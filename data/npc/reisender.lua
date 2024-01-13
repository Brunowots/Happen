local internalNpcName = "Reisender"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1575,
	lookHead = 15,
	lookBody = 55,
	lookLegs = 0,
	lookFeet = 100,
	lookAddons = 3
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

local topic = {}
local renown = {}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	if (MsgContains(message, 'no') or MsgContains(message, 'não')) then
		npcHandler:say('Você quem sairá perdendo, lá é um lugar incrivel.', npc, creature)
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		npcHandler:say('Você já conseguiu tudo que podia comigo, vá perturbar outro.', npc, creature)
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		npcHandler:say({
			'Excelente, fico contente em saber disso.',
			'Primeiramente, gostaria de dizer que lá é um local perigoso.',
			'Por causa disso, estou com medo de que você não conseguirá se sair bem lá. Para ter certeza irei precisar que você faça uns testes.',
			'Para começar, mate 1000 Dragon Lords, me traga 100 Red Dragon Leather e 100 Red Dragon Scale.',
			'Você aceita o desafio?',
		}, npc, creature)
		npcHandler:setTopic(playerId, 2)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		npcHandler:say('Ok então, mate-os, traga-me os itens e volte aqui!', npc, creature)
		player:setStorageValue(31542, 0)
		player:setStorageValue(31543, 0)
		player:setStorageValue(31544, 0)
		npcHandler:removeInteraction(npc, creature)
		npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		npcHandler:say({
			'Eu pedi para você matar 1000 Dragon Lords e me trazer 100 Red Dragon Leather e 100 Red Dragon Scale.',
			'Você conseguiu tudo?',
		}, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:getStorageValue(54110) == 2 then
			if player:getItemCount(5948) >= 100 and player:getItemCount(5882) >= 100 then
				npcHandler:say({
					'Deixa eu verificar',
					'Estou vendo que você matou os 1000 Dragon Lords',
					'Interessante, você trouxe os 100 Red Dragon Leather.',
					'Incrivel, você também trouxe os 100 Red Dragon Scale.',
					'Vejo que você tem tudo completo, gostaria de me entregar os itens agora?',
				}, npc, creature)
				npcHandler:setTopic(playerId, 2)
			elseif player:getItemCount(5948) < 100 then
				npcHandler:say('Você não tem os 100 Red Dragon Leather, está tentando me enganar?', npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			elseif player:getItemCount(5882) < 100 then
				npcHandler:say('Você não tem os 100 Red Dragon Scale, está tentando me enganar?', npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			end
		else
			npcHandler:say('Você não matou nem os 1000 Dragon Lords ainda, está tentando me enganar?', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:getItemCount(5948) >= 100 and player:getItemCount(5882) >= 100 then
			player:removeItem(5948, 100)
			player:removeItem(5882, 100)
			npcHandler:say({
				'Muito bem.',
				'Você passou no meu teste inicial.',
				'Irei dificultar um pouco para ver se você realmente tem a capacidade de ir para o local Vip.',
				'Quero que você mate 1000 Behemoths, me traga 100 Perfect Behemoth Fangs e 100 Behemoth Claws.',
				'Você consegue?',
			}, npc, creature)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say('Está tentando me passar a perna? Claramente você não me deu todos os itens.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say({
				'Muito bem.',
				'Quero que você mate 1000 Behemoths, me traga 100 Perfect Behemoth Fangs e 100 Behemoth Claws.',
				'Você consegue?',
			}, npc, creature)
			npcHandler:setTopic(playerId, 3)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say('Muito bem, estarei esperando.', npc, creature)
			player:setStorageValue(Storage.Vip1Quest.DragonLordMission, 3)
			player:setStorageValue(Storage.Vip1Quest.BehemothMission, 1)
			player:setStorageValue(Storage.Vip1Quest.Questline, 4)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		npcHandler:say({
			'Eu pedi para você matar 1000 Behemoths e me trazer 100 Perfect Behemoth Fangs e 100 Behemoth Claws.',
			'Não sinta vergonha em dizer que falhou, foi um teste mais dificil que o anterior.',
			'Você realmente conseguiu tudo?',
		}, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:getStorageValue(8462626) == 5 then
			if player:getItemCount(5893) >= 100 and player:getItemCount(5930) >= 100 then
				npcHandler:say({
					'Vamos ver, o teste foi mais dificil, tenho que verificar com calma...',
					'Incrivel, você matou os 1000 Behemoths.',
					'Também me trouxe os 100 Perfect Behemoth Fangs.',
					'Até conseguiu as 100 Behemoth Claws.',
					'Vejo que você tem tudo completo, gostaria de me entregar os itens agora?',
				}, npc, creature)
				npcHandler:setTopic(playerId, 2)
			elseif player:getItemCount(5893) < 100 then
				npcHandler:say('Você não tem as 100 Perfect Behemoth Fangs, está tentando me enganar?', npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			elseif player:getItemCount(5930) < 100 then
				npcHandler:say('Você não tem as 100 Behemoth Claws, está tentando me enganar?', npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			end
		else
			npcHandler:say('Você não matou nem os 1000 Behemoths ainda, está tentando me enganar?', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:getItemCount(5893) >= 100 and player:getItemCount(5930) >= 100 then
			player:removeItem(5893, 100)
			player:removeItem(5930, 100)
			npcHandler:say({
				'Muito bem.',
				'Você passou no meu segundo teste.',
				'Hora do ultimo, espero que esteja preparado.',
				'Quero que você mate 1000 Demons, me traga 100 Talons e 100 Demon Horn.',
				'Você consegue?',
			}, npc, creature)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say('Está tentando me passar a perna? Claramente você não me deu todos os itens.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say({
				'Hora do ultimo teste, espero que esteja preparado.',
				'Quero que você mate 1000 Demons, me traga 100 Talons e 100 Demon Horn.',
				'Você consegue?',
			}, npc, creature)
			npcHandler:setTopic(playerId, 3)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say('Boa sorte, pois será o teste mais dificil.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		npcHandler:say({
			'Eu pedi para você matar 1000 Demons e me trazer 100 Talons e 100 Demon Horn.',
			'Eu não esperava que você consiguiria tão rápido.',
			'Você realmente terminou tudo?',
		}, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:getStorageValue(545151) == 8 then
			if player:getItemCount(3034) >= 100 and player:getItemCount(5954) >= 100 then
				npcHandler:say({
					'Vamos ver, preciso olhar com um cuidado extra.',
					'Incrivel, você matou os 1000 Demons.',
					'Também me trouxe os 100 Talons.',
					'Até conseguiu as 100 Demon Horn.',
					'Vejo que você tem tudo completo, gostaria de me entregar os itens agora?',
				}, npc, creature)
				npcHandler:setTopic(playerId, 2)
			elseif player:getItemCount(3034) < 100 then
				npcHandler:say('Você não tem as 100 Talons, está tentando me enganar?', npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			elseif player:getItemCount(5954) < 100 then
				npcHandler:say('Você não tem as 100 Demon Horn, está tentando me enganar?', npc, creature)
				npcHandler:removeInteraction(npc, creature)
				npcHandler:resetNpc(creature)
			end
		else
			npcHandler:say('Você não matou nem os 1000 Demons ainda, está tentando me enganar?', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:getItemCount(3034) >= 100 and player:getItemCount(5954) >= 100 then
			player:removeItem(3034, 100)
			player:removeItem(5954, 100)
			npcHandler:say({
				'Muito bem.',
				'Você passou em todos meus testes.',
				'Gostaria de dizer que só isso seria suficiente.',
				'Mas todos esses testes foi pra garantir que você conseguiria fazer a quest.',
				'Irei te teleportar para a quest, só que precisarei consumir bastante material.',
				'Por isso precisarei de uma ajuda sua, poderia me trazer 15kk para me ajudar?',
			}, npc, creature)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say('Está tentando me passar a perna? Claramente você não me deu todos os itens.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say({
				'Irei te teleportar para a quest, só que precisarei consumir bastante material.',
				'Por isso precisarei de uma ajuda sua, poderia me trazer 15kk para me ajudar?',
			}, npc, creature)
			npcHandler:setTopic(playerId, 3)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say('Muito bom, estarei esperando por você para me trazer o dinheiro.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say('Já conseguiu pegar o dinheiro para o teleport?', npc, creature)
			npcHandler:setTopic(playerId, 1)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
		if player:removeMoney(15000000) then
			npcHandler:say('Excelente, boa sorte na sua jornada.', npc, creature)	
			player:setStorageValue(12546, 1)
			player:teleportTo(Position(161, 45, 7))
			player:setStorageValue(Storage.Vip1Quest.MoneyMission, 2)
			player:setStorageValue(Storage.Vip1Quest.Questline, 11)
			player:setStorageValue(Storage.Vip1Quest.QuestMission, 1)
		else
			npcHandler:say('Você não tem dinheiro suficiente.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say('Já fiz tudo para te ajudar, agora termine a quest.', npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
	elseif (MsgContains(message, 'yes') or MsgContains(message, 'sim')) then
			npcHandler:say('Muito bem, parabéns por adquirir sua recompensa.', npc, creature)
			player:setStorageValue(12548, 0)
			player:setStorageValue(12547, 1)
			player:teleportTo(Position(161, 45, 7))
	end
	return true
end

local function onReleaseFocus(npc, creature)
	local playerId = creature:getId()
	topic[playerId], renown[playerId] = nil, nil
end

npcHandler:setMessage(MESSAGE_GREET, 'Olá |PLAYERNAME|, interessado em fazer algumas das minhas task?')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)