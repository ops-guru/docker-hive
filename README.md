# Docker-hive

EMR 5.25.0 cluster single node hadoop docker image. With Amzn linux, Hadoop 2.8.5 and Hive 2.3.5

## Prerequisites
Tested with

- Docker 18.09.2
- bash 3.2.57

## Build

Clone repo

```
git clone git@github.com:ops-guru/docker-hive.git
```

Create image

```
docker build . -t amzn-hive-image
```

## DockerHub

Image available on DockerHub

```
docker run -d opsguruhub/docker-hive:0.0.1
```

## Test

Run image

```
CONTAINER_ID=$(docker run -d opsguruhub/docker-hive)
```

Start beeline client and connect to hive

```
docker exec -it $CONTAINER_ID /usr/local/hadoop/hive/bin/beeline -u jdbc:hive2://localhost:10000 -n "" -p ""
```

Now you should be able to query

```
0: jdbc:hive2://localhost:10000> show databases;
+----------------+
| database_name  |
+----------------+
| default        |
+----------------+
1 row selected (1.921 seconds)
```