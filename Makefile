Docker := ./srcs/docker-compose.yml

all: folders
	docker-compose -f $(Docker) up --build

folders:
	if [ ! -d "/home/kfaouzi/data" ]; then mkdir -p /home/kfaouzi/data/db /home/kfaouzi/data/wp; fi

build:
	docker-compose -f $(Docker) up -d --build

down:
	docker-compose -f $(Docker) down 

re:	down
	docker-compose -f $(Docker) up -d --build

clean: down

fclean:
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	rm -rf /home/kfaouzi/data
	

.PHONY	: all build down re clean fclean