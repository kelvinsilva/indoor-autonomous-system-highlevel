#!/bin/bash

# source /home/ubuntu/.bashrc
source /opt/ros/kinetic/setup.bash
source /home/ubuntu/indoor-autonomous-system-highlevel/devel/setup.bash

exit 0 # Uncomment this line to put the device in manual testing mode

roslaunch ians_control ians_ctl.launch & # Spin up Motors and Keyboard

/home/ubuntu/indoor-autonomous-system-highlevel/src/ians_control/server_interface.out &

rosrun rosserial_python serial_node.py /dev/ttyACM0 # Connect to Teensy

sleep 7 # Wait for the RPLidar node to fully boot before calling stop motor
rosservice call stop_motor # Stop LiDAR spinning
