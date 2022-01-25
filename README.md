# yar2dev_microservices
yar2dev microservices repository

# ДЗ 19 Kubernetes. Запуск кластера и приложения. Модель безопасности

Установлены:
- kubectl
- Minikube

Созданы Deployment и Service манифесты для компонентов приложения reddit

Создан манифест для dev namespace

В веб консоли Яндекс облака развернут Managed Service for kubernetes.

В облачном кластере развернуто приложение reddit
![k8s-reddit](https://github.com/yar2dev/imgs/blob/main/yc-k8s-reddit.png?raw=true)

# *
Создан Terraform манифест для разворачивания кластера Managed Service for kubernetes в Яндекс облаке

>cd /kubernetes/terraform-yc
terraform apply

Для запуска dashboard:
Выполнить:
>kubectl apply -f /kubernetes/reddit/dashboard

После получить токен:
>kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

Запустить прокси
>kubectl proxy

И перейти по адресу:
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

Использовать полученный токен.

![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
