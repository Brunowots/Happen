local mType = Game.createMonsterType("Mycobiontic Beetle")
local monster = {}

monster.name = "Mycobiontic Beetle"
monster.description = "a Mycobiontic Beetle"
monster.experience = 20360
monster.outfit = {
	lookType = 1620,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2376
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Jaded Roots"
	}

monster.health = 30200
monster.maxHealth = 30200
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 43555
monster.speed = 195
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 60},
	{type = COMBAT_FIREDAMAGE, percent = 35},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -25},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1650},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -966, maxDamage = -1520, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1750, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -850, maxDamage = -1300, radius = 7, effect = CONST_ME_BIGPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -850, maxDamage = -850, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}

}

monster.defenses = {
	defense = 104,
	armor = 104
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2}, -- crystal coin
	{id = 3029, chance = 27986, maxCount = 4}, -- small sapphire
	{id = 43778, chance = 17112}, -- organic acid
	{id = 3297, chance = 17112}, -- serpent sword
	{id = 829, chance = 7665}, -- glacier mask
	{id = 43849, chance = 7665}, -- rotten roots
	{id = 3042, chance = 7665},  -- scarab coin
	{id = 17829, chance = 5000}, -- buckle
	{id = 43847, chance = 2000}, -- Rotten Vermin Ichor
	{id = 3041, chance = 900}, --blue gem
	{id = 3036, chance = 900} -- violet gem
}

mType:register(monster)