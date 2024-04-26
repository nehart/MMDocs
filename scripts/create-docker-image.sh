#!/bin/bash

cd $CI_PROJECT_DIR

docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN registry.ans.co.at

docker build -f dockerfile -t registry.ans.co.at/templates/mmdocs/mmdocs:$CI_COMMIT_TAG .
docker push registry.ans.co.at/templates/mmdocs/mmdocs:$CI_COMMIT_TAG

docker build -f dockerfile -t registry.ans.co.at/templates/mmdocs/mmdocs:latest .
docker push registry.ans.co.at/templates/mmdocs/mmdocs:latest
