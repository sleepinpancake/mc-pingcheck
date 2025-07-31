## this is the ending function, this gets ran whenever the pingcheck ends
## 
# tp back
$data modify storage pingcheck:macro coords.x set from storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4)[0]
$data modify storage pingcheck:macro coords.y set from storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4)[1]
$data modify storage pingcheck:macro coords.z set from storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4)[2]
function ping_check:tp_back with storage pingcheck:macro coords

# set the original repeat score back to what it was
$execute store result score @s pingcheck.repeat run data get storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4)[3]

# remove the storage
$data remove storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4)

# attribute modifiers
attribute @s minecraft:movement_speed modifier remove 890708709
attribute @s minecraft:jump_strength modifier remove 987807987
attribute @s minecraft:gravity modifier remove 897097098
attribute @s minecraft:knockback_resistance modifier remove 67986976
attribute @s minecraft:attack_damage modifier remove 96882789
attribute @s minecraft:attack_knockback modifier remove 65789288

# calc
scoreboard players set #temp1 pingcheck.ping 6
scoreboard players set #temp2 pingcheck.ping 1
scoreboard players operation #temp1 pingcheck.ping *= @s pingcheck.repeat
scoreboard players operation #temp2 pingcheck.ping += #temp1 pingcheck.ping
execute if score @s pingcheck.ping <= #temp1 pingcheck.ping run scoreboard players operation @s pingcheck.ping = #temp2 pingcheck.ping
scoreboard players operation @s pingcheck.ping -= #temp1 pingcheck.ping
scoreboard players operation @s pingcheck.ping /= @s pingcheck.repeat

# gamemode
execute if score @s pingcheck.gamemode matches 0 run gamemode adventure
execute if score @s pingcheck.gamemode matches 1 run gamemode creative
execute if score @s pingcheck.gamemode matches 2 run gamemode spectator
execute if score @s pingcheck.gamemode matches 3 run gamemode survival

# remove leftover tags and scores
scoreboard players reset @s pingcheck.repeat
scoreboard players reset @s pingcheck.gamemode
tag @s remove pingcheck.repeat