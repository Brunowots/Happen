local mType = Game.createMonsterType("Magma Bubble")
local monster = {}

monster.description = "a Magma Bubble"
monster.experience = 255000
monster.outfit = {
	lookType = 1413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 550000
monster.maxHealth = 550000
monster.race = "blood"
monster.corpse = 36847
monster.speed = 400
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50
}

monster.bosstiary = {
	bossRaceId = 2242,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Timira.MagmaBubbleTimer
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
	canWalkOnPoison = false,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 30,
}

monster.loot = {
{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "silver token", chance = 97120, maxCount = 4},
	{name = "gold token", chance = 76980, maxCount = 3},
	{name = "berserk potion", chance = 24460, maxCount = 10},
	{name = "crystal coin", chance = 17270, maxCount = 170},
	{name = "gold ingot", chance = 62950},
	{name = "violet gem", chance = 64070},
	{name = "magic sulphur", chance = 64070},
	{name = "soul stone", chance = 50040},
	{name = "smoldering eye", chance = 43200},
	{name = "giant emerald", chance = 43200},
	{name = "portable flame", chance = 2880},
	{name = "Firefighting Axe", chance = 2880},
	{name = "Spiritthorn Helmet",  maxCount = 1, chance = 500},
	{name = "Arcanomancer Folio",  maxCount = 1, chance = 500},
	{name = "Arboreal Ring",  maxCount = 1, chance = 500},
	{name = "Arboreal Tome",  maxCount = 1, chance = 500},
	{name = "Arboreal Crown",  maxCount = 1, chance = 500},
	{name = "Alicorn Quiver",  maxCount = 1, chance = 500},
	{name = "Alicorn Ring",  maxCount = 1, chance = 500},
	{name = "Alicorn Headguard",  maxCount = 1, chance = 500},
	{name = "Arcanomancer Sigil",  maxCount = 1, chance = 500},
	{name = "Arcanomancer Regalia",  maxCount = 1, chance = 500},
	{name = "Spiritthorn Armor",  maxCount = 1, chance = 500},
	{name = "Spiritthorn Ring",  maxCount = 1, chance = 500}
}
-- ALTEREI O VALOR DE CHANCE. AUMENTEI DE 20 PARA 30. ADICIONEI MANA DRAIN, AUMENTEI O VALOR DE CHANCE DE 15 PARA 50
monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -2500, maxDamage = -5700},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2500, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -2200, range = 15, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},	
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -4400, range = 15, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},	
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -1800, maxDamage = -3500, radius = 40, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_MANADRAIN, minDamage = -40, maxDamage = -90, radius = 4, shootEffect = CONST_ANI_ONYXARROW, effect = CONST_ME_MAGIC_RED, target = true}	
}

monster.defenses = {
	defense = 20,
	armor = 20
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
