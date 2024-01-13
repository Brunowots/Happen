local mType = Game.createMonsterType("Murcion")
local monster = {}

monster.description = "Murcion"
monster.experience = 3250000
monster.outfit = {
	lookType = 1664,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 600000
monster.maxHealth = 600000
monster.race = "fire"
monster.corpse = 44015
monster.speed = 350
monster.manaCost = 0
monster.maxSummons = 8

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2362,
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
	{name = "Elder Bloodjaw", chance = 80, interval = 1000, max = 4},
	{name = "Bloodjaw", chance = 80, interval = 1000, max = 4}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "The light... that... drains!", yell = false}
}



monster.loot = {
	{name = "Crystal Coin", maxCount = 69, chance = 100000},
	{name = "mastermind potion",  maxCount = 15, chance = 21988},
	{name = "ultimate spirit potion",  maxCount = 169, chance = 21988},
	{name = "ultimate mana potion",  maxCount = 29, chance = 21988},
	{id = 3039, maxCount = 2, chance = 21000},
	{name = "white gem",  maxCount = 2, chance = 8735},
	{name = "amber with a dragonfly",  maxCount = 1, chance = 8735},
	{name = "Ultimate Mana Potion",  maxCount = 6, chance = 18735},
	{name = "Green Gem",  maxCount = 1, chance = 8735},	
	{name = "putrefactive figurine", maxCount = 1, chance = 500},
	{name = "The Essence of Murcion", maxCount = 1, chance = 500},
	{id = 43895, chance = 50}
}

monster.attacks = {
	{name="melee" ,interval="2000" ,minDamage="-3900" ,maxDamage="-5100"},	
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_DEATHDAMAGE, minDamage = -1200, maxDamage = -4800, length = 8, spread = 3, target = false},	
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -3200, radius = 4, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1020, maxDamage = -3000, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},	
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -3000, radius = 40, effect = CONST_ME_MORTAREA, target = false},
    {name ="melee", interval = 2000, chance = 100, minDamage = -1900, maxDamage = -2750},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -1566, maxDamage = -2420, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="stone shower rune", interval = 2000, chance = 10, minDamage = -1230, maxDamage = -1950, range = 7, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -1850, maxDamage = -2400, radius = 7, effect = CONST_ME_BIGPLANTS, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -1950, maxDamage = -3250, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true}
}



monster.defenses = {
	defense = 30,
	armor = 30	
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
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
