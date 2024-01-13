local function onMovementRemoveProtection(cid, oldPos, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPos = player:getPosition()
	if (playerPos.x ~= oldPos.x or playerPos.y ~= oldPos.y or playerPos.z ~= oldPos.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPos, time - 1)
end

local function protectionZoneCheck(playerName)
    doRemoveCreature(playerName)
    return true
end

local playerLogin = CreatureEvent("PlayerLogin")

function playerLogin.onLogin(player)
	local guild = player:getGuild()
	if guild then
		if player:getLevel() >= CONFIG_GUILD_LEVEL.minLevelToGetPoints then
			player:registerEvent('GuildLevelK')
  		end
  		player:registerEvent('guildLevel_e')
	end	
	player:loadVipData()
	player:updateVipTime()
	player:addAddonMount()

	local days = player:getVipDays()
	if days == 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'Você não tem nenhum dia vip.')
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('You have %s vip day%s left.', (days == 0xFFFF and 'infinite amount of' or days), (days == 1 and '' or 's')))
	end
	if player:getLastLoginSaved() == 0 then
		player:sendOutfitWindow()
		db.query('UPDATE `players` SET `istutorial` = 0 where `id`='..player:getGuid())
		-- Open channels
		if table.contains({TOWNS_LIST.DAWNPORT, TOWNS_LIST.DAWNPORT_TUTORIAL}, player:getTown():getId())then
			player:openChannel(3) -- World chat
		else
			player:openChannel(3) -- World chat
			player:openChannel(5) -- Advertsing main
		end
	else
		player:sendTextMessage(MESSAGE_LOGIN, string.format("Your last visit in ".. SERVER_NAME ..": %s.", os.date("%d. %b %Y %X", player:getLastLoginSaved())))
	end
	
	if days == 0 and player:getStorageValue(123457) ~= 1 then
		player:onRemoveVip()
		player:setStorageValue(123457, 1)
	elseif days > 0 and player:getStorageValue(123457) == 1 then
		player:setStorageValue(123457, 0)		
	end

	-- Reset bosstiary time
	local lastSaveServerTime = GetDailyRewardLastServerSave()
	if lastSaveServerTime >= player:getLastLoginSaved() then
		player:setRemoveBossTime(1)
	end

	if isPremium(player) then
		player:setStorageValue(Storage.PremiumAccount, 1)
	end

	local playerId = player:getId()
	DailyReward.init(playerId)

	player:loadSpecialStorage()

	if player:getGroup():getId() >= GROUP_TYPE_GAMEMASTER then
		player:setGhostMode(true)
	end

	-- Boosted creature
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Today's boosted creature: " .. Game.getBoostedCreature() .. " \
	Boosted creatures yield more experience points, carry more loot than usual and respawn at a faster rate.")

	-- Boosted boss
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Today's boosted boss: " .. Game.getBoostedBoss() .. " \
	Boosted bosses contain more loot and count more kills for your Bosstiary.")

if player:getClient().version > 1200 then
	addEvent(function()
	player:sendTextMessage(MESSAGE_LOOT, ("Bem-vindos ao %s 13.17! O servidor com mais diversão e qualidade no mundo dos otservs!"):format("{3043|HappenOT}"))
	end, 100)
	else
    player:sendTextMessage(MESSAGE_LOOT, ("Bem-vindos ao HappenOT 13.17! O servidor com mais diversão e qualidade no mundo dos otservs!"))
end
	if SCHEDULE_EXP_RATE ~= 100 then
		if SCHEDULE_EXP_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Exp Rate Event! Monsters yield more experience points than usual \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Exp Rate Decreased! Monsters yield less experience points than usual.")
		end
	end

	if SCHEDULE_SPAWN_RATE ~= 100 then
		if SCHEDULE_SPAWN_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Spawn Rate Event! Monsters respawn at a faster rate \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Spawn Rate Decreased! Monsters respawn at a slower rate.")
		end
	end

	if SCHEDULE_LOOT_RATE ~= 100 then
		if SCHEDULE_LOOT_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Loot Rate Event! Monsters carry more loot than usual \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Loot Rate Decreased! Monsters carry less loot than usual.")
		end
	end

	if SCHEDULE_SKILL_RATE ~= 100 then
		if SCHEDULE_SKILL_RATE > 100 then
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Skill Rate Event! Your skills progresses at a higher rate \
			Happy Hunting!")
		else
			player:sendTextMessage(MESSAGE_BOOSTED_CREATURE, "Skill Rate Decreased! Your skills progresses at a lower rate.")
		end
	end
	
	-- Loyalty system
	player:initializeLoyaltySystem()

	-- Stamina
	nextUseStaminaTime[playerId] = 1

	-- EXP Stamina
	nextUseXpStamina[playerId] = 1

	if (player:getAccountType() == ACCOUNT_TYPE_TUTOR) then
	local msg = [[:: Tutor Rules
		1 *> 3 Warnings you lose the job.
		2 *> Without parallel conversations with players in Help, if the player starts offending, you simply mute it.
		3 *> Be educated with the players in Help and especially in the Private, try to help as much as possible.
		4 *> Always be on time, if you do not have a justification you will be removed from the staff.
		5 *> Help is only allowed to ask questions related to tibia.
		6 *> It is not allowed to divulge time up or to help in quest.
		7 *> You are not allowed to sell items in the Help.
		8 *> If the player encounters a bug, ask to go to the website to send a ticket and explain in detail.
		9 *> Always keep the Tutors Chat open. (required).
		10 *> You have finished your schedule, you have no tutor online, you communicate with some CM in-game
		or ts and stay in the help until someone logs in, if you can.
		11 *> Always keep a good Portuguese in the Help, we want tutors who support, not that they speak a satanic ritual.
		12 *> If you see a tutor doing something that violates the rules, take a print and send it to your superiors. "
		- Commands -
		Mute Player: /mute nick, 90 (90 seconds)
		Unmute Player: /unmute nick.
		- Commands -]]
		player:popupFYI(msg)
	end

	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %d %s in your reward chest.",
		rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	if player:getStorageValue(Storage.combatProtectionStorage) < 1 then
		player:setStorageValue(Storage.combatProtectionStorage, 1)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end
	
	-- Wheel of destiny
	if (WheelOfDestinySystem ~= nil) then
		WheelOfDestinySystem.initializePlayerData(player) -- check folder libs have correclty
	else
		print("[login.onLogin::WheelOfDestinySystem]", "Lib not installed, ignoring player initialization")
	end

	-- Set Client XP Gain Rate --
	if configManager.getBoolean(configKeys.XP_DISPLAY_MODE) then
		local baseRate = player:getFinalBaseRateExperience()
		player:setBaseXpGain(baseRate * 100)
	end

	local staminaMinutes = player:getStamina()
	local staminaBonus = (staminaMinutes > 2340) and 150 or ((staminaMinutes < 840) and 50 or 100)

	player:setStaminaXpBoost(staminaBonus)

	if onExerciseTraining[player:getId()] then -- onLogin & onLogout
		stopEvent(onExerciseTraining[player:getId()].event)
		onExerciseTraining[player:getId()] = nil
		player:setTraining(false)
	end
	return true
end
playerLogin:register()
