local AC = AutoCategory

-- A very simple plugin for several one-liner addons which only have
-- a single rule function to register.
--
-- No strings or predefined rules to load.

AutoCategory_MiscAddons = {
    RuleFunc = {},
}

--Initialize plugin for Auto Category - Misc Addons
function AutoCategory_MiscAddons.Initialize()
    -- Master Merchant
	AutoCategory.AddRuleFunc("getpricemm", AutoCategory_MiscAddons.RuleFunc.GetPriceMM)
	AutoCategory.AddRuleFunc("getamountttc", AutoCategory_MiscAddons.RuleFunc.GetAmountTTC)    
	
    -- Tamriel Trade Center
    AutoCategory.AddRuleFunc("getpricettc", AutoCategory_MiscAddons.RuleFunc.GetPriceTTC)
    
    -- AlphaGear
    if not AG then
        AutoCategory.AddRuleFunc("alphagear", AutoCategory.dummyRuleFunc)   -- always return false
    else
        AutoCategory.AddRuleFunc("alphagear", AutoCategory_MiscAddons.RuleFunc.AlphaGear)
    end
    
    -- SetTracker
    if not SetTrack then
        AutoCategory.AddRuleFunc("istracked", AutoCategory.dummyRuleFunc)    -- always return false
    else
        AutoCategory.AddRuleFunc("istracked", AutoCategory_MiscAddons.RuleFunc.IsTracked)
    end
	
	-- Character Knowledge
	if not LibCharacterKnowledge then
        AutoCategory.AddRuleFunc("ck_isknowncat", AutoCategory.dummyRuleFunc)    -- always return false
        AutoCategory.AddRuleFunc("ck_isknown", AutoCategory.dummyRuleFunc)    -- always return false
    else
        AutoCategory.AddRuleFunc("ck_isknowncat", AutoCategory_MiscAddons.RuleFunc.IsKnownCatInCK)
        AutoCategory.AddRuleFunc("ck_isknown", AutoCategory_MiscAddons.RuleFunc.IsKnownInCK)
    end
    
    
end

local function getCurrentItemLink()
	return GetItemLink(AC.checkingItemBagId, AC.checkingItemSlotIndex)
end

-- Implement getpricemm() check function for Master Merchant
function AutoCategory_MiscAddons.RuleFunc.GetPriceMM( ... )
	local fn = "getpricemm"
	if MasterMerchant then
		local itemLink = getCurrentItemLink()
		local mmData = MasterMerchant:itemStats(itemLink, false)
        if (mmData.avgPrice ~= nil) then
            return mmData.avgPrice
        end
	end
	return 0 
end

-- Implement getpricettc() check function for Tamriel Trade Center
function AutoCategory_MiscAddons.RuleFunc.GetPriceTTC( ... )
	local fn = "getpricettc"
	if TamrielTradeCentre and TamrielTradeCentrePrice then
		local itemLink = getCurrentItemLink()
		local priceInfo = TamrielTradeCentrePrice:GetPriceInfo(itemLink)
		if priceInfo then 
			local ac = select( '#', ... ) 
			if ac == 0 then
				--get suggested price
				if priceInfo.SuggestedPrice then
					return priceInfo.SuggestedPrice
				end
			else
				local arg = select( 1, ... )
				if type( arg ) == "string" then
					if arg == "average" then
						if priceInfo.Avg then
							return priceInfo.Avg
						end
					elseif arg == "suggested" then
						if priceInfo.SuggestedPrice then
							return priceInfo.SuggestedPrice
						end
					elseif arg == "both" then
						if priceInfo.SuggestedPrice then
							return priceInfo.SuggestedPrice
						elseif priceInfo.Avg then
							return priceInfo.Avg
						end
					end
				end
			end 
		end
	end
	return 0 
end

-- Implement getamountttc() check function for Tamriel Trade Center
function AutoCategory_MiscAddons.RuleFunc.GetAmountTTC( ... )
	local fn = "getamountttc"
	if TamrielTradeCentre and TamrielTradeCentrePrice then
		local itemLink = getCurrentItemLink()
		local priceInfo = TamrielTradeCentrePrice:GetPriceInfo(itemLink)
		if priceInfo then
			return priceInfo.AmountCount
		end
	end
	return 0
end

-- Implement alphagear() check function for Alpha Gear
function AutoCategory_MiscAddons.RuleFunc.AlphaGear( ... ) 
	if not AG or not AG.setdata or not AG.setdata.profiles then
		return false
	end
	local fn = "alphagear"
	local ac = select( '#', ... )
	-- if ac == 0 then
	-- 	error( string.format("error: %s(): require arguments." , fn))
	-- end
	
	local uid = Id64ToString(GetItemUniqueId(AC.checkingItemBagId, AC.checkingItemSlotIndex))
	if not uid then return false end

	local profileSortKeysList = {}
	for ax = 1, ac do -- store parameters in profileSortKeysList
		local arg = select( ax, ... )
		local profileSortKey = nil
		if not arg then
			error( string.format("error: %s():  argument is nil." , fn))
		end
		if type( arg ) == "number" then
			profileSortKey = tostring(arg)
		elseif type( arg ) == "string" then
			profileSortKey = arg
		else
			error( string.format("error: %s(): argument is error." , fn ) )
		end

		table.insert(profileSortKeysList, profileSortKey)
	end

	if #profileSortKeysList == 0 then -- if no parameters, find all profileSortKeys and sort them
		for profileId, profile in ipairs(AG.setdata.profiles) do
			if profile and profile.setdata then
				local profileSortKey = profile.sortKey
				if profileSortKey and profileSortKey ~= "" then
					table.insert(profileSortKeysList, profileSortKey)
				end
			end
		end
		table.sort(profileSortKeysList)
	end

	for _, profileSortKey in ipairs(profileSortKeysList) do
		for profileId, profile in ipairs(AG.setdata.profiles) do
			if profile and profile.setdata and profile.sortKey == profileSortKey then
				for buildId, build in ipairs(profile.setdata) do
					if build and build.Set and build.Set.gear and (build.Set.gear > 0) and profile.setdata[build.Set.gear] then
						local gear = profile.setdata[build.Set.gear].Gear
						if gear then
							for slot = 1, 14 do
								if gear[slot] and gear[slot].id == uid then
									local profileName = profile.name
									if not profileName or (profileName == "") then profileName = "Profile "..tostring(profileId) end
									if AG.setdata.currentProfileId == profileId then
										local buildName = build.Set.text[1]
										if not buildName or (buildName == "") then buildName = "Build "..tostring(buildId) end
										AutoCategory.AdditionCategoryName = profileName.." - "..buildName
									else
										AutoCategory.AdditionCategoryName = profileName
									end
									return true
								end
							end
						end
					end
				end
			end
		end
	end

	return false 
end

-- Implement istracked() check function for Set Tracker
function AutoCategory_MiscAddons.RuleFunc.IsTracked( ... )
  local fn = "istracked"
  if SetTrack == nil then
    return false
  end
  local ac = select( '#', ... ) 
  local checkSets = {}
  for ax = 1, ac do
    
    local arg = select( ax, ... )
    if not arg then
      error( string.format("error: %s():  argument is nil." , fn))
    end
    checkSets[arg]=true
  end
  
  local iTrackIndex, sTrackName, sTrackColour, sTrackNotes = SetTrack.GetTrackingInfo(AutoCategory.checkingItemBagId, AutoCategory.checkingItemSlotIndex)
  if iTrackIndex >= 0 then
    if ac > 0 then
      if checkSets[sTrackName] ~= nil then
        -- true only if a specified set name is tracked on this item
        return true
      end
      -- item was tracked but not one of the specified sets, so return false
      return false
    else
      -- specific set names weren't given so true if tracked at all
      return true
    end
  end
  -- not a set tracked by SetTrack
  return false  
end

local function getCharId( charname )
	local sv = {}
	for i = 1, GetNumCharacters() do
		local name, _, _, _, _, _, characterId = GetCharacterInfo(i)
		sv[name] = characterId
	end
	if sv[charname] ~= nil then
	    return sv[charname]
	end
	return nil
end

-- Implement ck_isknown() check function for Set Tracker
function AutoCategory_MiscAddons.RuleFunc.IsKnownInCK( ... )
	local fn = "ck_isknown"
	if LibCharacterKnowledge == nil then
		return false
	end
	
	local itemLink = getCurrentItemLink()
	local cat = LibCharacterKnowledge.GetItemCategory(itemLink)
	
	local server = zo_strsplit(" ", GetWorldName())
	local ac = select( '#', ... )
	local crafter, knowledge
	if ac == 0 then
		knowledge = LibCharacterKnowledge.GetItemKnowledgeForCharacter(itemLink, server)
	else
		local arg = select(1, ...)
		for i = 1, GetNumCharacters() do
			local name, _, _, _, _, _, characterId = GetCharacterInfo(i)
			name = zo_strformat("<<1>>", name)
			if name == arg then
				crafter = characterId
			end
		end
		knowledge = LibCharacterKnowledge.GetItemKnowledgeForCharacter(itemLink, server, crafter)
	end
	if knowledge  == LibCharacterKnowledge.KNOWLEDGE_KNOWN then
		return true
	end
  -- not known by character
  return false  
end

-- Implement ck_isknowncat() check function for Set Tracker
function AutoCategory_MiscAddons.RuleFunc.IsKnownCatInCK( ... )
	local fn = "ck_isknowncat"
	if LibCharacterKnowledge == nil then
		return false
	end

	-- check if item is in one of CK's defined categories
	local itemLink = getCurrentItemLink()
	local cat = LibCharacterKnowledge.GetItemCategory(itemLink)
	if cat == LibCharacterKnowledge.ITEM_CATEGORY_NONE then return false end
	
	-- decide which CK categories to look for
	local names = { 
		["recipe"] =  LibCharacterKnowledge.ITEM_CATEGORY_RECIPE, 
		["plan"] = LibCharacterKnowledge.ITEM_CATEGORY_PLAN, 
		["motif"] = LibCharacterKnowledge.ITEM_CATEGORY_MOTIF,
		}
	local chkCats = {}
	local ac = select( '#', ... )
	if ac == 0 then
		return true
	else
		for ax = 1, ac do
			local arg = select(ax, ...)
			if not arg or not names[arg] then 
				error( string.format("error: %s(): argument %d is error. %s not recognized." , fn, ax, arg ) )
			end
			
			chkCats[names[arg]] = true
		end
	end	
	if chkCats[cat] then
	    return true
	end
	return false  
end


-- Register this plugin with AutoCategory to be initialized and used when AutoCategory loads.
AutoCategory.RegisterPlugin("MiscAddons", AutoCategory_MiscAddons.Initialize)