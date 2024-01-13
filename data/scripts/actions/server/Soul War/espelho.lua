local espelho = Action()

function espelho.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
		if player:getStorageValue(331801) <= 0 then
			player:teleportTo(Position(33914, 31034, 12)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa matar o primeiro boss para ter acesso aqui")
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33779, 31598, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
    return true
end

espelho:aid(40301)
espelho:register()