local teste3 = Action()

function teste3.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	print(" "..player:getLoyaltyPoints().." ")
	player:setLoaltyPointsDb(1)
	return true
end

teste3:aid(31248)
teste3:register()
