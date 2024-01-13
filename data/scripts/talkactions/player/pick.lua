local pick = TalkAction("!pick")

function pick.onSay(player, words, param)	
    if player:removeMoneyBank(500) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(3456, 1)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a pick for 500 gold coins!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

pick:register()
