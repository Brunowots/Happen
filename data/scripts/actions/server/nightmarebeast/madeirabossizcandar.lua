local MadeiraIzcandar = Action()

function MadeiraIzcandar.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32179, 32048, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

MadeiraIzcandar:aid(63040)
MadeiraIzcandar:register()