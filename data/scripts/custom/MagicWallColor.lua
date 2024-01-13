local MagicWallColor = Action()
function MagicWallColor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for i = 1, #runesMwColor do
		if item:getId() == runesMwColor[i] then
			if player:getStorageValue(storagesRunesMwColor[i]) ~= 1 then
				player:setStorageValue(Storage.MagicWallColor, i)
				player:setStorageValue(storagesRunesMwColor[i], 1)
				player:sendTextMessage(MESSAGE_STATUS, "Você mudou a cor da sua Magic Wall, agora é "..ItemType(wallsMwColor[i]):getName().."")
				item:remove()
			else
				player:sendTextMessage(MESSAGE_STATUS, "Você já tem esta cor, use !mwcolor e selecione ela.")
			end
		end
	end
	return true
end
MagicWallColor:id(44078, 44079, 44080, 44081, 44082, 44083, 44084)
MagicWallColor:register()
