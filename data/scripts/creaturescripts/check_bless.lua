local checkBless = CreatureEvent("checkBless")
function checkBless.onThink(creature)
    local player = creature:getPlayer()
	if player then
		if not (getTileInfo(player:getPosition()).protection) and player:getStorageValue(451278) ~= 1 then
			for i = 2, 6 do
				if not player:hasBlessing(i) then
					player:sendTextMessage(MESSAGE_STATUS_WARNING, "Atenção! você está deixando a zona segura sem todas as BÊNÇÃOS.")
					player:setStorageValue(451278, 1)
					return false
				end
   		 	end
  		elseif (getTileInfo(player:getPosition()).protection) and player:getStorageValue(451278) == 1 then
			player:setStorageValue(451278, 0)
		end
	end
return true
end

checkBless:register()