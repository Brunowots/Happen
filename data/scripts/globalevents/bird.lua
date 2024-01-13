local x1 = 32306
local x2 = 32314
local y = {33558, 33564, 33570, 33576}
local z = 7

local function passaroAndando(kiko)
	local meiox = x2 - ((x2 - x1) / 2)
	local positionMeio = Position(meiox, y[kiko], z)
        local spectators = Game.getSpectators(positionMeio, true, true, 7, 7, 7, 7)
        if #spectators < 1 then
		return true
	end

	a = 0
	for x = x1, x2 do
		local tile = Tile(Position(x, y[kiko], z))
		local creature = tile:getCreatures()
		if creature then
			a = a + #creature
			for i = 1, #creature do
				if creature[i]:isMonster() and creature[i]:getName() == "Teste" then
					local direction = creature[i]:getDirection()
					local nextPosition = creature[i]:getPosition()
					nextPosition:getNextPosition(direction)
					local posx1 = x2 + 1
					local posx2 = x1 - 1
					if nextPosition.x == posx2 then
						nextPosition.x = nextPosition.x + 2
					elseif nextPosition.x == posx1 then
						nextPosition.x = nextPosition.x - 2
					end
					local tile2 = Tile(nextPosition)
					local creature2 = tile2:getCreatures()
					for j = 1, #creature2 do
						if creature2[j]:isPlayer() then
							local town = creature2[j]:getTown()
							creature2[j]:teleportTo(town:getTemplePosition())
        						creature2[j]:sendTextMessage(MESSAGE_INFO_DESCR, "Foi atingido pelo passarinho, tente novamente.")
						end
					end

					creature[i]:teleportTo(nextPosition)
					return true
				end
			end
		end
	end
	if a == 0 then
		local creature = Game.createMonster("Teste", Position(x1, y[kiko], z))
		creature:setDirection(EAST)
		a = 0
	end
end

local bird = GlobalEvent("bird")

function bird.onThink(interval)
	for u = 1, #y do
			passaroAndando(u)
	end
	return true
end

bird:interval(70)
bird:register()
