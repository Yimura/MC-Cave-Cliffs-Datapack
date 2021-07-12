FROM debian:buster-slim AS download
WORKDIR /
RUN apt update &&\
apt install wget -y &&\
wget https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.7.4/fabric-installer-0.7.4.jar -O installer.jar

FROM azul/zulu-openjdk:16-jre AS build
WORKDIR /
COPY --from=download installer.jar /
RUN java -Xmx6G -Xms6G -jar installer.jar server -mcversion 1.17.1 -downloadMinecraft

FROM azul/zulu-openjdk:16-jre
EXPOSE 25565
COPY --from=build fabric-server-launch.jar /
COPY --from=build server.jar /
WORKDIR /app
COPY . .
ENTRYPOINT ["/bin/bash", "start.sh"]
