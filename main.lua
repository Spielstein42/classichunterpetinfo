-- Addon:	     ClassicHunterPetInfo
-- Author:	     Spielstein@Curse
--
-- Using the Library:
-- UIDropDownMenu  by arithmander@WoWAce
-- https://www.wowace.com/projects/libuidropdownmenu
--
-- Ace3
-- https://www.wowace.com/projects/ace3
--
-- LibStub
-- https://www.wowace.com/projects/libstub
--



if select(2, UnitClass("player")) ~= "HUNTER" then
	--print("|cff00ff00ClassicHunterPetInfo|r is not loaded. Consider disable this addon on non-hunter characters.")
    --return
end



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Variables, databases and constants  ------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-- Creating MainFrame
ClassicHunterPetInfo = {}
ClassicHunterPetInfo.mainFrame = CreateFrame("Frame", "ClassicHunterPetInfoFrame", UIParent)
ClassicHunterPetInfo.FIRST_SLASH_START = 0
ClassicHunterPetInfo.HELP_WINDOWS_OPEN = false

-- own realm
ClassicHunterPetInfo.OWN_REALM = GetRealmName()

-- locale code
ClassicHunterPetInfo.LOCALE_CODE = "enUS"
ClassicHunterPetInfo.LOCALE_CODE = GetLocale()


ClassicHunterPetInfo.DIET_ICONS = {
	["Bread"] = "133968",
	["Cheese"] = "133949",
	["Fish"] = "134031",
	["Fruit"] = "133976",
	["Fungus"] = "134528",
	["Meat"] = "134021",
	["Raw Fish"] = "133906",
	["Raw Meat"] = "134036",
}


----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Libraries  -------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


local ldb = LibStub("LibDataBroker-1.1")



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Sorting functions  -----------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-- Sorted pairs function
-- taken from https://stackoverflow.com/a/15706820
-- created by Michael Kottmann @ StackOverflow
-- (https://stackoverflow.com/users/221509/michal-kottman)
local function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end



-- The comparison function must return a boolean value specifying whether the first argument
-- should be before the second argument in the sequence.
-- (Source: http://lua-users.org/wiki/TableLibraryTutorial)

local function SortByAlphabet(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["name"] > ClassicHunterPetInfo.PET_INFORMATION[elem_a]["name"]
end

local function SortByAtkSpeedASC(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["attack_speed"] > ClassicHunterPetInfo.PET_INFORMATION[elem_a]["attack_speed"]
end

local function SortByAtkSpeedDESC(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["attack_speed"] < ClassicHunterPetInfo.PET_INFORMATION[elem_a]["attack_speed"]
end

local function SortByMinLevelASC(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["min_level"] > ClassicHunterPetInfo.PET_INFORMATION[elem_a]["min_level"]
end

local function SortByMinLevelDESC(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["min_level"] < ClassicHunterPetInfo.PET_INFORMATION[elem_a]["min_level"]
end

local function SortByMaxLevelASC(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["max_level"] > ClassicHunterPetInfo.PET_INFORMATION[elem_a]["max_level"]
end

local function SortByMaxLevelDESC(elem_a, elem_b)
	return ClassicHunterPetInfo.PET_INFORMATION[elem_b]["max_level"] < ClassicHunterPetInfo.PET_INFORMATION[elem_a]["max_level"]
end


local function GetSortFunctionID()

	if ClassicHunterPetInfo and ClassicHunterPetInfo.SelectedSortFunctionID then
		return ClassicHunterPetInfo.SelectedSortFunctionID
	else
		return 1
	end
end

local function SetSortFunctionID(id)
	ClassicHunterPetInfo.SelectedSortFunctionID = id
end

local function GetSortFunction()

	local currentSortFunctionSelection = nil

	if GetSortFunctionID() == 1 then
		return SortByAlphabet
	elseif GetSortFunctionID() == 2 then
		return SortByMinLevelASC
	elseif GetSortFunctionID() == 3 then
		return SortByMinLevelDESC
	elseif GetSortFunctionID() == 4 then
		return SortByMaxLevelASC
	elseif GetSortFunctionID() == 5 then
		return SortByMaxLevelDESC
	else
		return SortByAlphabet
	end
end


----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Helper functions  ------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


local function GetLocalization(key)
	if ClassicHunterPetInfo.LOCALIZATION[key] then
		return ClassicHunterPetInfo.LOCALIZATION[key]
	else
		return ClassicHunterPetInfo.LOCALIZATION[key]
	end
end


local function ColorLevel(level)
	if type(level) ~= "number" then
		return level
	end
	local color = GetRelativeDifficultyColor(UnitLevel("player"), level)
	return ("|cff%02x%02x%02x%d|r"):format(color.r * 255, color.g * 255, color.b * 255, level)
end

local function ColorSearchKeyword(text, keyword)

	local ability, _ = string.match(keyword, "%s?(%a+)%s*(%d*)")

	if ability then

		index = string.find(text:lower(), ability:lower())

	  	if text ~= "" and index then
		    prefix = string.sub(text, 0, index - 1)
		    match = string.sub(text, index, index + #keyword - 1)
		    suffix = string.sub(text, index + #keyword, -1)

	    	return prefix .. "|cffff0000" .. match .. "|r" .. suffix

	 	else
			return text
		end
	else
		return text
	end
end


local function SearchForAbility(searchTerm, rank)
	local npc_id, data, dataIndex, dataEntry

	local foundData = {}

	for npc_id, data in pairs(ClassicHunterPetInfo.PET_ABILITIES) do
		local foundMatch = false
		for dataIndex, dataEntry in pairs(data) do
			if (dataEntry["ability"]:lower()):find(searchTerm:lower()) then
				if not( rank > 0 and dataEntry["rank"] ~= rank) then
					foundMatch = true
				end
			end
		end
		if foundMatch then
			table.insert(foundData, npc_id)
		end
	end

	return foundData
end


local function ParseAbilityText(abilityText, rankNumber)

	local ability = string.match(abilityText, "%s?([%a ]+)%s*")

	if ability then
		return SearchForAbility(ability, rankNumber)
	end

	return {}
end


local function IntersectionOfParsedTexts(list_1, list_2)
    
    if #list_1 == 0 then
    	table.sort(list_2 , GetSortFunction())
        return list_2
    end
    if #list_2 == 0 then
    	table.sort(list_1 , GetSortFunction())
       	return list_1
    end
    
    local x, y
    local result = {}
    
    for x = 1, #list_1 do
       local found = false
       for y = 1, #list_2 do
            if list_1[x] == list_2[y] then
                found = true
            end
       end
       if found then
           table.insert(result, list_1[x])
       end
    end

    -- sort result
    table.sort(result, GetSortFunction())
    
    return result
end

local function GetEditbox(index)

	if index == 1 and ClassicHunterPetInfo.EDTBox1 then
		return ClassicHunterPetInfo.EDTBox1
	elseif index == 2 and ClassicHunterPetInfo.EDTBox2 then
		return ClassicHunterPetInfo.EDTBox2
	else
		return nil
	end
end

local function SetEditbox(index, editbox)
	
	if index == 1 then
		ClassicHunterPetInfo.EDTBox1 = editbox
	elseif index == 2 then
		ClassicHunterPetInfo.EDTBox2 = editbox
	end
end



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Search frame  ----------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


local searchFrame = CreateFrame("Frame", "ClassicHunterPetInfoSearchFrame", UIParent, "UIPanelDialogTemplate")
searchFrame:SetHeight(506)
searchFrame:SetWidth(300)
searchFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
searchFrame.DisplayData = {}
searchFrame.DataOffset = 0
searchFrame.UpdateFrame = function (self)
	if self.DisplayData then

		-- Update subFrames
		local count = 0
  		for _ in pairs(self.DisplayData) do count = count + 1 end

		local i
		for i = 1, math.min(count, 6) do
			self.subframes[i]:Show()
		end
		for i = count + 1, 6 do
			self.subframes[i]:Hide()
		end

		-- Feed data to the subFrames
		for i = 1, 6 do
			self.subframes[i]:SetData(self.DisplayData[i + self.DataOffset])
		end

		-- Update the scrollbar
		self.scrollbar:UpdateScrollbar(#self.DisplayData - 6, self.DataOffset)
	end
end

searchFrame:SetMovable(true)
searchFrame:EnableMouse(true)
searchFrame:RegisterForDrag("LeftButton")
searchFrame:SetScript("OnDragStart", searchFrame.StartMoving)
searchFrame:SetScript("OnDragStop", searchFrame.StopMovingOrSizing)
tinsert(UISpecialFrames, searchFrame:GetName())
searchFrame:Hide()

searchFrame:SetScript("OnMouseWheel", function (self, direction)
	if self.DisplayData then

		local count = 0
  		for _ in pairs(self.DisplayData) do count = count + 1 end

		self.DataOffset = self.DataOffset - direction
		if self.DataOffset < 0 then self.DataOffset = 0 end
		if self.DataOffset > count - 6 then self.DataOffset = count - 6 end

		self:UpdateFrame()
	end
end)


local searchFrameTitle = searchFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
searchFrameTitle:SetPoint("TOPLEFT", 15, -9)
searchFrameTitle:SetText("ClassicHunterPetInfo - Search Frame")
searchFrameTitle:SetJustifyH("LEFT")

searchFrame.title = searchFrameTitle


local subframes = {}
local f_index

local searchTextField = CreateFrame("Frame", nil, searchFrame)--, "ThinBorderTemplate")
searchTextField:SetHeight(25)
searchTextField:SetWidth(283)
searchTextField:SetPoint("TOPLEFT", searchFrame, "TOPLEFT", 12, -26)

local searchTextField2 = CreateFrame("Frame", nil, searchFrame)--, "ThinBorderTemplate")
searchTextField2:SetHeight(25)
searchTextField2:SetWidth(283)
searchTextField2:SetPoint("TOP", searchTextField, "BOTTOM", 0, 3)



------------------------------------
-- Editbox 1 (ability-search)     --
------------------------------------
local textForAbilityEditbox = searchTextField:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
textForAbilityEditbox:SetHeight(25)
textForAbilityEditbox:SetWidth(45)
textForAbilityEditbox:SetPoint("TOPLEFT", searchTextField, "TOPLEFT", 0, 0)
textForAbilityEditbox:SetJustifyH("LEFT")
textForAbilityEditbox:SetText("Ability:")


-- EditBox 
local abilityEditbox = CreateFrame("EditBox", nil, searchTextField, BackdropTemplateMixin and "BackdropTemplate")
abilityEditbox:SetHeight(18)
abilityEditbox:SetWidth(125)--(235)
abilityEditbox:SetPoint("LEFT", textForAbilityEditbox, "RIGHT", 0, 0)

abilityEditbox:SetFontObject("GameFontHighlightSmall")
abilityEditbox:SetMultiLine(false)
abilityEditbox:SetAutoFocus(false)
abilityEditbox:SetBackdrop(
	{
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
		tile = true, edgeSize = 1, tileSize = 5,
	}
)
abilityEditbox:SetBackdropColor(0, 0, 0, 0.2)
abilityEditbox:SetBackdropBorderColor(0.3, 0.3, 0.30, 0.80)
abilityEditbox:SetJustifyH("LEFT")
abilityEditbox:SetCursorPosition(0)
abilityEditbox.LastInput = ""
SetEditbox(1, abilityEditbox)

-- Editbox scripts
abilityEditbox:SetScript("OnEnterPressed", function(self)
	self:ClearFocus()
end
)

abilityEditbox:SetScript("OnTextChanged", function(self)

	local textAbilities = GetEditbox(1):GetText()

	local textRank = GetEditbox(2):GetText()
	local numberRank = GetEditbox(2):GetNumber()

	local resultAbilities = ParseAbilityText(textAbilities, numberRank)

	searchFrame.DisplayData = IntersectionOfParsedTexts({}, resultAbilities)
	searchFrame.DataOffset = 0

	self.button:SetShown(textAbilities ~= "")

	searchFrame:UpdateFrame()
end)

abilityEditbox:SetScript("OnEscapePressed", function(self)
	self:ClearFocus()
end)

abilityEditbox:SetScript("OnEditFocusLost", function(self)
	self:ClearFocus()
end)

abilityEditbox:SetScript("OnTabPressed", function(self)
	self:ClearFocus()
	GetEditbox(2):SetFocus()
end)

searchFrame.abilityEditbox = abilityEditbox


local abilityDeleteButton = CreateFrame("Button", nil, abilityEditbox, "UIPanelSquareButton")
abilityDeleteButton:SetScale(0.5)
abilityDeleteButton:SetPoint("CENTER", abilityEditbox, "RIGHT", -18, 0)
abilityDeleteButton:Hide()
abilityDeleteButton:SetScript("OnClick", function(self)
	self:GetParent():SetText("")
end)

searchFrame.abilityEditbox.button = abilityDeleteButton



------------------------------------
-- Editbox 2 (rank-search)     --
------------------------------------
local textForRankEditbox = searchTextField2:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
textForRankEditbox:SetHeight(25)
textForRankEditbox:SetWidth(45)
textForRankEditbox:SetPoint("LEFT", abilityEditbox, "RIGHT", 10, 0)
textForRankEditbox:SetJustifyH("LEFT")
textForRankEditbox:SetText("Rank:")


-- EditBox 
local rankEditbox = CreateFrame("EditBox", nil, searchTextField2, BackdropTemplateMixin and "BackdropTemplate")
rankEditbox:SetHeight(18)
rankEditbox:SetWidth(65)--(235)
rankEditbox:SetPoint("LEFT", textForRankEditbox, "RIGHT", -10, 0)

rankEditbox:SetFontObject("GameFontHighlightSmall")
rankEditbox:SetMultiLine(false)
rankEditbox:SetAutoFocus(false)
rankEditbox:SetBackdrop(
	{
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
		tile = true, edgeSize = 1, tileSize = 5,
	}
)
rankEditbox:SetBackdropColor(0, 0, 0, 0.2)
rankEditbox:SetBackdropBorderColor(0.3, 0.3, 0.30, 0.80)
rankEditbox:SetJustifyH("LEFT")
rankEditbox:SetCursorPosition(0)
rankEditbox.LastInput = ""
SetEditbox(2, rankEditbox)

-- Editbox scripts
rankEditbox:SetScript("OnEnterPressed", function(self)
	self:ClearFocus()
end
)

rankEditbox:SetScript("OnTextChanged", function(self)

	local textAbilities = GetEditbox(1):GetText()
	local textRank = GetEditbox(2):GetText()
	local numberRank = GetEditbox(2):GetNumber()

	local resultAbilities = ParseAbilityText(textAbilities, numberRank)

	searchFrame.DisplayData = IntersectionOfParsedTexts({}, resultAbilities)
	searchFrame.DataOffset = 0

	self.button:SetShown(textRank ~= "")

	searchFrame:UpdateFrame()
end)

rankEditbox:SetScript("OnEscapePressed", function(self)
	self:ClearFocus()
end)

rankEditbox:SetScript("OnEditFocusLost", function(self)
	self:ClearFocus()
end)

rankEditbox:SetScript("OnTabPressed", function(self)
	self:ClearFocus()
	GetEditbox(1):SetFocus()
end)

searchFrame.rankEditbox = rankEditbox


local rankDeleteButton = CreateFrame("Button", nil, rankEditbox, "UIPanelSquareButton")
rankDeleteButton:SetScale(0.5)
rankDeleteButton:SetPoint("CENTER", rankEditbox, "RIGHT", -18, 0)
rankDeleteButton:Hide()
rankDeleteButton:SetScript("OnClick", function(self)
	self:GetParent():SetText("")
end)

searchFrame.rankEditbox.button = rankDeleteButton


------------------------------------
-- DropdownMenu                   --
------------------------------------
local dropdownMenu = {}

dropdownMenu.element = L_Create_UIDropDownMenu("ClassicHunterPetInfoFrame_Dropdown", searchFrame)
dropdownMenu.element:SetPoint("TOPLEFT", searchTextField2, "TOPLEFT", -20, 0)
dropdownMenu.items = {
	"Alphabetical",
	"Min. Level (ascending)", "Min. Level (descending)",
	"Max. Level (ascending)", "Max. Level (descending)",
}
local function OnClick(self)
	L_UIDropDownMenu_SetSelectedID(dropdownMenu.element, self:GetID())
	SetSortFunctionID(self:GetID())

	local data = searchFrame.DisplayData
	table.sort(data, GetSortFunction())
	searchFrame.DisplayData = data
	searchFrame:UpdateFrame()
end
local function initialize(self, level)
	local info = L_UIDropDownMenu_CreateInfo()
	for k, v in pairs(dropdownMenu.items) do
		info = L_UIDropDownMenu_CreateInfo()
		info.text = v
		info.value = v
		info.func = OnClick
		L_UIDropDownMenu_AddButton(info, level)
	end
end
L_UIDropDownMenu_Initialize(dropdownMenu.element, initialize)
L_UIDropDownMenu_SetWidth(dropdownMenu.element, 155)
L_UIDropDownMenu_SetButtonWidth(dropdownMenu.element, 145)
L_UIDropDownMenu_JustifyText(dropdownMenu.element, "LEFT")
L_UIDropDownMenu_SetSelectedID(dropdownMenu.element, 1)
L_UIDropDownMenu_SetText(dropdownMenu.element, "Sort by")

searchFrame.dropdownMenu = dropdownMenu



------------------------------------
-- HelpFrame                      --
------------------------------------

local function createAbilityHelpButton(abilityName ,iconID, size, parent, point, relativeFrame, relativePoint, ofsx, ofsy)
	local icon = CreateFrame("Button", nil, parent)
	icon:SetSize(size, size)
	icon:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)

	icon.abilityName = abilityName

	icon:SetScript("OnClick", function(self, button, down)
		GetEditbox(1):SetText(abilityName)
	end)

	icon.texture = icon:CreateTexture()
	icon.texture:SetAllPoints(icon)
	icon.texture:SetTexture(iconID)

	icon.HighlightTexture = icon:CreateTexture()
	icon.HighlightTexture:SetTexture("Interface\\Buttons\\UI-Common-MouseHilight")
	icon.HighlightTexture:SetAllPoints()
	icon.HighlightTexture:SetBlendMode("ADD")
	icon:SetHighlightTexture(icon.HighlightTexture)

	icon.text = icon:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	icon.text:SetText(abilityName)
	icon.text:SetPoint("LEFT", icon, "RIGHT", 10, 0)

	return icon
end

local helpFrame = CreateFrame("Frame", nil, searchFrame, "InsetFrameTemplate")

helpFrame:SetHeight(430)
helpFrame:SetWidth(200)
helpFrame:SetPoint("TOPLEFT", searchFrame, "TOPRIGHT", -2, -27)

helpFrame:Hide()


helpFrame.title = helpFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalMed3")
helpFrame.title:SetText("Ability Shortcuts")
helpFrame.title:SetPoint("TOPLEFT", helpFrame, "TOPLEFT", 10, -10)

helpFrame.iconBite = createAbilityHelpButton("Bite", 132278, 16, helpFrame, "TOPLEFT", helpFrame.title, "BOTTOMLEFT", 10, -10)
helpFrame.iconCharge = createAbilityHelpButton("Charge", 132184, 16, helpFrame, "TOPLEFT", helpFrame.iconBite, "BOTTOMLEFT", 0, -7)
helpFrame.iconClaw = createAbilityHelpButton("Claw", 132140, 16, helpFrame, "TOPLEFT", helpFrame.iconCharge, "BOTTOMLEFT", 0, -7)
helpFrame.iconCower = createAbilityHelpButton("Cower", 132118, 16, helpFrame, "TOPLEFT", helpFrame.iconClaw, "BOTTOMLEFT", 0, -7)
helpFrame.iconDash = createAbilityHelpButton("Dash", 132120, 16, helpFrame, "TOPLEFT", helpFrame.iconCower, "BOTTOMLEFT", 0, -7)
helpFrame.iconDive = createAbilityHelpButton("Dive", 136126, 16, helpFrame, "TOPLEFT", helpFrame.iconDash, "BOTTOMLEFT", 0, -7)
helpFrame.iconFireBreath = createAbilityHelpButton("Fire Breath", 135789, 16, helpFrame, "TOPLEFT", helpFrame.iconDive, "BOTTOMLEFT", 0, -7)
helpFrame.iconFuriousHowl = createAbilityHelpButton("Furious Howl", 132203, 16, helpFrame, "TOPLEFT", helpFrame.iconFireBreath, "BOTTOMLEFT", 0, -7)
helpFrame.iconGore = createAbilityHelpButton("Gore", 135664, 16, helpFrame, "TOPLEFT", helpFrame.iconFuriousHowl, "BOTTOMLEFT", 0, -7)
helpFrame.iconLightningBreath = createAbilityHelpButton("Lightning Breath", 136048, 16, helpFrame, "TOPLEFT", helpFrame.iconGore, "BOTTOMLEFT", 0, -7)
helpFrame.iconPoisonSpit = createAbilityHelpButton("Poison Spit", 136016, 16, helpFrame, "TOPLEFT", helpFrame.iconLightningBreath, "BOTTOMLEFT", 0, -7)
helpFrame.iconProwl = createAbilityHelpButton("Prowl", 132142, 16, helpFrame, "TOPLEFT", helpFrame.iconPoisonSpit, "BOTTOMLEFT", 0, -7)
helpFrame.iconScorpidPoison = createAbilityHelpButton("Scorpid Poison", 132274, 16, helpFrame, "TOPLEFT", helpFrame.iconProwl, "BOTTOMLEFT", 0, -7)
helpFrame.iconScreech = createAbilityHelpButton("Screech", 132182, 16, helpFrame, "TOPLEFT", helpFrame.iconScorpidPoison, "BOTTOMLEFT", 0, -7)
helpFrame.iconShellShield = createAbilityHelpButton("Shell Shield", 132199, 16, helpFrame, "TOPLEFT", helpFrame.iconScreech, "BOTTOMLEFT", 0, -7)
helpFrame.iconThunderstomp = createAbilityHelpButton("Thunderstomp", 132189, 16, helpFrame, "TOPLEFT", helpFrame.iconShellShield, "BOTTOMLEFT", 0, -7)
helpFrame.iconWarp = createAbilityHelpButton("Warp", 135731, 16, helpFrame, "TOPLEFT", helpFrame.iconThunderstomp, "BOTTOMLEFT", 0, -7)


local optionsButton = CreateFrame("Button", nil, helpFrame)
optionsButton:SetMotionScriptsWhileDisabled(true)
optionsButton:SetSize(16, 16)
optionsButton:SetPoint("BOTTOMRIGHT", helpFrame, "BOTTOMRIGHT", -3, 3)

optionsButton.NormalTexture = optionsButton:CreateTexture()
optionsButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-OptionsButton")
optionsButton.NormalTexture:SetSize(16, 16)
optionsButton.NormalTexture:SetPoint("RIGHT", optionsButton, -3, 3)
optionsButton:SetNormalTexture(optionsButton.NormalTexture)

optionsButton.HighlightTexture = optionsButton:CreateTexture()
optionsButton.HighlightTexture:SetTexture("Interface\\Buttons\\UI-Common-MouseHilight")
optionsButton.HighlightTexture:SetSize(16, 16)
optionsButton.HighlightTexture:SetPoint("RIGHT", optionsButton, -3, 3)
optionsButton.HighlightTexture:SetBlendMode("ADD")
optionsButton:SetHighlightTexture(optionsButton.HighlightTexture)

optionsButton:SetScript("OnClick", function(self, button, down)
	if ClassicHunterPetInfo.FIRST_SLASH_START == 0 then
		ClassicHunterPetInfo.FIRST_SLASH_START = 1
		InterfaceOptionsFrame_OpenToCategory(ClassicHunterPetInfo.opanel)
	end
	InterfaceOptionsFrame_OpenToCategory(ClassicHunterPetInfo.opanel)
end)



------------------------------------
-- ExpandArrow                    --
------------------------------------
local expandArrow = CreateFrame("Button", nil, searchFrame)
expandArrow:SetMotionScriptsWhileDisabled(true)
expandArrow:SetSize(24, 24)
expandArrow:SetPoint("BOTTOMRIGHT", searchTextField2, "BOTTOMRIGHT", 0, 0)

expandArrow.NormalTexture = expandArrow:CreateTexture()
expandArrow.NormalTexture:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
expandArrow.NormalTexture:SetSize(24, 24)
expandArrow.NormalTexture:SetPoint("RIGHT", expandArrow, 0, 0)
expandArrow:SetNormalTexture(expandArrow.NormalTexture)

expandArrow.PushedTexture = expandArrow:CreateTexture()
expandArrow.PushedTexture:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
expandArrow.PushedTexture:SetSize(24, 24)
expandArrow.PushedTexture:SetPoint("RIGHT", expandArrow, 0, 0)
expandArrow:SetPushedTexture(expandArrow.PushedTexture)

expandArrow.DisabledTexture = expandArrow:CreateTexture()
expandArrow.DisabledTexture:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled")
expandArrow.DisabledTexture:SetSize(24, 24)
expandArrow.DisabledTexture:SetPoint("RIGHT", expandArrow, 0, 0)
expandArrow:SetDisabledTexture(expandArrow.DisabledTexture)

expandArrow.HighlightTexture = expandArrow:CreateTexture()
expandArrow.HighlightTexture:SetTexture("Interface\\Buttons\\UI-Common-MouseHilight")
expandArrow.HighlightTexture:SetSize(24, 24)
expandArrow.HighlightTexture:SetPoint("RIGHT", expandArrow, 0, 0)
expandArrow.HighlightTexture:SetBlendMode("ADD")
expandArrow:SetHighlightTexture(expandArrow.HighlightTexture)

expandArrow.NormalTexture:SetRotation(math.pi/2)
expandArrow.PushedTexture:SetRotation(math.pi/2)
expandArrow.DisabledTexture:SetRotation(math.pi/2)
expandArrow.HighlightTexture:SetRotation(math.pi/2)

local function flipExpandArrow()

	local rotation = math.pi / 2 * (ClassicHunterPetInfo.HELP_WINDOWS_OPEN and -1 or 1)

	expandArrow.NormalTexture:SetRotation(rotation)
	expandArrow.PushedTexture:SetRotation(rotation)
	expandArrow.DisabledTexture:SetRotation(rotation)
	expandArrow.HighlightTexture:SetRotation(rotation)
end

expandArrow:SetScript("OnClick", function(self, button, down)

	-- Flip boolean
	ClassicHunterPetInfo.HELP_WINDOWS_OPEN = not ClassicHunterPetInfo.HELP_WINDOWS_OPEN
	-- rotate Texture
    flipExpandArrow()
	-- set Visibility of help frame
	helpFrame:SetShown(ClassicHunterPetInfo.HELP_WINDOWS_OPEN)

	-- reposition scrollbar
	ClassicHunterPetInfo.searchFrame.scrollbar:ClearAllPoints()
	if ClassicHunterPetInfo.HELP_WINDOWS_OPEN then
		ClassicHunterPetInfo.searchFrame.scrollbar:SetPoint("RIGHT", ClassicHunterPetInfo.searchFrame, "LEFT", 1, -35)
	else
		ClassicHunterPetInfo.searchFrame.scrollbar:SetPoint("LEFT", ClassicHunterPetInfo.searchFrame, "RIGHT", -1, -35)
	end
end)

searchFrame.ExpandArrow = expandArrow


------------------------------------
-- Subframes                      --
------------------------------------
for f_index = 1, 6 do

	local s_frame = CreateFrame("Frame", nil, searchFrame, BackdropTemplateMixin and "BackdropTemplate")--, "ThinBorderTemplate")
	s_frame:SetHeight(70)
	s_frame:SetWidth(280)
	s_frame:SetPoint(
		"TOPLEFT",
		(#subframes == 0 and searchTextField2 or subframes[#subframes]),
		"BOTTOMLEFT", 0,
		(#subframes == 0 and -2 or 0)
	)
	s_frame:SetBackdrop(
		{
			bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
			edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
			tile = true, edgeSize = 1, tileSize = 5,
		}
	)
	s_frame:SetBackdropColor(0, 0, 0, 0.2)
	s_frame:SetBackdropBorderColor(0.3, 0.3, 0.30, 0.80)

	-- Icon
	s_frame.Icon = s_frame:CreateTexture()
	s_frame.Icon:SetHeight(35)
	s_frame.Icon:SetWidth(35)
	s_frame.Icon:SetPoint("LEFT", s_frame, "LEFT", 3, 15)
	s_frame.Icon:SetTexture(134400)

	-- PetName
	s_frame.Name = s_frame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	s_frame.Name:SetHeight(25)
	s_frame.Name:SetWidth(200)
	s_frame.Name:SetPoint("TOPLEFT", s_frame.Icon, "TOPRIGHT", 5, 5)
	s_frame.Name:SetJustifyH("LEFT")
	s_frame.Name:SetText("")

	-- Level, Location

	s_frame.LVL_and_Location = s_frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	local font, size, flags = s_frame.LVL_and_Location:GetFont()
	s_frame.LVL_and_Location:SetFont(font, size - 3, flags)
	s_frame.LVL_and_Location:SetHeight(25)
	s_frame.LVL_and_Location:SetWidth(200)
	s_frame.LVL_and_Location:SetPoint("TOP", s_frame.Name, "BOTTOM", 0, 12)
	s_frame.LVL_and_Location:SetJustifyH("LEFT")
	s_frame.LVL_and_Location:SetText("")

	-- Attacks
	s_frame.attack1 = s_frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	local font, size, flags = s_frame.attack1:GetFont()
	s_frame.attack1:SetFont(font, size - 3, flags)
	s_frame.attack1:SetHeight(25)
	s_frame.attack1:SetWidth(120)
	s_frame.attack1:SetPoint("TOPLEFT", s_frame.LVL_and_Location, "BOTTOMLEFT", 0, 12)
	s_frame.attack1:SetJustifyH("LEFT")
	s_frame.attack1:SetText("")

	s_frame.attack2 = s_frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	local font, size, flags = s_frame.attack2:GetFont()
	s_frame.attack2:SetFont(font, size - 3, flags)
	s_frame.attack2:SetHeight(25)
	s_frame.attack2:SetWidth(120)
	s_frame.attack2:SetPoint("LEFT", s_frame.attack1, "RIGHT", 0, 0)
	s_frame.attack2:SetJustifyH("LEFT")
	s_frame.attack2:SetText("")

	s_frame.attack3 = s_frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	local font, size, flags = s_frame.attack3:GetFont()
	s_frame.attack3:SetFont(font, size - 3, flags)
	s_frame.attack3:SetHeight(25)
	s_frame.attack3:SetWidth(120)
	s_frame.attack3:SetPoint("TOP", s_frame.attack1, "BOTTOM", 0, 15)
	s_frame.attack3:SetJustifyH("LEFT")
	s_frame.attack3:SetText("")


	s_frame.SetData = function (self, npc_id)

		if ClassicHunterPetInfo.PET_INFORMATION[npc_id] then

			local petData = ClassicHunterPetInfo.PET_INFORMATION[npc_id]
			local abilityData = ClassicHunterPetInfo.PET_ABILITIES[npc_id]
			local familyData = ClassicHunterPetInfo.PET_FAMILIES[petData["family"]]

			if petData and familyData then
				self.Icon:SetTexture(familyData["textureID"])
				self.Name:SetText(petData["name"])
				if petData["min_level"] == petData["max_level"] then
					self.LVL_and_Location:SetText(
						string.format(
							"Lvl: %s (%s)",
							ColorLevel(petData["min_level"]),
							petData["area"]
						)
					)
				else
					self.LVL_and_Location:SetText(
						string.format(
							"Lvl: %s-%s (%s)",
							ColorLevel(petData["min_level"]),
							ColorLevel(petData["max_level"]),
							petData["area"]
						)
					)
				end
				
			else
				self.Icon:SetTexture(134400)
				self.Name:SetText("")
				self.AttackSpeed:SetText("")
				self.LVL_and_Location:SetText("")
			end

			if abilityData then
				
				local index

				local lcl_atk_frame_1 = s_frame.attack1
				local lcl_atk_frame_2 = s_frame.attack2
				local lcl_atk_frame_3 = s_frame.attack3

				local searchKeyword = GetEditbox(1):GetText()

				if #abilityData == 2 then 
					lcl_atk_frame_2 = s_frame.attack3
					lcl_atk_frame_3 = s_frame.attack2
				end

				if abilityData[1] then
					lcl_atk_frame_1:SetText(
						("%s (Rank %d)"):format(ColorSearchKeyword(abilityData[1]["ability"], searchKeyword), abilityData[1]["rank"])
					)
				else
					lcl_atk_frame_1:SetText("")
				end

				if abilityData[2] then
					lcl_atk_frame_2:SetText(
						("%s (Rank %d)"):format(ColorSearchKeyword(abilityData[2]["ability"], searchKeyword), abilityData[2]["rank"])
					)
				else
					lcl_atk_frame_2:SetText("")
				end
				if abilityData[3] then
					lcl_atk_frame_3:SetText(
						("%s (Rank %d)"):format(ColorSearchKeyword(abilityData[3]["ability"], searchKeyword), abilityData[3]["rank"])
					)
				else
					lcl_atk_frame_3:SetText("")
				end
			else
				s_frame.attack1:SetText("")
				s_frame.attack2:SetText("")
				s_frame.attack3:SetText("")
			end
		end
	end

	s_frame:Hide()

	table.insert(subframes, s_frame)
end

searchFrame.subframes = subframes



------------------------------------
-- Scrollbar                      --
------------------------------------
local scrollbar = CreateFrame("Slider", "ClassicHunterPetInfoFrame_ScrollBar", searchFrame, "OptionsSliderTemplate")
scrollbar:SetWidth(10)
scrollbar:SetHeight(425)
scrollbar:SetOrientation('VERTICAL')
scrollbar:SetPoint("LEFT", searchFrame, "RIGHT", -1, -35)
--scrollbar:SetPoint("RIGHT", searchFrame, "LEFT", 1, -35)

scrollbar:SetMinMaxValues(0, 1)
scrollbar:SetValue(0)
scrollbar:Hide()

getglobal(scrollbar:GetName() .. 'Low'):SetText('')
getglobal(scrollbar:GetName() .. 'High'):SetText('')
getglobal(scrollbar:GetName() .. 'Text'):SetText('')
scrollbar.UpdateScrollbar = function (self, newMaxValue, value)
	if newMaxValue <= 0 then
		self:Hide()
	else
		self:Show()
	end

	if self:IsShown() then
		scrollbar:SetMinMaxValues(0, newMaxValue)
		self:SetValue(value)
	end
end

scrollbar:SetScript("OnValueChanged", function (self, value)
	local floored_Value = floor(value)
	self:GetParent().DataOffset = floored_Value
	self:GetParent():UpdateFrame()
end)

searchFrame.scrollbar = scrollbar


ClassicHunterPetInfo.searchFrame = searchFrame



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Options panel  ---------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-- helper function for creating checkboxes
local function CreateCheckbox(parentFrame, checkboxFrameName, off_x, off_y, anchorFrame, DBvariable, text)
	-- checkbox
	local checkbox = CreateFrame("CheckButton", checkboxFrameName, parentFrame, "OptionsBaseCheckButtonTemplate", off_x, off_y, anchorFrame)
	checkbox:SetPoint("TOPLEFT", anchorFrame, "BOTTOMLEFT", off_x, off_y)
	checkbox:SetScript("OnClick", function()
		ClassicHunterPetInfoDB[DBvariable] = not ClassicHunterPetInfoDB[DBvariable]
		checkbox:SetChecked(ClassicHunterPetInfoDB[DBvariable])
	end)
	-- text
	local textfield = parentFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	textfield:SetPoint("LEFT", checkbox, "RIGHT", 10, 1)
	textfield:SetJustifyH("LEFT")
	textfield:SetText(text)

	return checkbox, textfield
end


-- option panel

local opanel = CreateFrame("Frame", "ClassicHunterPetInfoOptionsPanel", UIParent)

-- main titles
opanel.title = opanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
opanel.title:SetPoint("TOPLEFT", 16, -16)
opanel.title:SetText("ClassicHunterPetInfo")
opanel.title:SetJustifyH("LEFT")

opanel.title2 = opanel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
opanel.title2:SetPoint("TOPLEFT", 16, -35)
opanel.title2:SetText("Author: Spielstein@Curse\nVersion: " .. GetAddOnMetadata("ClassicHunterPetInfo", "Version"))
opanel.title2:SetJustifyH("LEFT")


-- option title
opanel.optionTitle = opanel:CreateFontString(nil, "ARTWORK", "GameFontNormalMed3")
opanel.optionTitle:SetPoint("TOPLEFT",  opanel.title2, "BOTTOMLEFT", 0, -20)
opanel.optionTitle:SetText("Options")
opanel.optionTitle:SetJustifyH("LEFT")

-- option for Showing Tooltip information for own pet
opanel.BOXshowForOwnPet, opanel.TEXTshowForOwnPet = CreateCheckbox(
	opanel, "HPI_showForOwnPet", 0, -5, opanel.optionTitle,
	"showForOwnPet", "Show Tooltip information for own pet")

-- option for Showing Tooltip information for other Hunters' pets
opanel.BOXshowForOtherPets, opanel.TEXTshowForOtherPets = CreateCheckbox(
	opanel, "HPI_showForOtherPets", 0, -1, opanel.BOXshowForOwnPet,
	"showForOtherPets", "Show Tooltip information for other Hunters' pets")

-- option for Showing Tooltip information for wild pets
opanel.BOXshowForWildPets, opanel.TEXTshowForWildPets = CreateCheckbox(
	opanel, "HPI_showForWildPets", 0, -1, opanel.BOXshowForOtherPets,
	"showForWildPets", "Show Tooltip information for wild pets")

-- suboptions title
opanel.suboptionTitle = opanel:CreateFontString(nil, "ARTWORK", "GameFontNormalMed3")
opanel.suboptionTitle:SetPoint("TOPLEFT",  opanel.optionTitle, "BOTTOMLEFT", 0, -100)
opanel.suboptionTitle:SetText("Enable/Disable single information")
opanel.suboptionTitle:SetJustifyH("LEFT")

--
opanel.BOXshowFamily, opanel.TEXTshowFamily = CreateCheckbox(
	opanel, "HPI_showFamily", 0, -5, opanel.suboptionTitle,
	"showFamily", "Show Tooltip information for the pet's Family")

--
opanel.BOXshowDiet, opanel.TEXTshowDiet = CreateCheckbox(
	opanel, "HPI_showDiet", 0, -1, opanel.BOXshowFamily,
	"showDiet", "Show Tooltip information for the pet's Diet")

--
opanel.BOXshowDietIcons, opanel.TEXTshowDietIcons = CreateCheckbox(
	opanel, "HPI_showDietIcons", 0, -1, opanel.BOXshowDiet,
	"showDietIcons", "Show Icons instead of Text for a pet's Diet in the Tooltip")


--
opanel.BOXshowType, opanel.TEXTshowType = CreateCheckbox(
	opanel, "HPI_showType", 0, -1, opanel.BOXshowDietIcons,
	"showType", "Show Tooltip information for the pet's Combat Type")

--
opanel.BOXshowStatmod, opanel.TEXTshowStatmod = CreateCheckbox(
	opanel, "HPI_showStatmod", 0, -1, opanel.BOXshowType,
	"showStatmod", "Show Tooltip information for the pet's Stat Modifier")

--
opanel.BOXshowLearnable, opanel.TEXTshowLearnable = CreateCheckbox(
	opanel, "HPI_showLearnable", 0, -1, opanel.BOXshowStatmod,
	"showLearnable", "Show Tooltip information for Abilities learnable by the pet")

--
opanel.BOXshowName, opanel.TEXTshowName = CreateCheckbox(
	opanel, "HPI_showName", 0, -1, opanel.BOXshowLearnable,
	"showName", "Show Tooltip information for the pet's NPC Name")

--
opanel.BOXshowLvlRange, opanel.TEXTshowLvlRange = CreateCheckbox(
	opanel, "HPI_showLvlRange", 0, -1, opanel.BOXshowName,
	"showLvlRange", "Show Tooltip information for the pet's NPC Level Range")

--
opanel.BOXshowArea, opanel.TEXTshowArea = CreateCheckbox(
	opanel, "HPI_showArea", 0, -1, opanel.BOXshowLvlRange,
	"showArea", "Show Tooltip information for the pet's NPC Location")

--
opanel.BOXshowTeaches, opanel.TEXTshowTeaches = CreateCheckbox(
	opanel, "HPI_showTeaches", 0, -1, opanel.BOXshowArea,
	"showTeaches", "Show Tooltip information for Abilities the pet can teach the hunter")

--
opanel.BOXshowTeachesOwnPet, opanel.TEXTshowTeachesOwnPet = CreateCheckbox(
	opanel, "HPI_showTeachesOwnPet", 35, -1, opanel.BOXshowTeaches,
	"showTeachesOwnPet", "Show learnable Abilities on Own Pet")

--
opanel.BOXshowTeachesOtherPets, opanel.TEXTshowTeachesOtherPets = CreateCheckbox(
	opanel, "HPI_showTeachesOtherPets", 0, -1, opanel.BOXshowTeachesOwnPet,
	"showTeachesOtherPets", "Show learnable Abilities on Other Hunters' Pets")



ClassicHunterPetInfo.opanel = opanel
ClassicHunterPetInfo.opanel.name = "ClassicHunterPetInfo";
InterfaceOptions_AddCategory(ClassicHunterPetInfo.opanel);



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Hooking functions  -----------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-- /run print(IsSpellKnown(23148, true))

-- hooking the gametooltip
local function HookfunctionForGametooltip(...)

	if ClassicHunterPetInfoDB == nil then return end

	-- variables
	local _

	local guid = UnitGUID("mouseover")

	-- only proceed with a valid guid
	if guid and not UnitIsUnit("mouseover", "player") then

		local isOwnPet = UnitIsUnit("mouseover", "pet")

		-- Stop when options indicate that tooltip must not be shown
		if isOwnPet and not ClassicHunterPetInfoDB.showForOwnPet then
			return
		end

		-- split guid
		local guid_type, zero, server_id, instance_id, zone_uid, npc_id, spawn_uid = strsplit("-", guid)

		-- Stop when options indicate that tooltip must not be shown
		if guid_type == "Pet" and not ClassicHunterPetInfoDB.showForOtherPets then
			return
		end
		if guid_type == "Creature" and not ClassicHunterPetInfoDB.showForWildPets then
			return
		end

		-- only start if mouseover target is pet or creature
		if guid_type == "Creature" or guid_type == "Pet" then

			-- only proceed with a valid npc_id
			if npc_id then

				-- only proceed with a valid npc_id_as_number (after converting string to number)
				local npc_id_as_number = tonumber(npc_id)
				if npc_id_as_number then

					-- only proceed if npc_id is in database
					if ClassicHunterPetInfo.PET_INFORMATION[npc_id_as_number] then

						local petinfo = ClassicHunterPetInfo.PET_INFORMATION[npc_id_as_number]

						if ClassicHunterPetInfoDB.showFamily then
							GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_family"], petinfo["family"])
						end

						if ClassicHunterPetInfo.PET_FAMILIES[petinfo["family"]] then

							local familyinfo = ClassicHunterPetInfo.PET_FAMILIES[petinfo["family"]]

							if ClassicHunterPetInfoDB.showDiet then
								local dietInfoTable = {}

								if ClassicHunterPetInfoDB.showDietIcons then
									for index = 1, #familyinfo["diet"] do
										dietInfoTable[index] = "|T" .. ClassicHunterPetInfo.DIET_ICONS[familyinfo["diet"][index]] .. ":14:14:2:0|t"
									end
								else
									dietInfoTable = familyinfo["diet"]
								end
								GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_diet"], table.concat(dietInfoTable, ", "))
							end

							if ClassicHunterPetInfoDB.showType then
								local type_icon = ""
								if familyinfo["type"] == "|cff1070ffDefense|r" then
									type_icon = INLINE_TANK_ICON
								elseif familyinfo["type"] == "|cffa40000Offense|r" then
									type_icon = INLINE_DAMAGER_ICON
								else
									type_icon = ""--INLINE_HEALER_ICON
								end

								GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_type"], type_icon .. familyinfo["type"])
							end

							if ClassicHunterPetInfoDB.showStatmod then
								GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"],
									string.format("HP: %.2f - Arm: %.2f - Dmg: %.2f",
										familyinfo["stat_mod"]["health"],
										familyinfo["stat_mod"]["armor"],
										familyinfo["stat_mod"]["damage"]
										)
								)
							end

							if ClassicHunterPetInfoDB.showLearnable then
								GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"], table.concat(familyinfo["abilities"], ", "))
							end
						end

						if ClassicHunterPetInfo.PET_ABILITIES[npc_id_as_number] and ClassicHunterPetInfoDB.showTeaches then

							if guid_type ~= "Pet" or
								(guid_type == "Pet" and ClassicHunterPetInfoDB.showTeachesOwnPet and isOwnPet) or
								(guid_type == "Pet" and ClassicHunterPetInfoDB.showTeachesOtherPets and not isOwnPet) then

								local index
								local abilityinfo = ClassicHunterPetInfo.PET_ABILITIES[npc_id_as_number]
								local abilitytexts = {}

								for index = 1, #abilityinfo do
									local dummyText = (" "):rep(#ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"])
									if index == 1 then
										GameTooltip:AddDoubleLine(
											ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"],
											("%s (Rank %d)"):format(abilityinfo[index]["ability"], abilityinfo[index]["rank"])
										)
									else
										GameTooltip:AddDoubleLine(
											dummyText,
											("%s (Rank %d)"):format(abilityinfo[index]["ability"], abilityinfo[index]["rank"])
										)
									end
							    	--table.insert(abilitytexts, ("%s (Rank %d)"):format(abilityinfo[index]["ability"], abilityinfo[index]["rank"]))
							  	end

							  	--GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"], table.concat(abilitytexts, ", "))
							  end
						end

						-- show the following information only if pet is not your own
						if guid_type == "Pet" and not isOwnPet then

							if ClassicHunterPetInfoDB.showName then
								GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_name"], petinfo["name"])
							end

							if ClassicHunterPetInfoDB.showLvlRange then
								if petinfo["min_level"] == petinfo["max_level"] then

									GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"], string.format("%s", ColorLevel(petinfo["min_level"])))
								else

									GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"], string.format("%s - %s", ColorLevel(petinfo["min_level"]), ColorLevel(petinfo["max_level"])))
								end
							end
							
							if ClassicHunterPetInfoDB.showArea then
								GameTooltip:AddDoubleLine(ClassicHunterPetInfo.LOCALIZATION["tlp_area"], petinfo["area"])
							end
						end		

						GameTooltip:Show()
					end
				end
			end
		end
	end
end



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  OnEvent Handler  -------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-- OnEvent handler
local function OnEvent(self, event, arg1, arg2, ...)
	if event == "ADDON_LOADED" and arg1 == "ClassicHunterPetInfo" then

		-- creating the saved variables' array if needed
		if ClassicHunterPetInfoDB == nil then
			ClassicHunterPetInfoDB = {}
    	end

    	-- set the saved variables' default value if needed
    	-- main options
    	if ClassicHunterPetInfoDB.showForOwnPet == nil then
    		ClassicHunterPetInfoDB.showForOwnPet = true
    	end
		if ClassicHunterPetInfoDB.showForOtherPets == nil then
			ClassicHunterPetInfoDB.showForOtherPets = true
		end
		if ClassicHunterPetInfoDB.showForWildPets == nil then
			ClassicHunterPetInfoDB.showForWildPets = true
		end
		-- secondary options
		 if ClassicHunterPetInfoDB.showDietIcons == nil then
		 	ClassicHunterPetInfoDB.showDietIcons = false
		 end
		if ClassicHunterPetInfoDB.showFamily == nil then
			ClassicHunterPetInfoDB.showFamily = false
		end
		if ClassicHunterPetInfoDB.showType == nil then
			ClassicHunterPetInfoDB.showType = true
		end
		if ClassicHunterPetInfoDB.showStatmod == nil then
			ClassicHunterPetInfoDB.showStatmod = false
		end
		if ClassicHunterPetInfoDB.showLearnable == nil then
			ClassicHunterPetInfoDB.showLearnable = false
		end
		if ClassicHunterPetInfoDB.showDiet == nil then
			ClassicHunterPetInfoDB.showDiet = true
		end
		if ClassicHunterPetInfoDB.showName == nil then
			ClassicHunterPetInfoDB.showName = true
		end
		if ClassicHunterPetInfoDB.showLvlRange == nil then
			ClassicHunterPetInfoDB.showLvlRange = true
		end
		if ClassicHunterPetInfoDB.showArea == nil then
			ClassicHunterPetInfoDB.showArea = true
		end
		if ClassicHunterPetInfoDB.showTeaches == nil then
			ClassicHunterPetInfoDB.showTeaches = true
		end
		if ClassicHunterPetInfoDB.showTeachesOwnPet == nil then
			ClassicHunterPetInfoDB.showTeachesOwnPet = false
		end
		if ClassicHunterPetInfoDB.showTeachesOtherPets == nil then
			ClassicHunterPetInfoDB.showTeachesOtherPets = false
		end

		-- unregister PLAYER_LOGIN after retrieving saved variables
    	ClassicHunterPetInfo.mainFrame:UnregisterEvent("ADDON_LOADED")

    	-- set up the option panel
    	-- main options
    	ClassicHunterPetInfo.opanel.BOXshowForOwnPet:SetChecked(ClassicHunterPetInfoDB.showForOwnPet)
    	ClassicHunterPetInfo.opanel.BOXshowForOtherPets:SetChecked(ClassicHunterPetInfoDB.showForOtherPets)
    	ClassicHunterPetInfo.opanel.BOXshowForWildPets:SetChecked(ClassicHunterPetInfoDB.showForWildPets)
    	-- secondary options
    	ClassicHunterPetInfo.opanel.BOXshowDietIcons:SetChecked(ClassicHunterPetInfoDB.showDietIcons)
		ClassicHunterPetInfo.opanel.BOXshowFamily:SetChecked(ClassicHunterPetInfoDB.showFamily)
		ClassicHunterPetInfo.opanel.BOXshowType:SetChecked(ClassicHunterPetInfoDB.showType)
		ClassicHunterPetInfo.opanel.BOXshowStatmod:SetChecked(ClassicHunterPetInfoDB.showStatmod)
		ClassicHunterPetInfo.opanel.BOXshowLearnable:SetChecked(ClassicHunterPetInfoDB.showLearnable)
		ClassicHunterPetInfo.opanel.BOXshowDiet:SetChecked(ClassicHunterPetInfoDB.showDiet)
		ClassicHunterPetInfo.opanel.BOXshowName:SetChecked(ClassicHunterPetInfoDB.showName)
		ClassicHunterPetInfo.opanel.BOXshowLvlRange:SetChecked(ClassicHunterPetInfoDB.showLvlRange)
		ClassicHunterPetInfo.opanel.BOXshowArea:SetChecked(ClassicHunterPetInfoDB.showArea)
		ClassicHunterPetInfo.opanel.BOXshowTeaches:SetChecked(ClassicHunterPetInfoDB.showTeaches)
		ClassicHunterPetInfo.opanel.BOXshowTeachesOwnPet:SetChecked(ClassicHunterPetInfoDB.showTeachesOwnPet)
		ClassicHunterPetInfo.opanel.BOXshowTeachesOtherPets:SetChecked(ClassicHunterPetInfoDB.showTeachesOtherPets)	
	end
end



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  LDB initializing  ------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


local dataBroker = ldb:NewDataObject("ClassicHunterPetInfo",
	{type = "launcher", label = "CHPI", text = "ClassicHunterPetInfo", icon = 132161}
)

function dataBroker.OnClick(self, button)
	if button == "RightButton" then
		if ClassicHunterPetInfo.FIRST_SLASH_START == 0 then
	        ClassicHunterPetInfo.FIRST_SLASH_START = 1
	        InterfaceOptionsFrame_OpenToCategory(ClassicHunterPetInfo.opanel)
	    end
	    InterfaceOptionsFrame_OpenToCategory(ClassicHunterPetInfo.opanel)
	elseif button == "LeftButton" then
	    if ClassicHunterPetInfo.searchFrame then
			if ClassicHunterPetInfo.searchFrame:IsShown() then
				ClassicHunterPetInfo.searchFrame:Hide()
			else
				ClassicHunterPetInfo.searchFrame:Show()
			end
		end
	end
end

function dataBroker.OnTooltipShow(tt)
	tt:AddLine("ClassicHunterPetInfo")
	tt:AddLine("|cffeda55fLeft-Click|r to access search window.", 0.2, 1, 0.2, 1)
	tt:AddLine("|cffeda55fRight-Click|r to access options.", 0.2, 1, 0.2, 1)
end



----------------------------------------------------------------------------
----------------------------------------------------------------------------
--------  Script startup  --------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------


-- hook for the gametooltip
GameTooltip:HookScript("OnTooltipSetUnit", HookfunctionForGametooltip)

-- loading saved settings
ClassicHunterPetInfo.mainFrame:RegisterEvent("ADDON_LOADED")
ClassicHunterPetInfo.mainFrame:SetScript("OnEvent", OnEvent)


-- slash commands
SLASH_CLASSICHUNTERPETINFO1 = "/hpi"
SLASH_CLASSICHUNTERPETINFO2 = "/hunterpetinfo"
SLASH_CLASSICHUNTERPETINFO3 = "/chpi"
SLASH_CLASSICHUNTERPETINFO4 = "/classichunterpetinfo"
SlashCmdList["CLASSICHUNTERPETINFO"] = function(msg)

	local optionKeywords = {
		"options",
		"option",
		"opt",
		"o",
		"config",
		"conf",
		"c",
	}

	local x; local kws = {}; for x in pairs(optionKeywords) do kws[optionKeywords[x]] = true end

	if msg ~= "" then
		if kws[msg] then
			if ClassicHunterPetInfo.FIRST_SLASH_START == 0 then
		        ClassicHunterPetInfo.FIRST_SLASH_START = 1
		        InterfaceOptionsFrame_OpenToCategory(ClassicHunterPetInfo.opanel)
		    end
		    InterfaceOptionsFrame_OpenToCategory(ClassicHunterPetInfo.opanel)
		else
			print("To access the options of ClassicHunterPetInfo type one of the following commands:")
			print("/hpi options  /hpi option  /hpi opt  /hpi o")
			print("/hpi config  /hpi conf  /hpi c")
			print("To open ClassicHunterPetInfo search window only type:")
			print("/hpi")
		end
	else
		if ClassicHunterPetInfo.searchFrame then
			if ClassicHunterPetInfo.searchFrame:IsShown() then
				ClassicHunterPetInfo.searchFrame:Hide()
			else
				ClassicHunterPetInfo.searchFrame:Show()
			end
		end
	end
end

SLASH_RELOADUI1 = "/rl";
SlashCmdList["RELOADUI"] = ReloadUI;