#
#	MINECRAFT DVC DOCKERFILE
#

# Base image
FROM ubuntu

# VOLUME
VOLUME ["/minecraft"]

# Update apt-get and install wget
RUN apt-get update -y
RUN apt-get install wget -y

ADD download.sh /minecraft/download.sh 
CMD cd /minecraft && ./download.sh
