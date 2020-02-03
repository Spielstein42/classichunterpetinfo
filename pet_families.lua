-- Addon:	     ClassicHunterPetInfo
-- Author:	     Spielstein@Curse

if select(2, UnitClass("player")) ~= "HUNTER" then
    --return
end


ClassicHunterPetInfo.PET_FAMILIES = {
	["Bat"] = {
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
	["Bear"] = {
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
			"all",
			--"Bread",
			--"Cheese",
			--"Fish",
			--"Fruit",
			--"Fungus",
			--"Meat",
		},
		["textureID"] = 132183,
	},
	["Boar"] = {
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
			"Growl",
		},
		["diet"] = {
			"all",
			--"Bread",
			--"Cheese",
			--"Fish",
			--"Fruit",
			--"Fungus",
			--"Meat",
		},
		["textureID"] = 132184,
	},
	["Carrion Bird"] = {
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
	["Cat"] = {
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
	["Crab"] = {
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
	["Crocolisk"] = {
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
	["Gorilla"] = {
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
	["Hyena"] = {
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
	["Owl"] = {
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
	["Raptor"] = {
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
			"Growl",
		},
		["diet"] = {
			"Meat",
		},
		["textureID"] = 132193,
	},
	["Scorpid"] = {
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
	["Spider"] = {
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
	["Tallstrider"] = {
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
	["Turtle"] = {
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
	["Wind Serpent"] = {
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
	["Wolf"] = {
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
}