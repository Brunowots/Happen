local barcofalconvolta = Action()

function barcofalconvolta.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33327, 31350, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

barcofalconvolta:aid(60530)
barcofalconvolta:register()
