local config = {
	item_id = 35909,
	storageTempoCD = 2592000, -- Storage para tempo 
	TempoCD = 30, -- 1 hora = 3600 | 30 dias 2592000

	modal_Name = modal_pedrateleport,
	modal_Event = "modal_pedrateleport",
	modal_Titulo = "Select Destiny",

	name_local_1 = "House", -- Nao mexer

	name_local_2 = "Npc's Island",
	pos_local_2 = Position(992, 1029, 6),

	name_local_3 = "Adventurer's Island",
	pos_local_3 = Position(32209, 32300, 6),
	
	name_local_4 = "Thais",
	pos_local_4 = Position(32369, 32241, 7),
	
	name_local_5 = "Marapur",
	pos_local_5 = Position(33842, 32852, 7),
	
	name_local_6 = "Gnomprona",
	pos_local_6 = Position(33516, 32856, 14),
	
	name_local_7 = "Bounac",
	pos_local_7 = Position(32424, 32446, 7),
	
	name_local_8 = "Feyrist",
	pos_local_8 = Position(33488, 32221, 7),
	
	name_local_9 = "Issavi",
	pos_local_9 = Position(33921, 31477, 5),
	
	name_local_10 = "Yalahar",
	pos_local_10 = Position(32787, 31276, 7),
	
	name_local_11 = "Kazordoon",
	pos_local_11 = Position(32649, 31925, 11)
}

config.modal_Name = Action()
function config.modal_Name.onUse(player, item, fromPosition, target, toPosition, isHotkey)

		-- se estiver pz nao uza nada
		if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) and not (getTileInfo(player:getPosition()).protection) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não pode usar enquanto está em battle")
			return true
		end
		if player:isPzLocked() and not (getTileInfo(player:getPosition()).protection) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não pode usar enquanto está em battle")
			return false
		end
		
		if player:getStorageValue(31230) > 0 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce esta preso")
			return false
		end

		if player:getStorageValue(config.storageTempoCD) > os.time() then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce esta em Cooldown de 30 segundos")
			player:getPosition():sendMagicEffect(3)
		else
			player:setStorageValue(config.storageTempoCD, os.time() + config.TempoCD)
			player:registerEvent(config.modal_Event)
			local w = ModalWindow(0, config.modal_Titulo)
			w:addChoice(1, config.name_local_1)
			w:addChoice(2, config.name_local_2)
			w:addChoice(3, config.name_local_3)
			w:addChoice(4, config.name_local_4)
			w:addChoice(5, config.name_local_5)
			w:addChoice(6, config.name_local_6)
			w:addChoice(7, config.name_local_7)
			w:addChoice(8, config.name_local_8)
			w:addChoice(9, config.name_local_9)
			w:addChoice(10, config.name_local_10)
			w:addChoice(11, config.name_local_11)
		
			
			
			w:addButton(0, "Select")
			w:addButton(1, "Cancel")
			w:setDefaultEnterButton(0)
			w:setDefaultEscapeButton(1)
			w:setDefaultEscapeButton(2)
			w:sendToPlayer(player)
		end

	return true
end

config.modal_Name:id(config.item_id)
config.modal_Name:register()

config.modal_Name = CreatureEvent(config.modal_Event)

function config.modal_Name.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent(config.modal_Event)
	

    if buttonId == 0 then
	
		if choiceId == 1 then 
			if not player then return true end
			local house = player:getHouse()
			if house then
				local house_position = house:getExitPosition()
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player:teleportTo(house_position)  
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:getPosition():sendMagicEffect(3)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce nao tem house")
			end
			
		elseif choiceId == 2 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_2)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

		elseif choiceId == 3 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_3)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

		elseif choiceId == 4 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_4)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		elseif choiceId == 5 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_5)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		elseif choiceId == 6 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_6)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		elseif choiceId == 7 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_7)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

		elseif choiceId == 8 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_8)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
			
		elseif choiceId == 9 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_9)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
			
		elseif choiceId == 10 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_10)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	

		elseif choiceId == 11 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_11)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)		
			

		end
		
	end
	
    return true
end

config.modal_Name:type("modalwindow")
config.modal_Name:register()