docker=docker
DVC=theknarf/minecraft-dvc
SERVER=theknarf/minecraft-server
DEFAULT_MEM=2056m

all: dvc server

dvc:
	$(docker) build -t $(DVC) minecraft-dvc/

server:
	$(docker) build -t $(SERVER) minecraft-server/

test-log: test-all log

log:
	$(docker) logs -f minecraft-server

test-all: test-dvc test-server

test-dvc:
	$(docker) run -it --name minecraft-dvc $(DVC)  

test-server:
	$(docker) run -d --volumes-from minecraft-dvc -p 25565:25565 --name minecraft-server $(SERVER) 

console-dvc:
	$(docker) run -it --volumes-from minecraft-dvc ubuntu /bin/bash

help:
	@echo "Make [all|dvc|server|test-log|log|test-all|test-dvc|test-server|console-dvc|help|clean|clean-all]"
	@echo ""
	@echo "all\t\truns dvc and then sever"
	@echo "dvc\t\tbuilds $(DVC)"
	@echo "server\t\tbuilds $(SERVER)"
	@echo "test-log\truns test-all and then logs"
	@echo "log\t\truns docker logs -f on minecraft-sever"
	@echo "test-all\truns up a $(DVC) and a $(SERVER)"
	@echo "test-dvc\truns up a $(DVC)"
	@echo "test-server\truns up a $(SERVER)"
	@echo "console-dvc\thooks into the $(DVC) image"
	@echo "help\t\truns this help"
	@echo "clean\t\tstops minecraft-server and deletes it and minecraft-dvc"

clean:
	$(docker) stop minecraft-server
	$(docker) rm minecraft-server
	$(docker) rm minecraft-dvc

clean-all:
	$(docker) stop $($(docker) ps -a -q)
	$(docker) rm $($(docker) ps -a -q)

