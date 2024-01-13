COH_PUSHTIME = 10800
COH_AREA = {{x = 1076, y = 1051, z = 5}, {x = 1130, y = 1096, z = 6}} -- Canto superior esquerdo / inferior direito do Castle
COH_STATUS = 201320111714
COH_PREPARE1 = 201320111715 
COH_PUSHSTOR = 201320111716 
COH_PREPARE2 = 201320111717 

function doCastleRemoveEnemies()
	for index, creature in ipairs(Game.getPlayers()) do
		if isInRange(getThingPos(creature), COH_AREA[1], COH_AREA[2]) then
			local storage = db.storeQuery("SELECT `value` FROM `player_storage` WHERE player_id= 1 AND `key` = 1000;")
			local storage1 = tonumber(result.getDataInt(storage, "value"))
			local guild = creature:getGuild()
			local guild1 = guild:getId()
			if guild1 ~= storage1 then
				doTeleportThing(creature, getTownTemplePosition(getPlayerTown(creature)))
			end
		end
	end
return true
end