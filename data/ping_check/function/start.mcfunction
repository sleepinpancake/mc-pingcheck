## this is the starting function, run this to start the pingcheck
## additionally you can set how many times you want the pingcheck to run and take the average of it by changing your pingcheck.repeat scoreboard
##
# correct scoreboards
scoreboard players set @s[tag=!pingcheck.repeat] pingcheck.ping 0
execute unless score @s pingcheck.repeat matches -2147483648..2147483647 run scoreboard players set @s pingcheck.repeat 1
execute if score @s[tag=!pingcheck.repeat] pingcheck.repeat matches ..0 run scoreboard players set @s pingcheck.repeat 1
execute if score @s pingcheck.repeat matches 11.. run scoreboard players set @s pingcheck.repeat 10

# setup macro
data modify storage pingcheck:macro uuid.u1 set from entity @s UUID[0]
data modify storage pingcheck:macro uuid.u2 set from entity @s UUID[1]
data modify storage pingcheck:macro uuid.u3 set from entity @s UUID[2]
data modify storage pingcheck:macro uuid.u4 set from entity @s UUID[3]

# run final function
execute if score @s pingcheck.repeat matches 0 run return run function ping_check:finish with storage pingcheck:macro uuid

# set macro
execute unless entity @s[tag=pingcheck.repeat] run function ping_check:setmacro with storage pingcheck:macro uuid


# teleports you up a bit so you dont get stuck, and reset motion
tp @s ~ 500 ~
tp @s @s

# tags
tag @s add pingcheck.launch
tag @s remove pingcheck.waiting

execute if entity @s[tag=pingcheck.repeat] run return 0

# attribute modifiers
attribute @s minecraft:movement_speed modifier add 890708709 -1 add_multiplied_total
attribute @s minecraft:jump_strength modifier add 987807987 -1 add_multiplied_total
attribute @s minecraft:gravity modifier add 897097098 -1 add_multiplied_total
attribute @s minecraft:knockback_resistance modifier add 67986976 10 add_value
attribute @s minecraft:attack_damage modifier add 96882789 -1 add_multiplied_total
attribute @s minecraft:attack_knockback modifier add 65789288 -1 add_multiplied_total

# gamemode
execute if entity @s[gamemode=adventure] run return run scoreboard players set @s pingcheck.gamemode 0
execute if entity @s[gamemode=creative] run return run scoreboard players set @s pingcheck.gamemode 1
execute if entity @s[gamemode=spectator] run return run scoreboard players set @s pingcheck.gamemode 2
scoreboard players set @s pingcheck.gamemode 3