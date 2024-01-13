local mType = Game.createMonsterType("Wandering Pillar")
local monster = {}

monster.description = "a Wandering Pillar"
monster.experience = 22300
monster.outfit = {
	lookType = 1657,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2395
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 0,
	Locations = "Gloom Pillars."
	}

monster.health = 37000
monster.maxHealth = 37000
monster.race = "blood"
monster.corpse = 43828
monster.speed = 190
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
	chance = 10
}

monster.loot = {
	{name = "crystal coin", chance = 15540},
	{name = "platinum coin", chance = 90540, maxCount = 10},
	{name = "ultimate health potion", chance = 32220, maxCount = 7},
	{name = "ultimate mana potion", chance = 32220, maxCount = 7},
	{id = 8092, chance = 8560}, -- wand of starstorm
	{id = 3036, chance = 8560}, -- violet gem
	{id = 43781, chance = 8560}, -- darklight obsidian axe
	{id = 43850, chance = 8560}, -- dark obsidian splinter
	{id = 3030, chance = 8560, maxCount = 3}, -- small ruby
	{id = 3032, chance = 8560, maxCount = 3}, -- small emerald
	{id = 43853, chance = 8560}, -- darklight core
	{name = "green gem", chance = 1960},
	{id = 10386, chance = 1960}, -- zaoan shoes
	{id = 16115, chance = 5000} -- wand of everblazing
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -490, maxDamage = -700},
	{name ="combat", interval = 2000, chance = 17, type = COMBAT_HOLYDAMAGE, minDamage = -700, maxDamage = -1300, radius = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -1200, radius = 4, effect = CONST_ME_HOLYDAMAGE, target = false},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -1150, maxDamage = -1800, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -1000, maxDamage = -1650, length = 8, effect = CONST_ME_EXPLOSIONHIT, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -750, length = 5, radius = 2, effect = CONST_ME_GREEN_RINGS, target = false}
	-- Fear
}

monster.defenses = {
	defense = 90,
	armor = 100
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = -15}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)