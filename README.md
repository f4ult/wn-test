# wn-test

## описание

Тестовое задание **wn-test** разворачивает с помощью Ansible масштабируемый docker-контейнер с php-приложением, делающим простую выборку из двух таблиц. База данных и балансировщик разворачиваются в отдельных контейнерах.

## предварительные требования

- **сервер\#1** с установленным Ansible
- **сервер\#2** с установленными docker, docker-compose, sshd. Сервер должен принимать сетевые входящие соединения от **сервера\#1** на порт sshd. Учетная запись, к которой будет подключаться **сервер\#1**, должна входить в гуппу docker

## использование

На **сервере\#1**:
1. ```git clone https://github.com/f4ult/wn-test```
2. указать ip и учетную запись **сервера\#2** в файле *ansible-hosts*
3. ```make
make install
```



