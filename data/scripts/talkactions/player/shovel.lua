local shovel = TalkAction("!shovel")

function shovel.onSay(player, words, param)	
    if player:removeMoneyBank(500) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(5710, 1)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a light shovel for 500 gold coins!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

shovel:register()
