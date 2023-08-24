PHONY: up down

venv: venv/touchfile

venv/touchfile: requirements.txt
	test -d venv || python3 -m venv venv
	. venv/bin/activate; pip install -Ur requirements.txt
	touch venv/touchfile

# Server management
up:
	docker-compose -f docker-compose.yaml up --build -d 

down:
	docker-compose -f docker-compose.yaml down --remove-orphans

restart: down up

# Development environment
test: venv
	. venv/bin/activate; pytest

test-v: venv
	. venv/bin/activate; pytest -vv

format: venv
	. venv/bin/activate; isort . && black .

lint: venv
	. venv/bin/activate; pylint . --recursive=true

ftl: format test lint

clean:
	rm -rf venv
