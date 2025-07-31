# mc-pingcheck
A datapack to check any player's ping to the server.

## notes
- to run the pingcheck you run the function `ping_check:start`
- after running the pingcheck, the players ping gets stored in the `pingcheck.ping` scoreboard
- if you change the `pingcheck.repeat` scoreboard, the check will run that amount of times and take the average of the results
- it's recommended to set `pingcheck.repeat` to atleast 5 for more accuracy
- you can give a player the `pingcheck.waiting` tag, that will turn the `pingcheck.ping` scoreboard into a countdown that runs `ping_check:start` when it hits 0
- ping is stored in ticks so there is 50ms accuracy


This is my first time uploading something on github and i haven't made a lot of datapacks, please report any bugs or tell me what i should improve upon.
