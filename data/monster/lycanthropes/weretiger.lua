local mType = Game.createMonsterType("Weretiger")
local monster = {}

monster.description = "a weretiger"
monster.experience = 3700
monster.outfit = {
	lookType = 1646,
	lookHead = 78,
	lookBody = 57,
	lookLegs = 113,
	lookFeet = 113,
	lookAddons = 1,
	lookMount = 0
}

monster.raceId = 2386
monster.Bestiary = {
	class = "Lycanthrope",
	race = BESTY_RACE_LYCANTHROPE,
	toKill = 1000,
	FirstUnlock = 1000,
	SecondUnlock = 2500,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Oskayaat, Oskayaat Undercity."
	}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "blood"
monster.corpse = 43750
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
	{id = 3031, chance = 97000, maxCount = 242}, -- gold coin
	{id = 3035, chance = 18200, maxCount = 10}, -- platinum coin
	{id = 239, chance = 1200, maxCount = 2}, -- great health potion
	{id = 7643, chance = 2210}, -- ultimate health potion
	{id = 238, chance = 1200}, -- great mana potion
	{id = 3582, chance = 1900, maxCount = 2}, -- ham
	{id = 7432, chance = 6000}, -- furry club
	{id = 3370, chance = 1200}, -- knight armor
	{id = 7436, chance = 800}, -- angelic axe
	{id = 3053, chance = 400}, -- time ring
	{id = 22083, chance = 2000}, -- moonlight crystals
	{id = 43915, chance = 200}, -- trophy
	{id = 43732, chance = 400}, -- silver moon coin
	{id = 3041, chance = 500}, -- blue gem
	{id = 16120, chance = 1200}, -- violet shard
	{id = 43730, chance = 2500, maxCount = 2} -- teeth
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 50, maxDamage = -485},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -65, maxDamage = -335, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -550, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -250, maxDamage = -470, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -190, maxDamage = -350, radius = 4, effect = CONST_ME_TELEPORT, target = true}
}

monster.defenses = {
	defense = 76,
	armor = 76,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -5},
	{type = COMBAT_ENERGYDAMAGE, percent = 25},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = -25},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 30},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
