1. Create a UID
```bash
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

2. ```cd``` into ~/airflow and run:
```bash
docker-compose -f docker-compose.yml up -d
```

3. turn down the server using:
```bash
docker-compose -f docker-compose.yml down -d
```
