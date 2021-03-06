# test for http://www.n-core.ru/
Site configuration (NGINX) for Docker

Для выполнения тестового задания необходимо сделать следующее.
Нужно написать три 'Dockerfile', из которых можно будет собрать три docker-контейнера (host-1, host-2, host-3).
Запускаться docker-контейнеры должны на одной хост-системе, как, 
или при помощи чего будут запускаться контейнеры (руками из строки, скриптами, docker-compose), не важно.
На хост-системе где будут запускаться docker-контейнеры должна быть установлена ОС linux.
Docker-контейнеры должны быть на базе ОС ubuntu:16.04.

В docker-контейнерах должен запускаться nginx. 
Конфигурационные файлы nginx для каждого docker-контейнера должны находиться на хост-системе, 
что бы изменение конфигурационных файлов nginx не требовало пересборки контейнера.
Файлы 'file01.txt', 'file03.txt', 'file07.txt' доллжны находиться на хост-системе и были доступны из docker-контейнеров, 
лучше из разных директорий для каждого контейнера (пример: host-1: /opt/node1/file01.txt).
Что именно будет внутри файлов не важно.

Доменные имена nginx на разных хостах должны работать в рамках хост-системы где запущены контейнеры, 
и выглядеть следующим образом (dns-сервер разворачивать не нужно):
- host-1: host-1.internal
- host-2: host-2.internal
- host-3: host-3.internal

Все внешние запросы должны приходить на host-1.
Необходимо настроить nginx так, что бы при запросе файла http://host-1.internal/node2/file01.txt, 
файл запрашивался из nginx хоста host-2.
При запросе файла http://host-1.internal/node3/file07.txt, 
файл запрашивался из nginx хоста host-3.
При запросе файла http://host-1.internal/node1/file03.txt,
файл запрашивался из nginx хоста host-1.
