local vocItem = {[1] = 35592, [5] = 35592, [2] = 35591, [6] = 35591, [3] = 35590, [7] = 35590, [4] = 35589, [8] = 35589}
local RatmiralDeath = CreatureEvent("RatmiralDeath")

function RatmiralDeath.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	local damageMap = creature:getMonster():getDamageMap()

	for key, value in pairs(damageMap) do
		local player = Player(key)
		if player and player:getStorageValue(548754) < 1 then
			player:setStorageValue(Storage.Quest.U12_60.APiratesTail.RascacoonKiller, 1)
			player:addOutfitAddon(1372)
			player:addOutfitAddon(1371)
			player:addItem(vocItem[player:getVocation():getId()], 1)
		end
	end
end

RatmiralDeath:register()