local table = {
   [{1, 5}] = {
    [20] = {items = {{itemid = 3043, count = 3}}, storage = 40100, msg = "You won 3 Crystal Coins for reaching level 20!"},
    [50] = {items = {{itemid = 3043, count = 5}}, storage = 40101, msg = "You won 5 Crystal Coins for reaching level 50!"},
	[100] = {items = {{itemid = 3043, count = 15}}, storage = 40101, msg = "You won 15 Crystal Coins for reaching level 100!"}
   },
   [{2, 6}] = {
    [20] = {items = {{itemid = 3043, count = 3}}, storage = 40100, msg = "You won 3 Crystal Coins for reaching level 20!"},
    [50] = {items = {{itemid = 3043, count = 5}}, storage = 40101, msg = "You won 5 Crystal Coins for reaching level 50!"},
	[100] = {items = {{itemid = 3043, count = 15}}, storage = 40101, msg = "You won 15 Crystal Coins for reaching level 100!"}
   },
   [{3, 7}] = {
    [20] = {items = {{itemid = 3043, count = 3}}, storage = 40100, msg = "You won 3 Crystal Coins for reaching level 20!"},
    [50] = {items = {{itemid = 3043, count = 5}}, storage = 40101, msg = "You won 5 Crystal Coins for reaching level 50!"},
	[100] = {items = {{itemid = 3043, count = 15}}, storage = 40101, msg = "You won 15 Crystal Coins for reaching level 100!"}
   },
   [{4, 8}] = {
    [20] = {items = {{itemid = 3043, count = 3}}, storage = 40100, msg = "You won 3 Crystal Coins for reaching level 20!"},
    [50] = {items = {{itemid = 3043, count = 5}}, storage = 40101, msg = "You won 5 Crystal Coins for reaching level 50!"},
	[100] = {items = {{itemid = 3043, count = 15}}, storage = 40101, msg = "You won 15 Crystal Coins for reaching level 100!"}
   }
}

local rewardLevel = CreatureEvent("RewardLevel")
function rewardLevel.onAdvance(player, skill, oldLevel, newLevel)


    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        
        return true
    
    end

        for voc, x in pairs(table) do
            if isInArray(voc, player:getVocation():getId()) then
            	for level, z in pairs(x) do
            		if newLevel >= level and player:getStorageValue(z.storage) ~= 1 then
                		for v = 1, #z.items do
                			local ret = ", "
                			if v == 1 then
                			ret = ""
                		
                                        end
				        player:addItem(z.items[v].itemid, z.items[v].count)
            				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, z.msg)
            				player:setStorageValue(z.storage, 1)
                		end
                        end
                end
      
   			player:save()

   			return true
   
            end
         end
end

rewardLevel:register()