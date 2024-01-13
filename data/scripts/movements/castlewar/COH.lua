local COH = MoveEvent()
function COH.onStepIn(cid, item, position, fromPosition)
	local pos = getThingfromPos(cid)
	local player = Player(cid)
	local storage = db.storeQuery("SELECT `value` FROM `player_storage` WHERE player_id= 1 AND `key` = 1000;")
	local storage1 = tonumber(result.getDataInt(storage, "value"))
	if not getPlayerGuildLevel(cid, 0) then
			doSendMagicEffect(getThingfromPos(cid), 2)
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendCancel(cid, "[CoH] Você não possui uma guild.")
	return true
	end
	if not storage1 then
		db.query("INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES (1,1000,0)")
		doTeleportThing(cid, fromPosition, false)
		doPlayerSendCancel(cid, "Tente novamente!")
		return false
	elseif 	storage1 < 0 then
		db.query("UPDATE `player_storage` SET `value` = 0 WHERE `key` = 1000 AND `player_id` = 1")
		doTeleportThing(cid, fromPosition, false)
		doPlayerSendCancel(cid, "Tente novamente!")
		return false
	end
	local guild = player:getGuild()
	local guild1 = guild:getId()
	local teste5 = db.storeQuery("SELECT `name` FROM `guilds` WHERE `id` = ".. storage1 ..";")
	local teste6 = tostring(result.getDataString(teste5, "name"))
	local guildn = guild:getName()

		

	if item.actionid == 16203 then 
		if not isPlayer(cid) then
			return true
		end

		if guild1 == storage1 then
			doSendMagicEffect(getThingfromPos(cid), 14)
			doPlayerSendTextMessage(cid, 4, "[CoH] Membros da guild dominante "..guild:getName().." possuem o privilegio de passar por aqui!")
		elseif storage1 > 0 then
				doSendMagicEffect(getThingfromPos(cid), 2)
				doTeleportThing(cid, fromPosition, false)
				doPlayerSendCancel(cid, "[CoH] Você não pertence á guild dominante ".. teste6 ..".")	
		else
			doSendMagicEffect(getThingfromPos(cid), 2)
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendCancel(cid, "[CoH] Não existe Guild dominando o castelo no momento, espere o evento e conquiste-o!")
		end
	return true
	end

	if item.actionid == 16202 then
		if not isPlayer(cid) then
			return true
		end
		if getPlayerGuildLevel(cid, 0) then
   			if (storage1 ~= guild1) then
				doPlayerSendTextMessage(cid, 20, "[Castle of Honor] Você e sua guild estão no comando do castelo!")
				setGlobalStorageValue(COH_PREPARE1, -1)
				setGlobalStorageValue(COH_PREPARE2, -1)
				db.query("UPDATE `player_storage` SET `value` = "..guild1 .." WHERE `key` = 1000 AND `player_id` = 1")
				doCastleRemoveEnemies()
				broadcastMessage("[Castle of Honor] O jogador ["..player:getName().."] e sua guild ["..player:getGuild():getName().."] estão agora no comando do castelo. Tente dominar o Castle ou os aceite como governantes!")
			end
		else
			doSendMagicEffect(getThingfromPos(cid), 2)
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendCancel(cid, "[CoH] Você não possui uma guild.")
		end
	return true
	end

	if item.actionid == 16200 then
		if not isPlayer(cid) then
			return true
		end
		if getPlayerGuildLevel(cid, 0) then
			doPlayerSendTextMessage(cid, 4, "CoH Invasion Camp!")
			if (player:getGuild():getName() ~= teste6) then
				setGlobalStorageValue(COH_PREPARE1, guild1)
				if storage1 > 0 then
					broadcastMessage("[Castle of Honor] Atenção! A guild "..guildn.." está indo em direção ao Castelo. Guild dominante preparem-se!")
				else
					broadcastMessage("[Castle of Honor] Atenção! A guild "..guildn.." está indo em direção ao Castelo.")
				end
			else
				doPlayerSendTextMessage(cid, 20, "Defenda o castelo para que sua guild permaneça a dominante.")  
			end
		else
			doSendMagicEffect(getThingfromPos(cid), 2)
			doTeleportThing(cid, fromPosition, false)
			doPlayerSendCancel(cid, "[CoH] Você não possui uma guild.")  
		return true
		end  
	end

	if item.actionid == 16201 then
		if not isPlayer(cid) then
			return true
		end
		doPlayerSendTextMessage(cid, 4, "CoH Invasion Castle!")
		if (getGlobalStorageValue(COH_PREPARE2) ~= guild1) then
			setGlobalStorageValue(COH_PREPARE2, guild1)
			broadcastMessage("[Castle of Honor] Atenção! A guild "..teste6.." está próxima do domínio do Castle. Guild dominanete defenda o Castle para não perde-lo!")
		end
	end
return true
end

COH:type("stepin")
COH:aid(16200, 16201, 16202, 16203)
COH:register()