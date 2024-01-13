local config = {
	[1] = {
		{itemId = 7440, count = 20},
		{itemId = 23373, count = 100},
        {itemId = 22516, count = 1}, --silver token
		{itemId = 22721, count = 1}, -- gold token
		{itemId = 28545, count = 500},
		{itemId = 3043, count = 2},
	},

	[2] = {
		{itemId = 7440, count = 20},
		{itemId = 23373, count = 100},
        {itemId = 22516, count = 1}, --silver token
		{itemId = 22721, count = 1}, -- gold token
		{itemId = 28544, count = 500},
		{itemId = 3043, count = 2},

	},

	[3] = {
		{itemId = 7443, count = 20},
		{itemId = 23374, count = 100},
        {itemId = 22516, count = 1}, --silver token
		{itemId = 22721, count = 1}, -- gold token
		{itemId = 28543, count = 500},
		{itemId = 3043, count = 2},

	},

	[4] = {
		{itemId = 7439, count = 20}, -- bezerk potion
		{itemId = 23375, count = 100}, -- supreme healt
		{itemId = 22516, count = 1}, --silver token
		{itemId = 22721, count = 1}, -- gold token
		{itemId = 28542, count = 500}, -- exercise club
		{itemId = 28540, count = 500},  -- exercise sword
		{itemId = 28541, count = 500}, -- exercise axe
		{itemId = 3043, count = 2}, --  crystal coin
	},
	
	[5] = {
		{itemId = 7440, count = 50},
		{itemId = 23373, count = 100},
        {itemId = 22516, count = 2}, --silver token
		{itemId = 22721, count = 2}, -- gold token
		{itemId = 28545, count = 1500},
		{itemId = 3043, count = 4},
	},
	[6] = {
		{itemId = 7440, count = 50},
		{itemId = 23373, count = 100},
        {itemId = 22516, count = 2}, --silver token
		{itemId = 22721, count = 2}, -- gold token
		{itemId = 28544, count = 1500},
		{itemId = 3043, count = 4},
	},
	[7] = {
		{itemId = 7443, count = 50},
		{itemId = 23374, count = 100},
        {itemId = 22516, count = 2}, --silver token
		{itemId = 22721, count = 2}, -- gold token
		{itemId = 28543, count = 1500},
		{itemId = 3043, count = 4},
	},
	[8] = {
		{itemId = 7439, count = 50}, -- bezerk potion
		{itemId = 23375, count = 100}, -- supreme healt
		{itemId = 22516, count = 2}, --silver token
		{itemId = 22721, count = 2}, -- gold token
		{itemId = 28542, count = 1500}, -- exercise club
		{itemId = 28540, count = 1500},  -- exercise sword
		{itemId = 28541, count = 1500}, -- exercise axe
		{itemId = 3043, count = 4}, --  crystal coin
	}
}

local cooldown ={
	waitTime = 24 * 60 * 60
}

local exercise_reward_modal = TalkAction("!rewardvip")
function exercise_reward_modal.onSay(player, words, param)
	local window = ModalWindow {
		title = "Daily Reward",
		message = 'Escolha sua recompensa de hoje '.. player:getVocation():getName() ..'.'
	}
	for i, info in pairs(config[player:getVocation():getId()]) do
		window:addChoice(string.format("%s", info.count .." ".. ItemType(info.itemId):getName()), function (player, button, choice)
			if button.name ~= "Select" then
				return true
			end

			local lastRewardTime = player:getStorageValue("21542") or 0
			local timeSinceLastReward = os.time() - lastRewardTime
			if timeSinceLastReward >= cooldown.waitTime then
				window:sendToPlayer(player)
			else
				local timeLeft = cooldown.waitTime - timeSinceLastReward
				local daysLeft = math.floor(timeLeft / (60 * 60 * 24))
					timeLeft = timeLeft - daysLeft * 60 * 60 * 24
				local hoursLeft = math.floor(timeLeft / (60 * 60))
					timeLeft = timeLeft - hoursLeft * 60 * 60
				local minutesLeft = math.floor(timeLeft / 60)
				local secondsLeft = timeLeft % 60
				local message = string.format("You must wait %d days, %d hours, %d minutes and %d seconds before claiming your next reward.", daysLeft, hoursLeft, minutesLeft, secondsLeft)
				player:sendTextMessage(MESSAGE_INFO_DESCR, message)
				return false
			end
			
			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			if inbox and inbox:getEmptySlots() > 0 then
				local item = inbox:addItem(info.itemId, info.count)
				if item then
					item:setActionId(IMMOVABLE_ACTION_ID)
					player:setStorageValue("21542", os.time())
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations, you just received a [".. info.count .." ".. ItemType(info.itemId):getName() .."].")
				end
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to have capacity and empty slots to receive.")
				return true
			end
		end)
	end
	window:addButton("Select")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	
	if player:getLevel() < 250 then
		player:sendTextMessage(MESSAGE_LOOK, "Voce deve ser level 250 ou maior.") -- MESSAGE_ADMINISTRADOR
		return false
	end
	
        if player:isVip() then
		window:sendToPlayer(player)
	else
		player:getPosition():sendMagicEffect(3)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Permitida apenas para VIP.")
        end
	return false
end
exercise_reward_modal:separator(" ")
exercise_reward_modal:register()
