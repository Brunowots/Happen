local mType = Game.createMonsterType("Timira the Many-Headed")
local monster = {}

monster.description = "Timira the Many-Headed"
monster.experience = 70
monster.outfit = {
	lookType = 1542,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 100000
monster.maxHealth = 100000
monster.race = "undead"
monster.corpse = 39712
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5
}

monster.bosstiary = {
	bossRaceId = 2250,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Timira.Timer
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
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Who Disturbs my slumber?", yell = false},
	{text = "Mourn the dead, do not hunt them!", yell = false}
}

monster.loot = {
	{name = "crystal coin", chance = 67500, maxCount = 150},
	{name = "mastermind potion", chance = 67500, maxCount = 5},
	{name = "berserk potion", chance = 67500, maxCount = 5},
	{name = "bullseye potion", chance = 67500, maxCount = 5},
	{name = "naga basin", chance = 4000},
	{name = "giant emerald", chance = 14000},
	{name = "giant sapphire", chance = 14000},
	{name = "giant topaz", chance = 14000},
	{name = "giant amethyst", chance = 14000},
	{name = "piece of timira's sensors", chance = 4000},
	{name = "one of timira's many heads", chance = 4300},
	{name = "naga sword", chance = 500},
	{name = "naga axe", chance = 500},
	{name = "naga club", chance = 500},
	{name = "naga wand", chance = 500},
	{name = "midnight tunic", chance = 500},
	{name = "naga rod", chance = 500},
	{name = "naga crossbow", chance = 500},
	{name = "naga quiver", chance = 500},
	{name = "dawnfire sherwani", chance = 500},
	{name = "dawnfire pantaloons", chance = 500},
	{name = "feverbloom boots", chance = 500},
	{name = "frostflower boots", chance = 500},
	{id = 39233, chance = 500}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -2500},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -1600, maxDamage = -3400, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -1200, length = 8, spread = 3, effect = CONST_ME_POFF, target = false},
	{name ="explosion wave", interval = 2000, chance = 14, minDamage = -1260, maxDamage = -2620, target = false},
	{name ="energy strike", interval = 2000, chance = 30, minDamage = -2500, maxDamage = -2900, range = 1, target = false},
	{name ="targetfirering", interval = 2000, chance = 8, minDamage = -900, maxDamage = -1500, target = true}
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{name ="combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 3500, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 4000, chance = 80, speedChange = 700, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
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
