FILE=spigot-1.17.jar
if [ ! -f "$FILE" ]; then
    echo "$FILE server jar does not exist in container root directory, moving..."
    mv /$FILE ./
fi
java -Xmx6G -Xms6G -jar spigot-1.17.jar nogui
