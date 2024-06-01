#!/bin/bash

echo "*******************************"
echo "***** Running Unit Tests ******"
echo "*******************************"

WORKSPACE=/var/lib/jenkins/workspace/spring-boot-app
chmod 777 /var/run/docker.sock
docker run --rm  -v $WORKSPACE:/app -v /root/.m2/:/root/.m2/ -w /app  maven:3.8.3-openjdk-17 "$@"
