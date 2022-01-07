# Repository Organization

There are a number of different ways you can organize repositories under ROS. But some principles we followed:

## Message packages
The files associated with messages, services, and actions are definitions of interfaces. You need to be able to load these files without having to load the nodes that interact with these types, as users of the package should not need to load the nodes in a workspace if the nodes are going to be run on a differen machine. So, you need a separate ROS2 package for the messages.
## Repo-level documentation.
Looking at the [ROS index](https://index.ros.org), there is documentation there for both ROS packages as well as for the repositories that contain those packages. If you have a project that involves both nodes and packages, where do you document the entire project?

I wanted to have a layout like this, but I could not make colcon accept this without constantly adding options to the call:
```
workspace/
  src/
    fqdemo/
      .git/
      README.md
      package.xml
      fqdemo_msgs/
        package.xml
      fqdemo_nodes/
        package.xml
      fqdemo/
        README.md
```
So I went with this more traditional organization. But any documentation at the repo level (where the .git folder is) is not in a package, and will not be included with rosdoc2.

I still don't know how best to organize the repo-level documentation. I suppose the only way is to put it in the metapackage at src/fqdemo/fqdemo but I dislike that the repo has little documentation, and that I have to duplicate the name of the fqdemo directory.