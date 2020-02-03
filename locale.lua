-- Addon:	     ClassicHunterPetInfo
-- Author:	     Spielstein@Curse

if select(2, UnitClass("player")) ~= "HUNTER" then
    --return
end

-- locale stuff
-- localized country names
ClassicHunterPetInfo.LOCALIZATION = {}

-- english
ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

--[[
--german
if ClassicHunterPetInfo.LOCALE_CODE == "deDE" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

--french
elseif ClassicHunterPetInfo.LOCALE_CODE == "frFR" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

-- italian
if ClassicHunterPetInfo.LOCALE_CODE == "itIT" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

-- russian
if ClassicHunterPetInfo.LOCALE_CODE == "ruRU" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

-- spanish
if ClassicHunterPetInfo.LOCALE_CODE == "esES" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

-- mexican spanish
if ClassicHunterPetInfo.LOCALE_CODE == "esMX" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

-- portugues
if ClassicHunterPetInfo.LOCALE_CODE == "ptBR" then
	ClassicHunterPetInfo.LOCALIZATION["tlp_attack_speed"] = "AttackSpeed"
	ClassicHunterPetInfo.LOCALIZATION["tlp_family"] = "PetFamiliy"
	ClassicHunterPetInfo.LOCALIZATION["tlp_type"] = "PetType"
	ClassicHunterPetInfo.LOCALIZATION["tlp_statmod"] = "StatModifier"
	ClassicHunterPetInfo.LOCALIZATION["tlp_learnable"] = "Learnable"
	ClassicHunterPetInfo.LOCALIZATION["tlp_diet"] = "Diet"
	ClassicHunterPetInfo.LOCALIZATION["tlp_name"] = "Name"
	ClassicHunterPetInfo.LOCALIZATION["tlp_lvlrange"] = "LevelRange"
	ClassicHunterPetInfo.LOCALIZATION["tlp_area"] = "Area"
	ClassicHunterPetInfo.LOCALIZATION["tlp_teaches"] = "Teaches"

end

]]--

-- localized option strings
--GroupfinderFlags.OPTION_LOCALE = {
	-- TODO
--}
