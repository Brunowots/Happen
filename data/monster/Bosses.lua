local outfitIds = {354, 444, 544, 676, 679, 844, 926, 938, 940, 944, 984, 1047, 1144, 1197, 1224, 1261, 1272, 1278, 1393, 1412, 1542, 1600, 1671}

local randomOutfit = Condition(CONDITION_OUTFIT)
randomOutfit:setTicks(3000)

local chance = 50
local changeInterval = 200
local intervalCounter = changeInterval


local mType = Game.createMonsterType("Bosses")
local monster = {}
monster.description = "a Bosses"
monster.experience = 1
monster.outfit = {
    lookType = 354
}

monster.health = 1
monster.maxHealth = monster.health
monster.race = "undead"
monster.corpse = 236
monster.speed = 170
monster.maxSummons = 0

monster.changeTarget = {
    interval = 4*1000,
    chance = 20
}

monster.flags = {
    summonable = false,
    attackable = true,
    hostile = false,
    challengeable = true,
    convinceable = false,
    ignoreSpawnBlock = false,
    illusionable = false,
    canPushItems = false,
    canPushCreatures = false,
    targetDistance = 1,
    staticAttackChance = 70
}

mType.onThink = function(monster, interval)
    intervalCounter = intervalCounter + interval
    if intervalCounter >= changeInterval then
        if math.random(100) <= chance then
            randomOutfit:setOutfit({lookType = outfitIds[math.random(#outfitIds)]})
            monster:addCondition(randomOutfit)
        end
        intervalCounter = 0
    end
end

mType:register(monster)