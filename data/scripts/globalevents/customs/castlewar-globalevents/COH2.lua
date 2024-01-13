local COH2 = GlobalEvent("COH2")
function COH2.onTime()
	broadcastMessage("[Castle Of Honor] Castle esta aberto! Todas as guilds tem 1 HORA para domina-lo, apos isso ele será fechado novamente e abrira apenas em 48Hrs!") 
	gatepos = {x=1090, y=1073, z=5, stackpos=1} -- Posição da pedra inicial
	getgate = getThingfromPos(gatepos)
	doRemoveItem(getgate.uid,1)
	doRemoveItem(1791, 1, Position(1090, 1073, 5))
	addEvent(COH, 60 * 60 * 1000) -- Tempo de espera
end

function COH()
	broadcastMessage("[Castle Of Honor] Fechado!")  -- Mensagem quando evento fecha
    Game.createItem(1791, 1, Position(1090, 1073, 5)) -- Posição da pedra inicial
    doCastleRemoveEnemies()
end

COH2:time("19:00:00")
COH2:register()