local prison = Position(32173, 32259, 7)
local storagePrison = 31230
local storageTime = 31231
local seg = 30

local jail = TalkAction("/prison")

function jail.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local split = param:split(",")
	if not split[2] then
		player:sendCancelMessage("Insufficient parameters.")
		return false
	end

	local target = Player(split[1])
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end
	if target:getPosition() ~= prison then
		target:teleportTo(prison)
	end
	target:setStorageValue(storageTime, (split[2] * 60))
	target:setStorageValue(storagePrison, 1)
	if tonumber(split[2]) > 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce enviou o "..target:getName().." para a prisao por ".. split[2] .." minutos." )
		target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce foi enviado para a prisao pelo "..player:getName().." por ".. split[2] .." minutos." )
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce enviou o "..target:getName().." para a prisao por ".. split[2] .." minuto." )
		target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce foi enviado para a prisao pelo "..player:getName().." por ".. split[2] .." minuto." )
	end
	local exp = target:getExperience() 
	target:removeExperience(exp * 0.15)
	return false
end

jail:separator(" ")
jail:register()

--------------------------------------------------------------

local unjail = TalkAction("/unprison")

function unjail.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	if param == "" then
		player:sendCancelMessage("Command param required.")
		return false
	end

	local target = Player(param)
	if not target then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	local town = target:getTown()
	target:teleportTo(town:getTemplePosition())

	target:setStorageValue(storageTime, 0)
	target:setStorageValue(storagePrison, 0)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce retirou o "..target:getName().." da prisao." )
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce foi retirado da prisao pelo "..player:getName()..". Saia a direita da prisao" )
	
	return false
end

unjail:separator(" ")
unjail:register()

----------------------------------------------

local prison = GlobalEvent("prison")
function prison.onThink(interval)
	for _, player in ipairs(Game.getPlayers()) do
        	if player:getStorageValue(storageTime) > seg then
			player:setStorageValue(storageTime, (player:getStorageValue(storageTime) - seg))
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Faltam "..player:getStorageValue(storageTime).." segundos para sair da prisao." )
		elseif 	((player:getStorageValue(storageTime) - seg) <= 0) and player:getStorageValue(storagePrison) == 1 then
			local town = player:getTown()
			player:teleportTo(town:getTemplePosition())
			player:setStorageValue(storagePrison, 0)
			player:setStorageValue(storageTime, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce cumpriu seu tempo, cuidado para nao entrar novamente na prisao. Agora voce tem acesso a saida a direita da prisao." )
        	end
    	end
    return true
end

prison:interval(seg * 1000) -- 1 hora = 3600 segundos
prison:register()