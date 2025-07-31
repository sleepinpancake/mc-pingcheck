# run the tick function as a player
execute as @a[tag=pingcheck.checking] at @s run function ping_check:tick
execute as @a[tag=pingcheck.launch] at @s run function ping_check:tick
execute as @a[tag=pingcheck.waiting] at @s run function ping_check:tick
