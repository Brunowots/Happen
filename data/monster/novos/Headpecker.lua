local mType = Game.createMonsterType("Headpecker")
local monster = {}

monster.name = "Headpecker"
monster.description = "a Headpecker"
monster.experience = 12026
monster.outfit = {
	lookType = 1557,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2275
monster.Bestiary = {
	class = "Birds",
	race = BESTY_RACE_BIRD,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Gnomprona"
	}

monster.health = 16300
monster.maxHealth = 16300
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 39319
monster.speed = 217
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
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = -10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1950},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -850, maxDamage = -1250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1750, range = 7, target = false}

}

monster.defenses = {
	defense = 84,
	armor = 84
}

monster.loot = {
    {id = 3043, chance = 27986, maxCount = 2},
	{id = 39388, chance = 17112},
	{id = 39387, chance = 17112},
	{id = 3041, chance = 7665},
	{id = 7413, chance = 7665},
	{id = 8092, chance = 7665},
	{id = 9058, chance = 7665}
}

mType:register(monster)