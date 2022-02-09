# yar2dev_microservices
yar2dev microservices repository


# ДЗ 21 CI/CD в Kubernetes
- Работа с Helm
- Развертывание Gitlab в Kubernetes
- Запуск CI/CD конвейера в Kubernetes

Работа производилась на Яндекс облаке
### Установлен HELM2
>curl https://get.helm.sh/helm-v2.17.0-linux-amd64.tar.gz | tar zx
 mv linux-amd64/helm /usr/bin/

Запущен tiller сервер
>helm init --service-account tiller

Созданы чарты для reddit приложения
> kubernetes/Charts

Созданы файлы _helpers.tpl в папках templates сервисов ui, post и comment
Опробован tiller plugin
Опробован HELM3
Установлен Gitlab-omnibus
> helm repo add stable https://charts.helm.sh/stable
 helm fetch gitlab/gitlab-omnibus --version 0.1.37 --untar
 Далее ручная правка

Созданы .gitlab-ci.yml файлы для ui, comment, post сервисов и reddit-deploy в соответствии с заданием.

Задание со *
Из пайплайнов ui, post, comment происходит API вызов тригера на запуск reddit-deploy пайплайна https://docs.gitlab.com/ee/ci/triggers/

P.S. Инструкция по ДЗ, к сожалению сильно устарела.

![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
