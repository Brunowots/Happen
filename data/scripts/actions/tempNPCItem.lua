local tempNPCItem = Action()

local config = {
    storageTimeNPC = 995626452,
    npcName = "Kronnos Seller",
    npcDuration = 60 * 2,
    storageReward = 985487569
}

local function createTempNPC(position)
    local npc = Game.createNpc(config.npcName, position)
    npc:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
    addEvent(function()
        npc:getPosition():sendMagicEffect(CONST_ME_POFF)
        npc:remove()
    end, config.npcDuration * 1000)
    return npc
end

function tempNPCItem.onUse(player, item, frompos, item2, topos)
    if player:getLevel() < 8 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você precisa ser level 8 ou superior para usar esse item.")
        return true
    end
	
	 if not player:isVip() then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você precisa ser vip para chamar o Kronnos.")
        return true
    end
	
	if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) and not (getTileInfo(player:getPosition()).protection) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não pode usar enquanto está em battle")
			return true
		end
		if player:isPzLocked() and not (getTileInfo(player:getPosition()).protection) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não pode usar enquanto está em battle")
			return false
		end

    if player:getStorageValue(config.storageTimeNPC) > os.time() then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você já possui um NPC temporário ativo.")
        return true
    end

    local npc = createTempNPC(player:getPosition())
    if not npc then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Falha ao criar o NPC temporário: " .. config.npcName)
        return true
    end

    player:setStorageValue(config.storageTimeNPC, os.time() + config.npcDuration)
    player:setStorageValue(config.storageReward, config.rewardValue)

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Um NPC temporário (" .. config.npcName .. ") foi criado.")
    return true
end

tempNPCItem:id(16262)
tempNPCItem:register()