local teste = Action()
function teste.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addTournamentBalance(5)
			print(""..player:getTournamentBalance().."")
	return false
end
teste:aid(12457)
teste:register()
