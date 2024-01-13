local mType = Game.createMonsterType("Undertaker")
local monster = {}

monster.name = "Undertaker"
monster.description = "a Undertaker"
monster.experience = 13543
monster.outfit = {
	lookType = 1551,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2269
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Gnomprona"
	}


monster.health = 20100
monster.maxHealth = 20100
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 39294
monster.speed = 205
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	healthHidden = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "SMAASH!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -700, maxDamage = -1250},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1160, maxDamage = -1900, range = 1, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="sudden death rune", interval = 2000, chance = 17, minDamage = -1000, maxDamage = -1650, range = 7, target = false},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1750, range = 7, target = false}
}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2},
	{id = 39380, chance = 17112},
	{id = 812, chance = 17112},
	{id = 813, chance = 7665},
	{id = 5879, chance = 7665},
	{id = 7383, chance = 7665},
	{id = 8094, chance = 7665},
	{id = 16119, chance = 7665},
	{id = 25698, chance = 7665},
	{id = 3036, chance = 7665}
}

mType:register(monster)