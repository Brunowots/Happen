local mType = Game.createMonsterType("Shrieking Cry-Stal")
local monster = {}

monster.name = "Shrieking Cry-Stal"
monster.description = "a Shrieking Cry-Stal"
monster.experience = 13560
monster.outfit = {
	lookType = 1560,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2278
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Gnomprona"
	}

monster.health = 20650
monster.maxHealth = 20650
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 39331
monster.speed = 207
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
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 5},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1950},
	{name ="thunderstorm rune", interval = 2000, chance = 35, minDamage = -1500, maxDamage = -2200, range = 7, target = true},
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -900, maxDamage = -1800, range = 7, shootEffect = CONST_ANI_ENERGY, target = false}

}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2},
	{id = 39394, chance = 17112},
	{id = 3028, chance = 17112},
	{id = 8895, chance = 7665},
	{id = 16127, chance = 7665},
	{id = 813, chance = 7665},
	{id = 3036, chance = 7665},
	{id = 3063, chance = 7665},
	{id = 3038, chance = 7665}
}

mType:register(monster)