
include ./srcs/.env

DOCKER_DIR = ./srcs
DOCKER_COMPOSE = /docker-compose.yaml

all: create_volume build

build:
	docker compose -f ${DOCKER_DIR}${DOCKER_COMPOSE} -p inception up --build

up:
	docker compose -f ${DOCKER_DIR}${DOCKER_COMPOSE} -p inception up

down:
	docker compose -f ${DOCKER_DIR}${DOCKER_COMPOSE} -p inception down

stop:
	docker compose -f ${DOCKER_DIR}${DOCKER_COMPOSE} -p inception stop

start:
	docker compose -f ${DOCKER_DIR}${DOCKER_COMPOSE} -p inception start

down_vol:
	docker compose -f ${DOCKER_DIR}${DOCKER_COMPOSE} -p inception down -v

erase:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null

create_volume:
	mkdir -p $(VOLUMES_PATH)/wordpress
	mkdir -p $(VOLUMES_PATH)/mariadb

delete_volumes:
	rm -rf $(VOLUMES_PATH)/wordpress
	rm -rf $(VOLUMES_PATH)/mariadb

purge:
	docker system prune -f

fclean: 
	delete_volumes erase purge