# yar2dev_microservices
yar2dev microservices repository



# ДЗ 14 Docker: сети,docker-compose

Проект запущен в двух сетях, UI не имеет прямого доступа к базе данных.
С помощью docker network connect <network> <container> объединены UI-POST, UI-COMMENT, DB-POST, DB-COMMENT.

Docker-compose
Запущена сборка приложения с помощью Docker-compose.
Параметризирован файл docker-compose.yml, добавлены сетевые алиасы, переменные окружения.
Имя проекта задается с помощью параметра container_name.

Создан docker-compose.override.yml
Менять код приложения можно с помощью монтирования volume.
В запуск puma с ключом --debug -w 2


![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
