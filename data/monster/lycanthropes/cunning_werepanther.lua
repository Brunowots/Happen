local mType = Game.createMonsterType("Cunning Werepanther")
local monster = {}

monster.description = "a Cunning Werepanther"
monster.experience = 3620
monster.outfit = {
	lookType = 1648,
	lookHead = 104,
	lookBody = 124,
	lookLegs = 74,
	lookFeet = 114,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 2403
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

monster.health = 4300
monster.maxHealth = 4300
monster.race = "blood"
monster.corpse = 43959
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
	{id = 9057, chance = 2000, maxCount = 4}, -- small topaz
	{id = 22083, chance = 2000}, -- moonlight crystals
	{id = 3346, chance = 400}, -- ripper lance
	{id = 3306, chance = 2000}, -- golden sickle
	{id = 3037, chance = 1000}, -- yellow gem
	{id = 828, chance = 800}, -- lightning headband
	{id = 816, chance = 400}, -- lightning pendant
	{id = 43731, chance = 2500, maxCount = 2}, -- claw
	{id = 24392, chance = 400}, -- gemmed figurine
	}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -190, maxDamage = -415},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_ICEDAMAGE, minDamage = -250, maxDamage = -400, length = 5, spread = 3, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -100, maxDamage = -350, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -290, maxDamage = -550, radius = 4, effect = CONST_ME_TELEPORT, target = true}
}

monster.defenses = {
	defense = 82,
	armor = 82,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = -25},
	{type = COMBAT_FIREDAMAGE, percent = -15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 20},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
