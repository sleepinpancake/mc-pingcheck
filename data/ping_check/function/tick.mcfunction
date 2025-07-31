# wait time
scoreboard players remove @s[tag=pingcheck.waiting] pingcheck.ping 1
execute if score @s[tag=pingcheck.waiting] pingcheck.ping matches ..0 at @s run return run function ping_check:start

# launch
execute if entity @s[tag=pingcheck.launch] run function ping_check:launch
execute if entity @s[tag=!pingcheck.checking] run return 0

# check y level and add to the ping
execute store result score #ylevel pingcheck.ping run data get entity @s Pos[1]
execute unless score #ylevel pingcheck.ping matches 505.. run return run scoreboard players add @s pingcheck.ping 1

# tags
tag @s remove pingcheck.checking
tag @s add pingcheck.repeat

# repeat one more time
scoreboard players remove @s pingcheck.repeat 1
function ping_check:start
