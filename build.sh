#!/bin/bash
docker build -t movie-server .
docker rm -f movie-server-container &>/dev/null
docker volume prune -f
docker run -d -p 1935:1935 -p 8080:8080 --name movie-server-container movie-server
