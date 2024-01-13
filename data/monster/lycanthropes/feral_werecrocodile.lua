local mType = Game.createMonsterType("Feral Werecrocodile")
local monster = {}

monster.description = "a feral werecrocodile"
monster.experience = 5080
monster.outfit = {
	lookType = 1647,
	lookHead = 116,
	lookBody = 95,
	lookLegs = 19,
	lookFeet = 21,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2389
monster.Bestiary = {
	class = "Lycanthrope",
	race = BESTY_RACE_LYCANTHROPE,
	toKill = 1000,
	FirstUnlock = 1000,
	SecondUnlock = 2500,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Oskayaat, Murky Caverns."
	}

monster.health = 6400
monster.maxHealth = 6400
monster.race = "blood"
monster.corpse = 43767
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
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
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "GROOOWL", yell = false},
	{text = "GRRR", yell = false}
}

monster.loot = {
	{id = 3031, chance = 97000, maxCount = 242}, -- gold coin
	{id = 3035, chance = 18200, maxCount = 20}, -- platinum coin
	{id = 239, chance = 1200, maxCount = 2}, -- great health potion
	{id = 7643, chance = 2210}, -- ultimate health potion
	{id = 238, chance = 1200}, -- great mana potion
	{id = 3582, chance = 1900, maxCount = 2}, -- ham
	{id = 7454, chance = 800}, -- axe
	{id = 22083, chance = 2000}, -- moonlight crystals
	{id = 43734, chance = 700}, -- golden sun coin
	{id = 43737, chance = 300}, -- sun brooch
	{id = 3279, chance = 1000}, -- war hammer
	{id = 3036, chance = 1000}, -- violet gem
	{id = 811, chance = 300}, -- terra mantle
	{id = 14247, chance = 300}, -- ornate crossbow
	{id = 43729, chance = 2500, maxCount = 2} -- tongue
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -190, maxDamage = -515},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -166, maxDamage = -420, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -550, length = 5, spread = 3, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -500, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -250, maxDamage = -350, length = 4, spread = 1, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 82,
	armor = 82,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 35},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
