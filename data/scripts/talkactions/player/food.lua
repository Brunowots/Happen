local food = TalkAction("!food")

function food.onSay(player, words, param)	
    if player:removeMoneyBank(2000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(3725, 100)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought 100 Brown mushroom for 2K!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("Tu ta pobre, vai pedir free itens.")
    end
end

food:register()
