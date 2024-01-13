local MadeiraMaxxenius = Action()

function MadeiraMaxxenius.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32211, 32002, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

MadeiraMaxxenius:aid(63042)
MadeiraMaxxenius:register()