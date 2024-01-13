taskOptions = {
	bonusReward = 65001, -- storage bonus reward
	bonusRate = 2, -- rate bonus reward
	taskBoardPositions = {
        {x = 32358, y = 32239, z = 7},
        {x = 32362, y = 32239, z = 7},
    },
	selectLanguage = 1 -- options: 1 = pt_br or 2 = english
}

task_pt_br = {
	exitButton = "Fechar",
	confirmButton = "Validar",
	cancelButton = "Anular",
	returnButton = "Voltar",
	title = "Quadro De Missões",
	missionError = "Missão esta em andamento ou ela já foi concluida.",
	missionErrorTwo = "Você concluiu a missão",
	missionErrorTwoo = "\nAqui estão suas recompensas:",
	choiceText = "- Experiência: ",
	messageAcceptedText = "Você aceitou essa missão!",
	messageDetailsText = "Detalhes da missão:",
	choiceMonsterName = "Nome: ",
	choiceMonsterKill = "Abates: ",
	choiceEveryDay = "Repetição: Todos os dias",
	choiceRepeatable = "Repetição: Sempre",
	choiceOnce = "Repetição: Apenas uma vez",
	choiceReward = "Recompensas:",
	messageAlreadyCompleteTask = "Você já concluiu essa missão.",
	messageNaoPodeTask = "Conclua a missão anterior para liberar esta.",
	choiceCancelTask = "Você cancelou essa missão",
	choiceCancelTaskError = "Você não pode cancelar essa missão, porque ela já foi concluída ou não foi iniciada.",
	choiceBoardText = "Escolha uma missão e use os botões abaixo:",
	choiceRewardOnHold = "Resgatar Prémio",
	choiceDailyConclued = "Diária Concluída",
	choiceConclued = "Concluída",
	messageTaskBoardError = "O quadro de missões esta muito longe ou esse não é o quadro de missões correto.",
	messageCompleteTask = "Você terminou essa missão! \nRetorne para o quadro de missões e pegue sua recompensa.",
}

taskConfiguration = {
{name = "Rotworm", color = 40, total = 300, type = "once", storage = 190000, storagecount = 190001, 
rewards = {
		{3043, 5}, -- 50k
		{"exp", 100000},
	},
creatures = {"rotworm", "carrion worm"},
},

{name = "Minotaur", color = 40, total = 750, type = "once", storage = 190002, storagecount = 190003, 
rewards = {
		{5890, 100}, -- chicken feather
		{5902, 50}, -- minotaur leather
		{3374, 1}, -- soldier helmet
		{"exp", 100000}, -- EXP
	},
creatures = {"minotaur", "minotaur guard", "minotaur archer", "minotaur mage"},
},

{name = "Quaras", color = 40, total = 500, type = "once", storage = 190004, storagecount = 190005, 
rewards = {
		{5945, 1}, -- Coral Comb
		{3043, 5}, -- 50k
		{"exp", 200000}, -- EXP
	},
creatures = {"quara predator scout", "quara pincher scout", "quara mantassin scout", "quara hydromancer scout", "quara constrictor scout"},	
},

{name = "Dragon", color = 40, total = 500, type = "once", storage = 190006, storagecount = 190007, 
rewards = { 
		{5887, 1}, -- Piece of Royal Steel
		{5880, 100}, -- Iron Ore
		{"exp", 500000}, -- EXP
	},
},

{name = "Vampire", color = 40, total = 500, type = "once", storage = 190008, storagecount = 190009, 
rewards = { 
		{5905, 30}, -- Vampire Dust
		{3043, 10}, -- 100k
		{"exp", 1000000}, -- EXP
	},
},

{name = "Giant Spider", color = 40, total = 750, type = "once", storage = 190010, storagecount = 190011, 
rewards = { 
		{12320, 1}, -- Sweet Smelling Bait
		{5886, 10}, -- Spool of Yarn
		{"exp", 1000000}, -- EXP
	},
},

{name = "Wyrm", color = 40, total = 500, type = "once", storage = 190012, storagecount = 190013, 
rewards = { 
		{5884, 1}, -- Spirit Container
		{3043, 25}, -- 250k
		{"exp", 1000000}, -- EXP
	},
},

{name = "Hydra", color = 40, total = 500, type = "once", storage = 190014, storagecount = 190015, 
rewards = { 
		{5899, 100}, -- Turtle Shells
		{5925, 100}, -- Hardened Bones
		{"exp", 1000000}, -- EXP
	},
},

{name = "Dragon Lord", color = 40, total = 1500, type = "once", storage = 190016, storagecount = 190017, 
rewards = { 
		{5919, 1}, -- Dragon Claw
		{"exp", 1500000}, -- EXP
	},
},

{name = "Serpent Spawn", color = 40, total = 1000, type = "once", storage = 190018, storagecount = 190019, 
rewards = { 
		{5893, 50}, -- Perfect Behemoth Fang
		{5876, 50}, -- Lizard Leather
		{"exp", 1000000}, -- EXP
	},
},

{name = "Grim Reaper", color = 40, total = 750, type = "once", storage = 190020, storagecount = 190021, 
rewards = { 
		{5922, 50}, -- Holy Orchid
		{3006, 1}, -- Ring of The Sky
		{3386, 1}, -- Dragon Scale Mail
		{3436, 1}, -- Medusa Shield
		{3382, 1}, -- Crown Legs
		{"exp", 1000000}, -- EXP
	},
},

{name = "Diremaw", color = 40, total = 750, type = "once", storage = 190022, storagecount = 190023, 
rewards = { 
		{5910, 50}, -- Green piece of cloth
		{5911, 50}, -- Red piece of cloth
		{"exp", 1000000}, -- EXP
	},
},

{name = "Glooth", color = 40, total = 1500, type = "once", storage = 190024, storagecount = 190025, 
rewards = { 
		{5894, 10}, -- Bat wing
		{5913, 20}, -- Brown Piece of Cloth
		{5878, 50}, -- Minotaur Leather
		{5921, 30}, -- Heaven Blossom
		{"exp", 1000000}, -- EXP
	},
creatures = {"glooth bandit", "glooth brigand"},	
},

{name = "Demon", color = 40, total = 666, type = "once", storage = 190026, storagecount = 190027, 
rewards = { 
		{12905, 1}, -- Dread Doll
		{3043, 50}, -- 500k
		{"exp", 1500000}, -- EXP
	},	
},

{name = "Asuras", color = 40, total = 2500, type = "once", storage = 190028, storagecount = 190029, 
rewards = { 
		{14143, 1}, -- Four-Leaf Clover
		{"exp", 2500000}, -- EXP
	},
creatures = {"dawnfire asura", "frost flower asura", "midnight asura", "true dawnfire asura", "true frost flower asura"
, "true midnight asura"},	
},

{name = "Skeleton Elite Warrior", color = 40, total = 1000, type = "once", storage = 190030, storagecount = 190031, 
rewards = { 
		{16244, 1}, -- Music Box
		{"exp", 1000000}, -- EXP
	},
creatures = {"skeleton elite warrior", "undead elite gladiator"},	
},

{name = "Guzzlemaw", color = 40, total = 1000, type = "once", storage = 190032, storagecount = 190033, 
rewards = { 
		{20274, 1}, -- Nightmare Horn
		{"exp", 1000000}, -- EXP
	},
},

{name = "Elf de Gelo", color = 40, total = 1500, type = "once", storage = 190034, storagecount = 190035, 
rewards = { 
		{3043, 40}, -- 400k
		{"exp", 1000000}, -- EXP
	},
creatures = {"crazed winter rearguard", "crazed winter vanguard"},	
},

{name = "Elf de Fogo", color = 40, total = 1500, type = "once", storage = 190036, storagecount = 190037, 
rewards = { 
		{3043, 40}, -- 400k
		{"exp", 1000000}, -- EXP
	},
creatures = {"crazed summer rearguard", "crazed summer vanguard"},	
},

{name = "Lost Souls", color = 40, total = 1500, type = "once", storage = 190038, storagecount = 190039, 
rewards = { 
		{3043, 50}, -- 500k
		{"exp", 1500000}, -- EXP
	},
creatures = {"flimsy lost soul", "freakish lost soul", "mean lost soul"},	
},

{name = "Goanas", color = 40, total = 1000, type = "once", storage = 190040, storagecount = 190041, 
rewards = { 
		{30403, 1}, -- Theurgic Amulet
		{"exp", 1500000}, -- EXP
	},
creatures = {"young goanna", "adult goanna"},	
},

{name = "Girtabilu", color = 40, total = 1800, type = "once", storage = 190042, storagecount = 190043, 
rewards = { 
		{12509, 1}, -- Scorpion Sceptre
		{"exp", 1500000}, -- EXP
	},
creatures = {"girtablilu warrior", "venerable girtablilu"},	
},

{name = "Bashmus", color = 40, total = 1000, type = "once", storage = 190044, storagecount = 190045, 
rewards = { 
		{30343, 1}, -- Enchanted Sleep Shawl
		{"exp", 2500000}, -- EXP
	},
creatures = {"bashmu", "juvenile bashmu"},	
},

{name = "Energetic Book", color = 40, total = 2000, type = "once", storage = 190046, storagecount = 190047, 
rewards = { 
		{3043, 150}, -- 1.5kk
		{"exp", 5000000}, -- EXP
	},
creatures = {"energetic book", "knowledge elemental", "brain squid"},	
},

{name = "Icecold Book", color = 40, total = 2000, type = "once", storage = 190048, storagecount = 190049, 
rewards = {   
		{3043, 150}, -- 1.5kk
		{"exp", 5000000}, -- EXP
	},
creatures = {"icecold book", "animated feather", "squid warden"},	
},

{name = "Burning Book", color = 40, total = 2000, type = "once", storage = 190050, storagecount = 190051, 
rewards = { 
		{3043, 150}, -- 1.5kk
		{"exp", 5000000}, -- EXP
	},
creatures = {"burning book", "guardian of tales", "rage squid"},	
},

{name = "Rotten Wasteland", color = 40, total = 4000, type = "once", storage = 190052, storagecount = 190053, 
rewards = { 
		{3043, 200}, -- 2kk
		{"exp", 10000000}, -- EXP
	},
creatures = {"rotten golem", "branchy crawler", "mould phantom"},
},

{name = "Furious Crater", color = 40, total = 4000, type = "once", storage = 190054, storagecount = 190055, 
rewards = { 
		{3043, 200}, -- 2kk
		{"exp", 10000000}, -- EXP
	},
creatures = {"vibrant phantom", "courage leech", "cloak of terror"},
},

{name = "Ebb and Flow", color = 40, total = 4000, type = "once", storage = 190056, storagecount = 190057, 
rewards = { 
		{3043, 200}, -- 2kk
		{"exp", 10000000}, -- EXP
	},
creatures = {"bony sea devil", "turbulent elemental", "capricious phantom"},
},

{name = "Claustrophobic Inferno", color = 40, total = 4000, type = "once", storage = 190058, storagecount = 190059, 
rewards = { 
		{3043, 200}, -- 2kk
		{"exp", 10000000}, -- EXP
	},
creatures = {"infernal demon", "brachiodemon", "infernal phantom"},
},
}

squareWaitTime = 5000
taskQuestLog = 65000 -- A storage so you get the quest log
dailyTaskWaitTime = 20 * 60 * 60 

function Player.getCustomActiveTasksName(self)
	local player = self
	if not player then
		return false
	end
local tasks = {}
	for i, data in pairs(taskConfiguration) do
		if player:getStorageValue(data.storagecount) ~= -1 then
		tasks[#tasks + 1] = data.name
		end
	end
	return #tasks > 0 and tasks or false
end


function getTaskByStorage(storage)
	for i, data in pairs(taskConfiguration) do
		if data.storage == tonumber(storage) then
			return data
		end
	end
	return false
end

function getTaskByMonsterName(name)
	for i, data in pairs(taskConfiguration) do
		if data.name:lower() == name:lower() then
			return data
		end
	end
	return false
end

function Player.startTask(self, storage)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if player:getStorageValue(taskQuestLog) == -1 then
		player:setStorageValue(taskQuestLog, 1)
	end
	player:setStorageValue(storage, player:getStorageValue(storage) + 1)
	player:setStorageValue(data.storagecount, 0)
	return true
end

function Player.canStartCustomTask(self, storage)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if data.type == "daily" then
		return os.time() >= player:getStorageValue(storage)
	elseif data.type == "once" then
		return player:getStorageValue(storage) == -1
	elseif data.type[1] == "repeatable" and data.type[2] ~= -1 then
		return player:getStorageValue(storage) < (data.type[2] - 1)
	else
		return true
	end
end

function Player.endTask(self, storage, prematurely)
	local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	if prematurely then
		if data.type == "daily" then
			player:setStorageValue(storage, -1)
		else
			player:setStorageValue(storage, player:getStorageValue(storage) - 1)
	end
	else
		if data.type == "daily" then
			player:setStorageValue(storage, os.time() + dailyTaskWaitTime)
		end
	end
	player:setStorageValue(data.storagecount, -1)
	return true
end

function Player.hasStartedTask(self, storage)
	local player = self
	if not player then
		return false
	end

local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	return player:getStorageValue(data.storagecount) ~= -1
end


function Player.getTaskKills(self, storage)
	local player = self
	if not player then
		return false
	end
	return player:getStorageValue(storage)
end

function Player.addTaskKill(self, storage, count)
local player = self
	if not player then
		return false
	end
	local data = getTaskByStorage(storage)
	if data == false then
		return false
	end
	local kills = player:getTaskKills(data.storagecount)
	if kills >= data.total then
		return false
	end
	if kills + count >= data.total then
		if taskOptions.selectLanguage == 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, task_pt_br.messageCompleteTask)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Task System] You have finished this task! To claim your rewards, return to the quest board and claim your reward.")
		end
		return player:setStorageValue(data.storagecount, data.total)
	end
		player:say('Task: '..data.name ..' - ['.. kills + count .. '/'.. data.total ..']', TALKTYPE_MONSTER_SAY)
		return player:setStorageValue(data.storagecount, kills + count)
end


function Player.getCustomStartedTasks(self, storage)
	local tmp = {}
	local player = self
	for i, data in pairs(taskConfiguration) do
		if player:hasStartedTask(data.storage) then
			tmp[#tmp + 1] = i
		end
	end
	return tmp
end
