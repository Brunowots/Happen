local config = {
	name_Event = Bosspiranha,
	evento_monstro = "bosscloak",
	Storage = 331804,
	NorteEsquerda = Position(33846, 31857, 7),
	SulDireita = Position(33865, 31875, 7),
	TextoAoMatarBoss = "Agora voce tem acesso a sala do quinto boss"
}

local name_Event = CreatureEvent(config.evento_monstro)
function name_Event.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster or targetMonster:getMaster() then
		return true
	end
	
	local targetPlayers = Game.getPlayers()
	for _, player in ipairs(targetPlayers) do
	    if player:getPosition():isInRange(config.NorteEsquerda, config.SulDireita) then
			if player:getStorageValue(config.Storage) <= 0 then
				player:setStorageValue(config.Storage, 1)
				player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.TextoAoMatarBoss)
			end
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	    end
	end
	
	return true
end
name_Event:register()