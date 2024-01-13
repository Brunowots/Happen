local MadeiraAlptramun = Action()

function MadeiraAlptramun.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32215, 32048, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

MadeiraAlptramun:aid(63043)
MadeiraAlptramun:register()