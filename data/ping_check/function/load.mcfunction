# scoreboards
scoreboard objectives add pingcheck.gamemode dummy
scoreboard objectives add pingcheck.ping dummy
scoreboard objectives add pingcheck.repeat dummy

# run the loop function
schedule function ping_check:loop 1t append