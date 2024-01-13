local mType = Game.createMonsterType("Tamru The Black")
local monster = {}

monster.description = "Tamru The Black"
monster.experience = 16800
monster.outfit = {
	lookType = 1646,
	lookHead = 76,
	lookBody = 19,
	lookLegs = 114,
	lookFeet = 113,
	lookAddons = 2,
	lookMount = 0
}

monster.health = 15500
monster.maxHealth = 15500
monster.race = "blood"
monster.corpse = 44043
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 1560,
	bossRace = RARITY_ARCHFOE
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{name = "Wereboar", chance = 20, interval = 2000, count = 2}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You will DIE!", yell = false},
	{text = "The ruthlessness of boars will stamp down the careless!", yell = false}
}

monster.loot = {
	{name = "gold coin", chance = 13600000, maxCount = 100},
	{name = "gold coin", chance = 13600000, maxCount = 100},
	{name = "platinum coin", chance = 13600000, maxCount = 17},
	{name = "great health potion", chance = 13600000, maxCount = 10},
	{name = "red crystal fragment", chance = 13600000, maxCount = 2},
	{name = "small enchanted ruby", chance = 13600000, maxCount = 3},
	{id= 3028, chance = 13600000, maxCount = 3}, -- small diamond
	{id = 22083, chance = 20000}, -- moonlight crystals
	{id= 3037, chance = 13600000}, -- yellow gem
	{name = "silver token", chance = 250},
	{id = 43730, chance = 22500, maxCount = 2}, -- teeth
	{id = 3333, chance = 15200}, -- crystal mace
	{id = 816, chance = 15200}, -- lightning pendant
	{id = 3567, chance = 20000}, -- blue robe
	{id = 32769, chance = 5000}, -- white gem
	{id = 43732, chance = 4000}, -- silver moon coin
	{id = 43736, chance = 4000}, -- moon pin
	{id = 43739, chance = 4000}, -- moon compass
	{id = 7456, chance = 20000} -- noble axe
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -690},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -520, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -550, maxDamage = -850, radius = 4, effect = CONST_ME_TELEPORT, target = true},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -400, length = 5, spread = 3, target = false}
}

monster.defenses = {
	defense = 76,
	armor = 76,
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 150, maxDamage = 345, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = -5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
