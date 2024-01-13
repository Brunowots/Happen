local charmpoints = Action()

function charmpoints.onUse(player, item, fromPosition, target, toPosition, isHotkey)
local charm_points = 500 -- quantidade de coins que o item vai dar
  player:addCharmPoints(charm_points)
  player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
  player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce recebeu "..charm_points.." Charm Points")
  item:remove(1)
  return true
end

charmpoints:id(22720)
charmpoints:register()
