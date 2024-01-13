WheelOfDestinySystem.sendWheelOfDestinyData = function(player, owner)
    if not(player) then
        print("[WheelOfDestinySystem.sendWheelOfDestinyData]", "'player' cannot be null")
        return false
    end

    if not(WheelOfDestinySystem.config.enabled) then
        return true
    end

    if not(player) then
        print("[WheelOfDestinySystem.sendWheelOfDestinyData]", "'player' cannot be null")
        return false
    end

    if not(owner) then
        print("[WheelOfDestinySystem.sendWheelOfDestinyData]", "'owner' cannot be null")
        return false
    end

    local data = WheelOfDestinySystem.data.player[owner:getGuid()]
    if (data == nil) then
        print("[WheelOfDestinySystem.sendWheelOfDestinyData]", "owner 'data' cannot be null")
        return false
    end

    local canUse = WheelOfDestinySystem.canUseOwnWheel(owner)
    local vocation = WheelOfDestinySystem.getPlayerVocationEnum(owner)
    if (vocation == WheelOfDestinySystem.enum.vocation.VOCATION_INVALID) then
        canUse = false
    end

    if (player:getClient().version < 1310) then
        return true
    end

    local msg = NetworkMessage()
    msg:addByte(0x5F)
    msg:addU32(owner:getId())
    msg:addByte(canUse and 1 or 0)
    if not(canUse) then
        msg:sendToPlayer(player)
        return true
    end

    msg:addByte(WheelOfDestinySystem.getWheelOfDestinyUsableEnum(player, owner))
    msg:addByte(vocation)
    msg:addU16(WheelOfDestinySystem.getPoints(owner))
    msg:addU16(0)
    for i = WheelOfDestinySystem.enum.slots.SLOT_FIRST, WheelOfDestinySystem.enum.slots.SLOT_LAST do
        msg:addU16(WheelOfDestinySystem.getPlayerPointsOnSlot(owner, i))
    end
    msg:addU16(0)

    msg:sendToPlayer(player)
    return true
end