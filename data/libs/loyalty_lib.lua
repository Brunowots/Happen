local loyaltySystem = {
	enable = configManager.getBoolean(LOYALTY_SYSTEM_ENABLED),
	titles = {
		[1] = {name = "Scout of Tibia", points = 0},
		[2] = {name = "Sentinel of Tibia", points = 1},
		[3] = {name = "Steward of Tibia", points = 3},
		[4] = {name = "Warden of Tibia", points = 6},
		[5] = {name = "Squire of Tibia", points = 9},
		[6] = {name = "	Warrior of Tibia", points = 15},
		[7] = {name = "Keeper of Tibia", points = 21},
		[8] = {name = "Guardian of Tibia", points = 30},
		[9] = {name = "Sage of Tibia", points = 42},
		[10] = {name = "Savant of Tibia", points = 56},
		[11] = {name = "Enlightened of Tibia", points = 70},
	},
	bonus = {
		{minPoints = 1, percentage = 12.5, skill = 1},
		{minPoints = 3, percentage = 25, skill = 2},
		{minPoints = 6, percentage = 37.5, skill = 3},
		{minPoints = 9, percentage = 50, skill = 4},
		{minPoints = 15, percentage = 62.5, skill = 5},
		{minPoints = 21, percentage = 75, skill = 6},
		{minPoints = 30, percentage = 87.5, skill = 7},
		{minPoints = 42, percentage = 100, skill = 8},
		{minPoints = 56, percentage = 112.5, skill = 9},
		{minPoints = 70, percentage = 125, skill = 10},
	},
	messageTemplate = "Due to your loyalty to " .. SERVER_NAME .. " you currently benefit from a ${skillLoyalt} skill bonus on all of your skills. (You have ${loyaltyPoints} loyalty points)"
}

function Player.initializeLoyaltySystem(self)
	if not loyaltySystem.enable then
		return true
	end

	-- Title
	local title = ""
	for _, titleTable in ipairs(loyaltySystem.titles) do
		if (self:getLoyaltyPoints() > titleTable.points) then
			title = titleTable.name
		end
	end
	self:setLoyaltyTitle(title)

	-- Bonus
	local bonusPercentage = 0
	local skillLoyalt = 0
	for _, bonusTable in ipairs(loyaltySystem.bonus) do
		if self:getLoyaltyPoints() >= bonusTable.minPoints then
			bonusPercentage = bonusTable.percentage
			skillLoyalt = bonusTable.skill
		end
	end

	self:setLoyaltyBonus(skillLoyalt)

	if self:getLoyaltyBonus() ~= 0 then
		self:sendTextMessage(MESSAGE_STATUS, string.formatNamed(loyaltySystem.messageTemplate, { bonusPercentage = self:getLoyaltyBonus(), loyaltyPoints = self:getLoyaltyPoints(), skillLoyalt = skillLoyalt}))
	end

	return true
end