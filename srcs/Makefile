
include .env


COMPOSE_FILE := docker-compose.yaml

up:
	docker-compose -f $(COMPOSE_FILE) up -d

down:
	docker-compose -f $(COMPOSE_FILE) down --rmi all

restart:
	docker-compose -f $(COMPOSE_FILE) restart

# Logs
logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

.PHONY: up down restart logs
