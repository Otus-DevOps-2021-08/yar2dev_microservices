# yar2dev_microservices
yar2dev microservices repository


# ДЗ 16 Введение в мониторинг. Системы мониторинга.

- Запущен Prometeus в Docker контейнере
```sh
 docker run --rm -p 9090:9090 -d --name prometheus prom/prometheus
 ```
- Собран Docker образ Prometheus с файлом конфигурации
в папке monitoring/prometheus/ создан Dockerfile и конфигурационный файл prometheus.yml
- При помощи docker-compose.yml развернуты сервисы mongo post_py ui comment и prometheus
```sh
cd docker &&  docker-compose up -d
 ```
# *
- В сервисы в docker-compose.yml и экспортеры в Prometheus: prom/node-exporter, percona/mongodb_exporter, prom/blackbox-exporter
- Создан Makefile для сборки и пушинга образов в докер-хаб
```sh
make build
make push
 ```

![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
