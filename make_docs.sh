#!/bin/bash
#
# This script will build the documentation locally for this collection

rosdoc2 build --debug -o docs -u file:///home/kent/github/rosdabbler/fqdemo/docs/ -p ./fqdemo_msgs
rosdoc2 build --debug -o docs -u file:///home/kent/github/rosdabbler/fqdemo/docs/ -p ./fqdemo_nodes
rosdoc2 build --debug -o docs -u file:///home/kent/github/rosdabbler/fqdemo/docs/ -p ./fqdemo
