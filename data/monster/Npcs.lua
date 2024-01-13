local outfitIds = {80, 51, 332, 432, 873, 885, 908, 948, 949, 1067, 1112, 1114, 1116, 1210, 1611, 1663}

local randomOutfit = Condition(CONDITION_OUTFIT)
randomOutfit:setTicks(3000)

local chance = 50
local changeInterval = 200
local intervalCounter = changeInterval


local mType = Game.createMonsterType("Npcs")
local monster = {}
monster.description = "a Npcs"
monster.experience = 1
monster.outfit = {
    lookType = 1114
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