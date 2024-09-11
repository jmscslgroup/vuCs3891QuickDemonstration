# syntax=docker/dockerfile:1
FROM ros:noetic-robot

# change the default shell command
SHELL ["/bin/bash", "-c"] 

# this gets run in this image
RUN source ros_entrypoint.sh

# now add this to all future calls
RUN echo "source /ros_entrypoint.sh" >> /etc/bash.bashrc

# create our catkin workspace
RUN mkdir -p catkin_ws/src
# get the 
RUN source /etc/bash.bashrc
# change to our working directory
WORKDIR catkin_ws
RUN source /ros_entrypoint.sh && catkin_make


# clone the packages we need
# get the git package
RUN apt-get -y update
RUN apt-get -y install git

WORKDIR /catkin_ws/src

# go ahead and copy over the bagfile
COPY 2023_09_28_16_19_25_2T3MWRFVXLW056972microstrain_record.bag mytest.bag
COPY playbacktest.launch playbacktest.launch

# you only get one command
CMD roslaunch playbacktest.launch

