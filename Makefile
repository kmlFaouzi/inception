Docker := ./srcs/docker-compose.yml

all:
	@printf "Launch configuration ${name}...\n"
	@docker-compose -f $(Docker) up -d

build:
	@printf "Building configuration ${name}...\n"
	@docker-compose -f $(Docker) up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f $(Docker) down

re:	down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f $(Docker) up -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean