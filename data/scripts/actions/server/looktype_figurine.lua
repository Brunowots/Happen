local looktypeF = {[1] = 1367, [5] = 1367, [2] = 1364, [6] = 1364, [3] = 1366, [7] = 1366, [4] = 1365, [8] = 1365}
local looktypeFigurine = Action()

function looktypeFigurine.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:hasFamiliar(looktypeF[player:getVocation():getId()]) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Parabéns, você adquiriu um novo outfit pro seu familiar.')
		player:addFamiliar(looktypeF[player:getVocation():getId()])
		item:remove()
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Você já usou este item ou ele não é o da sua vocation.')
	end
    return true
end

looktypeFigurine:id(35592, 35591, 35590, 35589)
looktypeFigurine:register()
