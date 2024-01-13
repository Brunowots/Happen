local config = {
  eventBoss = boss_magmabubble, -- Nome do evento
  bossAction = 63020, -- Action id que fica na alavanca
  storageQuest = 30064, -- Storage para tempo da quest
  duration = 15, -- Dura??o em Minutos para matar o bos depois disso vc sera teletransportado para fora da sala
  TempoQuestHoras = 72000, -- 72000, -- Tempo para matar o boss novamente || 1 hora = 3600 sendo - [36000 = 10 horas] ~ [72000 = 20 horas]
  level_req = 800, -- Level Requerido
  min_players = 1, -- Minimo de Jogadores
  exit_player = Position(33670, 32933, 15) -- Para onde o player vai quando acabar o tempo do boss
}

-- Position dos Players
local player_positions = { 
    [1] = {fromPos = Position(33669, 32926, 15), toPos = Position(33654, 32918, 15)},
    [2] = {fromPos = Position(33669, 32927, 15), toPos = Position(33654, 32918, 15)},
    [3] = {fromPos = Position(33669, 32928, 15), toPos = Position(33654, 32918, 15)},
    [4] = {fromPos = Position(33669, 32929, 15), toPos = Position(33654, 32918, 15)},
	[5] = {fromPos = Position(33669, 32930, 15), toPos = Position(33654, 32918, 15)}
}

-- Position dos monstros
local monsters = {
    [1] = {pos = Position(33649, 32903, 15), name = "Magma Bubble"} -- Posição do 'BOSS'
}

-- Area da Quest
local quest_range = {fromPos = Position(33635, 32896, 15), toPos = Position(33663, 32921, 15)} -- Cordenada Nort Esquerda ~ Sul Direita


-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@ FIM DAS CONFIGURAÇÔES @@@@@@@@@@@@@@@@@@@
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



config.eventBoss = Action()
local exit_position = config.exit_player

-- Fun??o para resetar a quest
function doResetQuest(position, cid_array)

  -- Adiciona monstros na sala
  local monster_names = {}
  for key, value in pairs(monsters) do
    if not isInArray(monster_names, value.name) then
      monster_names[#monster_names + 1] = value.name
    end
  end

  -- Remove Monstros na sala
  for i = 1, #monsters do
    local area = {quest_range.fromPos,quest_range.toPos} -- [ NE // SD ] -- Mudar AQUI
    local remove, clean = true, true
    for x = area[1].x - 1, area[2].x + 1 do
      for y = area[1].y - 1, area[2].y + 1 do
        local pos = {x=x, y=y, z=area[1].z}
        local m = getTopCreature(pos).uid
        if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
      end
    end
  end

  -- Remove Players
  for i = 1, #player_positions do
    local creatures = Tile(player_positions[i].toPos):getCreatures()
    for key, creature in pairs(creatures) do
      if isInArray(monster_names, creature:getName()) then
        creature:remove()
      end
    end
  end

  -- Removendo os players da sala
  for key, cid in pairs(cid_array) do
    local participant = Player(cid)
    if participant and isInRange(participant:getPosition(), quest_range.fromPos, quest_range.toPos) then
      participant:teleportTo(exit_position)
      exit_position:sendMagicEffect(CONST_ME_TELEPORT)
      participant:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O tempo acabou.")
    end
  end

end


function config.eventBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
  -- item:transform(config.lever_id)

  -- Checa se h? jogadores na ?rea do boss
  for _, pid in ipairs(Game.getPlayers()) do
    local playerPos = pid:getPosition()
    if isInRange(playerPos, quest_range.fromPos, quest_range.toPos) then
      player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A sala do boss est? atualmente em uso!")
      return true
    end
  end

  -- Remove Monstros na sala
  for i = 1, #monsters do
    local area = {quest_range.fromPos,quest_range.toPos} -- [ NE // SD ] -- Mudar AQUI
    local remove, clean = true, true
    for x = area[1].x - 1, area[2].x + 1 do
      for y = area[1].y - 1, area[2].y + 1 do
        local pos = {x=x, y=y, z=area[1].z}
        local m = getTopCreature(pos).uid
        if remove ~= false and m ~= 0 and isMonster(m) then doRemoveCreature(m) end
      end
    end
  end


  local participants, pull_player = {}, false
  for i = 1, #player_positions do
    local fromPos = player_positions[i].fromPos
    local tile = Tile(fromPos)
    if not tile then
      print(">> ERROR: tile n?o existe para Posi??o(" .. fromPos.x .. ", " .. fromPos.y .. ", " .. fromPos.z .. ").")
      return player:sendCancelMessage("H? um problema com esta miss?o. Entre em contato com um administrador.")
    end

    local creature = tile:getBottomCreature()
    if creature then
      local participant = creature:getPlayer()
      if not participant then
        return player:sendCancelMessage(participant:getName() .. " n?o ? um participante v?lido.")
      end

      if participant:getLevel() < config.level_req then
        return player:sendCancelMessage(participant:getName() .. " n?o tem n?vel exigido.")
      end

      -- Checando se alguem tem a storage
      if participant:getStorageValue(config.storageQuest) > os.time() then
        return player:sendCancelMessage(participant:getName() .. " ainda est? em cooldown.")
      end


      if participant.uid == player.uid then
        pull_player = true
      end

      participants[#participants + 1] = {participant = participant, toPos = player_positions[i].toPos}
    end
  end

  if #participants < config.min_players then
    return player:sendCancelMessage("Est? faltando jogadores")
  end

  if not pull_player then
    return player:sendCancelMessage("Voc? est? na posi??o errada.")
  end

  for i = 1, #monsters do
    local toPos = monsters[i].pos
    if not Tile(toPos) then
      print(">> ERROR: tile n?o existe para Posi??o(" .. toPos.x .. ", " .. toPos.y .. ", " .. toPos.z .. ").")
      return player:sendCancelMessage("Quest Error entre em contato com o administrador do server")
    end

    -- Criando o monstro
    Game.createMonster(monsters[i].name, monsters[i].pos, false, true)
  end

  local cid_array = {}
  for i = 1, #participants do
    participants[i].participant:setStorageValue(config.storageQuest, os.time() + config.TempoQuestHoras)
    participants[i].participant:teleportTo(participants[i].toPos)
    participants[i].toPos:sendMagicEffect(CONST_ME_TELEPORT)
    cid_array[#cid_array + 1] = participants[i].participant.uid
  end
  
  addEvent(doResetQuest, config.duration * 60 * 1000, toPosition, cid_array)
  return true
end

config.eventBoss:aid(config.bossAction)
config.eventBoss:register()