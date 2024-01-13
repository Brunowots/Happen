local storageGlobal = TalkAction("/global")

function storageGlobal.onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The storage is ".. Game.getStorageValue(param) ..".")
	return false
end

storageGlobal:separator(" ")
storageGlobal:register()
