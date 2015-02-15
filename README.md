# docker-logstash

This repo container an dockerfile for creating a basic logstash listener.

It includes a basic config file which reads from stdin and write to stdout
additionally it can read from the containers logs on a host system if
the folder is mounted into the container

# Pre-requisites 
- Docker needs to be installed on the machine building the container image

# Building 
```
docker build -t logger-image .
```


# Basic Usage

```
docker run -v /var/lib/docker:/data:ro logger-image 
```

# Specify config
```
docker run -v <config_folder>:/app/logstash/conf.d:ro logger-image
```
