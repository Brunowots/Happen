local mType = Game.createMonsterType("The Monster")
local monster = {}

monster.description = "The Monster"
monster.experience = 17500
monster.outfit = {
	lookType = 1600,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 105000
monster.maxHealth = 105000
monster.race = "blood"
monster.corpse = 42247
monster.speed = 350
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 5000,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.events = {
	"Jayson"
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "Diamond", chance = 15000},
	{name = "Great Mana Potion", chance = 15000},
	{name = "Great Health Potion", chance = 15000},
	{id = 40588, chance = 500},
	{id = 40591, chance = 500},
	{id = 40595, chance = 500},
	{id = 40592, chance = 500},
	{id = 40594, chance = 500},
	{id = 30060, chance = 15000},
	{id = 32622, chance = 15000},
	{id = 32623, chance = 15000},
	{id = 40589, chance = 500},
	{id = 40590, chance = 500},
	{id = 40593, chance = 500},
	{id = 3035, chance = 25000, maxCount = 90},
	{id = 3038, chance = 25000},
	{id = 3041, chance = 25000},
	{id = 3036, chance = 25000},
	
}

monster.attacks = {	
		{name ="melee", interval = 1700, chance = 100, minDamage = -1500, maxDamage = -2500, effect = 244},
		{name ="combat", interval = 1800, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -2000, length = 4, spread = 0, effect = CONST_ME_HITBYFIRE, target = false},
		{name ="combat", interval = 1800, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -2000, length = 4, spread = 0, effect = CONST_ME_EXPLOSIONHIT, target = false},
		{name ="combat", interval = 1400, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -800, radius = 5, effect = CONST_ME_SLASH, target = false},
		{name ="combat", interval = 1800, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -800, length = 10, spread = 3, effect = CONST_ME_STONE_STORM, target = false},
		{name ="combat", interval = 1700, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -900, maxDamage = -1300, length = 8, spread = 3, effect = CONST_ME_BLACKSMOKE, target = false}

}


monster.defenses = {
	defense = 64,
	armor = 52,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
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
