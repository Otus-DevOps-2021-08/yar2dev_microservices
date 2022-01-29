# yar2dev_microservices
yar2dev microservices repository


# ДЗ 20 Kubernetes. Networks, Storages.
Развернут кластер Kubernetes на Яндек облаке.
Кластер добавлен в колальный конфиг:
> yc managed-kubernetes cluster get-credentials k8s-cluster --external

В облачном кластере развернуто приложение reddit
Для доступа, через единую точку входа, к приложению reddit настроен облачный балансировщик.
*В спецификации указан как type: LoadBalancer*

Установлен Ingress controller (ingress-nginx):
> kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/cloud/deploy.yaml

Создан Ingress для сервиса UI (ui-ingress.yml)

Подключен самоподписанный сертификат TLS:
>IP адрес Ingress контроллера можно узнать:
  kubectl get ingress -n dev
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=1.2.3.4"
  kubectl create secret tls ui-ingress --key tls.key --cert tls.crt -n dev

Созданы сетевые политики Calico (mongo-network-policy.yml)
по принципу все запрещено, что не разрешено явно.
- по умолчанию запрещен весь входящий трафик
- разрешен к mongo от comment и post
- разрешен к comment от ui
- разрешен к post от ui
- разрешен "из вне" к ui

Создано хранилище для базы данных:
1) В яндекс облаке создан диск
>yc compute disk create \
 --name k8s \
 --size 4 \
 --description "disk for k8s"

2) Создан ресурс дискового хранилища в виде PersistentVolume
>mongo-volume.yml
3) Создан запрос на выдачу ресурса - PersistentVolumeClaim
>mongo-claim.yml
4)В деплоименте mongo в разделе volumes заменено
emptyDir: {}
на
persistentVolumeClaim:
  claimName: mongo-pvc

Проверено сохранение данных


# *
Описан объект Secret в виде Kubernetes-манифеста.
>ui-secret.yml
Чтобы не включать генерируемые ключи в yaml файл, создан скрипт *ui-secret-deploy.sh* для генерации и деплоя.
Для корректной написания доменного имени в сертификате, используется сервиc sslip.io


![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
