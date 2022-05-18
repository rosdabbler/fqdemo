# fqdemo

This is the metapackage for fqdemo, an exploration of how to structure a ros2 package.

## Purpose

### Documentation
This collection is a demo of the use of [rosdoc2](https://github.com/ros-infrastructure/rosdoc2) to document a collection of packages. The official rosdoc2 is inadequate for this purpose, so we are using [this version.](https://github.com/rkent/rosdoc2) Different branches may be in use, see .github/workflows/docs.yaml for the branch in use (```rosdoc2_branch: "rkent/jinja-templates"``` as of this writing.)

### Testing
The various ROS2 packages also contain tests that demonstrate the use of various ros2 testing features.

## Repo organization

### Package collection
This git repo **fqdemo** is intended as an overall container for a set of related packages, which we will call a 'related packages collection'. The actual functional packages are subdirectories under this repo. 

- fqdemo: ROS2 metapackage that lists the full set of packages in the collection. It also contains documentation of the overall collection in its ```doc``` directory.

- fqdemo_msgs: ROS2 package with message and service definitions that are used by various packages in the collection. This is a separate package from the packages contains nodes, as in an environment with multiple compute environments (such as a robot that uses a desktop or cloud computer for more extensive calculations), the message and service definitions would be needed by both the local (robot) and the remote(cloud or desktop) environments, but the nodes themselves may have different setup needs. So it might not be possible, for example, to compile the cloud nodes on the robot, so we need separate packages for the different environments.

- fqdemo_nodes: Contains compute nodes. There may be many of these in a real, more complex collection.

Typical ros2 workspace configuration would look like this:

```
workspace/
  src/
    fqdemo/
      fqdemo/
      fqdemo_msgs/
      fqdemo_nodes/
    some_other_unrelated_package_or_collection/
```

### Additional directories
The ```docs``` and ```.github``` directories contain files necessary to the automatic publishing of collection documentation on github pages.

