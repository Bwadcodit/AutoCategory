
local LMP = LibMediaProvider
local SF = LibSFUtils

local sortKeys = {
    slotIndex = { isNumeric = true },
    stackCount = { tiebreaker = "slotIndex", isNumeric = true },
    name = { tiebreaker = "stackCount" },
    quality = { tiebreaker = "name", isNumeric = true },
    stackSellPrice = { tiebreaker = "name", tieBreakerSortOrder = ZO_SORT_ORDER_UP, isNumeric = true },
    statusSortOrder = { tiebreaker = "age", isNumeric = true},
    age = { tiebreaker = "name", tieBreakerSortOrder = ZO_SORT_ORDER_UP, isNumeric = true},
    statValue = { tiebreaker = "name", isNumeric = true, tieBreakerSortOrder = ZO_SORT_ORDER_UP },
    traitInformationSortOrder = { tiebreaker = "name", isNumeric = true, tieBreakerSortOrder = ZO_SORT_ORDER_UP },
    sellInformationSortOrder = { tiebreaker = "name", isNumeric = true, tieBreakerSortOrder = ZO_SORT_ORDER_UP },
	ptValue = { tiebreaker = "name", isNumeric = true },
}

local CATEGORY_HEADER = 998

-- convenience function
-- given a (supposed) table variable
-- either return the table variable
-- or return an empty table if the table variable was nil
local function validTable(tbl)
    if tbl == nil then
        tbl = {}
    end
    return tbl
end

-- convenience function
local function NilOrLessThan(value1, value2)
    if value1 == nil then
        return true
    elseif value2 == nil then
        return false
    else
        return value1 < value2
    end
end 

-- debug convenience function
local function dTable(table, depth, name)
	if type(table) ~= "table" then 
		d(tostring(table)) 
		return
	end
	if depth < 1 then return end
	for k, v in pairs(table) do
		d(name.." : "..tostring(k).." -> "..tostring(v))
		if type(v) == "table" then dTable(v, depth - 1, name.." - ["..tostring(k).."]") end
	end
end

local function setup_InventoryItemRowHeader(rowControl, slot, overrideOptions)
	--set header
	local headerLabel = rowControl:GetNamedChild("HeaderName")
	-- Add count to category name if selected in options
	if AutoCategory.acctSaved.general["SHOW_CATEGORY_ITEM_COUNT"] then
		count = slot.dataEntry.data.AC_catCount
		headerLabel:SetText(string.format('%s |cFFE690[%d]|r', slot.bestItemTypeName, count))
	else
		headerLabel:SetText(slot.bestItemTypeName)
	end
	
	local appearance = AutoCategory.acctSaved.appearance
	headerLabel:SetHorizontalAlignment(appearance["CATEGORY_FONT_ALIGNMENT"])
	headerLabel:SetFont(string.format('%s|%d|%s', 
			LMP:Fetch('font', appearance["CATEGORY_FONT_NAME"]), 
			appearance["CATEGORY_FONT_SIZE"], appearance["CATEGORY_FONT_STYLE"]))
	headerLabel:SetColor(appearance["CATEGORY_FONT_COLOR"][1], appearance["CATEGORY_FONT_COLOR"][2], 
						 appearance["CATEGORY_FONT_COLOR"][3], appearance["CATEGORY_FONT_COLOR"][4])

	local marker = rowControl:GetNamedChild("CollapseMarker")
	local cateName = slot.dataEntry.data.AC_categoryName
	local bagTypeId = slot.dataEntry.data.AC_bagTypeId
	
	-- set the collapse marker
	local collapsed = (cateName ~= nil) and (bagTypeId ~= nil) and AutoCategory.IsCategoryCollapsed(bagTypeId, cateName) 
	if AutoCategory.acctSaved.general["SHOW_CATEGORY_COLLAPSE_ICON"] then
		marker:SetHidden(false)
		if collapsed then
			marker:SetTexture("EsoUI/Art/Buttons/plus_up.dds")
		else
			marker:SetTexture("EsoUI/Art/Buttons/minus_up.dds")
		end
	else
		marker:SetHidden(true)
	end
	
	rowControl:SetHeight(AutoCategory.acctSaved.appearance["CATEGORY_HEADER_HEIGHT"])
	rowControl.slot = slot
end

local function AddTypeToList(rowHeight, datalist, inven_ndx) 
	if datalist == nil then return end
	
	local templateName = "AC_InventoryItemRowHeader"
	local setupFunc = setup_InventoryItemRowHeader
	local resetCB = ZO_InventorySlot_OnPoolReset
	local hiddenCB
	if inven_ndx then
		hiddenCB = PLAYER_INVENTORY.inventories[inven_ndx].listHiddenCallback
	else
		hiddenCB = nil
	end
	ZO_ScrollList_AddDataType(datalist, CATEGORY_HEADER, templateName, 
	    rowHeight, setupFunc, hiddenCB, nil, resetCB)
end

local function isUngroupedHidden(bagTypeId)
	return bagTypeId == nil or AutoCategory.saved.bags[bagTypeId].isUngroupedHidden
end

local function loadRulesResult(itemEntry, isAtCraftStation)
	local specialType = nil
	if isAtCraftStation then specialType = AC_BAG_TYPE_CRAFTSTATION end
	local matched, categoryName, categoryPriority, bagTypeId, isHidden = AutoCategory:MatchCategoryRules(itemEntry.data.bagId, itemEntry.data.slotIndex, specialType)
	itemEntry.data.AC_matched = matched
	if matched then
		itemEntry.data.AC_categoryName = categoryName
		itemEntry.data.AC_sortPriorityName = string.format("%03d%s", 100 - categoryPriority , categoryName)
	else
		itemEntry.data.AC_categoryName = AutoCategory.acctSaved.appearance["CATEGORY_OTHER_TEXT"]
		itemEntry.data.AC_sortPriorityName = string.format("%03d%s", 999 , categoryName)
	end
	itemEntry.data.AC_bagTypeId = bagTypeId
	itemEntry.data.AC_isHidden = isHidden
end

local function isHiddenEntry(itemEntry)
	return itemEntry.data.AC_isHidden or (itemEntry.data.AC_bagTypeId ~= nil and ((not matched and isUngroupedHidden(itemEntry.data.AC_bagTypeId)) or AutoCategory.IsCategoryCollapsed(itemEntry.data.AC_bagTypeId, itemEntry.data.AC_categoryName)))
end

local function createHeaderEntry(itemEntry)
	local headerEntry = ZO_ScrollList_CreateDataEntry(CATEGORY_HEADER, {bestItemTypeName = itemEntry.data.AC_categoryName, stackLaunderPrice = 0})
	headerEntry.data.AC_categoryName = itemEntry.data.AC_categoryName
	headerEntry.data.AC_sortPriorityName = itemEntry.data.AC_sortPriorityName
	headerEntry.data.AC_isHeader = true
	headerEntry.data.AC_bagTypeId = itemEntry.data.AC_bagTypeId
	headerEntry.data.AC_catCount = 1
	return headerEntry
end

-- execute rules and store result in entry.data, if needed. Return false if no entry was updated, true otherwise.
local function handleRules(scrollData, newHash, isAtCraftStation)
	local hasUpdated = false
	local reloadAll = false
	if newHash ~= AutoCategory.hookUpdateHash then
		-- d("[AUTO-CAT] reloading all: "..tostring(AutoCategory.hookUpdateHash).." -> "..tostring(newHash))
		AutoCategory.hookUpdateHash = newHash
		reloadAll = true
	end
	for _, entry in ipairs(scrollData) do
		if entry.typeId ~= CATEGORY_HEADER then
			if reloadAll or (entry.data.AC_categoryName == nil) then 
				hasUpdated = true
				loadRulesResult(entry, isAtCraftStation)
			else
				for _, uniqueId in ipairs(AutoCategory.uniqueIdsToUpdate) do
					if entry.data.uniqueId == uniqueId then
						-- d("[AUTO-CAT] reloading: "..tostring(entry.data.name))
						hasUpdated = true
						loadRulesResult(entry, isAtCraftStation)
						break
					end
				end
			end
		end
	end
	AutoCategory.uniqueIdsToUpdate = {} -- reset update buffer
	return hasUpdated
end

-- Create new category or update existing. Return created category, or nil.
local function handleCategory(category_list, itemEntry)
	local categoryName = itemEntry.data.AC_categoryName
	if category_list[categoryName] == nil and (itemEntry.data.AC_matched or not isUngroupedHidden(itemEntry.data.AC_bagTypeId)) then -- first time seeing this category name, and ungrouped not hidden -> create new header
		category_list[categoryName] = createHeaderEntry(itemEntry)
		return category_list[categoryName]
	elseif category_list[categoryName] ~= nil then -- header already existing -> increment category count
		category_list[categoryName].data.AC_catCount = category_list[categoryName].data.AC_catCount + 1
	end
	return nil
end

local function getInventory(objectTable, inventoryType)
	if objectTable == nil then objectTable = PLAYER_INVENTORY end
	local inventory = objectTable.inventories[inventoryType]
	if inventory == nil then
		-- Use normal inventory by default (instead of the quest item inventory for example)
		inventory = objectTable.inventories[objectTable.selectedTabType]
	end
	return inventory
end

-- return inventoryTable, scrollData, headersAlreadyProcessed, bagId, bagTypeId, filterType, selectTabType
local function getSortInitValues(objectTable, inventoryType)
	local inventory = getInventory(objectTable, inventoryType)
	if not inventory then return nil, nil, nil, 0, 1 end
	local scrollData = ZO_ScrollList_GetDataList(inventory.listView)
	local bagId, bagTypeId, headersAlreadyProcessed = nil, nil, false
	for _, entry in ipairs(scrollData) do
		if bagId == nil and entry.data.bagId ~= nil then
			bagId = entry.data.bagId
		end
		if (#scrollData == AutoCategory.lastScrollDataSize) and (entry.typeId == CATEGORY_HEADER) then
			headersAlreadyProcessed = true -- a header existing here means the scroll data is untouched since last sort
		end
		if headersAlreadyProcessed and bagId ~= nil then break end
	end
	AutoCategory.lastScrollDataSize = #scrollData
	return  inventory, scrollData, headersAlreadyProcessed, bagId, AutoCategory.convert2BagTypeId(bagId), inventory.currentFilter, objectTable.selectedTabType
end

AutoCategory.hookUpdateHash = nil -- a hash representing the last 'state', so changes can be detected. Use bag, filter and sorting infos.
AutoCategory.uniqueIdsToUpdate = {}
AutoCategory.lastScrollDataSize = 0
local function prehookSort(self, inventoryType) 
	-- d("[AUTO-CAT] -> prehookSort ("..inventoryType.." - "..tostring(AutoCategory.Enabled)..") <-- START")
	if not AutoCategory.Enabled then return false end -- reverse to default behavior if disabled: default ApplySort() function is used
	if inventoryType == INVENTORY_QUEST_ITEM then return false end  -- reverse to default behavior if quest item tab opened

	local inventory, scrollData, headersAlreadyProcessed, bagId, bagTypeId, filterType, selectTabType = getSortInitValues(self, inventoryType)

	if #scrollData == 0 then return false end

	inventory.sortFn =  function(left, right) -- set new inventory sort function
		if AutoCategory.Enabled then
			if right.data.AC_sortPriorityName ~= left.data.AC_sortPriorityName then
				return NilOrLessThan(left.data.AC_sortPriorityName, right.data.AC_sortPriorityName)
			end
			if right.data.AC_isHeader ~= left.data.AC_isHeader then
				return NilOrLessThan(right.data.AC_isHeader, left.data.AC_isHeader)
			end
		end
		--compatible with quality sort
		if type(inventory.currentSortKey) == "function" then 
			if inventory.currentSortOrder == ZO_SORT_ORDER_UP then
				return inventory.currentSortKey(left.data, right.data)
			else
				return inventory.currentSortKey(right.data, left.data)
			end
		end
		return ZO_TableOrderingFunction(left.data, right.data, inventory.currentSortKey, sortKeys, inventory.currentSortOrder)
	end
	
	-- build a hash with bag, filter and sort identifiers, so it detects any changes and triggers a full rule rerun. 
	local newHash = table.concat({tostring(bagId), tostring(bagTypeId), tostring(inventory.currentFilter), tostring(inventory.currentSortKey), tostring(inventory.currentSortOrder), tostring(self.selectedTabType)}, ":") 
	handleRules(scrollData, newHash, false)

	if not handleRules(scrollData, newHash, false) and headersAlreadyProcessed then return false end -- no entry updated and categories already present in scrollData -> exit, default ApplySort() function is applied with custom sort function

	local category_list = {} -- keep track of categories added and their item count
	local newScrollData = {} -- output, entries sorted with category headers
	for _, entry in ipairs(scrollData) do -- create newScrollData with headers and only non hidden items 
		if entry.typeId ~= CATEGORY_HEADER then
			if not isHiddenEntry(entry) then table.insert(newScrollData, entry) end -- add entry if visible
			table.insert(newScrollData, handleCategory(category_list, entry)) -- add header or update header count
		end
	end
	-- d("[AUTO-CAT] END - "..tostring(#scrollData).." -> "..tostring(#newScrollData))
	inventory.listView.data = newScrollData 
end

-- return scrollData, headersAlreadyProcessed, bagId, bagTypeId
local function getCraftSortInitValues(objectTable)
	local scrollData = ZO_ScrollList_GetDataList(objectTable.list)
	local bagId, bagTypeId, headersAlreadyProcessed = nil, nil, false
	for _, entry in ipairs(scrollData) do
		if bagId == nil and entry.data.bagId ~= nil then
			bagId = entry.data.bagId
		end
		if (#scrollData == AutoCategory.lastScrollDataSize) and (entry.typeId == CATEGORY_HEADER) then
			headersAlreadyProcessed = true -- a header existing here means the scroll data is untouched since last sort
		end
		if headersAlreadyProcessed and bagId ~= nil then break end
	end
	AutoCategory.lastScrollDataSize = #scrollData
	return  scrollData, headersAlreadyProcessed, bagId, AutoCategory.convert2BagTypeId(bagId, AC_BAG_TYPE_CRAFTSTATION)
end

local function prehookCraftSort(self)
	if not AutoCategory.Enabled then return false end -- reverse to default behavior if disabled
	local scrollData, headersAlreadyProcessed, bagId, bagTypeId = getCraftSortInitValues(self)

	if #scrollData == 0 then return false end

	--change sort function
	--self.sortFunction = function(left,right) sortInventoryFn(self,left,right) end
	self.sortFunction = function(left, right) 
		if AutoCategory.Enabled then
			if right.data.AC_sortPriorityName ~= left.data.AC_sortPriorityName then
				return NilOrLessThan(left.data.AC_sortPriorityName, right.data.AC_sortPriorityName)
			end
			if right.data.AC_isHeader ~= left.data.AC_isHeader then
				return NilOrLessThan(right.data.AC_isHeader, left.data.AC_isHeader)
			end
			--compatible with quality sort
			if type(self.sortKey) == "function" then 
				if self.sortOrder == ZO_SORT_ORDER_UP then
					return self.sortKey(left.data, right.data)
				else
					return self.sortKey(right.data, left.data)
				end
			end
		end
		return ZO_TableOrderingFunction(left.data, right.data, self.sortKey, sortKeys, self.sortOrder)
	end

	-- build a hash with bag, filter and sort identifiers, so it detects any changes and triggers a rules rerun. 
	local newHash = table.concat({tostring(bagId), tostring(bagTypeId), tostring(self.filterType)}, ":") 
	handleRules(scrollData, newHash, true)

	if not handleRules(scrollData, newHash, true) and headersAlreadyProcessed then return false end -- no entry updated and categories already present in scrollData -> exit, default ApplySort() function is applied with custom sort function

	local category_list = {} -- keep track of categories added and their item count
	local newScrollData = {} -- output, entries sorted with category headers
	for i, entry in ipairs(scrollData) do
		if entry.typeId ~= CATEGORY_HEADER then
			if not isHiddenEntry(entry) then table.insert(newScrollData, entry) end -- add entry if visible
			table.insert(newScrollData, handleCategory(category_list, entry)) -- add header or update header count
		end
	end
	table.sort(newScrollData, self.sortFunction)
	self.list.data = newScrollData  
end

-- force re-execution of rules
local function forceInventoryRefresh()
	AutoCategory.hookUpdateHash = "force_refresh" -- trigger rules execution on next sort hook
	PLAYER_INVENTORY:UpdateList(INVENTORY_BACKPACK, true)-- trigger sort for backpack as opening/closing it does not trigger sort
end

local function preHookOnInventorySlotUpdated(self, bagId, slotIndex)
	table.insert(AutoCategory.uniqueIdsToUpdate, GetItemUniqueId(bagId, slotIndex))
end

local function preHookDoQuickSlotUpdate(self, physicalSlot, animationOption)
	if animationOption then -- a quickslot has been changed (manually)
		forceInventoryRefresh()
	end
end

local function preHookLAMPanelClosed(currentPanel)
	if currentPanel and currentPanel.data.name == AutoCategory.settingName then -- closed panel is AC panel
		forceInventoryRefresh()
	end
end

function AutoCategory.HookKeyboardMode() 
    
	--Add a new data type: row with header
	local rowHeight = AutoCategory.acctSaved.appearance["CATEGORY_HEADER_HEIGHT"]
	
    AddTypeToList(rowHeight, ZO_PlayerInventoryList, INVENTORY_BACKPACK)
    AddTypeToList(rowHeight, ZO_CraftBagList, INVENTORY_BACKPACK)
    AddTypeToList(rowHeight, ZO_PlayerBankBackpack, INVENTORY_BACKPACK)
    AddTypeToList(rowHeight, ZO_GuildBankBackpack, INVENTORY_BACKPACK)
    AddTypeToList(rowHeight, ZO_HouseBankBackpack, INVENTORY_BACKPACK)
    AddTypeToList(rowHeight, ZO_PlayerInventoryQuest, INVENTORY_QUEST_ITEM)
    AddTypeToList(rowHeight, SMITHING.deconstructionPanel.inventory.list, nil)
    AddTypeToList(rowHeight, SMITHING.improvementPanel.inventory.list, nil)
	
	-- sort hooks
	ZO_PreHook(PLAYER_INVENTORY, "ApplySort", prehookSort)
    ZO_PreHook(SMITHING.deconstructionPanel.inventory, "SortData", prehookCraftSort)
    ZO_PreHook(SMITHING.improvementPanel.inventory, "SortData", prehookCraftSort)
	
	-- changes detection hook (rules results may have changed)
	ZO_PreHook(PLAYER_INVENTORY, "OnInventorySlotUpdated", preHookOnInventorySlotUpdated) -- items has been changed -- weirdly here ZO_PostHook does not gives good result but ZO_PreHook does
	ZO_PreHook(ZO_QuickslotManager, "DoQuickSlotUpdate", preHookDoQuickSlotUpdate) -- quick slots updated
	EVENT_MANAGER:RegisterForEvent(AutoCategory.name, EVENT_STACKED_ALL_ITEMS_IN_BAG, forceInventoryRefresh)

	CALLBACK_MANAGER:RegisterCallback("LAM-PanelClosed", preHookLAMPanelClosed) -- AddonMenu panel closed (AC settings may have changed)
	
	if AG then
		ZO_PostHook(AG, "handlePostChangeGearSetItems", forceInventoryRefresh)
		ZO_PostHook(AG, "LoadProfile", forceInventoryRefresh)
	end -- AlphaGear item change
end

