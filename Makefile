# include .env

# COMPOSE_FILE := docker-compose.yaml

# up:
# 	docker-compose -f $(COMPOSE_FILE) up -d

# down:
# 	docker-compose -f $(COMPOSE_FILE) down --rmi all

# restart:
# 	docker-compose -f $(COMPOSE_FILE) restart

# # Logs
# logs:
# 	docker-compose -f $(COMPOSE_FILE) logs -f

# .PHONY: up down restart logs

include ./srcs/.env

DOCKER_DIR := ./srcs
DOCKER_COMPOSE := /docker-compose.yaml
PROJECT_NAME := inception

WORDPRESS_VOLUME := $(VOLUMES_PATH)/wordpress
MARIADB_VOLUME := $(VOLUMES_PATH)/mariadb

DOCKER_COMPOSE_CMD := docker compose -f $(DOCKER_DIR)$(DOCKER_COMPOSE) -p $(PROJECT_NAME)

.PHONY: all initVolume deleteVolumes build up down stop start down_vol erase purge fclean

all: initVolume build start

initVolume:
	mkdir -p $(WORDPRESS_VOLUME)
	mkdir -p $(MARIADB_VOLUME)

deleteVolumes:
	rm -rf $(WORDPRESS_VOLUME)
	rm -rf $(MARIADB_VOLUME)

build up down stop start down_vol:
	$(DOCKER_COMPOSE_CMD) $@

erase:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null

purge:
	docker system prune -f

fclean: deleteVolumes erase purge

start: up
