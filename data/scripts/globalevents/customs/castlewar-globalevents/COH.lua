_Lib_COH_Days = {
	["Monday"] = {
	["19:01"]  = {players = 50},
	},
	["Tuesday"] = {
	["19:01"] = {players = 50},
	},
	["Wednesday"] = {
	["19:01"] = {players = 50},
	},
	["Friday"] = {
	["19:01"] = {players = 50},
	},
	["Saturday"] = {
	["19:01"] = {players = 50},
	},
	["Sunday"] = {
	["19:01"] = {players = 50}
	}
	}
	
	local COH = GlobalEvent("COH")
	
	function COH.onThink(interval, lastExecution)
	if _Lib_COH_Days[os.date("%A")] then
	hours = tostring(os.date("%X")):sub(1, 5)
	tb = _Lib_COH_Days[os.date("%A")][hours]
		gatepos = {x=17091, y=16958, z=5, stackpos=1}
		getgate = getThingfromPos(gatepos)
		doRemoveItem(getgate.uid,1)
	end
	return true
	end
	
	COH:interval(4000)
	COH:register()