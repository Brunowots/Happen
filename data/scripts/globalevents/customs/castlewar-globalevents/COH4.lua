local COH4 = GlobalEvent("COH4")
function COH4.onTime()
	gatepos = {x=1090, y=1073, z=5, stackpos=1} -- Posição da pedra inicial
	getgate = getThingfromPos(gatepos)
	doRemoveItem(getgate.uid,1)
end

COH4:time("19:01:00")
COH4:register()