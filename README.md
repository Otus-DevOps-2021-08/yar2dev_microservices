# yar2dev_microservices
yar2dev microservices repository


# ДЗ 15 Устройство Gitlab CI. Построение процесса непрерывной поставки

- Развернут Gitlab и Gitlab-runner в docker контейнерах
- Определен CI/CD Пайплайн в файле .gitlab-ci.yml
- Runner зарегистрирован по токену проекта
- В Пайплайн добавлены тесты и окружения dev staging и production
- Добавлено создание динамического окружение для для каждой ветки

# *
- Автоматизация развертывания GitLab & Автоматизация развёртывания GitLab Runner
В папке gitlab-ci созданы папки terraform и ansible с ролями docker и gitlab.
Для автоматичкского развертывания контейнеров с GitLab, GitLab-Runner
и последующей автоматичской регистрацией shared-runner выполнить команду:
```sh
cd terraform
terraform apply
```

- Запуск reddit в контейнере
Сборка reddit  и и запуск в контейнере осуществляется через dockerfile и .gitlab-ci.yml

![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
