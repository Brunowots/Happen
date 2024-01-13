ITEM_SETS = {
  [1] = {
    name = "Evolution Sanguine",
    parts = {
		{slot = CONST_SLOT_LEFT, item = 43886},
		{slot = CONST_SLOT_LEFT, item = 43867},
		{slot = CONST_SLOT_LEFT, item = 43869},
		{slot = CONST_SLOT_LEFT, item = 43871},
		{slot = CONST_SLOT_LEFT, item = 43875},
		{slot = CONST_SLOT_LEFT, item = 43878},
		{slot = CONST_SLOT_LEFT, item = 43880},
		{slot = CONST_SLOT_LEFT, item = 43883}
    },
    bonuses = {
      [1] = {
	{type = BONUS_TYPE_MAXMP, value = 15},
	{type = BONUS_TYPE_MAXHP, value = 15}
      }
    }
  }
}


ITEM_SETS_CACHE = {}
ITEM_SETS_CONDITIONS = {}

function onItemSetMoved(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
  if fromPosition.y >= 64 and toPosition.y >= 64 then
    return
  end
  if fromPosition.x ~= 65535 and toPosition.x ~= 65535 then
    return
  end
  if fromPosition.y >= 64 and toPosition.x ~= 65535 or fromPosition.x ~= 65535 and toPosition.y >= 64 then
    return
  end
  local itemSet = getItemSet(item:getId())
  if not itemSet then
    if toPosition.x ~= 65535 or fromPosition.y < 64 and toPosition.y >= 64 then
      return
    end
  end

  RefreshPlayerSet(player)
end

function onItemSetLook(player, thing, position, distance, description)
  if thing:isItem() then
    local itemSet = getItemSet(thing:getId())

    if itemSet ~= nil then
      local playerParts = 0
      for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local slotItem = player:getSlotItem(slot)
        if slotItem then
          local tempSet = getItemSet(slotItem:getId())
          if tempSet ~= nil and tempSet.name == itemSet.name then
            playerParts = playerParts + 1
          end
        end
      end
      local setParts = ""
      for _, part in ipairs(itemSet.parts) do
        local tempItem = Game.createItem(part.item, 1)
        local itemName =
          tempItem:getName():gsub(
          "(%a)(%a+)",
          function(a, b)
            return string.upper(a) .. string.lower(b)
          end
        )
        if _ == 1 then
          setParts = itemName .. ", "
        elseif _ ~= #itemSet.parts then
          setParts = setParts .. itemName .. ", "
        else
          setParts = setParts .. itemName
        end
        tempItem:remove()
      end
      description = string.format("%s\n%s [%d/%d]", description, itemSet.name, playerParts, #itemSet.parts)
      description = string.format("%s\n[%s]", description, setParts)
      if playerParts > 0 then
        local bonus = itemSet.bonuses[playerParts]
        description = description .. formatSetBonus(bonus)
      end
    end
  end
  return description
end
local sets = CreatureEvent("sets")

function sets.onLogin(player)
  player:registerEvent("ItemSetsHealth")
  player:registerEvent("ItemSetsKill")
  RefreshPlayerSet(player)
  return true
end

sets:register()

function onItemSetsGainExperience(player, source, exp, rawExp)
  local cid = player:getId()
  if ITEM_SETS_CACHE[cid] then
    for setId, parts in pairs(ITEM_SETS_CACHE[cid]) do
      local bonuses = ITEM_SETS[setId].bonuses[parts]
      for _, bonus in ipairs(bonuses) do
        if bonus.type == BONUS_TYPE_EXPERIENCE then
          player:addExperience(math.ceil(exp * bonus.value / 100), true)
        end
      end
    end
  end
  return true
end

local sets1 = CreatureEvent("sets1")
function sets1.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
  if not creature or not attacker or origin == ORIGIN_CONDITION then
    return primaryDamage, primaryType, secondaryDamage, secondaryType
  end
  if primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN then
    return primaryDamage, primaryType, secondaryDamage, secondaryType
  end
  if creature == attacker then
    return primaryDamage, primaryType, secondaryDamage, secondaryType
  end

  local pid = attacker:isPlayer() and attacker:getId() or creature:getId()
  local attackerId = attacker:isPlayer() and attacker:getId() or nil
  local creatureId = creature:isPlayer() and creature:getId() or nil

  if attackerId and ITEM_SETS_CACHE[attackerId] then
    for setId, parts in pairs(ITEM_SETS_CACHE[attackerId]) do
      local bonuses = ITEM_SETS[setId].bonuses[parts]
      for _, bonus in ipairs(bonuses) do
        if bonus.type.combatType and bonus.type.combatType ~= BONUS_TYPES.CONDITION then
          if bonus.type.combatType == BONUS_TYPES.TRIGGER then
            if bonus.type.triggerType == TRIGGER_TYPES.ATTACK then
              if bonus.chance >= math.random(1, 100) then
                attacker:getPosition():sendDistanceEffect(creature:getPosition(), bonus.type.distanceEffect)
                doTargetCombatHealth(
                  attacker:getId(),
                  creature:getId(),
                  bonus.type.damageType,
                  bonus.min,
                  bonus.max,
                  bonus.type.hitEffect,
                  ORIGIN_CONDITION
                )
              end
            end
          else
            if (bonus.type.combatDamage % (primaryType + primaryType) >= primaryType) == true then
              if bonus.type.combatType == BONUS_TYPES.OFFENSIVE then
                primaryDamage = math.floor(primaryDamage + (primaryDamage * bonus.value / 100))
              end
            end
            if (bonus.type.combatDamage % (secondaryType + secondaryType) >= secondaryType) == true then
              if bonus.type.combatType == BONUS_TYPES.OFFENSIVE then
                secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * bonus.value / 100))
              end
            end

            local damage = (primaryDamage + secondaryDamage)
            if damage < 0 then
              damage = damage * -1
            end

            if bonus.type == BONUS_TYPE_LIFESTEAL then
              local lifeSteal = math.floor((damage * (bonus.value / 100)))
              if lifeSteal > 0 then
                attacker:addHealth(lifeSteal)
              end
            end
          end
        end
      end
    end
  end

  if creatureId and ITEM_SETS_CACHE[creatureId] then
    for setId, parts in pairs(ITEM_SETS_CACHE[creatureId]) do
      local bonuses = ITEM_SETS[setId].bonuses[parts]
      for _, bonus in ipairs(bonuses) do
        if bonus.type.combatType and bonus.type.combatType ~= BONUS_TYPES.CONDITION then
          if bonus.type.combatType == BONUS_TYPES.TRIGGER then
            if bonus.type.triggerType == TRIGGER_TYPES.HIT then
              if bonus.chance >= math.random(1, 100) then
                creature:getPosition():sendDistanceEffect(attacker:getPosition(), bonus.type.distanceEffect)
                doTargetCombatHealth(
                  creature:getId(),
                  attacker:getId(),
                  bonus.type.damageType,
                  bonus.min,
                  bonus.max,
                  bonus.type.hitEffect,
                  ORIGIN_CONDITION
                )
              end
            end
          else
            if (bonus.type.combatDamage % (primaryType + primaryType) >= primaryType) == true then
              if bonus.type.combatType == BONUS_TYPES.DEFENSIVE and creature:isPlayer() then
                primaryDamage = math.floor(primaryDamage - (primaryDamage * bonus.value / 100))
              end
            end
            if (bonus.type.combatDamage % (secondaryType + secondaryType) >= secondaryType) == true then
              if bonus.type.combatType == BONUS_TYPES.DEFENSIVE and creature:isPlayer() then
                secondaryDamage = math.floor(secondaryDamage - (secondaryDamage * bonus.value / 100))
              end
            end
          end
        end
      end
    end
  end

  return primaryDamage, primaryType, secondaryDamage, secondaryType
end

sets1:register()

function RefreshPlayerSet(player)
  local cid = player:getId()
  if ITEM_SETS_CACHE[cid] then
    for setId, parts in pairs(ITEM_SETS_CACHE[cid]) do
      local bonuses = ITEM_SETS[setId].bonuses[parts]
      for _, bonus in ipairs(bonuses) do
        if bonus.type.combatType == BONUS_TYPES.CONDITION then
          if ITEM_SETS_CONDITIONS[bonus.type.name] and ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value] then
            player:removeCondition(bonus.type.condition, CONDITIONID_COMBAT, 100 + bonus.type.subId)
          end
        end
      end
    end
  end

  ITEM_SETS_CACHE[cid] = {}
  for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
    local slotItem = player:getSlotItem(slot)
    if slotItem then
      local slotSetItem,
        setId = getItemSet(slotItem:getId())
      if slotSetItem ~= nil then
        if not ITEM_SETS_CACHE[cid][setId] then
          ITEM_SETS_CACHE[cid][setId] = 0
        end
        ITEM_SETS_CACHE[cid][setId] = ITEM_SETS_CACHE[cid][setId] + 1
      end
    end
  end

  local maxHP = player:getMaxHealth()
  local maxMP = player:getMaxMana()
  if ITEM_SETS_CACHE[cid] then
    for setId, parts in pairs(ITEM_SETS_CACHE[cid]) do
      local bonuses = ITEM_SETS[setId].bonuses[parts]
      for _, bonus in ipairs(bonuses) do
        if bonus.type.combatType == BONUS_TYPES.CONDITION then
          if not ITEM_SETS_CONDITIONS[bonus.type.name] then
            ITEM_SETS_CONDITIONS[bonus.type.name] = {}
          end
          if not ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value] then
            ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value] = Condition(bonus.type.condition)
            ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value]:setParameter(
              bonus.type.param,
              bonus.type.percentage == true and 100 + bonus.value or bonus.value
            )
            ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value]:setParameter(CONDITION_PARAM_SUBID, 100 + bonus.type.subId)
            ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value]:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
            ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value]:setParameter(CONDITION_PARAM_TICKS, -1)
            player:addCondition(ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value])
            if bonus.type == BONUS_TYPE_MAXHP then
              if player:getHealth() == maxHP then
                player:addHealth(player:getMaxHealth())
              end
            end
            if bonus.type == BONUS_TYPE_MAXMP then
              if player:getMana() == maxMP then
                player:addMana(player:getMaxMana())
              end
            end
          else
            player:addCondition(ITEM_SETS_CONDITIONS[bonus.type.name][bonus.value])
            if bonus.type == BONUS_TYPE_MAXHP then
              if player:getHealth() == maxHP then
                player:addHealth(player:getMaxHealth())
              end
            end
            if bonus.type == BONUS_TYPE_MAXMP then
              if player:getMana() == maxMP then
                player:addMana(player:getMaxMana())
              end
            end
          end
        end
      end
    end
  end
end

function getItemSet(id)
  for i = 1, #ITEM_SETS do
    local itemSet = ITEM_SETS[i]
    for _, part in ipairs(itemSet.parts) do
      if part.item == id then
        return itemSet, i
      end
    end
  end

  return nil
end

function formatSetBonus(bonuses)
  local text = ""
  for _, bonus in ipairs(bonuses) do
    if bonus.type.combatType == BONUS_TYPES.TRIGGER then
      text = string.format("%s\n%d%% chance to cast %s dealing %d-%d damage", text, bonus.chance, bonus.type.name, bonus.min, bonus.max)
    else
      text = string.format("%s\n%s +%d%s", text, bonus.type.name, bonus.value, bonus.type.percentage == true and "%" or "")
    end
  end
  return text
end
