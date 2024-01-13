local SingeingSteed = Action()

local requiredItems = { --id/count
	[36938] = 4
}

function SingeingSteed.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- has mount?
	if player:hasMount(184) then
		player:sendTextMessage(19, "You already have this mount.")
		return true
	end

	--verify if have items
    for id, count in pairs(requiredItems) do
		if player:getItemCount(id) < count then
			player:sendTextMessage(19, "You not have all required items.")
			return true
		end
	end
	
	-- remove items
	for id, count in pairs(requiredItems) do
		player:removeItem(id, count)
	end
	
	-- add mount
	player:addMount(184)
	player:say('Hot on the Trail', TALKTYPE_MONSTER_SAY)
	
    return true
end

SingeingSteed:id(36938)
SingeingSteed:register()