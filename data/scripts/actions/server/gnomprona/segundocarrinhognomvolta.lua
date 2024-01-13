local espelho = Action()

function espelho.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33545, 32911, 15)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

espelho:aid(63016)
espelho:register()