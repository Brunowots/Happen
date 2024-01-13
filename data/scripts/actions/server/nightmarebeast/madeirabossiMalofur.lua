local MadeiraMalofur = Action()

function MadeiraMalofur.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32252, 32048, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

MadeiraMalofur:aid(63041)
MadeiraMalofur:register()