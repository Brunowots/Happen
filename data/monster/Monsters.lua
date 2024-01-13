local outfitIds = {230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254}

local randomOutfit = Condition(CONDITION_OUTFIT)
randomOutfit:setTicks(3000)

local chance = 50
local changeInterval = 200
local intervalCounter = changeInterval


local mType = Game.createMonsterType("Monsters")
local monster = {}
monster.description = "a Monsters"
monster.experience = 1
monster.outfit = {
    lookType = 230
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