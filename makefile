PHONY: up down

venv: venv/touchfile

venv/touchfile: requirements.txt
	test -d venv || python3 -m venv venv
	. venv/bin/activate; pip install -Ur requirements.txt
	touch venv/touchfile

up:
	docker-compose -f docker-compose.yaml up --build -d 

down:
	docker-compose -f docker-compose.yaml down --remove-orphans

test: venv
	. venv/bin/activate; pytest

test-v: venv
	. venv/bin/activate; pytest -vv

format: venv
	. venv/bin/activate; isort . && black .

clean:
	rm -rf venv

ft: format test

restart: down up
