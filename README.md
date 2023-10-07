# Updating "source.list" file of multiple Raspberry Pi with Bash script

When we initially flashed a memory card for a TurtleBot from the [eManual Robotis website](https://emanual.robotis.com/docs/en/platform/turtlebot3/sbc_setup/), it comes with the 'Stretch' version of the operating system. This version is preferred in our laboratory because it already includes ROS (Robot Operating System). However, as mentioned in the [Raspberry forum](https://forums.raspberrypi.com/viewtopic.php?t=356182) it has come to our attention that the mirrors for this 'Stretch' version have recently been relocated from http://raspbian.raspberrypi.org/ or http://archive.raspberrypi.org/ to http://legacy.raspbian.org/

The original `source.list` file found at `/etc/apt` in the Turtlebots comes with these links:

```
deb http://raspbian.raspberrypi.org/raspbian/ stretch main contrib non-free rpi
# Uncomment line below then 'apt-get update' to enable 'apt-get source'
#deb-src http://raspbian.raspberrypi.org/raspbian/ stretch main contrib non-free rpi
```

When trying to `apt update` we'd get the next errors:

```
Ign:1 http://raspbian.raspberrypi.org/raspbian stretch InRelease                                                  
Get:2 http://archive.raspberrypi.org/debian stretch InRelease [25.3 kB]
Get:3 http://packages.ros.org/ros/ubuntu stretch InRelease [4,687 B]
Err:4 http://raspbian.raspberrypi.org/raspbian stretch Release                                                    
  404  Not Found [IP: 93.93.128.193 80]
Get:5 http://packages.ros.org/ros/ubuntu stretch/main armhf Packages [32.2 kB]
Get:6 http://archive.raspberrypi.org/debian stretch/main armhf Packages [192 kB]
Reading package lists... Done                                                                                     
E: The repository 'http://raspbian.raspberrypi.org/raspbian stretch Release' does no longer have a Release file.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

To address this issue, we found a straightforward solution – updating the 'source.list' file, the updated version can be found here with the name `newsourcefile.list`. Given that we have multiple TurtleBots in the laboratory, I decided to create a Bash script. This script simplifies the task of updating 'source.list' across all TurtleBots, ensuring consistency and efficiency in our maintenance procedures.
