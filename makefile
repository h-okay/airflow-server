PHONY: up down

up: 
	docker-compose -f docker-compose.yaml up -d

down:
	docker-compose -f docker-compose.yaml down --remove-orphans

restart: down up