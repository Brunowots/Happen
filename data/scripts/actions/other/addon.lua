local outfits = {
    ["revenant"] = {1323, 1322}
}

local storage = 32943

local addonDollCoin = Action()
function addonDollCoin.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if player:getStorageValue(storage) > 0 then
        player:sendCancelMessage("Você já tem o addon 1 do revenant.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    for a, b in pairs(outfits) do
        player:addOutfitAddon(b[1], 1)
    end
    
	player:addOutfitAddon(1323, 0)
	player:addOutfitAddon(1322, 1)
    player:sendCancelMessage("Você recebeu o primeiro addon revenant.")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	player:setStorageValue(storage, 1)
	item:remove(1)
    return true
end

addonDollCoin:id(34076)
addonDollCoin:register()

local outfits = {
    ["revenant"] = {1323, 1322}
}

local storage = 32944

local addonDollCoin = Action()
function addonDollCoin.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if player:getStorageValue(storage) > 0 then
        player:sendCancelMessage("Você já tem todo o addon do revenant.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    for a, b in pairs(outfits) do
        player:addOutfitAddon(b[2], 2)
    end
    
	player:addOutfitAddon(1323, 0)
	player:addOutfitAddon(1322, 1)
    player:sendCancelMessage("Você recebeu o segundo addon revenant.")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	player:setStorageValue(storage, 1)
	item:remove(1)
    return true
end

addonDollCoin:id(34075)
addonDollCoin:register()

local outfits = {
    ["rascoohan"] = {1372, 1371}
}

local storage = 32945

local addonDollCoin = Action()
function addonDollCoin.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if player:getStorageValue(storage) > 0 then
        player:sendCancelMessage("Você já tem todo o addon do Rascoohan.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    for a, b in pairs(outfits) do
        player:addOutfitAddon(b[1], 1)
    end
    
	player:addOutfitAddon(1372, 0)
	player:addOutfitAddon(1371, 1)
    player:sendCancelMessage("Você recebeu o primeiro addon Rascoohan.")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	player:setStorageValue(storage, 1)
	item:remove(1)
    return true
end

addonDollCoin:id(35595)
addonDollCoin:register()

local outfits = {
    ["rascoohan"] = {1372, 1371}
}

local storage = 32946

local addonDollCoin = Action()
function addonDollCoin.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if player:getStorageValue(storage) > 0 then
        player:sendCancelMessage("Você já tem todo o addon do Rascoohan.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    for a, b in pairs(outfits) do
        player:addOutfitAddon(b[2], 2)
    end
    
	player:addOutfitAddon(1372, 0)
	player:addOutfitAddon(1371, 1)
    player:sendCancelMessage("Você recebeu o segundo addon Rascoohan.")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	player:setStorageValue(storage, 1)
	item:remove(1)
    return true
end

addonDollCoin:id(35695)
addonDollCoin:register()