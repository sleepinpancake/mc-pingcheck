# save original position
$data modify storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4) set from entity @s Pos

# save how many times you will be checked
$data modify storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4) append value 1
$execute store result storage pingcheck:macro data.$(u1)$(u2)$(u3)$(u4)[3] int 1 run scoreboard players get @s pingcheck.repeat