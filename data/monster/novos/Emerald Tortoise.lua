local mType = Game.createMonsterType("Emerald Tortoise")
local monster = {}

monster.name = "Emerald Tortoise"
monster.description = "a Emerald Tortoise"
monster.experience = 12129
monster.outfit = {
	lookType = 1550,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}
monster.raceId = 2268
monster.Bestiary = {
	class = "Reptile",
	race = BESTY_RACE_REPTILE,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Gnomprona"
	}


monster.health = 22300
monster.maxHealth = 22300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 39290
monster.speed = 382
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 20},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 10},
	{type = COMBAT_MANADRAIN, percent = 10},
	{type = COMBAT_DROWNDAMAGE, percent = 10},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 10},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -800, maxDamage = -2200},
	{name ="thunderstorm rune", interval = 2000, chance = 35, minDamage = -1500, maxDamage = -2200, range = 7, target = true},
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -900, maxDamage = -1800, range = 7, shootEffect = CONST_ANI_ENERGY, target = false}
}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2},
	{id = 281, chance = 27986, maxCount = 2},
	{id = 39379, chance = 17112},
	{id = 16127, chance = 17112},
	{id = 16121, chance = 15865, maxCount = 2},
	{id = 3036, chance = 7665},
	{id = 6126, chance = 5070},
	{id = 3038, chance = 5070}
}

mType:register(monster)