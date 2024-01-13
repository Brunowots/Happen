local cmd = TalkAction("!programador")

local config = {
    interval = 6000, -- in ms, 1000 ms = 1 s
    storage = 12345 -- empty storage
}

local function sendAfkMessage(pid, startPos)
    local player = Player(pid)
    if not player then
        return
    end

    if player:getStorageValue(config.storage) ~= 1 then
        return
    end

    if player:getPosition() ~= startPos then
        return player:toggleAFK()
    end

    local dir = player:getDirection()
    player:setDirection(dir < 3 and dir + 1 or 0)
    player:sendTextMessage(MESSAGE_LOOT, ("%s %s"):format("{3043|MANDE MENSAGEM NO WHATSAPP ESTOU PROGRAMANDO}", "{34021| OBRIGADO!}"))
    return addEvent(sendAfkMessage, config.interval, player.uid, startPos)
end

function Player:toggleAFK()
    if self:getStorageValue(config.storage) ~= 1 then
        self:setStorageValue(config.storage, 1)
        self:sendCancelMessage('You have enabled AFK mode.')
        sendAfkMessage(self.uid, self:getPosition())
    else
        self:setStorageValue(config.storage, 0)
        self:sendCancelMessage('You have disabled AFK mode.')
    end
end

function cmd.onSay(player, words, param)
    player:toggleAFK()
    return false
end

cmd:register()