local mType = Game.createMonsterType("Morshabaal")
local monster = {}

monster.description = "Morshabaal"
monster.experience = 10000
monster.outfit = {
	lookType = 1468,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 2000000
monster.maxHealth = 2000000
monster.race = "blood"
monster.corpse = 37704
monster.speed = 380
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2118,
	bossRace = RARITY_NEMESIS
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 2500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summons = {
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Revenge for my little brother!", yell = false},
	{text = "You are starting to annoy me!", yell = false},
	{text = "I will restore our family honor!", yell = false}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 100},
	{name = "crystal coin", chance = 56000, maxCount = 160},
	{name = "ultimate health potion", chance = 60000, maxCount = 70},
	{name = "ultimate mana potion", chance = 26000, maxCount = 35},
	{name = "ultimate spirit potion", chance = 26000, maxCount = 140},
    {name = "giant emerald", chance = 16000},
    {name = "bar of gold", chance = 16000},
    {name = "dragon figurine", chance = 16000},
    {name = "unicorn figurine", chance = 16000},
	{name = "thunder hammer", chance = 1500},
	{name = "morshabaal's brain", chance = 1500},
	{name = "morshabaal's mask", chance = 1000},
	{name = "green demon helmet", chance = 1000},
	{name = "green demon legs", chance = 1000},
	{name = "green demon slippers", chance = 1000}

}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -5000, maxDamage = -9000},
	{name ="combat", interval = 1000, chance = 50, type = COMBAT_MANADRAIN, minDamage = -900, maxDamage = -1500, range = 7, target = false},
	{name ="combat", interval = 1000, chance = 60, type = COMBAT_MANADRAIN, minDamage = -850, maxDamage = -1750, radius = 5, effect = CONST_ME_POISONAREA, target = false},
	{name ="effect", interval = 1000, chance = 6, radius = 5, effect = CONST_ME_HITAREA, target = false},
	{name ="combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -910, maxDamage = -4600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="firefield", interval = 1000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -2850, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false}
}

monster.defenses = {
	defense = 111,
	armor = 90,
	{name ="combat", interval = 3000, chance = 90, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 4367, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 4000, chance = 75, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 10, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 7000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 50},
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
	{type = "drunk", condition = true},
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
