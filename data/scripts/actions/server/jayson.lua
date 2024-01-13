local jayson = Action()

function jayson.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_LOOT, "OI THIAGO BONITAO.")
    return true
end

jayson:aid(31246)
jayson:register()