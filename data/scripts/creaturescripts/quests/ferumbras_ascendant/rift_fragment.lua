local riftFragmentDeath = CreatureEvent("riftFragmentDeath")
function riftFragmentDeath.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)

    local targetMonster = creature:getMonster()
	if not targetMonster or targetMonster:getName():lower() ~= 'rift fragment' then
		return true
	end

	local targetMonster = creature:getMonster()
	local pos = Position(33392 + math.random(-10, 10), 31473 + math.random(-10, 10), 14)
	local name = targetMonster:getName():lower()
	Game.createMonster(name, pos)
	return true
end

riftFragmentDeath:register()