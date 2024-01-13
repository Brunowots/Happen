local config = {
	['dragon lord'] = {task = 1, storage_count = 31542, count = 1000},
	['behemoth'] = {task = 4, storage_count = 31543, count = 1000},
	['demon'] = {task = 7, storage_count = 31544, count = 1000}
}
local countkill= CreatureEvent("countkill")
function countkill.onKill(creature, target)
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end

	local bossConfig = config[targetMonster:getName():lower()]
	if not bossConfig then
        	return true
	end

	for pid, _ in pairs(targetMonster:getDamageMap()) do
		local attackerPlayer = Player(pid)
		if attackerPlayer and attackerPlayer:getStorageValue(Storage.Vip1Quest.Questline) == bossConfig.task then
			attackerPlayer:setStorageValue(bossConfig.storage_count, (attackerPlayer:getStorageValue(bossConfig.storage_count) + 1))

			if (attackerPlayer:getStorageValue(bossConfig.storage_count) + 1) > bossConfig.count then
				attackerPlayer:setStorageValue(Storage.Vip1Quest.Questline, (attackerPlayer:getStorageValue(Storage.Vip1Quest.Questline) + 1))
			end
        	end
    	end
end

countkill:register()