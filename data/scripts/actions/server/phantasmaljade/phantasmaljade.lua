local PhantasmalJade = Action()

local requiredItems = { --id/count
	[34072] = 4,
	[34074] = 1,
	[34073] = 1,
}

function PhantasmalJade.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- has mount?
	if player:hasMount(167) then
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
	player:addMount(167)
	player:say('You receive the permission to ride a Phantasmal Jade', TALKTYPE_MONSTER_SAY)
	
    return true
end

PhantasmalJade:id(34072,34073,34074)
PhantasmalJade:register()