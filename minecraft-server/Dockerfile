#
#	MINECRAFT SERVER DOCKERFILE
#

# Base image
FROM ubuntu

# Volume
VOLUME ["/minecraft"]

# Update apt-get and install java
RUN apt-get update -y
Run apt-get install -y openjdk-7-jre-headless

# Expose minecraft port
EXPOSE 25565

WORKDIR /minecraft

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "./minecraft_server.jar"]
