local positionsLetras = {
			Position(32366, 32242, 7),
			Position(32367, 32242, 7), 
			Position(32368, 32242, 7), 
			Position(32369, 32242, 7), 
			Position(32370, 32242, 7), 
			Position(32371, 32242, 7), 
			Position(32368, 32243, 7), 
			Position(32369, 32243, 7)
}

local idLetras = {44071, 44072, 44073, 44073, 44074, 44075, 44076, 44077}

local function removeLetras()
	for i = 1, #positionsLetras do
		local tile = Tile(positionsLetras[i])
		local items = tile:getItems()
		if items then
			for k = 1, #items do
				for z = 44071, 44077 do
					if items[k]:getId() == z then
						items[k]:remove()
					end
				end
			end
		end
	end
		Game.setStorageValue(548842, 1)
end

local function letraPorLetra()
	local nmr = Game.getStorageValue(548842)
	if nmr <= 8 then
		Game.createItem(idLetras[nmr], 1, positionsLetras[nmr])
		Game.setStorageValue(548842, (nmr + 1))
		positionsLetras[nmr]:sendMagicEffect(CONST_ME_YELLOWENERGY)
	else
		addEvent(removeLetras, 1000)
	end
end
	
local letras = GlobalEvent("letras")

function letras.onThink(interval)
	local positionMeio = Position(32369, 32241, 7)
        local spectators = Game.getSpectators(positionMeio, true, true, 10, 10, 10, 10)
        if #spectators < 1 then
		return true
	end

	if Game.getStorageValue(548842) < 1 then
		Game.setStorageValue(548842, 1)
	end
	if Game.getStorageValue(548842) > 8 then
		addEvent(removeLetras, 500)
		Game.setStorageValue(548842, 1)
	else
		addEvent(letraPorLetra, 100)
	end
	return true
end

letras:interval(300)
letras:register()
