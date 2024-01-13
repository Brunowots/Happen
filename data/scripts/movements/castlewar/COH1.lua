local pos = {x = 32369, y = 32241, z = 7}

local COH1 = MoveEvent()
function COH1.onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) then
doTeleportThing(cid, pos) 
doSendMagicEffect(getThingPos(cid), 37)
end
return true
end

COH1:type("stepin")
COH1:uid(23027)
COH1:register()