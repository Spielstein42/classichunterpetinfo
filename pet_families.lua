-- Addon:	     ClassicHunterPetInfo
-- Author:	     Spielstein@Curse

if select(2, UnitClass("player")) ~= "HUNTER" then
    --return
end


ClassicHunterPetInfo.PET_FAMILIES = {

	-----------------------------
	-- Vanilla                 --
	-----------------------------

	["Bat"] = { -- added in Vanilla
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.07,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Dive",
			"Growl",
			"Screech",
		},
		["diet"] = {
			"Fruit",
			"Fungus",
		},
		["textureID"] = 132182,
	},
	["Bear"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.08,
			["armor"] = 1.05,
			["damage"] = 0.91,
		},
		["abilities"] = {
			"Bite",
			"Claw",
			"Cower",
			"Growl",
		},
		["diet"] = {
			"Bread",
			"Cheese",
			"Fish",
			"Fruit",
			"Fungus",
			"Meat",
		},
		["textureID"] = 132183,
	},
	["Boar"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.04,
			["armor"] = 1.09,
			["damage"] = 0.90,
		},
		["abilities"] = {
			"Bite",
			"Charge",
			"Cower",
			"Dash",
			"Gore",
			"Growl",
		},
		["diet"] = {
			"Bread",
			"Cheese",
			"Fish",
			"Fruit",
			"Fungus",
			"Meat",
		},
		["textureID"] = 132184,
	},
	["Carrion Bird"] = { -- added in Vanilla
		["type"] = "|cff159908General|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.05,
			["damage"] = 1.00,
		},
		["abilities"] = {
			"Bite",
			"Claw",
			"Cower",
			"Dive",
			"Growl",
			"Screech",
		},
		["diet"] = {
			"Fish",
			"Meat",
		},
		["textureID"] = 132200,
	},
	["Cat"] = { -- added in Vanilla
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 0.98,
			["armor"] = 1.00,
			["damage"] = 1.10,
		},
		["abilities"] = {
			"Bite",
			"Claw",
			"Cower",
			"Dash",
			"Growl",
			"Prowl",
		},
		["diet"] = {
			"Fish",
			"Meat",
		},
		["textureID"] = 132185,
	},
	["Crab"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 0.96,
			["armor"] = 1.13,
			["damage"] = 0.95,
		},
		["abilities"] = {
			"Claw",
			"Cower",
			"Growl",
		},
		["diet"] = {
			"Bread",
			"Fish",
			"Fruit",
			"Fungus",
		},
		["textureID"] = 132186,
	},
	["Crocolisk"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 0.95,
			["armor"] = 1.10,
			["damage"] = 1.00,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Growl",
		},
		["diet"] = {
			"Fish",
			"Meat",
		},
		["textureID"] = 132187,
	},
	["Gorilla"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.04,
			["armor"] = 1.00,
			["damage"] = 1.02,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Growl",
			"Thunderstomp",
		},
		["diet"] = {
			"Fruit",
			"Fungus",
		},
		["textureID"] = 132189,
	},
	["Hyena"] = { -- added in Vanilla
		["type"] = "|cff159908General|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.05,
			["damage"] = 1.00,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Dash",
			"Growl",
		},
		["diet"] = {
			"Fruit",
			"Meat",
		},
		["textureID"] = 132190,
	},
	["Owl"] = { -- added in Vanilla
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.07,
		},
		["abilities"] = {
			"Claw",
			"Cower",
			"Dive",
			"Growl",
			"Screech",
		},
		["diet"] = {
			"Meat",
		},
		["textureID"] = 132192,
	},
	["Raptor"] = { -- added in Vanilla
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 0.95,
			["armor"] = 1.03,
			["damage"] = 1.10,
		},
		["abilities"] = {
			"Bite",
			"Claw",
			"Cower",
			"Dash",
			"Growl",
		},
		["diet"] = {
			"Meat",
		},
		["textureID"] = 132193,
	},
	["Scorpid"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.10,
			["damage"] = 0.94,
		},
		["abilities"] = {
			"Claw",
			"Cower",
			"Growl",
			"Scorpid Poison",
		},
		["diet"] = {
			"Meat",
		},
		["textureID"] = 132195,
	},
	["Spider"] = { -- added in Vanilla
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.07,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Growl",
		},
		["diet"] = {
			"Meat",
		},
		["textureID"] = 132196,
	},
	["Tallstrider"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.05,
			["armor"] = 1.00,
			["damage"] = 1.00,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Dash",
			"Growl",
		},
		["diet"] = {
			"Cheese",
			"Fruit",
			"Fungus",
		},
		["textureID"] = 132198,
	},
	["Turtle"] = { -- added in Vanilla
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.13,
			["damage"] = 0.90,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Growl",
			"Shell Shield",
		},
		["diet"] = {
			"Fish",
			"Fruit",
			"Fungus",
		},
		["textureID"] = 132199,
	},
	["Wind Serpent"] = { -- added in Vanilla
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.07,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Dive",
			"Growl",
			"Lightning Breath",
		},
		["diet"] = {
			"Bread",
			"Cheese",
			"Fish",
		},
		["textureID"] = 132202,
	},
	["Wolf"] = { -- added in Vanilla
		["type"] = "|cff159908General|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.05,
			["damage"] = 1.00,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Dash",
			"Furious Howl",
			"Growl",
		},
		["diet"] = {
			"Meat",
		},
		["textureID"] = 132203,
	},


	-----------------------------
	-- The Burning Crusade     --
	-----------------------------

	["Dragonhawk"] = { -- added in TBC
		["type"] = "|cff159908General|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.00,
		},
		["abilities"] = {        
			"Bite",
			"Cower",
			"Dive",
			"Fire Breath",
			"Growl",
		},
		["diet"] = {
			"Fish",
			"Raw Fish",
			"Fruit",
			"Meat",
			"Raw Meat",
		},
		["textureID"] = 132188,
	},
	["Nether Ray"] = { -- added in TBC
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.10,
			["armor"] = 0.90,
			["damage"] = 1.03,
		},
		["abilities"] = {
			"Bite",
			"Cower",
			"Dive",
			"Growl",
		},
		["diet"] = {
			"Meat",
			"Raw Meat",
		},
		["textureID"] = 132191,
	},
	["Ravager"] = { -- added in TBC
		["type"] = "|cffa40000Offense|r",
		["stat_mod"] = {
			["health"] = 0.93,
			["armor"] = 1.05,
			["damage"] = 1.10,
		},
		["abilities"] = {        
			"Bite",
			"Cower",
			"Dash",
			"Gore",
			"Growl",
		},
		["diet"] = {
			"Meat",
			"Raw Meat",
		},
		["textureID"] = 132194,
	},
	["Serpent"] = { -- added in TBC
		["type"] = "|cff159908General|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.00,
		},
		["abilities"] = {        
			"Bite",
			"Cower",
			"Growl",
			"Poison Spit",
		},
		["diet"] = {
			"Fish",
			"Raw Fish",
			"Meat",
			"Raw Meat",
		},
		["textureID"] = 136040,
	},
	["Sporebat"] = { -- added in TBC
		["type"] = "|cff159908General|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.00,
			["damage"] = 1.00,
		},
		["abilities"] = {   
			"Cower",
			"Growl",
		},
		["diet"] = {
			"Bread",
			"Cheese",
			"Fruit",
			"Fungus",
		},
		["textureID"] = 132197,
	},
	["Warp Stalker"] = { -- added in TBC
		["type"] = "|cff1070ffDefense|r",
		["stat_mod"] = {
			["health"] = 1.00,
			["armor"] = 1.05,
			["damage"] = 0.94,
		},
		["abilities"] = {        
			"Bite",
			"Claw",
			"Cower",
			"Growl",
			"Warp",
		},
		["diet"] = {
			"Fish",
			"Raw Fish",
			"Fruit",
		},
		["textureID"] = 132201,
	},
}