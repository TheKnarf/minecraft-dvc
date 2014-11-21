#Minecraft docker

Setup:

 - Setup a docker volume container

	docker build -t theknarf/minecraft-dvc minecraft-dvc/

	docker build -t theknarf/minecraft-server minecraft-server/
	
	docker run -it --name minecraft-dvc theknarf/minecraft-dvc

 - Start minecraft from the volume container

	docker run -d --volumes-from minecraft-dvc -p 25565:25565 theknarf/minecraft-server

# Setting up docker volume container with different download link

	docker run -it --name -e MINECRAFT_PATH=http://downloadpath theknarf/minecraft-dvc
