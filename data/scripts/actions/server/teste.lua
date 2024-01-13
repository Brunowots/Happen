local items = {43870, 43879, 43866, 43885, 43868, 43877, 43874, 43872, 43882}
local itemsTransform = {43871, 43880, 43867, 43886, 43869, 43878, 43875, 43873, 43883}

local teste = Action()

function teste.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local a = 0
	for i = 1, #items do
		if player:getItemById(items[i], true) then
			a = a + player:getItemCount(items[i])
		end
	end

	if item:getId() == 31245 then
		if player:getStorageValue(45680) ~= 0 then
			player:setStorageValue(45680, os.time() + 86400)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Voc� clicou na pedra de evolu��o, agora voc� so podera clica na pedra novamente ap�s 24hrs.")
		else
			player:sendCancelMessage("Voc� j� clicou na pedra da evolu��o. Volte ap�s 24 horas para poder clica novamente.")
		end
	end

	if a == 1 then
		for k = 1, #items do
			if player:removeItem(items[k], 1) then
				player:addItem(itemsTransform[k], 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
				player:setStorageValue(45678, 0)
			end
		end
	elseif a > 1 then
		player:sendCancelMessage("Voc� tem mais de 1 item dispon�vel para troca, volte pro Templo e pegue o atalho no Destiny para voltar aqui depois de 24hrs com s� 1 item na backpack, lembrando o atalho s� estar� dispon�vel para voc� durante 48hrs.")
		player:setStorageValue(45678, 1)
	else
		player:sendCancelMessage("Voc� n�o tem nenhum sanguine item dispon�vel ou voc� ja clicou na pedra da evolu��o, volte ap�s 24hrs para clica novamente, pegue o atalho no Teleporte Destiny.")
	end

	return true
end

teste:aid(31245)
teste:register()