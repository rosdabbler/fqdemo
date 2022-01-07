# Repository Organization

There are a number of different ways you can organize repositories under ROS. But some principles we followed:

## Message packages
The files associated with messages, services, and actions are definitions of interfaces. You need to be able to load these files without having to load the nodes that interact with these types, as users of the package should not need to load the nodes in a workspace if the nodes are going to be run on a differen machine. So, you need a separate ROS2 package for the messages.
## Repo-level documentation.
Looking at the [ROS index](https://index.ros.org), there is documentation there for both ROS packages as well as for the repositories that contain those packages. If you have a project that involves both nodes and packages, where do you document the entire project? This demo assumes that there needs to be documentation of the combined project, and that this documentation should reside in the repository that contains the individual packages. We want most of the documentation for the project to exist in a single location, so that means we want to use the ROS2 documentation tool [rosdoc2](https://github.com/ros-infrastructure/rosdoc2) for that purpose. Since rosdoc2 is designed for packages only, that implies that the repository holding all of the packages is itself a package. So we make it a meta package.
 