!#bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"


IMAGE="spring-boot-app"


echo "** Logging in ***"
docker login -u phatijava -p $PASS

echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG phatijava/$IMAGE:$BUILD_TAG

echo "*** Pushing image ***"
docker push phatijava/$IMAGE:$BUILD_TAG