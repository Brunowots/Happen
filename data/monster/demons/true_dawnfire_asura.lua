local mType = Game.createMonsterType("True Dawnfire Asura")
local monster = {}

monster.description = "a true dawnfire asura"
monster.experience = 7475
monster.outfit = {
	lookType = 1068,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 121,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 1620
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Asura Palace."
	}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 28664
monster.speed = 180
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 3031, chance = 97000, maxCount = 242}, -- gold coin
	{id = 3035, chance = 18200, maxCount = 6}, -- platinum coin
	{id = 3043, chance = 3200, maxCount = 2}, -- crystal coin
	{id = 6558, chance = 20000}, -- flask of demonic blood
	{id = 238, chance = 20000}, -- great mana potion
	{id = 3033, chance = 10210, maxCount = 3}, -- small amethyst
	{id = 3028, chance = 10300, maxCount = 3}, -- small diamond
	{id = 3032, chance = 10300, maxCount = 3}, -- small emerald
	{id = 3030, chance = 10350, maxCount = 3}, -- small ruby
	{id = 9057, chance = 10280, maxCount = 3}, -- small topaz
	{id = 3041, chance = 900}, -- blue gem
	{id = 6299, chance = 4600}, -- death ring
	{id = 6499, chance = 4430}, -- demonic essence
	{id = 8043, chance = 3200}, -- focus cape
	{id = 21974, chance = 5800}, -- golden lotus brooch
	{id = 826, chance = 2000}, -- magma coat
	{id = 3078, chance = 4000}, -- mysterious fetish
	{id = 3574, chance = 4000}, -- mystic turban
	{id = 21981, chance = 1500}, -- oriental shoes
	{id = 21975, chance = 6000}, -- peacock feather fan
	{id = 5911, chance = 3000}, -- red piece of cloth
	{id = 3016, chance = 1000}, -- ruby necklace
	{id = 5944, chance = 14000}, -- soul orb
	{id = 8074, chance = 3400}, -- spellbook of mind control
	{id = 3071, chance = 4400} -- wand of inferno
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -1069},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_MANADRAIN, minDamage = -350, maxDamage = -850, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_LIFEDRAIN, minDamage = -550, maxDamage = -750, length = 4, spread = 2, effect = CONST_ME_MAGIC_RED, target = false},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -320, maxDamage = -1350, length = 1, spread = 0, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -850, radius = 3, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -530, maxDamage = -950, radius = 4, effect = CONST_ME_BLACKSMOKE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = -100, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 30000}
}

monster.defenses = {
	defense = 55,
	armor = 77,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 2000, chance = 15, speedChange = 320, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
