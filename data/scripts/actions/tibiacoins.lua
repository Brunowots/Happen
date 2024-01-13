local addCoins = Action()
function addCoins.onUse(player, item, fromPosition, target, toPosition, isHotkey)
local coins = 100
  db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. coins .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
  player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce recebeu "..coins.." tibia coins")
  item:remove(1)
  return true
end
addCoins:id(22118)
addCoins:register()