local espelho = Action()

function espelho.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33090, 32280, 12)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

espelho:aid(40315)
espelho:register()
