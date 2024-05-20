#!/bin/bash

echo "*******************************"
echo "***** Running Unit Tests ******"
echo "*******************************"


docker run --rm  -v $PWD:/app -v /root/.m2/:/root/.m2/ -w /app  maven:3.8.3-openjdk-17 "$@"