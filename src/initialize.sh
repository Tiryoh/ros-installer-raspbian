#!/bin/sh -e

sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -Ls https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | apt-key add -
rosdep init
su - `logname` -c 'rosdep update; rosdep install --from-paths /opt/ros/melodic --ignore-src --rosdistro melodic --os=debian:buster -y --skip-keys="collada-dom ros-melodic-libuvc libuvc"; echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc'
rm -rf /opt/ros/melodic/initialize.sh
