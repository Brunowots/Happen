local internalNpcName = "Mina do Addon"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1582,
	lookHead = 79,
	lookBody = 91,
	lookLegs = 0,
	lookFeet = 79,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)


npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

local addons = {
		["citizen"] = {male = 136, female = 128},
		["hunter"] = {male = 137, female = 129}
	}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if addons[message:lower()] and npcHandler:getTopic(playerId) == 0 then
		npcHandler:say("Hm... Você está interessado nos addons do "..message:lower().." outfit. Ok então, custará 1kk. Aceita? A parada é o seguinte, eu não me importo se você já tem ou não. Vou pegar o dinheiro se você concordar.", npc, creature)
		npcHandler:setTopic(playerId, 1)
		player:setStorageValue(778451, addons[message:lower()].male)
		player:setStorageValue(778452, addons[message:lower()].female)
	elseif MsgContains(message, "yes") and npcHandler:getTopic(playerId) == 1 then
		if player:removeMoney(1000000) then
			npcHandler:setTopic(playerId, 0)
				for i = 1, 2 do
					player:addOutfitAddon(player:getStorageValue(778451), i)
					player:addOutfitAddon(player:getStorageValue(778452), i)
				end
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler:say("Addon adicionado com sucesso, aproveite. Interessado em outro?", npc, creature)
		else
			npcHandler:say("Você não tem dinheiro suficiente, ta pobre tio?.", npc, creature)
			npcHandler:removeInteraction(npc, creature)
			npcHandler:resetNpc(creature)
		end
	else
		npcHandler:say("Mano... Não tenho esse addon disponível, tente outro outfit ou escreva o nome corretamente.", npc, creature)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 'Olá |PLAYERNAME|, interessado em algum addon? Fale o nome que verei se tenho disponível.')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
