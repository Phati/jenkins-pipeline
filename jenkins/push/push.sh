!#bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"


IMAGE="spring-boot-app"


echo "** Logging in ***"
docker login -u phatijava -p $PASS

echo "*** Tagging image ***"
docker tag $IMAGE:$RELEASE_VERSION phatijava/$IMAGE:$RELEASE_VERSION

echo "*** Pushing image ***"
docker push phatijava/$IMAGE:$RELEASE_VERSION
