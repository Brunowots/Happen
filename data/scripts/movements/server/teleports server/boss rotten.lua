---------------------------------------- Primeiro portal fumaça ------------------------------------------------------
local PrimeiroPortal = MoveEvent()
function PrimeiroPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(34010, 31014, 9)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
PrimeiroPortal:aid(30301)
PrimeiroPortal:register()



---------------------------------------- Segundo portal fumaça ------------------------------------------------------
-- Segundo portal fumaça
local SegundoPortal = MoveEvent()
function SegundoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33972, 31041, 11)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
SegundoPortal:aid(30302)
SegundoPortal:register()

---------------------------------------- Terceiro portal fumaça ------------------------------------------------------
local TerceiroPortal = MoveEvent()
function TerceiroPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33893, 31020, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
TerceiroPortal:aid(30303)
TerceiroPortal:register()


---------------------------------------- Quarto portal fumaça ------------------------------------------------------
local QuartoPortal = MoveEvent()
function QuartoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33858, 31831, 3)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
QuartoPortal:aid(30304)
QuartoPortal:register()

---------------------------------------- Quinto portal fumaça ------------------------------------------------------
local QuintoPortal = MoveEvent()
function QuintoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33888, 31185, 10)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
QuintoPortal:aid(30305)
QuintoPortal:register()

---------------------------------------- BOSS Infernal portal fumaça ------------------------------------------------------
local SextoPortal = MoveEvent()
function SextoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33685, 31595, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
SextoPortal:aid(30306)
SextoPortal:register()

---------------------------------------- BOSS Piranhas portal fumaça ------------------------------------------------------
local SetimoPortal = MoveEvent()
function SetimoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
	
	if player:getStorageValue(331802) <= 0 then
			player:teleportTo(Position(33948, 31109, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa matar o segundo boss para ter acesso aqui")
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33781, 31630, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end

    return true
end
SetimoPortal:aid(30307)
SetimoPortal:register()

---------------------------------------- BOSS Dark Thais portal fumaça ------------------------------------------------------
local SetimoPortal = MoveEvent()
function SetimoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
	if player:getStorageValue(331804) <= 0 then
			player:teleportTo(Position(33937, 31215, 11)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa matar o quarto boss para ter acesso aqui")
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33782, 31661, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
    return true
end
SetimoPortal:aid(30308)
SetimoPortal:register()

---------------------------------------- Hunt1 Cloak portal fumaça ------------------------------------------------------
local OitavoPortal = MoveEvent()
function OitavoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33883, 31872, 4)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
OitavoPortal:aid(30309)
OitavoPortal:register()

---------------------------------------- Hunt2 Cloak portal fumaça ------------------------------------------------------
local OitavoPortal = MoveEvent()
function OitavoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33837, 31866, 5)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
OitavoPortal:aid(30310)
OitavoPortal:register()

---------------------------------------- BOSS Cloak portal fumaça ------------------------------------------------------
local OitavoPortal = MoveEvent()
function OitavoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
	if player:getStorageValue(331803) <= 0 then
			player:teleportTo(Position(33856, 31886, 5)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa matar o terceiro boss para ter acesso aqui")
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33855, 31882, 6)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
    return true
end
OitavoPortal:aid(30311)
OitavoPortal:register()

---------------------------------------- Alminha Soulwar portal fumaça ------------------------------------------------------
local NonoPortal = MoveEvent()
function NonoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33648, 31438, 10)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
NonoPortal:aid(30312)
NonoPortal:register()

---------------------------------------- Alminha Soulwar2 portal fumaça ------------------------------------------------------
local DecimoPortal = MoveEvent()
function DecimoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33648, 31438, 10)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoPortal:aid(30313)
DecimoPortal:register()

---------------------------------------- Alminha Thais portal  ------------------------------------------------------
local DecimoPrimeiroPortal = MoveEvent()
function DecimoPrimeiroPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(31913, 32355, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoPrimeiroPortal:aid(30314)
DecimoPrimeiroPortal:register()

---------------------------------------- Alminha Thais portal ------------------------------------------------------
local DecimoSegundoPortal = MoveEvent()
function DecimoSegundoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(31913, 32355, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoSegundoPortal:aid(30315)
DecimoSegundoPortal:register()

---------------------------------------- Raio Falcon portal ------------------------------------------------------
local DecimoTerceiroPortal = MoveEvent()
function DecimoTerceiroPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33329, 31332, 9)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoTerceiroPortal:aid(30316)
DecimoTerceiroPortal:register()

--------------------------------------- Dream Scar portal Piso ------------------------------------------------------
local DecimoQuartoPortal = MoveEvent()
function DecimoQuartoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32208, 32060, 13)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoQuartoPortal:aid(30317)
DecimoQuartoPortal:register()

--------------------------------------- Dream Scar portal Piso ------------------------------------------------------
local DecimoQuintoPortal = MoveEvent()
function DecimoQuintoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32208, 32060, 13)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoQuintoPortal:aid(30318)
DecimoQuintoPortal:register()

--------------------------------------- Dream Scar portal Piso ------------------------------------------------------
local DecimoSextoPortal = MoveEvent()
function DecimoSextoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32208, 32060, 13)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoSextoPortal:aid(30319)
DecimoSextoPortal:register()

--------------------------------------- Dream Scar portal Piso ------------------------------------------------------
local DecimoSetimoPortal = MoveEvent()
function DecimoSetimoPortal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32208, 32060, 13)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
DecimoSetimoPortal:aid(30320)
DecimoSetimoPortal:register()

--------------------------------------- Boss Final Soulwar ------------------------------------------------------
local BossSoulwarFinal = MoveEvent()
function BossSoulwarFinal.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
	if player:getStorageValue(331805) <= 0 then
			player:teleportTo(Position(33613, 31430, 10)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa matar o quinto boss para ter acesso aqui")
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33683, 31634, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
    return true
end
BossSoulwarFinal:aid(30321)
BossSoulwarFinal:register()

--------------------------------------- Sala Recompensa Soulwar ------------------------------------------------------
local RecompensaSoulWar = MoveEvent()
function RecompensaSoulWar.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
	if player:getStorageValue(331806) <= 0 then
			player:teleportTo(Position(33621, 31418, 10)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce precisa matar o final boss para ter acesso aqui")
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33621, 31411, 10)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
    return true
end
RecompensaSoulWar:aid(30322)
RecompensaSoulWar:register()

--------------------------------------- Timira the many head ida ------------------------------------------------------
local TimiraTheManyHeadida = MoveEvent()
function TimiraTheManyHeadida.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33803, 32700, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
TimiraTheManyHeadida:aid(30323)
TimiraTheManyHeadida:register()

--------------------------------------- Timira the many head volta ------------------------------------------------------
local TimiraTheManyHeadvolta = MoveEvent()
function TimiraTheManyHeadvolta.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33803, 32701, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
TimiraTheManyHeadvolta:aid(30324)
TimiraTheManyHeadvolta:register()

--------------------------------------- Timira the many head saida boss ------------------------------------------------------
local Timirasaidaboss = MoveEvent()
function Timirasaidaboss.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(33807, 32697, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
Timirasaidaboss:aid(30325)
Timirasaidaboss:register()

--------------------------------------- Teleport entrada norte dp thais ------------------------------------------------------

local huntToTempleThais = MoveEvent()
function huntToTempleThais.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then     return true end
       if not player:isVip() then
            player:teleportTo(fromPosition, false)
            player:getPosition():sendMagicEffect(3)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sala permitida apenas para VIP.")
         else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Seja bem vindo a sala VIP.")
			player:getPosition():sendMagicEffect(29)
			player:getPosition():sendMagicEffect(31)
			player:getPosition():sendMagicEffect(56)
        end
    return true
end
huntToTempleThais:type("stepin")
huntToTempleThais:aid(5432) -- Action ID
huntToTempleThais:register() 

--------------------------------------- Adventurers island ------------------------------------------------------
local TimiraTheManyHeadvolta = MoveEvent()
function TimiraTheManyHeadvolta.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(Position(32209, 32300, 6)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
TimiraTheManyHeadvolta:aid(30326)
TimiraTheManyHeadvolta:register()

----------------------------------------Saida Prisao -----------------------------------------------------------------------------
local saidaprisao = MoveEvent()
function saidaprisao.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then     return true end
        if player:getStorageValue(31230) > 0 then
            player:teleportTo(fromPosition, false)
            player:getPosition():sendMagicEffect(3)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce nao cumpriu sua pena.")
        end
    return true
end
saidaprisao:type("stepin")
saidaprisao:aid(30327) -- Action ID
saidaprisao:register() 

--------------------------------------- Teleport Forja ------------------------------------------------------
local Forja = MoveEvent()
function Forja.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(32369, 32241, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
Forja:aid(30328)
Forja:register()

--------------------------------------- Port Hope to Marapur ------------------------------------------------------
local PhtoMarapur = MoveEvent()
function PhtoMarapur.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(33842, 32854, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
PhtoMarapur:aid(30329)
PhtoMarapur:register()

--------------------------------------- Marapur to Port Hope ------------------------------------------------------
local MarapurtoPh = MoveEvent()
function MarapurtoPh.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(33036, 32739, 2)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
MarapurtoPh:aid(30330)
MarapurtoPh:register()


--------------------------------------- Galthen boss to entrance ------------------------------------------------------
local Galthenbosstoentrance = MoveEvent()
function Galthenbosstoentrance.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(34021, 31883, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
Galthenbosstoentrance:aid(30331)
Galthenbosstoentrance:register()

--------------------------------------- Galthen exit ------------------------------------------------------
local Galthenexit = MoveEvent()
function Galthenexit.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(32728, 32909, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
Galthenexit:aid(30332)
Galthenexit:register()

--------------------------------------- ultimo andar tp hunt ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(32349, 32242, 5)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30333)
ultimoandartphunt:register()

--------------------------------------- tp evolucao sanguine quest ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(32372, 33406, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30334)
ultimoandartphunt:register()

--------------------------------------- tp baixo sanguine quest ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(32241, 32490, 7)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30335)
ultimoandartphunt:register()

--------------------------------------- ida sanguine quest ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(34070, 31976, 14)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30336)
ultimoandartphunt:register()

--------------------------------------- volta sanguine quest ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(32954, 32398, 9)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30337)
ultimoandartphunt:register()

--------------------------------------- -1 weretiger quest ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(33042, 32950, 9)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30338)
ultimoandartphunt:register()

--------------------------------------- -2 weretiger quest ------------------------------------------------------
local ultimoandartphunt = MoveEvent()
function ultimoandartphunt.onStepIn(player, item, fromPosition, target, toPosition, isHotkey)
    if not player then return true end
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		    player:teleportTo(Position(33028, 32952, 8)) 
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end
ultimoandartphunt:aid(30339)
ultimoandartphunt:register()




