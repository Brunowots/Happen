local config = {
	name_Event = Bossfinalsoulwar,
	evento_monstro = "bossfinalsoulwar",
	Storage = 331806,
	NorteEsquerda = Position(33701, 31625, 14),
	SulDireita = Position(33720, 31644, 14),
	TextoAoMatarBoss = "Agora voce tem acesso a sala da recompensa"
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