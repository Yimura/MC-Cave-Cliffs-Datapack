#!/bin/bash
FILE=server.jar
if [ ! -f "$FILE" ]; then
    echo "Server jar does not exist in container root directory, moving..."
    mv /$FILE ./
    mv /fabric-server-launch.jar ./
fi
exec java -Xmx6G -Xms6G -jar fabric-server-launch.jar
