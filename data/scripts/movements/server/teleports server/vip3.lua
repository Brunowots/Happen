local function hasRequiredAccess(player)
    return player:isVip() and player:getLoyaltyPoints() >= 5
end

local function teleportPlayerToSpawn(player, fromPosition)
    player:teleportTo(fromPosition, false)
    player:getPosition():sendMagicEffect(3)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa ter VIP e Loyalty Points 5 para entrar nesta sala VIP 3.")
end

local vip3 = MoveEvent()

function vip3.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if not hasRequiredAccess(player) then
        teleportPlayerToSpawn(player, fromPosition)
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Seja bem-vindo à sala VIP 3.")
    player:getPosition():sendMagicEffect(29)
    player:getPosition():sendMagicEffect(31)
    player:getPosition():sendMagicEffect(56)

    return true
end

vip3:type("stepin")
vip3:aid(5434)
vip3:register()