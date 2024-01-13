function errorMwColorModalWindow(player)
	local title = "Magic Walls"
	local completedMessage = "Você não tem essa Cor Disponível."
	local window = ModalWindow{
		title = title,
		message = completedMessage
	}
	player:getPosition():sendMagicEffect(CONST_ME_STUN)
	window:addButton("Exit")
	window:addButton("Back", function() sendMwColorModalWindow(player) end)
	window:sendToPlayer(player)
end

function sucessMwColorModalWindow(player, wall)
	local textN = "Normal"
	local title = "Magic Walls"
	local customMessage = "Você escolheu: "..wall.."."
	local window = ModalWindow{
		title = title,
		message = customMessage
	}
	window:addButton("Exit")
	window:addButton("Back", function() sendMwColorModalWindow(player) end)
	window:sendToPlayer(player)
end

function sendMwColorModalWindow(player)
	local title = "Magic Walls"
	local taskButtonMessage = "Selecione uma entre as Magic Walls abaixo:"
	local window = ModalWindow{
		title = title,
		message = taskButtonMessage
	}
	local options = {}

	for i = 1, #storagesRunesMwColor do
		if storagesRunesMwColor[i] == 0 then
			window:addChoice("Normal")
		elseif player:getStorageValue(storagesRunesMwColor[i]) == 1 then
			window:addChoice(""..ItemType(wallsMwColor[i]):getName().."")
			table.insert(options, ItemType(wallsMwColor[i]):getId())
		end
	end
	local function confirmCallback(player, button, choice)
		local id = choice.id
		a = 0
		for k = 1, #storagesRunesMwColor do
			if wallsMwColor[k] == options[id] then
				a = k
			end
		end
		local teste = "Normal"
		if choice.text ~= "Normal" then
			player:setStorageValue(Storage.MagicWallColor, a)
		else
			player:setStorageValue(Storage.MagicWallColor, 0)
		end
		local messagees = ItemType(wallsMwColor[a]):getName() ~= "" and ItemType(wallsMwColor[a]):getName() or teste
		sucessMwColorModalWindow(player, messagees)
	end
	window:addButton("Exit")
	window:addButton("Choose", confirmCallback)
	window:setDefaultEscapeButton("Exit")
	window:sendToPlayer(player)
end

local mwcor = TalkAction("!mwcolor")

function mwcor.onSay(player, words, param)	
	sendMwColorModalWindow(player)
	return false
end

mwcor:register()
