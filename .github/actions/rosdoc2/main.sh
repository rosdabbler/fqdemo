#!/bin/bash

echo "This is main.sh for the rosdoc2 action"

git clone $INPUT_ROSDOC2_REPO rosdoc2

git -C rosdoc2 checkout $INPUT_ROSDOC2_BRANCH

python -m pip install ./rosdoc2

echo "rosdoc2 installed, running"

cd $GITHUB_WORKSPACE

echo "workspace ls\n $(ls)"

mkdir -p /results/build
mkdir -p /results/cr
mkdir -p /results/output

rosdoc2 build --debug -d /results/build -c /results/cr -o /results/output -p ./
