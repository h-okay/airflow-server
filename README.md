1. Create a UID
```bash
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

2. ```cd``` into ~/airflow and run:
```bash
make up
```

3. turn down the server using:
```bash
make down
```
