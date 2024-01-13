local internalNpcName = "Taskman"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1618,
	lookHead = 0,
	lookBody = 88,
	lookLegs = 88,
	lookFeet = 0,
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

local tasks = {
		["rotworm"] = '1',
		["minortaur"] = 2
	}
		
local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, 'tasks') then
		npcHandler:say('Oho... se achando capaz de completar as minhas tasks?', npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif MsgContains(message, 'yes') and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say('Atualmente estou precisando me livrar de {rotworm} e {minotaur}, qual você quer matar?', npc, creature)
		npcHandler:setTopic(playerId, 99)
	elseif npcHandler:getTopic(playerId) == 99 then
		local xuxa = message:lower()
		if not taskmanSystem["xuxa"].item then
			npcHandler:say({
				'Ok então, você escolheu '..message:lower()..', por isso precisaria que você mate '..taskmanSystem["xuxa"].kill..'',
				'Claro, não quero que faça isso sem recompensa.',
				'Você irá receber '..taskmanSystem.tasks["message:lower()"].exp..' de experiência.',
				'Você irá receber '..taskmanSystem.tasks["message:lower()"].gold..' de gold.',
			}, npc, creature)
			npcHandler:setTopic(playerId, 2)
		elseif taskmanSystem["xuxa"].item then
			print("123")
		end


	elseif npcHandler:getTopic(playerId) == 1 then
		if MsgContains(message, 'alchemist') then
			local destination = Position(32738, 31113, 7)
			Player(creature):teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:setTopic(playerId, 0)
		elseif MsgContains(message, 'cemetery') then
			local destination = Position(32743, 31113, 7)
			Player(creature):teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
