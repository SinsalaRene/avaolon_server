# Avolon Server

## Users

https://www.citadelservers.com/client/knowledgebase/232/Avorion-Startup-Guide-Linux.html
https://developer.valvesoftware.com/wiki/SteamCMD#Linux


docker run -it --name=steamcmd cm2network/steamcmd bash

./steamcmd.sh +force_install_dir /home/steam/avalon +login anonymous +app_update 565060 validate

## Running compose

docker-compose up

## TODO

Make some configs more easy to set in compose yaml. Like world-name so i can reference idfferent server-file folders?