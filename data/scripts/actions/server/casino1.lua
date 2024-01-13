local config = {
    actionId = 18563,
    lever = {
        left = 2772,
        right = 2773
    },
    playItem = {
        itemId = 44093,
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 10800,
        ignoredItems = {1617},
        winEffects = {12, 12, 45, 12, 12},
        effectDelay = 333,
        spinTime = {min = 8, max = 12},
        spinSlowdownRamping = 5,
        rouletteStorage = 97382 
    },
    prizePool = {
        {itemId = 25718, count = {1, 1},   chance = 6500},
        {itemId = 20085, count = {1, 1},    chance = 9000 },
        {itemId = 28526, count = {1, 1},    chance = 8500 },
        {itemId = 14769, count = {1, 1},    chance = 10000 },
        {itemId = 28716, count = {1, 1},   chance = 10800 },
        {itemId = 16244, count = {1, 1}, chance = 5000 },
        {itemId = 34258, count = {1, 1},    chance = 5100 }

    
    },
    cassinoPositions = {
        Position(32364, 32233, 6),
        Position(32364, 32234, 6),
        Position(32364, 32235, 6),
        Position(32364, 32236, 6),
        Position(32364, 32237, 6),
        Position(32364, 32238, 6),
        Position(32364, 32239, 6),
    }
}

local chancedItems = {}

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    lever:transform(config.lever.left)
end

local function updateRoulette(newItemInfo)
    local positions = config.cassinoPositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 7 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    if ItemType(newItemInfo.itemId):getCharges() then
        local item = Game.createItem(newItemInfo.itemId, 1, positions[1])
        item:setAttribute("charges", newItemInfo.count)
    else
        Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
    end
end

local function clearRoulette(newItemInfo)
    local positions = config.cassinoPositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            if ItemType(newItemInfo.itemId):getCharges() then
                local item = Game.createItem(newItemInfo.itemId, 1, positions[i])
                item:setAttribute("charges", newItemInfo.count)
            else
                Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
            end
        end
    end
end

local function chanceNewReward()
    local newItemInfo = {itemId = 0, count = 0}
    
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end
    
    local rand = math.random(#rewardTable)
    newItemInfo.itemId = config.prizePool[rewardTable[rand]].itemId
    newItemInfo.count = math.random(config.prizePool[rewardTable[rand]].count[1], config.prizePool[rewardTable[rand]].count[2])
    chancedItems[#chancedItems + 1] = config.prizePool[rewardTable[rand]].chance
    
    return newItemInfo
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.cassinoPositions[1]:sendDistanceEffect(config.cassinoPositions[4], config.rouletteOptions.winEffects[1])
            config.cassinoPositions[7]:sendDistanceEffect(config.cassinoPositions[4], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.cassinoPositions do
                config.cassinoPositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        if effectCounter == 2 then
            local item = Tile(config.cassinoPositions[4]):getTopVisibleThing()
            local newItemInfo = {itemId = item:getId(), count = item:getCount()}
            clearRoulette(newItemInfo)
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end
    
    local item = Tile(config.cassinoPositions[4]):getTopVisibleThing()
    
    if ItemType(item:getId()):getCharges() then
        local addedItem = player:addItem(item:getId(), 1, true)
        addedItem:setAttribute("charges", item:getCharges())
    else
        player:addItem(item:getId(), item:getCount(), true)
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)
    if chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. item:getName() .. " from the roulette!", MESSAGE_EVENT_ADVANCE)
    end
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end
    
    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)
    
    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end
    
    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casino1Roulette = Action()

function casino1Roulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� precisa de um Sanguine Toke para poder roda a roleta sanguine.")
        return true
    end
    
    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        if player:getStorageValue(config.rouletteOptions.rouletteStorage) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� precisa de " .. config.playItem.count .. "Sanguine  Token para usa a roleta.")
            return true
        end
    end
    
    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}
    
    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)
    
    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casino1Roulette:aid(config.actionId)
casino1Roulette:register()

--[[
local casino1 = MoveEvent()

casino1.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
    for v, k in pairs(config.cassinoPositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

casino1:position(config.cassinoPositions)
casino1:register()
]]