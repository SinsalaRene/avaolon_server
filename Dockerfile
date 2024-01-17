###########################################################
# Dockerfile that builds a avolon Gameserver
###########################################################
FROM cm2network/steamcmd:latest as build_stage

ENV STEAMAPPID 565060
ENV STEAMAPP avorion
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}-dedicated"
ENV ADMIN="76561197975665035"
ENV GALAXYNAME="first_galaxy"

RUN bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
    +login anonymous \
    +app_update "${STEAMAPPID}" \
    +quit

COPY etc/entry.sh "${STEAMAPPDIR}/entry.sh"

FROM build_stage AS bullseye-base

RUN echo "Galaxy Name is: $GALAXYNAME"

WORKDIR ${STEAMAPPDIR}

# CMD ["bash", "server.sh", "--galaxy-name", "first_galaxy", "--admin", "76561197975665035", "--datapath", "/home/steam/.avorion"]
CMD  ["bash", "entry.sh"] 

# 27015/udp = game traffic
# 27015/tcp = rcon traffic
EXPOSE 27000/tcp \
    27003/udp \
    27020/udp \
    27021/udp