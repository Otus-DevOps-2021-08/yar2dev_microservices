# yar2dev_microservices
yar2dev microservices repository

# ДЗ 18 Введение в kubernetes

В директории kubernetes созданы манифесты:
- post-deployment.yml
- ui-deployment.yml
- comment-deployment.yml
- mongo-deployment.yml

Установлен KS8s на двух нодах.
# *
Процесс установки кластера KS8s с двумя нодами описан при помощи Terraform и Ansible
Для установки использовать:
> cd kubernetes/terraform && terraform apply


![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
