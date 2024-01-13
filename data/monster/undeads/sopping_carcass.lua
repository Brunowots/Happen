local mType = Game.createMonsterType("Sopping Carcass")
local monster = {}

monster.description = "an Sopping Carcass"
monster.experience = 21100
monster.outfit = {
	lookType = 1658,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2396
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Putrefactory."
	}

monster.health = 32700
monster.maxHealth = 32700
monster.race = "undead"
monster.corpse = 43832
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
	{text = "AHCH...AAH!!", yell = false}
}

monster.loot = {
	{name = "crystal coin", chance = 10540, maxCount = 2},
	{name = "platinum coin", chance = 90540, maxCount = 32},
	{name = "ultimate health potion", chance = 72220, maxCount = 7},
	{id = 43778, chance = 17112}, -- organic acid
	{id = 8092, chance = 8560}, -- wand of starstorm
	{id = 43849, chance = 7665}, -- rotten roots
	{id = 3041, chance = 900}, --blue gem
	{id = 820, chance = 17112}, -- lightning boots
	{id = 822, chance = 400}, -- lightning legs
	{id = 3033, chance = 14560}, -- small amethyst
	{id = 43848, chance = 14560}, -- worm sponge
	{id = 3036, chance = 500}, -- violet gem
	{id = 8061, chance = 500}, -- skullcracker armor
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -700, maxDamage = -1200},
	{name ="combat", interval = 4000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -1150, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -950, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_ICEATTACK, target = true},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -900, range = 7, radius = 5, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -1600, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true}
	-- Fear 
	-- Chain: const_me-> CONST_ME_ICEATTACK, combat_t->COMBAT_ICEDAMAGE

}

monster.defenses = {
	defense = 80,
	armor = 107
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 35},
	{type = COMBAT_EARTHDAMAGE, percent = -15},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
