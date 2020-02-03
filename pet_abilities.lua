-- Addon:	     ClassicHunterPetInfo
-- Author:	     Spielstein@Curse

if select(2, UnitClass("player")) ~= "HUNTER" then
    --return
end

-- .*npc=(\d+)'>.*
-- [$1] = {\n\t["ability"] = XXXXX,\n\t["rank"] = YYYYY\n},

ClassicHunterPetInfo.PET_ABILITIES = {
	[1509] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1505] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[2958] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1688] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1994] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[30] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1138] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[2959] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1922] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1999] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1131] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[3110] = {
		{
			["ability"] = "Bite",
			["rank"] = 1,
		}
	},
	[1133] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[2000] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[118] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[1555] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[2960] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 1,
		}
	},
	[1195] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[834] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[2001] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[1765] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 1,
		}
	},
	[1132] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[7319] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[1693] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[442] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[3461] = {
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[1923] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[4005] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[1185] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[8393] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[14266] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[505] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[3823] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[4006] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[3653] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		},
		{
			["ability"] = "Shell Shield",
			["rank"] = 1,
		}
	},
	[2350] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[569] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[11921] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[2476] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[616] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[521] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[4824] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		},
		{
			["ability"] = "Shell Shield",
			["rank"] = 1,
		}
	},
	[14279] = {
		{
			["ability"] = "Bite",
			["rank"] = 3,
		}
	},
	[628] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[1112] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[2349] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[4887] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		},
		{
			["ability"] = "Shell Shield",
			["rank"] = 1,
		}
	},
	[2089] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[1258] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 2,
		}
	},
	[4825] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		},
		{
			["ability"] = "Shell Shield",
			["rank"] = 1,
		}
	},
	[2348] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[574] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[3825] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 2,
		}
	},
	[3821] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		}
	},
	[2408] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		},
		{
			["ability"] = "Shell Shield",
			["rank"] = 1,
		}
	},
	[14223] = {
		{
			["ability"] = "Bite",
			["rank"] = 4,
		},
		{
			["ability"] = "Shell Shield",
			["rank"] = 1,
		}
	},
	[2563] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[4143] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[4413] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[2727] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		},
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[4341] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[2565] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[4396] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[4411] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[4344] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[4412] = {
		{
			["ability"] = "Bite",
			["rank"] = 5,
		}
	},
	[2753] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[14233] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[4345] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[5286] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 3,
		},
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[769] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[1087] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[4400] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[8211] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		},
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[5356] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 3,
		}
	},
	[4841] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[8762] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		}
	},
	[8959] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 3,
		}
	},
	[14339] = {
		{
			["ability"] = "Bite",
			["rank"] = 6,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 3,
		}
	},
	[8277] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[2505] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[2681] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		},
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[8933] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[3581] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[8961] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[6585] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[1817] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[1824] = {
		{
			["ability"] = "Bite",
			["rank"] = 7,
		}
	},
	[9696] = {
		{
			["ability"] = "Bite",
			["rank"] = 8,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 4,
		},
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[1984] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[3098] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[1985] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[2966] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[708] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[2954] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[1125] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[3099] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[1126] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[113] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[390] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[1127] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[524] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[3100] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[330] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[1689] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[1190] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[3225] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[119] = {
		{
			["ability"] = "Charge",
			["rank"] = 1,
		}
	},
	[454] = {
		{
			["ability"] = "Charge",
			["rank"] = 2,
		}
	},
	[157] = {
		{
			["ability"] = "Charge",
			["rank"] = 2,
		}
	},
	[1191] = {
		{
			["ability"] = "Charge",
			["rank"] = 2,
		}
	},
	[1192] = {
		{
			["ability"] = "Charge",
			["rank"] = 2,
		}
	},
	[547] = {
		{
			["ability"] = "Charge",
			["rank"] = 2,
		}
	},
	[345] = {
		{
			["ability"] = "Charge",
			["rank"] = 3,
		}
	},
	[4511] = {
		{
			["ability"] = "Charge",
			["rank"] = 3,
		}
	},
	[4514] = {
		{
			["ability"] = "Charge",
			["rank"] = 3,
		}
	},
	[4512] = {
		{
			["ability"] = "Charge",
			["rank"] = 3,
		}
	},
	[5992] = {
		{
			["ability"] = "Charge",
			["rank"] = 5,
		}
	},
	[8303] = {
		{
			["ability"] = "Charge",
			["rank"] = 5,
		},
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[16117] = {
		{
			["ability"] = "Charge",
			["rank"] = 6,
		}
	},
	[3124] = {
		{
			["ability"] = "Claw",
			["rank"] = 1,
		}
	},
	[3281] = {
		{
			["ability"] = "Claw",
			["rank"] = 1,
		}
	},
	[3106] = {
		{
			["ability"] = "Claw",
			["rank"] = 1,
		}
	},
	[1995] = {
		{
			["ability"] = "Claw",
			["rank"] = 1,
		}
	},
	[1196] = {
		{
			["ability"] = "Claw",
			["rank"] = 1,
		}
	},
	[822] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[1997] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[3108] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[3127] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 1,
		}
	},
	[2163] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[1961] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[5823] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 1,
		}
	},
	[1778] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[1130] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[2232] = {
		{
			["ability"] = "Claw",
			["rank"] = 2,
		}
	},
	[1189] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[1216] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[6788] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[3812] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[3619] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[1225] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[2351] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[3809] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[4821] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[4822] = {
		{
			["ability"] = "Claw",
			["rank"] = 3,
		}
	},
	[3810] = {
		{
			["ability"] = "Claw",
			["rank"] = 4,
		}
	},
	[4823] = {
		{
			["ability"] = "Claw",
			["rank"] = 4,
		}
	},
	[4696] = {
		{
			["ability"] = "Claw",
			["rank"] = 4,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 2,
		}
	},
	[4140] = {
		{
			["ability"] = "Claw",
			["rank"] = 4,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 2,
		}
	},
	[4697] = {
		{
			["ability"] = "Claw",
			["rank"] = 5,
		}
	},
	[5937] = {
		{
			["ability"] = "Claw",
			["rank"] = 5,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 2,
		}
	},
	[4343] = {
		{
			["ability"] = "Claw",
			["rank"] = 5,
		}
	},
	[7022] = {
		{
			["ability"] = "Claw",
			["rank"] = 5,
		}
	},
	[5422] = {
		{
			["ability"] = "Claw",
			["rank"] = 6,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[922] = {
		{
			["ability"] = "Claw",
			["rank"] = 6,
		}
	},
	[5268] = {
		{
			["ability"] = "Claw",
			["rank"] = 6,
		}
	},
	[731] = {
		{
			["ability"] = "Claw",
			["rank"] = 6,
		},
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[5352] = {
		{
			["ability"] = "Claw",
			["rank"] = 6,
		}
	},
	[1088] = {
		{
			["ability"] = "Claw",
			["rank"] = 6,
		}
	},
	[5274] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		}
	},
	[8958] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		}
	},
	[14344] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		}
	},
	[7099] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		},
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[14343] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		},
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[8301] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		}
	},
	[7444] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		}
	},
	[7455] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		},
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[9695] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		},
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[1816] = {
		{
			["ability"] = "Claw",
			["rank"] = 7,
		}
	},
	[7456] = {
		{
			["ability"] = "Claw",
			["rank"] = 8,
		},
		{
			["ability"] = "Screech",
			["rank"] = 4,
		},
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[7445] = {
		{
			["ability"] = "Claw",
			["rank"] = 8,
		}
	},
	[1199] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[2042] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[1553] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[3035] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[3121] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[2957] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[3068] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[2070] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[2321] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[3246] = {
		{
			["ability"] = "Cower",
			["rank"] = 1,
		}
	},
	[3241] = {
		{
			["ability"] = "Cower",
			["rank"] = 2,
		}
	},
	[3245] = {
		{
			["ability"] = "Cower",
			["rank"] = 2,
		}
	},
	[2323] = {
		{
			["ability"] = "Cower",
			["rank"] = 2,
		}
	},
	[2237] = {
		{
			["ability"] = "Cower",
			["rank"] = 2,
		}
	},
	[2384] = {
		{
			["ability"] = "Cower",
			["rank"] = 2,
		}
	},
	[4067] = {
		{
			["ability"] = "Cower",
			["rank"] = 2,
		}
	},
	[4126] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		}
	},
	[2385] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		}
	},
	[681] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		}
	},
	[4538] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		},
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[683] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		}
	},
	[4539] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		},
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[736] = {
		{
			["ability"] = "Cower",
			["rank"] = 3,
		}
	},
	[2731] = {
		{
			["ability"] = "Cower",
			["rank"] = 4,
		},
		{
			["ability"] = "Prowl",
			["rank"] = 1,
		}
	},
	[4861] = {
		{
			["ability"] = "Cower",
			["rank"] = 4,
		},
		{
			["ability"] = "Screech",
			["rank"] = 2,
		},
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[2732] = {
		{
			["ability"] = "Cower",
			["rank"] = 4,
		}
	},
	[2522] = {
		{
			["ability"] = "Cower",
			["rank"] = 5,
		},
		{
			["ability"] = "Prowl",
			["rank"] = 3,
		}
	},
	[8600] = {
		{
			["ability"] = "Cower",
			["rank"] = 5,
		},
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[8601] = {
		{
			["ability"] = "Cower",
			["rank"] = 5,
		}
	},
	[7430] = {
		{
			["ability"] = "Cower",
			["rank"] = 6,
		}
	},
	[8602] = {
		{
			["ability"] = "Cower",
			["rank"] = 6,
		},
		{
			["ability"] = "Screech",
			["rank"] = 4,
		}
	},
	[976] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[682] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[4304] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[4688] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[4950] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[767] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[4662] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[2728] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[2850] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[729] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		}
	},
	[2729] = {
		{
			["ability"] = "Dash",
			["rank"] = 1,
		},
		{
			["ability"] = "Furious Howl",
			["rank"] = 2,
		}
	},
	[2734] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		},
		{
			["ability"] = "Prowl",
			["rank"] = 2,
		}
	},
	[728] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[5425] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[2730] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[1713] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		},
		{
			["ability"] = "Prowl",
			["rank"] = 2,
		}
	},
	[5426] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[5427] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[2926] = {
		{
			["ability"] = "Dash",
			["rank"] = 2,
		}
	},
	[8300] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[9416] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[7055] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[10200] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[7433] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[7432] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		},
		{
			["ability"] = "Prowl",
			["rank"] = 3,
		}
	},
	[11365] = {
		{
			["ability"] = "Dash",
			["rank"] = 3,
		}
	},
	[2578] = {
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[2579] = {
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[6013] = {
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[4693] = {
		{
			["ability"] = "Dive",
			["rank"] = 1,
		}
	},
	[5307] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		},
		{
			["ability"] = "Lightning Breath",
			["rank"] = 4,
		}
	},
	[5428] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		}
	},
	[5429] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		}
	},
	[5308] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		},
		{
			["ability"] = "Lightning Breath",
			["rank"] = 4,
		}
	},
	[8207] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		}
	},
	[5430] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		}
	},
	[7097] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		},
		{
			["ability"] = "Screech",
			["rank"] = 3,
		}
	},
	[5349] = {
		{
			["ability"] = "Dive",
			["rank"] = 2,
		},
		{
			["ability"] = "Lightning Breath",
			["rank"] = 5,
		}
	},
	[8927] = {
		{
			["ability"] = "Dive",
			["rank"] = 3,
		},
		{
			["ability"] = "Screech",
			["rank"] = 3,
		}
	},
	[1809] = {
		{
			["ability"] = "Dive",
			["rank"] = 3,
		},
		{
			["ability"] = "Screech",
			["rank"] = 3,
		}
	},
	[5708] = {
		{
			["ability"] = "Dive",
			["rank"] = 3,
		},
		{
			["ability"] = "Lightning Breath",
			["rank"] = 5,
		}
	},
	[8299] = {
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[7098] = {
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[2931] = {
		{
			["ability"] = "Dive",
			["rank"] = 3,
		}
	},
	[833] = {
		{
			["ability"] = "Furious Howl",
			["rank"] = 1,
		},
		{
			["ability"] = "Bite",
			["rank"] = 2,
		}
	},
	[10644] = {
		{
			["ability"] = "Furious Howl",
			["rank"] = 1,
		}
	},
	[5287] = {
		{
			["ability"] = "Furious Howl",
			["rank"] = 2,
		}
	},
	[2925] = {
		{
			["ability"] = "Furious Howl",
			["rank"] = 2,
		}
	},
	[2924] = {
		{
			["ability"] = "Furious Howl",
			["rank"] = 3,
		}
	},
	[3630] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[3631] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[3247] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[3424] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[5056] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[5756] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[3249] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 2,
		}
	},
	[4117] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 3,
		}
	},
	[3472] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 3,
		}
	},
	[4118] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 3,
		}
	},
	[4119] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 3,
		}
	},
	[8336] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 5,
		}
	},
	[5291] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 5,
		}
	},
	[11357] = {
		{
			["ability"] = "Lightning Breath",
			["rank"] = 6,
		}
	},
	[2406] = {
		{
			["ability"] = "Prowl",
			["rank"] = 1,
		}
	},
	[684] = {
		{
			["ability"] = "Prowl",
			["rank"] = 1,
		}
	},
	[768] = {
		{
			["ability"] = "Prowl",
			["rank"] = 1,
		}
	},
	[3226] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 1,
		}
	},
	[3250] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 1,
		}
	},
	[3252] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 1,
		}
	},
	[4139] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 2,
		}
	},
	[7078] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 2,
		}
	},
	[4699] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 2,
		}
	},
	[7405] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[5423] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[7803] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[5424] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[8926] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[9691] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[11735] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 3,
		}
	},
	[14476] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 4,
		}
	},
	[11736] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 4,
		}
	},
	[9698] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 4,
		}
	},
	[11737] = {
		{
			["ability"] = "Scorpid Poison",
			["rank"] = 4,
		}
	},
	[154] = {
		{
			["ability"] = "Screech",
			["rank"] = 1,
		}
	},
	[4158] = {
		{
			["ability"] = "Screech",
			["rank"] = 2,
		}
	},
	[4694] = {
		{
			["ability"] = "Screech",
			["rank"] = 2,
		}
	},
	[1108] = {
		{
			["ability"] = "Thunderstomp",
			["rank"] = 1,
		}
	},
	[1114] = {
		{
			["ability"] = "Thunderstomp",
			["rank"] = 1,
		}
	},
	[1557] = {
		{
			["ability"] = "Thunderstomp",
			["rank"] = 2,
		}
	},
	[5262] = {
		{
			["ability"] = "Thunderstomp",
			["rank"] = 2,
		}
	},
	[6516] = {
		{
			["ability"] = "Thunderstomp",
			["rank"] = 3,
		}
	},
	[9622] = {
		{
			["ability"] = "Thunderstomp",
			["rank"] = 3,
		}
	},

}