local mType = Game.createMonsterType("Animated Feather")
local monster = {}

monster.description = "an animated feather"
monster.experience = 9860
monster.outfit = {
	lookType = 1058,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1671
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "The Secret Library."
	}

monster.health = 13000
monster.maxHealth = 13000
monster.race = "ink"
monster.corpse = 28578
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true
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
	{name = "small sapphire", chance = 8700, maxCount = 5},
	{name = "platinum coin", chance = 87000, maxCount = 50},
	{id = 28570, chance = 500, maxCount = 10}, -- glowing rune
	{id = 3051, chance = 8700}, -- energy ring
	{id = 7441, chance = 4000}, -- ice cube
	{id = 7287, chance = 250, maxCount = 3}, -- shard
	{name = "glacier mask", chance = 8250},
	{name = "hailstorm rod", chance = 6250},
	{name = "life crystal", chance = 8700},
	{name = "great mana potion", chance = 900, maxCount = 6},
	{name = "golden mug", chance = 500},
	{name = "glowing rune", chance = 500, maxCount = 10},
	{id = 3051, chance = 8700}, -- energy ring
	{name = "quill", chance = 250},
	{name = "small diamond", chance = 8500, maxCount = 5}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -800},
	{name ="combat", interval = 1000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -540, maxDamage = -840, range = 7, shootEffect = CONST_ANI_ICE, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -475, maxDamage = -875, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -350, maxDamage = -640, length = 3, spread = 2, effect = CONST_ME_ICEATTACK, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -575, maxDamage = -1090, range = 7, radius = 3, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICETORNADO, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 79
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -18},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
