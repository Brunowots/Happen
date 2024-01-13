local config = {
	event_AID = 63523,
	modal_Name = modal_DpThais,
	modal_Event = "modal_DpThais",
	modal_Titulo = "Select Destiny",

	name_local_1 = "Npc's Island",
	pos_local_1 = Position(1068, 978, 7),

	name_local_2 = "Adventurer Island",
	pos_local_2 = Position(32209, 32300, 6),
	
	name_local_3 = "Temple Thais",
	pos_local_3 = Position(32369, 32241, 7),
	
	name_local_4 = "Castle War",
	pos_local_4 = Position(1090, 1071, 5),
	
	name_local_5 = "Forja",
	pos_local_5 = Position(32208, 32282, 7),

	name_local_6 = "Final Sanguine Quest",
	pos_local_6 = Position(32369, 32235, 6)

}

config.modal_Name = MoveEvent()
function config.modal_Name.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    player:registerEvent(config.modal_Event)

    local w = ModalWindow(0, config.modal_Titulo)
    	w:addChoice(1, config.name_local_1)
	w:addChoice(2, config.name_local_2)
	w:addChoice(3, config.name_local_3)
	w:addChoice(4, config.name_local_4)
	w:addChoice(5, config.name_local_5)
	if player:getStorageValue(45678) >= 1 then
		w:addChoice(6, config.name_local_6)
	end
	
	
    w:addButton(0, "Select")
    w:addButton(1, "Cancel")
    w:setDefaultEnterButton(0)
    w:setDefaultEscapeButton(1)
	w:setDefaultEscapeButton(2)
    w:sendToPlayer(player)
    return true
end

config.modal_Name:aid(config.event_AID)
config.modal_Name:register()

config.modal_Name = CreatureEvent(config.modal_Event)

function config.modal_Name.onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent(config.modal_Event)
	

    if buttonId == 0 then
		if choiceId == 1 then 
			if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config.pos_local_1)  
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

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
		end
		
	end
	
    return true
end

config.modal_Name:type("modalwindow")
config.modal_Name:register()









