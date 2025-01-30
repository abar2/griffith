#!/bin/bash
docker build -t griffith .
docker rm -f griffith-container &>/dev/null
# docker volume prune -f
docker run -d -p 1935:1935 -p 8080:8080 --name griffith-container griffith
