local function hasRequiredAccess(player)
    return player:isVip() and player:getLoyaltyPoints() >= 3
end

local function teleportPlayerToSpawn(player, fromPosition)
    player:teleportTo(fromPosition, false)
    player:getPosition():sendMagicEffect(3)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa ter VIP e Loyalty Points 3 para entrar nesta sala VIP 2.")
end

local vip2 = MoveEvent()

function vip2.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if not hasRequiredAccess(player) then
        teleportPlayerToSpawn(player, fromPosition)
        return true
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Seja bem-vindo à sala VIP 2.")
    player:getPosition():sendMagicEffect(29)
    player:getPosition():sendMagicEffect(31)
    player:getPosition():sendMagicEffect(56)

    return true
end

vip2:type("stepin")
vip2:aid(5433)
vip2:register()