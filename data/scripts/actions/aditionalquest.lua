local aditionalquest = Action()

function aditionalquest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemID = item:getId()
    local actionID = item:getActionId()

    if actionID == 4586 then
        local requiredLoyaltyPoints = 1
        local currentLoyaltyPoints = player:getLoyaltyPoints()

        if currentLoyaltyPoints >= requiredLoyaltyPoints then
            local itemToBeRemovedID1 = 44030
            local itemToBeRemovedID2 = 43987
            local newItemID1 = 44031
            local newItemID2 = 43988
            local targetPosition1 = Position(32383, 32236, 7)
            local targetPosition2 = Position(32385, 32242, 7)

            local tile1 = Tile(targetPosition1)
            local itemOnTile1 = tile1 and tile1:getItemById(newItemID1)

            local tile2 = Tile(targetPosition2)
            local itemOnTile2 = tile2 and tile2:getItemById(newItemID2)

            if itemOnTile1 and itemOnTile2 then
			
                local originalActionID1 = itemOnTile1:getActionId()
                local originalActionID2 = itemOnTile2:getActionId()

                local oldItem1 = Game.createItem(itemToBeRemovedID1, 1, targetPosition1)
                local oldItem2 = Game.createItem(itemToBeRemovedID2, 1, targetPosition2)
                if oldItem1 and oldItem2 then
                    oldItem1:setActionId(originalActionID1)
                    oldItem2:setActionId(originalActionID2)

                    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
                    itemOnTile1:remove(1)
                    itemOnTile2:remove(1)
                end
            else

                local tile1 = Tile(targetPosition1)
                local itemOnTile1 = tile1 and tile1:getItemById(itemToBeRemovedID1)
                if itemOnTile1 then
                    local newItem1 = Game.createItem(newItemID1, 1, targetPosition1)
                    if newItem1 then
                        newItem1:setActionId(actionID)

                        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você conseguiu transformar o item com sucesso!")
                        itemOnTile1:remove(1)
                    end
                end

                local tile2 = Tile(targetPosition2)
                local itemOnTile2 = tile2 and tile2:getItemById(itemToBeRemovedID2)
                if itemOnTile2 then
                    local newItem2 = Game.createItem(newItemID2, 1, targetPosition2)
                    if newItem2 then
                        newItem2:setActionId(actionID)

                        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você conseguiu transformar o item com sucesso!")
                        itemOnTile2:remove(1)
						
						local spectators = Game.getSpectators(targetPosition1, false, true, 7, 7, 5, 5)
                    if #spectators > 0 then
                        for i = 1, #spectators do
                            spectators[i]:say("Hora da brincadeira amiguinho!", TALKTYPE_MONSTER_SAY)
                        end
                        targetPosition1:sendMagicEffect(CONST_ME_MAGIC_GREEN)
                    end
						
                    end
                end
            end
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa de pelo menos 1 Loyalty Points para realizar esta invocação!")
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
end

aditionalquest:aid(4586)
aditionalquest:register()