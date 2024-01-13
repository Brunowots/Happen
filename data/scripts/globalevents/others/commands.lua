local commands = TalkAction("!commands")
 
function commands.onSay(player, words, param)
    if player then
        local text = 'Comandos disponiveis: \n\n'
        text = text .. '!aol \n'
        text = text .. '!vip \n'
		text = text .. '!backpack \n'
        text = text .. '!buyhouse \n'
        text = text .. '!leavehouse \n'
        text = text .. '!online \n'
        text = text .. '!sellhouse \n'
        text = text .. '!serverinfo \n'
        text = text .. '!reward \n'
		text = text .. '!shovel \n'
		text = text .. '!rewardvip \n\n'
        player:showTextDialog(28895, text)
    end
    return false
end
 
commands:register()