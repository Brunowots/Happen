local ITEM_SETS_VERSION = "1.1.1"

BONUS_TYPES = {
  CONDITION = 0,
  OFFENSIVE = 1,
  DEFENSIVE = 2,
  TRIGGER = 3
}

TRIGGER_TYPES = {
  ATTACK = 0,
  HIT = 1
}

BONUS_TYPE_MAXHP = {
  name = "Max HP",
  percentage = true,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT,
  subId = 1
}

BONUS_TYPE_MAXMP = {
  name = "Max MP",
  percentage = true,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT,
  subId = 2
}

BONUS_TYPE_MAGIC_LEVEL = {
  name = "Magic Level",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_STAT_MAGICPOINTS,
  subId = 3
}

BONUS_TYPE_MELEE_SKILLS = {
  name = "Melee Skills",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_MELEE,
  subId = 4
}

BONUS_TYPE_FIST_FIGHTING = {
  name = "Fist Fighting",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_FIST,
  subId = 5
}

BONUS_TYPE_SWORD_FIGHTING = {
  name = "Sword Fighting",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_SWORD,
  subId = 6
}

BONUS_TYPE_AXE_FIGHTING = {
  name = "Axe Fighting",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_AXE,
  subId = 7
}

BONUS_TYPE_CLUB_FIGHTING = {
  name = "Club Fighting",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_CLUB,
  subId = 8
}

BONUS_TYPE_DISTANCE_FIGHTING = {
  name = "Distance Fighting",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_DISTANCE,
  subId = 9
}

BONUS_TYPE_SHIELDING = {
  name = "Shielding",
  percentage = false,
  combatType = BONUS_TYPES.CONDITION,
  condition = CONDITION_ATTRIBUTES,
  param = CONDITION_PARAM_SKILL_SHIELD,
  subId = 10
}

BONUS_TYPE_LIFESTEAL = {
  name = "Life Steal",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_PHYSICALDAMAGE + COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE +
    COMBAT_DEATHDAMAGE
}

BONUS_TYPE_EXPERIENCE = {
  name = "Experience",
  percentage = true
}

BONUS_TYPE_PHYSICAL_DAMAGE = {
  name = "Physical Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_PHYSICALDAMAGE
}

BONUS_TYPE_ENERGY_DAMAGE = {
  name = "Energy Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_ENERGYDAMAGE
}

BONUS_TYPE_EARTH_DAMAGE = {
  name = "Earth Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_EARTHDAMAGE
}

BONUS_TYPE_FIRE_DAMAGE = {
  name = "Fire Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_FIREDAMAGE
}

BONUS_TYPE_ICE_DAMAGE = {
  name = "Ice Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_ICEDAMAGE
}

BONUS_TYPE_HOLY_DAMAGE = {
  name = "Holy Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_HOLYDAMAGE
}

BONUS_TYPE_DEATH_DAMAGE = {
  name = "Death Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_DEATHDAMAGE
}

BONUS_TYPE_ELEMENTAL_DAMAGE = {
  name = "Elemental Damage",
  percentage = true,
  combatType = BONUS_TYPES.OFFENSIVE,
  combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE
}

BONUS_TYPE_PHYSICAL_PROTECTION = {
  name = "Physical Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_PHYSICALDAMAGE
}

BONUS_TYPE_ENERGY_PROTECTION = {
  name = "Energy Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_ENERGYDAMAGE
}

BONUS_TYPE_EARTH_PROTECTION = {
  name = "Earth Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_EARTHDAMAGE
}

BONUS_TYPE_FIRE_PROTECTION = {
  name = "Fire Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_FIREDAMAGE
}

BONUS_TYPE_ICE_PROTECTION = {
  name = "Ice Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_ICEDAMAGE
}

BONUS_TYPE_HOLY_PROTECTION = {
  name = "Holy Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_HOLYDAMAGE
}

BONUS_TYPE_DEATH_PROTECTION = {
  name = "Death Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_DEATHDAMAGE
}

BONUS_TYPE_ELEMENTAL_PROTECTION = {
  name = "Elemental Protection",
  percentage = true,
  combatType = BONUS_TYPES.DEFENSIVE,
  combatDamage = COMBAT_ENERGYDAMAGE + COMBAT_EARTHDAMAGE + COMBAT_FIREDAMAGE + COMBAT_ICEDAMAGE + COMBAT_HOLYDAMAGE + COMBAT_DEATHDAMAGE
}

BONUS_TYPE_FLAMESTRIKE_ON_ATTACK = {
  name = "Flame Strike on Attack",
  triggerType = TRIGGER_TYPES.ATTACK,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_FIREDAMAGE,
  distanceEffect = CONST_ANI_FIRE,
  hitEffect = CONST_ME_FIREATTACK
}

BONUS_TYPE_FLAMESTRIKE_ON_HIT = {
  name = "Flame Strike on Hit",
  triggerType = TRIGGER_TYPES.HIT,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_FIREDAMAGE,
  distanceEffect = CONST_ANI_FIRE,
  hitEffect = CONST_ME_FIREATTACK
}

BONUS_TYPE_ICESTRIKE_ON_ATTACK = {
  name = "Ice Strike on Attack",
  triggerType = TRIGGER_TYPES.ATTACK,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_ICEDAMAGE,
  distanceEffect = CONST_ANI_SMALLICE,
  hitEffect = CONST_ME_ICEATTACK
}

BONUS_TYPE_ICESTRIKE_ON_HIT = {
  name = "Ice Strike on Hit",
  triggerType = TRIGGER_TYPES.HIT,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_ICEDAMAGE,
  distanceEffect = CONST_ANI_SMALLICE,
  hitEffect = CONST_ME_ICEATTACK
}

BONUS_TYPE_TERRASTRIKE_ON_ATTACK = {
  name = "Terra Strike on Attack",
  triggerType = TRIGGER_TYPES.ATTACK,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_EARTHDAMAGE,
  distanceEffect = CONST_ANI_SMALLEARTH,
  hitEffect = CONST_ME_CARNIPHILA
}

BONUS_TYPE_TERRASTRIKE_ON_HIT = {
  name = "Terra Strike on Hit",
  triggerType = TRIGGER_TYPES.HIT,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_EARTHDAMAGE,
  distanceEffect = CONST_ANI_SMALLEARTH,
  hitEffect = CONST_ME_CARNIPHILA
}

BONUS_TYPE_DEATHSTRIKE_ON_ATTACK = {
  name = "Death Strike on Attack",
  triggerType = TRIGGER_TYPES.ATTACK,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_DEATHDAMAGE,
  distanceEffect = CONST_ANI_DEATH,
  hitEffect = CONST_ME_MORTAREA
}

BONUS_TYPE_DEATHSTRIKE_ON_HIT = {
  name = "Death Strike on Hit",
  triggerType = TRIGGER_TYPES.HIT,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_DEATHDAMAGE,
  distanceEffect = CONST_ANI_DEATH,
  hitEffect = CONST_ME_MORTAREA
}

BONUS_TYPE_DIVINEMISSILE_ON_ATTACK = {
  name = "Divine Missile on Attack",
  triggerType = TRIGGER_TYPES.ATTACK,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_HOLYDAMAGE,
  distanceEffect = CONST_ANI_SMALLHOLY,
  hitEffect = CONST_ME_HOLYDAMAGE
}

BONUS_TYPE_DIVINEMISSILE_ON_HIT = {
  name = "Divine Missile on Hit",
  triggerType = TRIGGER_TYPES.HIT,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_HOLYDAMAGE,
  distanceEffect = CONST_ANI_SMALLHOLY,
  hitEffect = CONST_ME_HOLYDAMAGE
}

BONUS_TYPE_ENERGYSTRIKE_ON_ATTACK = {
  name = "Energy Strike on Attack",
  triggerType = TRIGGER_TYPES.ATTACK,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_ENERGYDAMAGE,
  distanceEffect = CONST_ANI_ENERGY,
  hitEffect = CONST_ME_ENERGYAREA
}

BONUS_TYPE_ENERGYSTRIKE_ON_HIT = {
  name = "Energy Strike on Hit",
  triggerType = TRIGGER_TYPES.HIT,
  percentage = false,
  combatType = BONUS_TYPES.TRIGGER,
  damageType = COMBAT_ENERGYDAMAGE,
  distanceEffect = CONST_ANI_ENERGY,
  hitEffect = CONST_ME_ENERGYAREA
}
