local mType = Game.createMonsterType("Werepanther")
local monster = {}

monster.description = "a Werepanther"
monster.experience = 3380
monster.outfit = {
	lookType = 1648,
	lookHead = 104,
	lookBody = 95,
	lookLegs = 86,
	lookFeet = 114,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 2390
monster.Bestiary = {
	class = "Lycanthrope",
	race = BESTY_RACE_LYCANTHROPE,
	toKill = 1000,
	FirstUnlock = 1000,
	SecondUnlock = 2500,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Oskayaat."
	}

monster.health = 4200
monster.maxHealth = 4200
monster.race = "blood"
monster.corpse = 43758
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	{text = "GROOOWL", yell = false},
	{text = "GRRR", yell = false}
}

monster.loot = {
	{id = 3031, chance = 97000, maxCount = 100}, -- gold coin
	{id = 3035, chance = 18200, maxCount = 10}, -- platinum coin
	{id = 239, chance = 1200, maxCount = 2}, -- great health potion
	{id = 7643, chance = 2210}, -- ultimate health potion
	{id = 238, chance = 1200}, -- great mana potion
	{id = 3582, chance = 1900, maxCount = 2}, -- ham
	{id = 3030, chance = 1000, maxCount = 4}, -- small ruby
	{id = 22083, chance = 2000}, -- moonlight crystals
	{id = 22085, chance = 400}, -- fur armor
	{id = 3346, chance = 400}, -- ripper lance
	{id = 3306, chance = 2000}, -- golden sickle
	{id = 3039, chance = 1000}, -- red gem
	{id = 827, chance = 800}, -- magma monocle
	{id = 817, chance = 400}, -- magma amulet
	{id = 43731, chance = 2500, maxCount = 2}, -- claw
	{id = 24392, chance = 400}, -- gemmed figurine
	{id = 43917, chance = 200} -- werepanther trophy
	}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -190, maxDamage = -415},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -166, maxDamage = -220, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -350, length = 5, spread = 3, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -550, length = 4, spread = 1, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 82,
	armor = 82,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
