local internalNpcName = "Lenon Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1292,
	lookHead = 0,
	lookBody = 57,
	lookLegs = 0,
	lookFeet = 68,
	lookAddons = 3,
}


npcConfig.flags = {
	floorchange = false,
	attackable = true
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Trocando tokens online! Equipamentos de primeira classe disponiveis!'}
}

npcConfig.currency = 19082

npcConfig.shop = {
	{ name = "Crystal Coin", clientId = 3043, buy = 1 },
	{ name = "Cozy Couch Left side kit", clientId = 2785, buy = 25 },
	{ name = "Cozy Couch Right side kit", clientId = 2789, buy = 25 },
	{ name = "Cozy Couch Round kit", clientId = 2790, buy = 25 },
	{ name = "Cozy Couch Middle kit", clientId = 2793, buy = 25 },
	{ name = "Cozy Couch Courner kit", clientId = 6372, buy = 25 },
	{ name = "Zaoan Chess Box", clientId = 18339, buy = 40 },
	{ name = "Sneaky Stabber of Eliteness", clientId = 9594, buy = 50 },
	{ name = "Squeezing Gear of Girlpower", clientId = 9596, buy = 50 },
	{ name = "Whacking Driller of Fate", clientId = 9598, buy = 50 },
	{ name = "Blood Herb", clientId = 3734, buy = 5 },
	{ name = "Blade of destruction", clientId = 27449, buy = 15 },
	{ name = "Slayer of destruction", clientId = 27450, buy = 15 },
	{ name = "Axe of destruction", clientId = 27451, buy = 15 },
	{ name = "Chopper of destruction", clientId = 27452, buy = 15 },
	{ name = "Mace of destruction", clientId = 27453, buy = 15 },
	{ name = "Hammer of destruction", clientId = 27454, buy = 15 },
	{ name = "Bow of destruction", clientId = 27455, buy = 15 },
	{ name = "Crossbow of destruction", clientId = 27456, buy = 15 },
	{ name = "Wand of destruction", clientId = 27457, buy = 15 },
	{ name = "Rod of destruction", clientId = 27458, buy = 15 },
	{ name = "Crude umbral Blade", clientId = 20064, buy = 10 },
	{ name = "Crude umbral Slayer", clientId = 20067, buy = 10 },
	{ name = "Crude umbral Axe", clientId = 20070, buy = 10 },
	{ name = "Crude umbral Chopper", clientId = 20073, buy = 10 },
	{ name = "Crude umbral Mace", clientId = 20076, buy = 10 },
	{ name = "Crude umbral Hammer", clientId = 20079, buy = 10 },
	{ name = "Crude umbral Bow", clientId = 20082, buy = 10 },
	{ name = "Crude umbral Crossbow", clientId = 20085, buy = 10 },
	{ name = "Crude umbral Spellbook", clientId = 20088, buy = 10 },
}

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

npcType.onCheckItem = function(npc, player, clientId, subType)
end

local answerType = {}
local answerLevel = {}

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

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setTopic(playerId, 0)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "trade") then
		npc:openShopWindow(creature)
		npcHandler:say("Se voce tiver algum online token, vamos fazer uma troca! Estas sao as minhas ofertas.", npc, creature)
	elseif npcHandler:getTopic(playerId) == 3 then
		if MsgContains(message, "yes") then
			local neededCap = 0
			for i = 1, #products[answerType[playerId]][answerLevel[playerId]].itens do
				neededCap = neededCap + ItemType(products[answerType[playerId]][answerLevel[playerId]].itens[i].id):getWeight() * products[answerType[playerId]][answerLevel[playerId]].itens[i].amount
			end
			if player:getFreeCapacity() > neededCap then
				if player:getItemCount(npc:getCurrency()) >= products[answerType[playerId]][answerLevel[playerId]].value then
					for i = 1, #products[answerType[playerId]][answerLevel[playerId]].itens do
						player:addItem(products[answerType[playerId]][answerLevel[playerId]].itens[i].id, products[answerType[playerId]][answerLevel[playerId]].itens[i].amount)
					end
					player:removeItem(npc:getCurrency(), products[answerType[playerId]][answerLevel[playerId]].value)
					npcHandler:say("Aí está.", npc, creature)
					npcHandler:setTopic(playerId, 0)
				else
					npcHandler:say("Me desculpe, mas parece que você não tem o suficiente ".. ItemType(npc:getCurrency()):getPluralName():lower().."Online Tokens", npc, creature)
				end
			else
				npcHandler:say("Você não tem capacidade suficiente. Você deve ter "..neededCap.." oz.", npc, creature)
			end
		elseif MsgContains(message, "no") then
			npcHandler:say("Sua decisão. Volte se você mudou de ideia.", npc, creature)
		end
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, false)

npcType:register(npcConfig)
