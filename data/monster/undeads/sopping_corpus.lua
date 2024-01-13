local mType = Game.createMonsterType("Sopping Corpus")
local monster = {}

monster.description = "an Sopping Corpus"
monster.experience = 21600
monster.outfit = {
	lookType = 1659,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2397
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Jaded Roots."
	}

monster.health = 33400
monster.maxHealth = 33400
monster.race = "undead"
monster.corpse = 43836
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
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
	{text = "Raaaarww.", yell = false}
}

monster.loot = {
	{name = "crystal coin", chance = 10540, maxCount = 2},
	{name = "platinum coin", chance = 90540, maxCount = 32},
	{name = "ultimate health potion", chance = 72220, maxCount = 7},
	{id = 43778, chance = 17112}, -- organic acid
	{id = 301, chance = 1560}, -- emerald bangle
	{id = 43849, chance = 7665}, -- rotten roots
	{id = 3041, chance = 900}, --blue gem
	{id = 7385, chance = 17112}, -- crimson sword
	{id = 8082, chance = 1400}, -- underworld rod
	{id = 8061, chance = 600}, -- skullcraker armor
	{id = 23531, chance = 600}, -- ring of green plasma
	{id = 3036, chance = 500} -- violet gem
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -600, maxDamage = -1200},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_EARTHDAMAGE, minDamage = -550, maxDamage = -900, length = 5, spread = 3, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -1066, maxDamage = -1420, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -950, maxDamage = -1250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}
	-- Fear 
	-- Chain: const_me-> CONST_ME_ICEATTACK, combat_t->COMBAT_ICEDAMAGE

}

monster.defenses = {
	defense = 80,
	armor = 107
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 40},
	{type = COMBAT_ENERGYDAMAGE, percent = -20},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -10},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
