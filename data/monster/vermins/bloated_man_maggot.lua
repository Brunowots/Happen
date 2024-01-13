local mType = Game.createMonsterType("Bloated Man-Maggot")
local monster = {}

monster.name = "Bloated Man-Maggot"
monster.description = "a Bloated Man-Maggot"
monster.experience = 20740
monster.outfit = {
	lookType = 1654,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2392
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

monster.health = 31700
monster.maxHealth = 31700
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 43816
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 45},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 15},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 5}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1750},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -1066, maxDamage = -1420, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1750, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -850, maxDamage = -1400, radius = 7, effect = CONST_ME_BIGPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -950, maxDamage = -1250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}

}

monster.defenses = {
	defense = 104,
	armor = 104
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2}, -- crystal coin
	{id = 9057, chance = 27986, maxCount = 4}, -- small topaz
	{id = 43778, chance = 17112}, -- organic acid
	{id = 3052, chance = 17112}, -- life ring
	{id = 3065, chance = 7665}, -- terra rod
	{id = 43849, chance = 7665}, -- rotten roots
	{id = 43856, chance = 7665},  -- Bloated Maggot
	{id = 3356, chance = 5000}, -- devil helmet
	{id = 7412, chance = 2000}, -- butchers axe
	{id = 3041, chance = 900}, --blue gem
	{id = 3036, chance = 900} -- violet gem
}

mType:register(monster)