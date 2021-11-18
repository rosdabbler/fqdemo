# fqdemo
Master repository for the full quality demo template

## Installing

```bash
mkdir -p fqdemo-ws/src
cd fqdemo-ws
wget https://raw.githubusercontent.com/rosdabbler/fqdemo/main/fqdemo.repos
vcs import src < fqdemo.repos
```

## Debugging in VS Code

Here's what worked for me:
- save the workspace as a workspace file in VS Code
- build the full workspace (`colcon build`)
- source install/setup.bash
- code <name of workspace file>

Then you can open the debug console from the side panel, and select "(gdb) subpub debug" from fqdemo-nodes folder.
