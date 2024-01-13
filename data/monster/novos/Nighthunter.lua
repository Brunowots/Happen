local mType = Game.createMonsterType("Nighthunter")
local monster = {}

monster.name = "Nighthunter"
monster.description = "a Nighthunter"
monster.experience = 12647
monster.outfit = {
	lookType = 1552,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2270
monster.Bestiary = {
	class = "Mammal",
	race = BESTY_RACE_MAMMAL,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Gnomprona"
	}

monster.health = 19200
monster.maxHealth = 19200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 39299
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
	{type = COMBAT_PHYSICALDAMAGE, percent = -10},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 20}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1950},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1750, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -750, maxDamage = -1200, radius = 7, effect = CONST_ME_BIGPLANTS, target = false}

}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2},
	{id = 39381, chance = 17112},
	{id = 16125, chance = 17112},
	{id = 16121, chance = 7665},
	{id = 16126, chance = 7665},
	{id = 14040, chance = 7665},
	{id = 8074, chance = 7665},
	{id = 3081, chance = 7665}
}

mType:register(monster)