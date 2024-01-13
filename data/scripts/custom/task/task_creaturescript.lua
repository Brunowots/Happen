local taskCreature = CreatureEvent("TaskCreature")

function taskCreature.onKill(player, target)
	if target:isPlayer() or target:getMaster() then
		return true
	end
	local targetName, startedTasks, taskId = target:getName():lower(), player:getCustomStartedTasks()
	for i = 1, #startedTasks do
		taskId = startedTasks[i]
		if taskConfiguration[taskId].creatures then
			if isInArray(taskConfiguration[taskId].creatures, targetName) then
				player:addTaskKill(taskConfiguration[taskId].storage, 1)
			end
		else
			local data = getTaskByMonsterName(targetName)
			if data ~= false and player:hasStartedTask(data.storage) then
				player:addTaskKill(data.storage, 1)
			end
		end
	end
	return true
end

taskCreature:register()