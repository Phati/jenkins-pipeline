!#bin/bash

echo "************************************"
echo "***** BUILDING DOCKER IMAGE ********"
echo "************************************"

cp target/jenkins-pipeline-0.0.1-SNAPSHOT.jar jenkins/build/


cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache