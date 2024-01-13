local x1 = 32305
local x2 = 32316
local y1 = 33548
local y2 = 33555
local z = 7
local crateId = 2471
local itemId = 19152
local textPosition = Position(32310, 33551, 7)
local wallPosition = Position(32310, 33557, 7)
local wallId = 43744
local positionEntrada = Position(32310, 33548, 7)

local function createCrate(player)
	if Game.getStorageValue(547842) == 1 then
		Game.setStorageValue(547841, 0)
		return true
	end
	for x = x1, x2 do
		for y = y1, y2 do
			local items1 = Tile(Position(x, y, z)):getItems()
			if items1 then
				for i = 1, #items1 do
					items1[i]:remove()
				end
			end
			Game.createItem(crateId, math.random(2, 4), Position(x, y, z))
		end
	end

	local itemX = math.random(x1, x2)
	local itemY = math.random(y1, y2)
	a = 0
	local items = Tile(Position(itemX, itemY, z)):getItems()

	for i = 1, #items do
		if items[i]:getId() == crateId then
			a = a + 1
		end
	end

	if a > 0 then
		crateToItem = math.random(1, a)
	end

	if items[crateToItem]:isContainer() then
		items[crateToItem]:addItem(itemId, 1)
		-- print("item criado na position "..itemX.." "..itemY.." na ordem "..crateToItem.."")
	end
       	local spectators = Game.getSpectators(textPosition, false, true, 7, 7, 7, 7)
        if #spectators > 0 then
		for i = 1, #spectators do
			spectators[i]:say("Caixas reposicionada.", TALKTYPE_MONSTER_SAY, false, spectators[i], textPosition)
		end
	else
		Game.setStorageValue(547841, 0)
		Game.setStorageValue(547842, 1)
		Game.setStorageValue(547843, 0)
	end
	Game.setStorageValue(547841, 120)
	Game.createItem(wallId, 1, wallPosition)
	Game.setStorageValue(547843, 0)
end

local teste2 = Action()

function teste2.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	Game.setStorageValue(547842, 0)
	createCrate()
	if player:getPosition() ~= positionEntrada then
		player:teleportTo(positionEntrada)
	end
	return true
end

teste2:aid(11548)
teste2:register()

-----------------------------------------

local crateBoxMessage = GlobalEvent("crateBoxMessage")

function crateBoxMessage.onThink(interval)
	if Game.getStorageValue(547841) < 1 then
		return true
	end
       	local spectators = Game.getSpectators(textPosition, false, true, 7, 7, 7, 7)
        if #spectators > 0 then
		for i = 1, #spectators do
			spectators[i]:say("Faltam "..Game.getStorageValue(547841).." segundos para reposicionar as caixas. Encontre a chave!", TALKTYPE_MONSTER_SAY, false, spectators[i], textPosition)
		end
	else
		Game.setStorageValue(547841, 0)
		Game.setStorageValue(547842, 1)
		Game.setStorageValue(547843, 0)
	end
	Game.setStorageValue(547841, (Game.getStorageValue(547841) - 10))

	if (Game.getStorageValue(547841) <= 0) then
		addEvent(createCrate, 10000)
	end

return true
end

crateBoxMessage:interval(10000)
crateBoxMessage:register()

------------------------------------

local teste3 = Action()

function teste3.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local wall = Tile(wallPosition):getItems()
	for i = 1, #wall do
		if wall[i] then
			wall[i]:remove()
		end
	end
		Game.setStorageValue(547841, 0)
		Game.setStorageValue(547842, 1)
		item:remove()
	addEvent(function() 
		Game.createItem(wallId, 1, wallPosition)
		end,
		30000)
		Game.setStorageValue(547843, 30)
	return true
end
teste3:id(19152)
teste3:register()

-----------------------------------------

local crateWallMessage = GlobalEvent("crateWallMessage")

function crateWallMessage.onThink(interval)
	if Game.getStorageValue(547843) < 1 then
		return true
	end
       	local spectators = Game.getSpectators(textPosition, false, true, 7, 7, 7, 7)
        if #spectators > 0 then
		for i = 1, #spectators do
			spectators[i]:say(""..Game.getStorageValue(547843).."", TALKTYPE_MONSTER_SAY, false, spectators[i], wallPosition)
		end
	else
		Game.setStorageValue(547841, 0)
		Game.setStorageValue(547842, 1)
		Game.setStorageValue(547843, 0)
	end
	Game.setStorageValue(547843, (Game.getStorageValue(547843) - 1))
return true
end

crateWallMessage:interval(1000)
crateWallMessage:register()
