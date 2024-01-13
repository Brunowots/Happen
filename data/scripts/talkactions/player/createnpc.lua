local npcCreate = TalkAction("!npc")

function npcCreate.onSay(player, words, param)
	local npcName = "Xodet"
	local position = player:getPosition()
	
	if position:getTile():getTopCreature() then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Você já criou o npc " .. npcName)
		return false
	end
	
	local npc = Game.createNpc(npcName, position)
	
	if npc then
		npc:setMasterPos(position)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
		addEvent(function() npc:remove() end, 60 * 1000)
		
		-- Define o tempo de 1 hora para a storage
		local storageTime = 3600
		player:setStorageValue(101, os.time() + storageTime)
		
		player:sendTextMessage(MESSAGE_INFO_DESCR, "NPC " .. npcName .. " criado com sucesso!")
	else
	    player:sendTextMessage(MESSAGE_INFO_DESCR, "Não foi possível criar o NPC " .. npcName)
		position:sendMagicEffect(CONST_ME_POFF)
	end
	
	return false
end

npcCreate:register()