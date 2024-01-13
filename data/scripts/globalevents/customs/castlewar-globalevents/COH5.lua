local COH5 = GlobalEvent("COH5")
function COH5.onTime()
	gatepos = {x=1090, y=1073, z=5, stackpos=1} -- Posição da pedra inicial
	getgate = getThingfromPos(gatepos)
	doRemoveItem(getgate.uid,1)
end

COH5:time("19:01:00")
COH5:register()