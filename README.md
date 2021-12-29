# yar2dev_microservices
yar2dev microservices repository

# ДЗ 17 Логирование и распределенная трассировка

- В Докер контейнерах развернута связка ElasticSearch, Fluentd, Kibana (docker/docker-compose-logging.yml).
Для Fluentd создан контейнер на основе Dockerfile с плагинами для ElasticSearch и фильтром Grok, и конфигурационным файлом в папке logging/fluentd.
Для просмотра неструктурированных логов были опробован фильтр с регулярными выражениями и впоследствии заменен фильтром на основе Grok плагина.
- Подключен сервис трейсинга Zipkin в docker-compose-logging.yml
Включено использование Zipkin приложениями ui post и comment

# *
- В fluent.conf добавлен доп. фильтр:
```sh
 grok_pattern service=%{WORD:service} \| event=%{WORD:event} \| path=%{URIPATH:path} \| request_id=%{GREEDYDATA:request_id} \| remote_addr=%{IP:remote_addr} \| method=%{GREEDYDATA:method} \| response_status=%{INT:response_status}
 ```
- Найдена причина подвисания в багнутом приложении:
Как видно в Zipkin, запрос к сервису POST (span=db_find_single_post), занимает более 3 секунд.
В коде приложения 'post-py/post_app.py', по span_name найдена функция find_post, в которой time.sleep(3)


![OTUS Tests](https://github.com/Otus-DevOps-2021-08/yar2dev_microservices/actions/workflows/runtests.yml/badge.svg)
