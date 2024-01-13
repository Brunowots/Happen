local shared = TalkAction("!shared")

function shared.onSay(player, words, param)
	local minLevel = math.floor((player:getLevel() * 2) / 3)
	local maxLevel = math.floor((player:getLevel() - minLevel) + player:getLevel())
	-- You share xp level x to level x
	-- 
	local str = "Players Min/Max Level for Share With You:\nMin Level: "..minLevel.."\nMax Level: "..maxLevel
	player:sendTextMessage(MESSAGE_LOOT, str)
	return false
end

shared:separator(" ")
shared:register()
