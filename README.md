# Docker-hive

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