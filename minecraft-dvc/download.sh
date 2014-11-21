#!/bin/bash
if [[ -z "$MINECRAFT_PATH" ]] ; then
	MINECRAFT_PATH="https://s3.amazonaws.com/Minecraft.Download/versions/1.8/minecraft_server.1.8.jar"
fi
wget -O minecraft_server.jar $MINECRAFT_PATH
chmod a+x minecraft_server.jar
echo "eula=true" > eula.txt
echo "Downloaded $MINECRAFT_PATH"
