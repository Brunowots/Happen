math.randomseed(os.time())

dofile(DATA_DIRECTORY .. "/lib/lib.lua")

local startupFile=io.open(DATA_DIRECTORY.. "/startup/startup.lua", "r")
if startupFile ~= nil then
	io.close(startupFile)
	dofile(DATA_DIRECTORY.. "/startup/startup.lua")
end

function IsRunningGlobalDatapack()
	if DATA_DIRECTORY == "data" then
		return true
	else
		return false
	end
end

PARTY_PROTECTION = 0
ADVANCED_SECURE_MODE = 0

NORTH = DIRECTION_NORTH
EAST = DIRECTION_EAST
SOUTH = DIRECTION_SOUTH
WEST = DIRECTION_WEST
SOUTHWEST = DIRECTION_SOUTHWEST
SOUTHEAST = DIRECTION_SOUTHEAST
NORTHWEST = DIRECTION_NORTHWEST
NORTHEAST = DIRECTION_NORTHEAST

STORAGEVALUE_PROMOTION = 30018

SERVER_NAME = configManager.getString(configKeys.SERVER_NAME)
SERVER_MOTD = configManager.getString(configKeys.SERVER_MOTD)

GLOBAL_CHARM_GUT = 0
GLOBAL_CHARM_SCAVENGE = 0

weatherConfig = {
	groundEffect = CONST_ME_LOSEENERGY,
	fallEffect = CONST_ANI_SMALLICE,
	thunderEffect = configManager.getBoolean(configKeys.WEATHER_THUNDER),
	minDMG = 1,
	maxDMG = 5
}

SCHEDULE_LOOT_RATE = 100
SCHEDULE_EXP_RATE = 100
SCHEDULE_SKILL_RATE = 100
SCHEDULE_SPAWN_RATE = 100

PROPOSED_STATUS = 1
MARRIED_STATUS = 2
PROPACCEPT_STATUS = 3
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 3004
ITEM_ENGRAVED_WEDDING_RING = 9585

SCARLETT_MAY_TRANSFORM = 0
SCARLETT_MAY_DIE = 0

ropeSpots = {386, 421, 386, 7762, 12202, 12936, 14238, 17238, 23363, 21965, 21966, 21967, 21968}
specialRopeSpots = { 12935 }

updateInterval = 2
if not GlobalBosses then
	GlobalBosses = {}
end

if healingImpact == nil then
	healingImpact = {}
end

if damageImpact == nil then
	damageImpact = {}
end

if onExerciseTraining == nil then
	onExerciseTraining = {}
end

if nextUseStaminaTime == nil then
	nextUseStaminaTime = {}
end

if nextUseXpStamina == nil then
	nextUseXpStamina = {}
end

if lastItemImbuing == nil then
	lastItemImbuing = {}
end

if not playerDelayPotion then
	playerDelayPotion = {}
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.splitTrimmed = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v:trim()
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

SAVE_INTERVAL_TYPE = configManager.getString(configKeys.SAVE_INTERVAL_TYPE)
SAVE_INTERVAL_CONFIG_TIME = configManager.getNumber(configKeys.SAVE_INTERVAL_TIME)
SAVE_INTERVAL_TIME = 0
if SAVE_INTERVAL_TYPE == "second" then
	SAVE_INTERVAL_TIME = 1000
elseif SAVE_INTERVAL_TYPE == "minute" then
	SAVE_INTERVAL_TIME = 60 * 1000
elseif SAVE_INTERVAL_TYPE == "hour" then
	SAVE_INTERVAL_TIME = 60 * 60 * 1000
end

staminaBonus = {
	target = 'Training Machine',
	period = configManager.getNumber(configKeys.STAMINA_TRAINER_DELAY) * 60 * 1000,
	bonus = configManager.getNumber(configKeys.STAMINA_TRAINER_GAIN),
	eventsTrainer = {},
	eventsPz = {}
}

FAMILIARSNAME = {
	"sorcerer familiar",
	"knight familiar",
	"druid familiar",
	"paladin familiar"
}

function addStamina(playerId, ...)
	if playerId then
		local player = Player(playerId)
		if configManager.getBoolean(configKeys.STAMINA_TRAINER) then
			if not player then
				staminaBonus.eventsTrainer[playerId] = nil
			else
				local target = player:getTarget()
				if not target or target:getName() ~= staminaBonus.target then
					staminaBonus.eventsTrainer[playerId] = nil
				else
					player:setStamina(player:getStamina() + staminaBonus.bonus)
					player:sendTextMessage(MESSAGE_STATUS,
					string.format("%i of stamina has been refilled.", configManager.getNumber(configKeys.STAMINA_TRAINER_GAIN)))
					staminaBonus.eventsTrainer[playerId] = addEvent(addStamina, staminaBonus.period, playerId)
				end
			end
		end
		return not configManager.getBoolean(configKeys.STAMINA_TRAINER)
	end

	local localPlayerId, delay = ...

	if localPlayerId and delay then
		if not staminaBonus.eventsPz[localPlayerId] then return false end
		stopEvent(staminaBonus.eventsPz[localPlayerId])

		local player = Player(localPlayerId)
		if not player then
			staminaBonus.eventsPz[localPlayerId] = nil
			return false
		end

		local actualStamina = player:getStamina()

		if actualStamina > 2400 and actualStamina < 2520 then
			delay = configManager.getNumber(configKeys.STAMINA_GREEN_DELAY) * 60 * 1000
		elseif actualStamina == 2520 then
			player:sendTextMessage(MESSAGE_STATUS, "You are no longer refilling stamina, \z because your stamina is already full.")
			staminaBonus.eventsPz[localPlayerId] = nil
			return false
		end

		player:setStamina(player:getStamina() + configManager.getNumber(configKeys.STAMINA_PZ_GAIN))
		player:sendTextMessage(MESSAGE_STATUS,
            string.format("%i of stamina has been refilled.", configManager.getNumber(configKeys.STAMINA_PZ_GAIN)
            )
        )
		staminaBonus.eventsPz[localPlayerId] = addEvent(addStamina, delay, nil, localPlayerId, delay)
		return true
	end
	return false
end
