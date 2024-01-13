local COH3 = GlobalEvent("COH3")
function COH3.onTime()
	broadcastMessage("[Pedra Castle Removida]")
	gatepos = {x=1090, y=1073, z=5, stackpos=1} -- Posição da pedra inicial
	getgate = getThingfromPos(gatepos)
	doRemoveItem(getgate.uid,1)
end

COH3:time("19:01:00")
COH3:register()