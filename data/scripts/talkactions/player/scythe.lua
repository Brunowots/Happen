local backpack = TalkAction("!scythe")

function backpack.onSay(player, words, param)	
    if player:removeMoneyBank(1000) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(3453, 1)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought an Scythe for 1K!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

backpack:register()
