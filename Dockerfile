FROM azul/zulu-openjdk:16-jre

EXPOSE 25565

WORKDIR /app

COPY /server .

ENTRYPOINT ["/bin/bash", "start.sh"]
