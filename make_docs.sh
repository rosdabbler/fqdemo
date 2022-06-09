#!/bin/bash
#
# This script will build the documentation locally for this collection

URL="file://$(pwd)/docs_output"
#rosdoc2 build --debug -u $URL -p ./fqdemo_msgs
#rosdoc2 build --debug -u $URL -p ./fqdemo_nodes
#rosdoc2 build --debug -u $URL -p ./fqdemo
rosdoc2 build --debug -u $URL -p ./
