AlavancaBosses = {
		GoshnarsHatred = GoshnarHatredTimer,
		GoshnarsMalice = GoshnarsMaliceTimer,
		GoshnarsSpite = GoshnarsSpiteTimer,
		GoshnarsCruelty = GoshnarsCrueltyTimer,
		GoshnarsGreed = GoshnarsGreedTimer,
		GoshnarsMegalomania = GoshnarsMegalomaniaTimer
}

local storagesBoss = {GoshnarHatredTimer, GoshnarsMaliceTimer, GoshnarsSpiteTimer, GoshnarsCrueltyTimer, GoshnarsGreedTimer, GoshnarsMegalomaniaTimer, Storage.GraveDanger.CobraBastion.ScarlettTimer, Storage.Kilmaresh.UrmahlulluTimer, Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer}

local bossNam = {"Goshnars Hatred", "Goshnars Malice", "Goshnars Spite", "Goshnars Cruelty", "Goshnars Greed", "Goshnars Megalomania", "Scarlett Etzel", "Urmahlullu", "Oberon", "Drume", "Lady Tenebris", "Lloyd", "Mounted Thorn Knight", "Dragonking Zyrtarch", "Melting Frozen Horror", "The Time Guardian", "The Last Lore Keeper", "King Zelos"}

function acceptedBossCdModalWindow(player, id)
	local title = "Boss Eye"
	local customMessage = "Você escolheu reduzir o CD do boss "..bossNam[id]..".\nAtualmente, ficaria sem CD em:\n" .. os.date('%d/%m/%Y - %H:%M:%S', player:getStorageValue(storagesBoss[id])) ..", será reduzido 5 horas.\nFicará: " .. os.date('%d/%m/%Y - %H:%M:%S', (player:getStorageValue(storagesBoss[id])-18000)) .."\n\nVocê confirma?"
	local window = ModalWindow{
		title = title,
		message = customMessage
	}
	local function confirm2Callback(player, button, choice)
		finalBossCdModalWindow(player)
		player:setStorageValue(storagesBoss[player:getStorageValue(958547)], (player:getStorageValue(storagesBoss[player:getStorageValue(958547)]) - 18000))
	end
	player:setStorageValue(958547, id)
	player:getPosition():sendMagicEffect(CONST_ME_TREASURE_MAP)
	window:addButton("Confirm", confirm2Callback)
	window:addButton("Back", function() player:sendBossWindow(player) end)
	window:sendToPlayer(player)
end

function errorBossCdModalWindow(player)
	local title = "Boss Eye"
	local customMessage = "Você não está com CD ativo para este boss, vá mata-lo."
	local window = ModalWindow{
		title = title,
		message = customMessage
	}
	window:addButton("Back", function() player:sendBossWindow(player) end)
	window:sendToPlayer(player)
end

function finalBossCdModalWindow(player, id)
	local title = "Boss Eye"
	local customMessage = "Tempo reduzido com sucesso!"
	local window = ModalWindow{
		title = title,
		message = customMessage
	}
	window:addButton("Back", function() player:sendBossWindow(player) end)
	window:sendToPlayer(player)
end

function Player:sendBossWindow(bosseye)

-- Modal window design
	local window = ModalWindow {
		title = bosseye.mainTitle, -- Title of the modal window
		message = bosseye.mainMsg, -- The message to be displayed on the modal window
	}

	local function confirmCallback(player, button, choice)
		local id = choice.id
		if string.find(choice.text, 'ON') then
			errorBossCdModalWindow(player)
			return true
		else
			acceptedBossCdModalWindow(player, id)
		end
	end

	-- Add buttons to the window (Note: if you change the names of these you must change the functions in the modal window functionallity!)
	window:addButton("-5 horas", confirmCallback)
	window:addButton("Cancel")

	-- Set what button is pressed when the player presses enter or escape
	window:setDefaultEscapeButton("Cancel")
	
	for i = 1, #storagesBoss do
		if self:getStorageValue(storagesBoss[i]) > os.time() then
			window:addChoice(""..bossNam[i].." [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(storagesBoss[i])) .."]")
		else
			window:addChoice(""..bossNam[i].." [ON]")
		end
	end
	-- Send the window to player
	window:sendToPlayer(self)
end