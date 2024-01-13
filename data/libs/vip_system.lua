local config = {
	useTeleport = false,
	expirationPosition = Position(32369, 32241, 7),
	useMessage = true,
	expirationMessage = 'Your vip days ran out.',
	expirationMessageType = MESSAGE_STATUS_WARNING,
	removeAddonsAndMounts = true
}

if not VipData then
	VipData = { }
end

function Player.onRemoveVip(self)

	if config.useTeleport then
		self:teleportTo(config.expirationPosition)
		self:setDirection(SOUTH)
		config.expirationPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end

	if config.useMessage then
		self:sendTextMessage(config.expirationMessageType, config.expirationMessage)
	end

	if config.removeAddonsAndMounts then
		local outfitsToDelete = {1444, 667, 1619}
		for i = 1, #outfitsToDelete do
			self:removeOutfit(outfitsToDelete[i])
		end

		local mountsToDelete = {850, 631, 950}
		for i = 1, #mountsToDelete do
			self:removeMount(mountsToDelete[i])
		end
	end

	local currentSex = self:getSex()
	local playerOutfit = self:getOutfit()

	playerOutfit.lookAddons = 0
	if currentSex == PLAYERSEX_FEMALE then
		playerOutfit.lookType = 136
	else
		playerOutfit.lookType = 128
	end
	self:setOutfit(playerOutfit)

end

function Player.addAddonMount(self)

	local outfitsToUpgrade = {1444, 667, 1619}
	local mountsToUpgrade = {850, 631, 950}

	if self:getVipDays() > 0 then
		for i = 1, #outfitsToUpgrade do
			local outfit = self:hasOutfit(outfitsToUpgrade[i], 3)
			if outfit == false then
				self:addOutfitAddon(outfitsToUpgrade[i], 3)
			end
		end
		for i = 1, #mountsToUpgrade do
			local outfit = self:hasMount(mountsToUpgrade[i])
			if outfit == false then
				self:addMount(mountsToUpgrade[i])
			end
		end
	end
end

function Player.getVipDays(self)
	return VipData[self:getId()].days
end

function Player.getLastVipDay(self)
	return VipData[self:getId()].lastDay
end

function Player.isVip(self)
	return self:getVipDays() > 0
end

function Player.addInfiniteVip(self)
	local data = VipData[self:getId()]
	data.days = 0xFFFF
	data.lastDay = 0

	db.query(string.format('UPDATE `accounts` SET `vipdays` = %i, `viplastday` = %i WHERE `id` = %i;', 0xFFFF, 0, self:getAccountId()))
end

function Player.addVipDays(self, days)
	local data = VipData[self:getId()]
	if data.days == 0xFFFF or days <= 0 then
		return false
	end

	if data.days == 0 then
		data.lastDay = os.time() + (days * 24 * 60 * 60)
	else
		data.lastDay = data.lastDay + (days * 24 * 60 * 60)
	end
	data.days = data.days + days

	db.query(string.format('UPDATE `accounts` SET `vipdays` = %i, `viplastday` = %i WHERE `id` = %i;', data.days, data.lastDay, self:getAccountId()))

	return true
end

function Player.removeVipDays(self, days)
	local data = VipData[self:getId()]
	if data.days == 0xFFFF or days <= 0 then
		return false
	end

	if (days > data.days) then
		days = data.days
	end
	data.lastDay = data.lastDay - (days * 24 * 60 * 60)
	data.days = data.days - days

	db.query(string.format('UPDATE `accounts` SET `vipdays` = %i, `viplastday` = %i WHERE `id` = %i;', data.days, data.lastDay, self:getAccountId()))

	if data.days == 0 then
		self:onRemoveVip()
	end

	return true
end

function Player.removeVip(self)
	local data = VipData[self:getId()]
	if data.days == 0 then
		return
	end

	data.days = 0
	data.lastDay = 0

	self:onRemoveVip()

	db.query(string.format('UPDATE `accounts` SET `vipdays` = 0, `viplastday` = 0 WHERE `id` = %i;', self:getAccountId()))
end

function Player.addFreeVip(self)
	local resultId = db.storeQuery(string.format('SELECT `freeVip` FROM `accounts` WHERE `id` = %i;', self:getAccountId()))
	if resultId then
		freeVip = result.getDataInt(resultId, 'freeVip')
		if freeVip ~= 1 then
			self:addVipDays(3)
			db.query(string.format('UPDATE `accounts` SET `freeVip` = 1 WHERE `id` = %i;', self:getAccountId()))
		end
	end
	return true
end


function Player.loadVipData(self)
	local resultId = db.storeQuery(string.format('SELECT `vipdays`, `viplastday` FROM `accounts` WHERE `id` = %i;', self:getAccountId()))
	if resultId then
		VipData[self:getId()] = {
			days = result.getDataInt(resultId, 'vipdays'),
			lastDay = result.getDataInt(resultId, 'viplastday')
		}

		result.free(resultId)
		return true
	end

	VipData[self:getId()] = { days = 0, lastDay = 0 }
	return false
end

function Player.updateVipTime(self)
	local save = false

	local data = VipData[self:getId()]
	local days, lastDay = data.days, data.lastDay
	local daysBefore = days
	if days == 0 or days == 0xFFFF then
		if lastDay ~= 0 then
			lastDay = 0
			save = true
		end
	elseif lastDay == 0 then
		days = 0
		lastDay = os.time()
		save = true
	else
		local time = os.time()
		local elapsedDays = math.floor((time - lastDay) / 86400)
		if elapsedDays > 0 then
			if elapsedDays >= days then
				days = 0
				lastDay = 0
			else
				days = days - elapsedDays
				lastDay = time - ((time - lastDay) % 86400)
			end
			save = true
		end
	end

	if save then
		if daysBefore > 0 and days == 0 then
			self:onRemoveVip()
		end
		db.query(string.format('UPDATE `accounts` SET `vipdays` = %i, `viplastday` = %i WHERE `id` = %i;', days, lastDay, self:getAccountId()))
		data.days = days
		data.lastDay = lastDay
	end
end
