local internalNpcName = "Mike Tyson"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1051,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 94,
	lookFeet = 114,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
end

local function onTradeRequest(npc, creature)
	local player = Player(creature)
	local playerId = player:getId()

	if not player:isVip() then
		npcHandler:say('Foi mal, só vendo pra player VIP, compre a sua na gamestore.', npc, creature)
		return false
	end
	
	if player:getLevel() < 100 then
		npcHandler:say('Foi mal, somente nivel 100+', npc, creature)
		return false
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "<Sighs> Eai, quer treinar para ficar igual eu?! To aposentado mas te meto a porrada ainda, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Até mais, |PLAYERNAME|. Ta ficando monstro, BIRL!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Quem vira as costas toma nocaute.")
npcHandler:setMessage(MESSAGE_SENDTRADE, 'Eai, to com uns bagulhinho aqui pra vender e te deixar monstro, aproveita.')

npcHandler:setCallback(CALLBACK_ON_TRADE_REQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 7400000, count = 14400 },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 7400000, count = 14400 },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 7400000, count = 14400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 7400000, count = 14400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 7400000, count = 14400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 7400000, count = 14400 },
	{ itemName = "great health potion", clientId = 239, buy = 225 },
	{ itemName = "great mana potion", clientId = 238, buy = 144 },
	{ itemName = "great spirit potion", clientId = 7642, buy = 228 },
	{ itemName = "health potion", clientId = 266, buy = 50 },
	{ itemName = "mana potion", clientId = 268, buy = 56 },
	{ itemName = "strong health potion", clientId = 236, buy = 115 },
	{ itemName = "strong mana potion", clientId = 237, buy = 93 },
	{ itemName = "supreme health potion", clientId = 23375, buy = 625 },
	{ itemName = "ultimate health potion", clientId = 7643, buy = 379 },
	{ itemName = "ultimate mana potion", clientId = 23373, buy = 438 },
	{ itemName = "ultimate spirit potion", clientId = 23374, buy = 438 }
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
