local mType = Game.createMonsterType("Energetic Book")
local monster = {}

monster.description = "an energetic book"
monster.experience = 12034
monster.outfit = {
	lookType = 1061,
	lookHead = 15,
	lookBody = 91,
	lookLegs = 85,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 1665
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Secret Library."
	}

monster.health = 18500
monster.maxHealth = 18500
monster.race = "ink"
monster.corpse = 28778
monster.speed = 220
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false
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
	{name = "platinum coin", chance = 100000, maxCount = 28},
	{id = 28569, chance = 900, maxCount = 8}, -- book page
	{id = 28570, chance = 900, maxCount = 7}, -- glowing rune
	{name = "ultimate health potion", chance = 10000, maxCount = 7},
	{name = "ultimate mana potion", chance = 10000, maxCount = 7},
	{name = "energy ball", chance = 900, maxCount = 7},
	{id = 28566, chance = 800, maxCount = 7}, -- silken bookmark
	{name = "lightning pendant", chance = 9500},
	{name = "lightning boots", chance = 9500},
	{name = "lightning headband", chance = 9500},
	{name = "might ring", chance = 6500},
	{name = "spellweaver's robe", chance = 5350},
	{name = "wand of defiance", chance = 6350},
	{name = "haunted blade", chance = 5550},
	{name = "lightning legs", chance = 7350}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -800},
	{name ="combat", interval = 2000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -660, maxDamage = -800, range = 7, shootEffect = CONST_ANI_ENERGY, target = false},
	{name ="combat", interval = 2000, chance = 40, type = COMBAT_HOLYDAMAGE, minDamage = -650, maxDamage = -800, radius = 3, effect = CONST_ME_HOLYAREA, target = false},
	{name ="combat", interval = 1500, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -400, maxDamage = -900, length = 8, spread = 3, effect = CONST_ME_STUN, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = -10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
