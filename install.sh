#!/usr/bin/env bash
set -eu

sudo apt update
sudo apt install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential git curl
sudo rosdep init
rosdep update
sudo mkdir -p /usr/src/ros/melodic
sudo chown -R $USER:$USER /usr/src/ros
cd /usr/src/ros/melodic
rosinstall_generator robot --rosdistro melodic --deps --tar > melodic-robot.rosinstall
wstool init -j1 src melodic-robot.rosinstall
rosdep install --from-paths src --ignore-src --rosdistro melodic -y
sudo mkdir -p /opt/ros/melodic
echo 'sudo ./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release  --install-space /opt/ros/melodic -j1' > install.sh
bash ./install.sh
grep -F "source /opt/ros/melodic/setup.bash" ~/.bashrc ||
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
