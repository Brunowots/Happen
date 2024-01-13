local leaveparty = TalkAction("!leaveparty")

function leaveparty.onSay(player, words, param)
	local party = player:getParty()
	if party then
		party:removeMember(player)
	else
		player:sendCancelMessage("You not have a party.")
	end
	return false
end

leaveparty:register()