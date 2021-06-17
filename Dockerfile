FROM debian:buster-slim as base

WORKDIR /app

RUN apt update && apt install wget -y && wget https://download.getbukkit.org/spigot/spigot-1.17.jar

FROM azul/zulu-openjdk:16-jre

EXPOSE 25565

WORKDIR /app

COPY --from=base /app/spigot-1.17.jar .
COPY . .

ENTRYPOINT ["/bin/bash", "start.sh"]
