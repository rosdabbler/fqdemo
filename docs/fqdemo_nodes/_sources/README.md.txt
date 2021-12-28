# fqdemo_nodes

This is part of an effort **fqdemo** to demonstrate various techniques in setting up a repository for a ROS2 package. This particular package contains a sample node, which uses custom messages from a separate package **fqdemo_msgs**.

## Purpose of the set of *fqdemo* packages

There are a number of methods that more developed ROS2 packages use to support the coding efforts. These include test suites, documentation generators, github actions, etc. It is not really clear (or it was not clear to me anyway) how to implement all of these things. But I know from experience that many of these concepts are useful in code development, so it is better to have them at the beginning rather than as an afterthought at the end.

This package started from the excellent [VSCode ROS2 Workspace Template](https://github.com/athackst/vscode_ros2_workspace) and expanded it to include more concepts.

## Use of this package

**fqdemo-nodes** contains two nodes with the same function, one as a python demo, and the other in c++. Both nodes subscribe to topic '/num_power' of type 'fqdemo_msgs/msg/NumPwrData' and publish a response to '/power_result' of type 'fqdemo_msgs/msg/NumPwrResult' In addition, both publish periodic '/power_result' messages with zero values to just show some activity.

When the topic '/num_power' is received, the nodes generate two results:
- `msg.number` to the power `msg.power`
- the `msg.power` root of `msg.number`

To run the c++ node:
```bash
$ ros2 run fqdemo_nodes subpub
[INFO] [1637782086.635299581] [demo_sub_pub]: Publishing NumPwrResult power:            0, root:            0
[INFO] [1637782088.635272308] [demo_sub_pub]: Publishing NumPwrResult power:            0, root:            0
^C[INFO] [1637782089.372733979] [rclcpp]: signal_handler(signum=2)
```
To run the python node:
```bash
$ ros2 run fqdemo_nodes py_node
[INFO] [1637782149.738643528] [pysubpub]: Publishing to_power: 0.0, to_root: 0.0
[INFO] [1637782150.226708490] [pysubpub]: Publishing to_power: 0.0, to_root: 0.0
```
To demo the nodes, in addition to running one of the above nodes, on a separate terminal send some messsages to the topic **/num_power**:
```bash
$ ros2 topic pub /num_power fqdemo_msgs/msg/NumPwrData "{num: 3.0, power: 4.0}"
publisher: beginning loop
publishing #1: fqdemo_msgs.msg.NumPwrData(num=3.0, power=4.0)

publishing #2: fqdemo_msgs.msg.NumPwrData(num=3.0, power=4.0)
```
In response, the nodes will generate a response like:
```bash
[INFO] [1637782880.736420256] [pysubpub]: I heard fqdemo_msgs.msg.NumPwrData(num=3.0, power=4.0)
[INFO] [1637782880.737321416] [pysubpub]: Publishing to_power: 81.0, to_root: 1.3160740129524924
```
which can also be seen by listening to the topic `/power_result`:
```bash
$ ros2 topic echo /power_result
to_power: 0.0
to_root: 0.0
---
to_power: 81.0
to_root: 1.3160740129524924
```

## Building the documentation
```bash
rosdoc2 build --package-path . \
  --cross-reference-directory doc/_build/cross_reference \
  --doc-build-directory doc/_build/build \
  --output-directory doc/_build/output
```
