local resetChar = TalkAction("/resChar")

function resetChar.onSay(player, words, param)
    local playerId = player:getId()
    player:remove()
    db.query("UPDATE `players` SET `level` = '8', `health` = '185', `healthmax` = '185', `experience` = '4200', `maglevel` = '0', `mana` = '90', `manamax` = '90', `manaspent` = '0', `cap` = '470', `skill_fist` = '10', `skill_fist_tries` = '0', `skill_club` = '10', `skill_club_tries` = '0', `skill_sword` = '10', `skill_sword_tries` = '0', `skill_axe` = '10', `skill_axe_tries` = '0', `skill_dist` = '10', `skill_dist_tries` = '0', `skill_shielding` = '10', `skill_shielding_tries` = '0', `skill_fishing` = '10', `skill_fishing_tries` = '0' WHERE `id` = " .. playerId)
    return false
end

resetChar:register()