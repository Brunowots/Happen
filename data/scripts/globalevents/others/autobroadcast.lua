local autoBroadcast = GlobalEvent("AutoBroadcast")
function autoBroadcast.onThink(interval, lastExecution)
    local messages = {
	"Bem-vindo ao HappenOT 13.20! OTserver Retro-PvP Mapa Custom e unico.",
	"[INICIANTES]: Digite: !reward, Para receber sua recompensa por ter entrado no nosso servidor.", 
	"[INFORMAÇÃO]: Contamos com um sistema exclusivo no HappenOT que é o sistema de Guild Level, para mais informações acesse nosso site.",
	"[INFORMAÇÃO]: informações: Sistema de Task exclusivo no templo! Recompensas como crystal coins e Bag You Desire e Uma recompensa especial.",
	"[EVENTO]: CastleWAR 48Hrs, isso indica que a guild dominante ficará sobre o comando do castle por 2 dias.",
	"[EVENTO]: Bosses Diário, nosso servidor tem um sistema de boss automático que spawnda um boss diário na arena boss.",
	"[QUEST]: Quest Sanguíne Evolution é a mais nova quest do nosso servidor ela é destinada a evoluir seu item sanguine.",
	"[VIP's]: Contamos com um sistema de vip exclusivo e único, para mais informações acesse nosso site www.happenot.com.br.",
}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE)
    return true
end

autoBroadcast:interval(600000)
autoBroadcast:register()