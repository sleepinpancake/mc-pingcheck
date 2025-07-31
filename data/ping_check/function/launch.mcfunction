# stop running if player doesnt have the tag
execute unless entity @s[tag=pingcheck.launch] run return run tellraw @s {"text": "ping_check:launch is not the start function, please run /function ping_check:start", "color": "red"}

# tags (remove the tag that triggers this function and add the tag that allows the rest of the function to be ran)
tag @s remove pingcheck.launch
tag @s add pingcheck.checking

# gamemodes (switch to gma is to make sure the player isn't flying anymore, and then switch to gmc to make sure the player doesn't take any damage)
gamemode adventure
gamemode creative

# teleport up, summon end crystal that instantly explodes, teleport back, change gamemode to adventure until ping_check:finish gets ran
tp ~ ~11000 ~
execute at @s summon end_crystal run damage @s 0
tp ~ ~ ~
gamemode adventure