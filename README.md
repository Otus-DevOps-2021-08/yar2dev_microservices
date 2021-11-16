# yar2dev_microservices
yar2dev microservices repository



# ДЗ 13 Docker-образы Микросервисы

Создана новая структура приложения из четырех контейнеров:
Comment - сервис комментариев
Mongo-db - база данных
Post - сервис постов
UI - веб интерфейс

Сборка с помощью команд:
docker build -t yar2dev/post:1.0 ./post-py
docker build -t yar2dev/comment:1.0 ./comment
docker build -t yar2dev/ui:1.0 ./ui

Запуск:
docker network create reddit
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
docker run -d --network=reddit --network-alias=post yar2dev/post:1.0
docker run -d --network=reddit --network-alias=comment yar2dev/comment:1.0
docker run -d --network=reddit -p 9292:9292 yar2dev/ui:1.0


Запуск с новыми алиасами:
docker run -d --network=reddit --network-alias=post_db_new --network-alias=comment_db_new mongo:latest
docker run -d --network=reddit -e POST_DATABASE_HOST='post_db_new' --network-alias=post_new yar2dev/post:1.0
docker run -d --network=reddit -e COMMENT_DATABASE_HOST='comment_db_new' --network-alias=comment_new yar2dev/comment:1.0
docker run -d --network=reddit -e COMMENT_SERVICE_HOST='comment_new' -e POST_SERVICE_HOST='post_new' -p 9292:9292 yar2dev/ui:1.0


Контейнеры оптимизированы, к базе данных подключен volume reddit_db


![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
