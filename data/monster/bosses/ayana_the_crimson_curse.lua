local mType = Game.createMonsterType("Ayana the Crimson Curse")
local monster = {}

monster.description = "Ayana the Crimson Curse"
monster.experience = 12400
monster.outfit = {
	lookType = 1647,
	lookHead = 38,
	lookBody = 132,
	lookLegs = 2,
	lookFeet = 76,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 17000
monster.maxHealth = 17000
monster.race = "blood"
monster.corpse = 44039
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2404,
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


monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You will DIE!", yell = false}
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
	{id= 3039, chance = 13600000}, -- red gem
	{name = "silver token", chance = 250},
	{id = 43729, chance = 22500, maxCount = 2}, -- tongue
	{id = 3333, chance = 15200}, -- crystal mace
	{id = 817, chance = 15200}, -- magma amulet
	{id = 43737, chance = 20000}, -- sun brooch
	{id = 3036, chance = 5000}, -- violet gem
	{id = 43734, chance = 4000}, -- golden sun coin
	{id = 43888, chance = 14000}, -- closed pocket sundial
	{id = 7382, chance = 20000} -- demonrage sword
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -690},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -520, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -260, maxDamage = -340, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -550, length = 4, spread = 1, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 76,
	armor = 76,
	{name ="combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 150, maxDamage = 345, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = -5},
	{type = COMBAT_FIREDAMAGE, percent = 100},
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
