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

Run container

```
docker run -d -p 10000:10000 amzn-hive-image
```

## DockerHub

```
docker run -d opsguruhub/docker-hive:0.0.1
```