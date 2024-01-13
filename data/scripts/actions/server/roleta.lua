local posX1 = 32366; --Esse é o X que fica na esquerda, Primeiro sqm da esquerda
local posX2 = 32372; --Esse é o X que fica na direita, Primeiro sqm da direita
local posY = 32231; --Esse é o Y que fica todos os itens.
local posZ = 6; -- Esse é o Z que fica todos os itens.
local center = 32369; -- Esse é o X central, onde ficará o item que irá ser entregue ao player.
local pos = {x = 32369, y = 32231, z = 6} --Essa é a posição central completa, onde ficará o item que entregará ao player.
local teste1 = {28721, 28718, 28724, 28725, 28723, 28717, 28716, 28719, 28714, 28715, 27647, 27649, 27648, 27651, 27650, 31631, 30399, 30398, 30400, 30397, 30393, 30395, 30394, 30396, 34152, 34153, 34156, 34154, 34151, 34157, 34155, 34150, 34254, 34253, 34158, 3043} --Items 1, 2, 3, 4, 5, 6 (em ordem, da esquerda pra direita, obrigado a colocar 1 item adicional que não aparece) nesse caso o item sera o 3043 o ultimo item da direita
local qitem = 35 --Quantidade de itens na roleta, tirando o 3043 de enfeite.
local ticketID = 44094 --Id do item que será cobrado pra usar a roleta
local count = 1 --Quantidade do item que será cobrado pra usar a roleta
a = 0
xa = 30

local roleta = Action()
function roleta.onUse(player, item, fromPosition, itemEx, target, toPosition, isHotkey)
	if item.itemid == 2772 then  -- Id da alavanca antes de usar
			local container = player:getSlotItem(CONST_SLOT_BACKPACK)
			if not container or container:getEmptySlots() == 0 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você está sem mochila ou ela nao tem espaço, livre-se de todos os itens e tente novamente.")
			return true
			end

			if Game.getStorageValue(12336) == 1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Espere a roleta parar e tente novamente.")
			return true
			end

			if player:removeItem(ticketID,count) then
				Game.setStorageValue(12336, 1)
				player:setStorageValue(12337, 1)
				player:allowMovement(false)

				item:transform(2773) -- Id da alavanca ao usar

				hulk = 1
				for i = posX1, posX2 do
					local posTotal = Position(i, posY, posZ)
					local tile = Tile(posTotal)
					local item = tile:getTopDownItem()
					if item then
						item:remove()
					end
					joka = Game.createItem(teste1[hulk], 1, posTotal)
					hulk = hulk + 1
				end

				local ja = math.random(20, 30)
				enableSleep(function()
				for i = 1, ja do
					for k = 1, #teste1 do
						for x = posX1, posX2 do
							local getItem = getTileItemById({x=x, y=posY, z=posZ}, teste1[k])
							if getItem.itemid == teste1[k] then
								if k == 1 then
									doTransformItem(getTileItemById({x=x, y=posY, z=posZ}, teste1[k]).uid, teste1[k+qitem])
								elseif k ~= 1 then
									doTransformItem(getTileItemById({x=x, y=posY, z=posZ}, teste1[k]).uid, teste1[k-1])
								end	
							end
						end
					end
					sleep(100 + xa)
					a = a + ja
					xa = xa + 30
				end
 				end)

				b = ((((((ja*xa)+100)*(ja-19))+8300) - (((ja+16)-xa)*100)) + 20)
				enableSleep(function()
				sleep(b)
				for k = 1, #teste1 do
					local getItem = getTileItemById({x=center, y=posY, z=posZ}, teste1[k])
					if getItem.itemid == teste1[k] then
						local itemType = ItemType(teste1[k])
						local full_weight = 0
						local free_cap = player:getCapacity()
						full_weight =	 itemType:getWeight(1)
						if full_weight <= free_cap then
							player:addItem(teste1[k])
							for i = posX1, posX2 do
								local posTotal1 = Position(i, posY, posZ)
								local tile = Tile(posTotal1)
								local item = tile:getTopDownItem()
								item:remove()
								joka = Game.createItem(teste1[k], 1, posTotal1)
								doSendMagicEffect(posTotal1, 57)
                           					doSendMagicEffect(posTotal1, 30)
                           					doSendMagicEffect(posTotal1, 31)							
							end
							doSendMagicEffect(pos, CONST_ME_TUTORIALARROW)
							broadcastMessage('O jogador '..player:getName()..' conseguiu pegar '..itemType:getName()..' na roleta.', MESSAGE_EVENT_ADVANCE)
							player:setStorageValue(12337, 0)
				player:allowMovement(true)
					else
						player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce nao tem capacidade suficiente para receber o item, libere espaço e tente novamente.")
						player:addItem(ticketID,count)
						player:setStorageValue(12337, 0)
				player:allowMovement(true)
					end
				end
				Game.setStorageValue(12336, 0)
				a = 0
				xa = 30
				ja = 0
				end
 				end)
			else
				local itemType = ItemType(ticketID)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Voce precisa'..count..' '..itemType:getName()..' para girar a roleta.')
			end
	else
		item:transform(2772) -- Id da alavanca antes de usar
	end
return true
end

roleta:aid(8135)   -- ActionID que coloca na alavanca
roleta:register()

-----------------------------

local roletaLogout = CreatureEvent("roletaLogout")
function roletaLogout.onLogout(player)
	if player:getStorageValue(12337) > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Voce precisa esperar a roleta parar de girar.')
		return false
	end
	return true
end
roletaLogout:register()

---------------------------
local pzRoleta = CreatureEvent("pzRoletaEvent")
function pzRoleta.onThink(creature)
	local player = creature:getPlayer()
	if player then
		if not (getTileInfo(player:getPosition()).protection) and (player:getStorageValue(12337) > 0) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Voce precisa esperar a roleta parar de girar.')
			local pos = player:getPosition()
			player:teleportTo(Position(center, posY + 4, posZ))
		end
	end
return true
end
pzRoleta:register()

--------------------------
--[[ local roletaItens = GlobalEvent("roletaItens")

function roletaItens.onThink(interval)
		local posTotal = Position(center-1, posY+2, posZ)
		local tile = Tile(posTotal)
		local item = tile:getTopDownItem()
		local ground = tile:getGround()
		if not item or item:getId() == 2113 then
			ground:setActionId(2154)
			joka = Game.createItem(teste1[1], 1, posTotal)
		end

		for k = 1, #teste1 do
			local getItem = getTileItemById({x=center-1, y=posY+2, z=posZ}, teste1[k])
			if getItem.itemid == teste1[k] then
				if k == 1 then
					doTransformItem(getTileItemById({x=center-1, y=posY+2, z=posZ}, teste1[k]).uid, teste1[k+qitem])
				elseif k ~= 1 then
					doTransformItem(getTileItemById({x=center-1, y=posY+2, z=posZ}, teste1[k]).uid, teste1[k-1])
				end	
			end
		end
		local item2 = tile:getTopDownItem()
		item2:setAttribute('aid', 100)
	return true
end

roletaItens:interval(1000) -- 8 hours
roletaItens:register() ]]--
