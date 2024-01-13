DROME_POTIONS = {
	POTIONS_IDS = {},
	Storage = {
		KooldownAid = 36723,
		StrikeEnhancement = 36724,
		WealthDuplex = 36727,
		BestiaryBetterment = 36728,
		CharmUpgrade = 36726,
		FireResilience = 36729,
		IceResilience = 36730,
		EarthResilience = 36731,
		EnergyResilience = 36732,
		HolyResilience = 36733,
		DeathResilience = 36734,
		PhyicalResilience = 36735,
		FireAmplification = 36736,
		IceAmplification = 36737,
		EarthAmplification = 36738,
		EnergyAmplification = 36739,
		HolyAmplification = 36740,
		DeathAmplification = 36741,
		PhyicalAmplification = 36742,
	},
}

local DROME_DAMAGE_STORAGE = {
	RESILIENCE = {
		[COMBAT_FIREDAMAGE] = DROME_POTIONS.Storage.FireResilience,
		[COMBAT_ICEDAMAGE] = DROME_POTIONS.Storage.IceResilience,
		[COMBAT_EARTHDAMAGE] = DROME_POTIONS.Storage.EarthResilience,
		[COMBAT_ENERGYDAMAGE] = DROME_POTIONS.Storage.EnergyResilience,
		[COMBAT_HOLYDAMAGE] = DROME_POTIONS.Storage.HolyResilience,
		[COMBAT_DEATHDAMAGE] = DROME_POTIONS.Storage.DeathResilience,
		[COMBAT_PHYSICALDAMAGE] = DROME_POTIONS.Storage.PhyicalResilience,
	},
	AMPLIFICATION = {
		[COMBAT_FIREDAMAGE] = DROME_POTIONS.Storage.FireAmplification,
		[COMBAT_ICEDAMAGE] = DROME_POTIONS.Storage.IceAmplification,
		[COMBAT_EARTHDAMAGE] = DROME_POTIONS.Storage.EarthAmplification,
		[COMBAT_ENERGYDAMAGE] = DROME_POTIONS.Storage.EnergyAmplification,
		[COMBAT_HOLYDAMAGE] = DROME_POTIONS.Storage.HolyAmplification,
		[COMBAT_DEATHDAMAGE] = DROME_POTIONS.Storage.DeathAmplification,
		[COMBAT_PHYSICALDAMAGE] = DROME_POTIONS.Storage.PhyicalAmplification,
	},
}

local DROME_DAMAGE_ITEMS = {
	RESILIENCE = {
		[36729] = COMBAT_FIREDAMAGE,
		[36730] = COMBAT_ICEDAMAGE,
		[36731] = COMBAT_EARTHDAMAGE,
		[36732] = COMBAT_ENERGYDAMAGE,
		[36733] = COMBAT_HOLYDAMAGE,
		[36734] = COMBAT_DEATHDAMAGE,
		[36735] = COMBAT_PHYSICALDAMAGE,
	},
	AMPLIFICATION = {
		[36736] = COMBAT_FIREDAMAGE,
		[36737] = COMBAT_ICEDAMAGE,
		[36738] = COMBAT_EARTHDAMAGE,
		[36739] = COMBAT_ENERGYDAMAGE,
		[36740] = COMBAT_HOLYDAMAGE,
		[36741] = COMBAT_DEATHDAMAGE,
		[36742] = COMBAT_PHYSICALDAMAGE,
	},
}

for i = 36723, 36742 do -- no register the id 41558, search "41558" on the server files
	table.insert(DROME_POTIONS.POTIONS_IDS, i)
end

DROME_POTIONS.parseUseAmplificationPotion = function(player, item)
	local combatType = DROME_DAMAGE_ITEMS.AMPLIFICATION[item:getId()]
	if not combatType then return false end
	if player:hasAmplification(combatType) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have '.. item:getName() ..' bonuses.')
		return false
	end
	player:setAmplification(combatType)
	local itemName = ItemType(item:getId()):getName()
	local animatedMsg = itemName.." actived (1h)"
	player:say(animatedMsg, TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	item:remove(1)
end

function Player.hasAmplification(self, combatType)
	if not self or not combatType then return false end
	local storage = DROME_DAMAGE_STORAGE.AMPLIFICATION[combatType]
	if not storage then return false end
	if self:getStorageValue(storage) > os.time() then
		return true
	end
	return false
end

function Player.setAmplification(self, combatType)
	if not self or not combatType then return false end
	local storage = DROME_DAMAGE_STORAGE.AMPLIFICATION[combatType]
	self:setStorageValue(storage, os.time() + 3600)
	return true
end

DROME_POTIONS.parseUseResiliencePotion = function(player, item)
	local combatType = DROME_DAMAGE_ITEMS.RESILIENCE[item:getId()]
	if not combatType then return false end
	if player:hasResilience(combatType) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have '.. item:getName() ..' bonuses.')
		return false
	end
	player:setResilience(combatType)
	local itemName = ItemType(item:getId()):getName()
	local animatedMsg = itemName.." actived (1h)"
	player:say(animatedMsg, TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	item:remove(1)
end

function reduceEightPercent(value)
	return (value > 0) and math.floor(value * 0.92) or 0
end

function increaseEightPercent(value)
	return (value > 0) and math.floor(value * 1.08) or 0
end

function Player.setResilience(self, combatType)
	if not self or not combatType then return false end
	local storage = DROME_DAMAGE_STORAGE.RESILIENCE[combatType]
	self:setStorageValue(storage, os.time() + 3600)
	return true
end

function Player.hasResilience(self, combatType)
	if not self or not combatType then return false end
	local storage = DROME_DAMAGE_STORAGE.RESILIENCE[combatType]
	if not storage then return false end
	if self:getStorageValue(storage) > os.time() then
		return true
	end
	return false
end

DROME_POTIONS.BestiaryBetterment = function(player, item)
	if player:hasBestiaryBettermentBonus() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have Bestiary Betterment bonuses.')
		return false
	end
	player:setStorageValue(DROME_POTIONS.Storage.BestiaryBetterment, os.time() + 3600)
	item:remove(1)
end

DROME_POTIONS.WealthDuplex = function(player, item)
	if player:hasWealthDuplexBonus() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have Wealth Duplex bonuses.')
		return false
	end
	player:setStorageValue(DROME_POTIONS.Storage.WealthDuplex, os.time() + 3600)
	item:remove(1)
	return true
end

DROME_POTIONS.CharmUpgrade = function(player, item)
	if player:hasCharmUpgradeBonus() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have Charm Upgrade bonuses.')
		return false
	end
	player:setStorageValue(DROME_POTIONS.Storage.CharmUpgrade, os.time() + 3600)
	item:remove(1)
	addEvent(checkDromeCharmUpgradeBonus, 3600000, player:getId())
	return true
end

DROME_POTIONS.StaminaExtension = function(player, item)
	if player:getStamina() < 2520 then
		local newStamina = ((player:getStamina() + 60) > 2520) and 2520 or player:getStamina() + 60
		player:setStamina(newStamina)
		item:remove(1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have a full stamina.')
	end
	return true
end

DROME_POTIONS.KooldownAid = function(player, item)
	if player:exaustedKooldownAid() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need to wait 60 seconds to use this again.')
		return false
	end
	player:resetSpellsCooldown()
	player:setStorageValue(DROME_POTIONS.Storage.KooldownAid, os.time() + 60)
	item:remove(1)
	return true
end

DROME_POTIONS.StrikeEnhancement = function(player, item)
	if player:hasStrikeEnhancement() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You already have Strike Enhancement bonuses.')
		return false
	end
	
	local strikeEnhancement = Condition(CONDITION_ATTRIBUTES)
	strikeEnhancement:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
	strikeEnhancement:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, 5)
	player:addCondition(strikeEnhancement)
	item:remove(1)
	player:setStorageValue(DROME_POTIONS.Storage.StrikeEnhancement, os.time() + 60 * 60)
	return true
end

local function doDromePotionUseAnimation(player, item)
	if not player or not item then return false end
	local itemName = ItemType(item:getId()):getName()
	local animatedMsg = itemName.." actived (1h)"
	player:say(animatedMsg, TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	return true
end

DROME_POTIONS.parseFunctions = function(player, item)
	if item:getId() == 36723 then return DROME_POTIONS.KooldownAid(player, item) end -- not actived?
	if item:getId() == 36724 then return DROME_POTIONS.StrikeEnhancement(player, item) end
	if item:getId() == 36725 then return DROME_POTIONS.StaminaExtension(player, item) end
	if item:getId() == 36726 then return DROME_POTIONS.CharmUpgrade(player, item) end
	if item:getId() == 36727 then return DROME_POTIONS.WealthDuplex(player, item) end
	if item:getId() == 36728 then return DROME_POTIONS.BestiaryBetterment(player, item) end
	if item:getId() >= 36729 and item:getId() <= 36735 then
		DROME_POTIONS.parseUseResiliencePotion(player, item)
	end
	if item:getId() >= 36736 and item:getId() <= 36742 then
		DROME_POTIONS.parseUseAmplificationPotion(player, item)
	end
end

DROME_POTIONS.parseUseAction = function(player, item)
	if DROME_POTIONS.parseFunctions(player, item) then
		doDromePotionUseAnimation(player, item)
		return true
	end
	return false
end

function Player.hasStrikeEnhancement(self)
	if not self then return false end
	if self:getStorageValue(DROME_POTIONS.Storage.StrikeEnhancement) > os.time() then
		return true
	end
	return false
end

function Player.exaustedKooldownAid(self)
	if not self then return false end
	if self:getStorageValue(DROME_POTIONS.Storage.KooldownAid) > os.time() then
		return true
	end
	return false
end

function Player.hasWealthDuplexBonus(self)
	if not self then return false end
	if self:getStorageValue(DROME_POTIONS.Storage.WealthDuplex) > os.time() then
		return true
	end
	return false
end

function Player.hasBestiaryBettermentBonus(self)
	if not self then return false end
	if self:getStorageValue(DROME_POTIONS.Storage.BestiaryBetterment) > os.time() then
		return true
	end
	return false
end

function Player.hasCharmUpgradeBonus(self)
	if not self then return false end
	if self:getStorageValue(DROME_POTIONS.Storage.CharmUpgrade) > os.time() then
		return true
	end
	return false
end

function Player.getCharmUpgradeBonusTimeLeft(self)
	if not self then return false end
	local timeStamp = self:getStorageValue(DROME_POTIONS.Storage.CharmUpgrade)
	if timeStamp <= os.time() then
		return 0
	end
	return timeStamp - os.time()
end

function checkDromeCharmUpgradeBonus(playerId)
	local player = Player(playerId)
	if not player then
		return
	end
	if not player:hasCharmUpgradeBonus() then
		player:setDromeCharmUpgrade(false)
		return
	end
	if player:hasCharmUpgradeBonus() then
		player:setDromeCharmUpgrade(true)
	end
	local secondsLeft = player:getCharmUpgradeBonusTimeLeft()
	addEvent(checkDromeCharmUpgradeBonus, secondsLeft * 1000, playerId)
end