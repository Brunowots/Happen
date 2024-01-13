local internalNpcName = "Lawyer"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1460,
	lookHead = 79,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 114,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

function math.Round(number) 
if number >= 0 then
	return math.floor(number+.5) 
else 
	return math.ceil(number-.5) 
	end
end

local function greetCallback(npc, creature)
	local player = Player(creature)
	local playerId = player:getId()
	local storagePrison = 31230
	local storageTime = 31231

	if player:getStorageValue(storagePrison) ~= 1 then
		npcHandler:say('Voc? n?o est? preso, fale comigo depois que se meter em encrenca.', npc, creature)
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
		return false
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Ol? preso |PLAYERNAME|, como est? seu tempo na cadeira? Interessado em sair mais cedo?')
	end
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local storagePrison = 31230
	local storageTime = 31231

	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local saveValor = player:getStorageValue(storageTime)
	if MsgContains(message, 'yes') and npcHandler:getTopic(playerId) == 0 then
		if player:getStorageValue(storagePrison) == 1 and player:getStorageValue(storageTime) <= 60 then
			npcHandler:say('Falta menos de 1 minuto para voc? sair da pris?o, n?o me incomode.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		elseif player:getStorageValue(storagePrison) == 1 and player:getStorageValue(storageTime) > 60 then
			npcHandler:say({
				'Excelente, infelizmente n?o ? t?o facil tira-lo daqui.',
				'Ir? ser necess?rio uma taxa. Para cada 1 minuto de redu??o, irei cobrar 3k.',
				'Contudo, n?o poderei tirar voc? de uma vez, seria muito estranho.',
				'Portanto, irei reduzir a sua pena para faltar menos de 60 segundos.',
				'Atualmente faltam '..math.Round(saveValor / 60)..' minutos para sua pris?o acabar.',
				'Irei retirar '..(math.Round(saveValor / 60) - 1)..' minutos de tempo de pris?o e ir? custar '..(math.Round((saveValor / 60) * 3000))..' gold. Interessado? '
				}, npc, creature)
				npcHandler:setTopic(playerId, 1)
		end
	elseif MsgContains(message, 'yes') and npcHandler:getTopic(playerId) == 1 then
		if player:removeMoney(math.Round((saveValor / 60) * 100000)) then
			npcHandler:say('Pronto, foi bom fazer negocio com voc?. Espero te ver novam-, digo, espero n?o te ver novamente na pris?o.', npc, creature)
			player:setStorageValue(storageTime, 60)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		else
			npcHandler:say('Voc? n?o tem dinheiro suficiente para pagar meu servi?o.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_FAREWELL, "Tenha um bom dia.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Tenha um bom dia.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
