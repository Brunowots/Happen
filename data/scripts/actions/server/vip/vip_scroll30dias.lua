local config = {
	storageTimeVip = 3265987, -- Storage para tempo da quest
	TempoVipHoras = 2592000 -- 1 hora = 3600 | 30 dias 2592000
}

local premiumScrollVip = Action()
function premiumScrollVip.onUse(player, item, fromPosition, target, toPosition, isHotkey)


		if player:getStorageValue(config.storageTimeVip) > os.time() then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Atualmente voc? j? tem vip, use !vip para ver o tempo restante.")
			player:getPosition():sendMagicEffect(3)
		else
			item:remove(1) 
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			player:setStorageValue(config.storageTimeVip, os.time() + config.TempoVipHoras)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc? recebeu 30 dias de vip\nuse !vip para ver o tempo restante.\n Relogue seu personagem para beneficios")
			player:setStorageValue(3265988, 1)
			
			-- Adicionando Roupa VIP
			local roupas = {
				-- ( Male | Female)
				-- Herder 
				1279, 1280,
				-- Winter 
				853, 852,
				-- Death Herald
				666, 667
			}

			for i = 1, #roupas do
				player:addOutfit(roupas[i])
				player:addOutfitAddon(roupas[i], 3)
			end
			
			-- Adicionando Mounts VIP
			local mounts = {
				-- ( Male | Female)
				-- Horse 
				23,
				-- Red Manta 
				33,
				-- Steelbeak
				34
			}

			for i = 1, #mounts do
				player:addMount(mounts[i])
			end
			
			
		end

	return true
end

premiumScrollVip:id(14758)
premiumScrollVip:register()