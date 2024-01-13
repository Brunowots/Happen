local barcofalconida = Action()

function barcofalconida.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32103, 31923, 13)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

barcofalconida:aid(60532)
barcofalconida:register()
