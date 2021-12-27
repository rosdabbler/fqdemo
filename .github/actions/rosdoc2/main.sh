#!/bin/bash

echo "This is main.sh for the rosdoc2 action"

git clone $INPUT_ROSDOC2_REPO rosdoc2

git -C rosdoc2 checkout $INPUT_ROSDOC2_BRANCH

python -m pip install ./rosdoc2
