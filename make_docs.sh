#!/bin/bash
#
# This script will build the documentation locally for this collection

URL="file://$(pwd)/docs"
rosdoc2 build --debug -o docs -u $URL -p ./fqdemo_msgs
rosdoc2 build --debug -o docs -u $URL -p ./fqdemo_nodes
rosdoc2 build --debug -o docs -u $URL -p ./fqdemo
