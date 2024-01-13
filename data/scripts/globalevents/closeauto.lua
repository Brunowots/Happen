local closeauto = GlobalEvent("closeauto")
function closeauto.onStartup()
	local closeAtServerSave = false

	local function closeServe()
		if closeAtServerSave then
			Game.setGameState(GAME_STATE_CLOSED)
		end
	end
	
	addEvent(closeServe, 1000)
return true
end

closeauto:register()
