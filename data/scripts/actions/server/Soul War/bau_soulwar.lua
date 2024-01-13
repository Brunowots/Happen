local BauSoulWar = Action()

local outfits = {
    ["revenant"] = {1323, 1322}
}

function BauSoulWar.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
	
	if player:getStorageValue(331807) <= 0 then
		player:setStorageValue(331807, 1)
		player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabéns! Você recebeu um item e o Outfit Revenant do baú Soul War.")
		
		for outfitName, addons in pairs(outfits) do
	        player:addOutfitAddon(addons[1], 0)
	        player:addOutfitAddon(addons[2], 1)
	        player:addOutfit(outfitName)
	    end
		
		local Premio = {34096, 34083, 34086, 34090, 34094, 34089, 34095, 34093, 34097, 34098, 34082, 34084, 34092, 34088, 34099, 34085, 34091, 34087} -- Mude os itens aqui
		local randomChance = math.random(1, #Premio)
		player:addItem(Premio[randomChance], 1)
		
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O baú está vazio.")
	end

    return true
end

BauSoulWar:aid(15321)
BauSoulWar:register()