
local L = AutoCategory.localizefunc
AutoCategory.defaultSettings = {
	bags = {
		[AC_BAG_TYPE_BACKPACK] = {
			rules = {},
		},
		[AC_BAG_TYPE_BANK] = {
			rules = {},
		},
		[AC_BAG_TYPE_GUILDBANK] = {
			rules = {},
		},
		[AC_BAG_TYPE_CRAFTBAG] = {
			rules = {},
		},
		[AC_BAG_TYPE_CRAFTSTATION] = {
			rules = {},
		},
		[AC_BAG_TYPE_HOUSEBANK] = {
			rules = {},
		},
	}, 
	accountWideSetting = true,
}
 
AutoCategory.defaultAcctSettings = {
	rules = {
		{
			["rule"] = "type(\"armor\") and not equiptype(\"neck\") and not equiptype(\"ring\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_ARMOR),
			["damaged"] = false,
			["description"] = "",
		},
		{
			["rule"] = "boundtype(\"on_equip\") and not isbound() and not keepresearch()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_BOE),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_BOE_DESC),
		},
		{
			["rule"] = "isboptradeable()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE_DESC),
		},
		{
			["rule"] = "traitstring(\"intricate\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT_DESC),
		},
		{
			["rule"] = "isequipping()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING_DESC),
		},
		{
			["rule"] = "cp() < 160 and type(\"armor\", \"weapon\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL_DESC),
		},
		{
			["rule"] = "equiptype(\"neck\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE_DESC),
		},
		{
			["rule"] = "keepresearch()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE_DESC),
		},
		{
			["rule"] = "equiptype(\"ring\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_RING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_RING_DESC),
		},
		{
			["rule"] = "autoset()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_SET),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_SET_DESC),
		},
		{
			["rule"] = "type(\"weapon\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GEARS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON_DESC),
		},
		{
			["rule"] = "type(\"food\", \"drink\", \"potion\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES_DESC),
		},
		{
			["rule"] = "type(\"container\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER_DESC),
		},
		{
			["rule"] = "filtertype(\"furnishing\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING_DESC),
		},
		{
			["rule"] = "type(\"soul_gem\", \"glyph_armor\", \"glyph_jewelry\", \"glyph_weapon\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS_DESC),
		},
		{
			["rule"] = "isnew()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_NEW),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_NEW_DESC),
		},
		{
			["rule"] = "type(\"poison\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_POISON),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_POISON_DESC),
		},
		{
			["rule"] = "isinquickslot()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS_DESC),
		},
		{
			["rule"] = "type(\"recipe\",\"racial_style_motif\") or sptype(\"trophy_recipe_fragment\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS_DESC),
		},
		{
			["rule"] = "traitstring(\"ornate\") or sptype(\"collectible_monster_trophy\") or type(\"trash\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_SELLING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_SELLING_DESC),
		},
		{
			["rule"] = "isstolen()",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN_DESC),
		},
		{
			["rule"] = "sptype(\"trophy_survey_report\", \"trophy_treasure_map\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_GENERAL_ITEMS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS_DESC),
		},
		{
			["rule"] = "setindex(1)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_1),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_1_DESC),
		},
		{
			["rule"] = "setindex(2)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_2),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_2_DESC),
		},
		{
			["rule"] = "setindex(3)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_3),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_3_DESC),
		},
		{
			["rule"] = "setindex(4)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_4),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_4_DESC),
		},
		{
			["rule"] = "setindex(5)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_5),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_5_DESC),
		},
		{
			["rule"] = "setindex(6)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_6),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_6_DESC),
		},
		{
			["rule"] = "setindex(7)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_7),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_7_DESC),
		},
		{
			["rule"] = "setindex(8)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_8),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_8_DESC),
		},
		{
			["rule"] = "setindex(9)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_9),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_9_DESC),
		},
		{
			["rule"] = "setindex(10)",
			["tag"] = L(SI_AC_DEFAULT_TAG_IAKONI_GEAR_CHANGER),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_10),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_IAKONI_SET_10_DESC),
		},
		{
			["rule"] = "filtertype(\"alchemy\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY_DESC),
		},
		{
			["rule"] = "filtertype(\"blacksmithing\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING_DESC),
		},
		{
			["rule"] = "filtertype(\"clothing\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING_DESC),
		},
		{
			["rule"] = "filtertype(\"enchanting\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING_DESC),
		},
		{
			["rule"] = "filtertype(\"jewelrycrafting\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_JEWELRYCRAFTING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_JEWELRYCRAFTING_DESC),
		},
		{
			["rule"] = "filtertype(\"provisioning\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING_DESC),
		},
		{
			["rule"] = "filtertype(\"trait_items\", \"style_materials\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS_DESC),
		},
		{
			["rule"] = "filtertype(\"woodworking\")",
			["tag"] = L(SI_AC_DEFAULT_TAG_MATERIALS),
			["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
			["damaged"] = false,
			["description"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING_DESC),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"deconstruction\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DECONSTRUCTION_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DECONSTRUCTION_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"dynamic_1\")",
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_1),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_1_DESC),
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_2),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_2_DESC),
			["rule"] = "ismarked(\"dynamic_2\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_3),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_3_DESC),
			["rule"] = "ismarked(\"dynamic_3\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_4),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_4_DESC),
			["rule"] = "ismarked(\"dynamic_4\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_5),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_5_DESC),
			["rule"] = "ismarked(\"dynamic_5\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_6),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_6_DESC),
			["rule"] = "ismarked(\"dynamic_6\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_7),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_7_DESC),
			["rule"] = "ismarked(\"dynamic_7\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_8),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_8_DESC),
			["rule"] = "ismarked(\"dynamic_8\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_9),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_9_DESC),
			["rule"] = "ismarked(\"dynamic_9\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_10),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_10_DESC),
			["rule"] = "ismarked(\"dynamic_10\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"gear_1\")",
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_1),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_1_DESC),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"gear_2\")", 
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_2),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_2_DESC),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"gear_3\")", 
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_3),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_3_DESC),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"gear_4\")", 
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_4),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_4_DESC),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"gear_5\")", 
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_5),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_GEAR_5_DESC),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"improvement\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_IMPROVEMENT_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_IMPROVEMENT_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"intricate\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_INTRICATE_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_INTRICATE_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"research\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_RESEARCH_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_RESEARCH_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"sell_at_guildstore\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_SELL_AT_GUILDSTORE_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_SELL_AT_GUILDSTORE_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"sell\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_SELL_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_SELL_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked(\"lock\")",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_LOCK_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_LOCK_MARK),
		},
		{
			["tag"] = "FCOIS",
			["rule"] = "ismarked()",
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_ALL_MARK_DESC),
			["damaged"] = false,
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_ALL_MARK),
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_11),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_11_DESC),
			["rule"] = "ismarked(\"dynamic_11\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_12),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_12_DESC),
			["rule"] = "ismarked(\"dynamic_12\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_13),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_13_DESC),
			["rule"] = "ismarked(\"dynamic_13\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_14),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_14_DESC),
			["rule"] = "ismarked(\"dynamic_14\")",
			["description"] = "",
        },
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_15),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_15_DESC),
			["rule"] = "ismarked(\"dynamic_15\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_16),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_16_DESC),
			["rule"] = "ismarked(\"dynamic_16\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_17),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_17_DESC),
			["rule"] = "ismarked(\"dynamic_17\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_18),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_18_DESC),
			["rule"] = "ismarked(\"dynamic_18\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_19),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_19_DESC),
			["rule"] = "ismarked(\"dynamic_19\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_20),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_20_DESC),
			["rule"] = "ismarked(\"dynamic_20\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_21),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_21_DESC),
			["rule"] = "ismarked(\"dynamic_21\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_22),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_22_DESC),
			["rule"] = "ismarked(\"dynamic_22\")",
			["description"] = "",
        },
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_23),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_23_DESC),
			["rule"] = "ismarked(\"dynamic_23\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_24),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_24_DESC),
			["rule"] = "ismarked(\"dynamic_24\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_25),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_25_DESC),
			["rule"] = "ismarked(\"dynamic_25\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_26),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_26_DESC),
			["rule"] = "ismarked(\"dynamic_26\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_27),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_27_DESC),
			["rule"] = "ismarked(\"dynamic_27\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_28),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_28_DESC),
			["rule"] = "ismarked(\"dynamic_28\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_29),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_29_DESC),
			["rule"] = "ismarked(\"dynamic_29\")",
			["description"] = "",
		},
		{
			["tag"] = "FCOIS",
			["name"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_30),
			["description"] = L(SI_AC_DEFAULT_CATEGORY_FCOIS_DYNAMIC_30_DESC),
			["rule"] = "ismarked(\"dynamic_30\")",
			["description"] = "",
		},
	},
	bags = {
		[AC_BAG_TYPE_BACKPACK] = {
			rules = {
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE),
				},
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NEW),
				},
				{
					["priority"] = 95,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER),
				},
				{
					["priority"] = 90,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SELLING),
				},
				{
					["priority"] = 85,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL),
				},
				{
					["priority"] = 80,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT),
				},
				{
					["priority"] = 70,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOE),
				},
				{
					["priority"] = 60,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE),
				},
				{
					["priority"] = 50,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING),
				},
				{
					["priority"] = 49,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SET),
				},
				{
					["priority"] = 48,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON),
				},
				{
					["priority"] = 47,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_POISON),
				},
				{
					["priority"] = 46,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ARMOR),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RING),
				},
				{
					["priority"] = 40,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS),
				},
				{
					["priority"] = 30,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING),
				},
				{
					["priority"] = 20,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
				},
			},
		},
		[AC_BAG_TYPE_BANK] = {
			rules = {
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE),
				},
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NEW),
				},
				{
					["priority"] = 95,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER),
				},
				{
					["priority"] = 90,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SELLING),
				},
				{
					["priority"] = 85,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL),
				},
				{
					["priority"] = 80,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT),
				},
				{
					["priority"] = 70,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOE),
				},
				{
					["priority"] = 60,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE),
				},
				{
					["priority"] = 50,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING),
				},
				{
					["priority"] = 49,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SET),
				},
				{
					["priority"] = 48,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON),
				},
				{
					["priority"] = 47,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_POISON),
				},
				{
					["priority"] = 46,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ARMOR),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RING),
				},
				{
					["priority"] = 40,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS),
				},
				{
					["priority"] = 30,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING),
				},
				{
					["priority"] = 20,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
				},
			},
		},
		[AC_BAG_TYPE_GUILDBANK] = {
			rules = {
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE),
				},
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NEW),
				},
				{
					["priority"] = 95,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER),
				},
				{
					["priority"] = 90,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SELLING),
				},
				{
					["priority"] = 85,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL),
				},
				{
					["priority"] = 80,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT),
				},
				{
					["priority"] = 70,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOE),
				},
				{
					["priority"] = 60,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE),
				},
				{
					["priority"] = 50,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING),
				},
				{
					["priority"] = 49,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SET),
				},
				{
					["priority"] = 48,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON),
				},
				{
					["priority"] = 47,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_POISON),
				},
				{
					["priority"] = 46,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ARMOR),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RING),
				},
				{
					["priority"] = 40,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS),
				},
				{
					["priority"] = 30,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING),
				},
				{
					["priority"] = 20,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
				},
			},
		},
		[AC_BAG_TYPE_CRAFTBAG] = {
			rules = {
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
				},
			},
		},
		[AC_BAG_TYPE_CRAFTSTATION] = {
			rules = {
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE),
				},
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NEW),
				},
				{
					["priority"] = 95,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER),
				},
				{
					["priority"] = 90,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SELLING),
				},
				{
					["priority"] = 85,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL),
				},
				{
					["priority"] = 80,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT),
				},
				{
					["priority"] = 70,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOE),
				},
				{
					["priority"] = 60,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE),
				},
				{
					["priority"] = 50,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING),
				},
				{
					["priority"] = 49,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SET),
				},
				{
					["priority"] = 48,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON),
				},
				{
					["priority"] = 47,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_POISON),
				},
				{
					["priority"] = 46,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ARMOR),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RING),
				},
				{
					["priority"] = 40,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS),
				},
				{
					["priority"] = 30,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING),
				},
				{
					["priority"] = 20,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
				},
			},
		},
		[AC_BAG_TYPE_HOUSEBANK] = {
			rules = {
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOP_TRADEABLE),
				},
				{
					["priority"] = 100,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NEW),
				},
				{
					["priority"] = 95,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONTAINER),
				},
				{
					["priority"] = 90,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SELLING),
				},
				{
					["priority"] = 85,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_LOW_LEVEL),
				},
				{
					["priority"] = 80,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_DECONSTRUCT),
				},
				{
					["priority"] = 70,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BOE),
				},
				{
					["priority"] = 60,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RESEARCHABLE),
				},
				{
					["priority"] = 50,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_EQUIPPING),
				},
				{
					["priority"] = 49,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_SET),
				},
				{
					["priority"] = 48,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WEAPON),
				},
				{
					["priority"] = 47,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_POISON),
				},
				{
					["priority"] = 46,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ARMOR),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_NECKLACE),
				},
				{
					["priority"] = 45,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RING),
				},
				{
					["priority"] = 40,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_QUICKSLOTS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CONSUMABLES),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_GLYPHS_AND_GEMS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_RECIPES_AND_MOTIFS),
				},
				{
					["priority"] = 35,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TREASURE_MAPS),
				},
				{
					["priority"] = 30,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_FURNISHING),
				},
				{
					["priority"] = 20,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_STOLEN),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ALCHEMY),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_BLACKSMITHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_CLOTHING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_ENCHANTING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_PROVISIONING),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_TRAIT_OR_STYLE_GEMS),
				},
				{
					["priority"] = 10,
					["name"] = L(SI_AC_DEFAULT_CATEGORY_WOODWORKING),
				},
			},
		},
	}, 
	appearance = {
		["CATEGORY_FONT_NAME"] = "Univers 67",
		["CATEGORY_FONT_STYLE"] = "soft-shadow-thin",
		["CATEGORY_FONT_COLOR"] = 
		{
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
		},
		["CATEGORY_FONT_SIZE"] = 18,
		["CATEGORY_FONT_ALIGNMENT"] = 1,
		["CATEGORY_OTHER_TEXT"] = L(SI_AC_DEFAULT_NAME_CATEGORY_OTHER),
		["CATEGORY_HEADER_HEIGHT"] = 52, 
	},
	general = {
		["SHOW_MESSAGE_WHEN_TOGGLE"] = false,
		["SHOW_CATEGORY_ITEM_COUNT"] = true, 
		["SAVE_CATEGORY_COLLAPSE_STATUS"] = false,
	},
}