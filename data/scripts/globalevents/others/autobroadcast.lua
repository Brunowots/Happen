local autoBroadcast = GlobalEvent("AutoBroadcast")
function autoBroadcast.onThink(interval, lastExecution)
    local messages = {
	"Bem-vindo ao HappenOT 13.20! OTserver Retro-PvP Mapa Custom e unico.",
	"[INICIANTES]: Digite: !reward, Para receber sua recompensa por ter entrado no nosso servidor.", 
	"[INFORMA��O]: Contamos com um sistema exclusivo no HappenOT que � o sistema de Guild Level, para mais informa��es acesse nosso site.",
	"[INFORMA��O]: informa��es: Sistema de Task exclusivo no templo! Recompensas como crystal coins e Bag You Desire e Uma recompensa especial.",
	"[EVENTO]: CastleWAR 48Hrs, isso indica que a guild dominante ficar� sobre o comando do castle por 2 dias.",
	"[EVENTO]: Bosses Di�rio, nosso servidor tem um sistema de boss autom�tico que spawnda um boss di�rio na arena boss.",
	"[QUEST]: Quest Sangu�ne Evolution � a mais nova quest do nosso servidor ela � destinada a evoluir seu item sanguine.",
	"[VIP's]: Contamos com um sistema de vip exclusivo e �nico, para mais informa��es acesse nosso site www.happenot.com.br.",
}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE)
    return true
end

autoBroadcast:interval(600000)
autoBroadcast:register()