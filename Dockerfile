FROM debian:buster-slim AS build

WORKDIR /

RUN apt update && apt install wget -y && wget https://download.getbukkit.org/spigot/spigot-1.17.jar -O spigot-1.17.jar

FROM azul/zulu-openjdk:16-jre

EXPOSE 25565

COPY --from=build spigot-1.17.jar /

WORKDIR /app

COPY . .

ENTRYPOINT ["/bin/bash", "start.sh"]
