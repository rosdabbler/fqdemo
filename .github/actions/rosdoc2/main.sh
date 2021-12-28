#!/bin/bash

set -x

BASE_URL="https://rosdabbler.github.io/fqdemo"

echo "This is main.sh for the rosdoc2 action"
echo "rosdoc2 repo is $INPUT_ROSDOC2_REPO"

git clone $INPUT_ROSDOC2_REPO /tmp/rosdoc2
git -C /tmp/rosdoc2 checkout $INPUT_ROSDOC2_BRANCH
python -m pip install /tmp/rosdoc2

echo "rosdoc2 installed, running"

cd $GITHUB_WORKSPACE

rosdoc2 build --debug -o docs -u $BASE_URL -p ./fqdemo_msgs
rosdoc2 build --debug -o docs -u $BASE_URL -p ./fqdemo_nodes
rosdoc2 build --debug -o docs -u $BASE_URL -p ./
