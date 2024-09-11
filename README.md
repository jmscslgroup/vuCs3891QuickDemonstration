Copyright (c) 2024 Vanderbilt University
All rights reserved
Author: Jonathan Sprinkle, Matt Nice, Matt Bunting

1. Creat your docker image from the internal Dockerfile to this respository:

  docker build --tag rosblank .

2. create the network to stream the bagfile

  docker network create localros
  
3. Start up your docker container, with the name set for easy reuse later

  docker run -it --rm --net localros --name master --env ROS_HOSTNAME=master --env ROS_MASTER_URI=http://master:11311 rosblank

4. start up the other container, which should have access to the ros master effectively

  docker run -it --rm --net localros --name test1 --env ROS_HOSTNAME=ros2ascii --env ROS_MASTER_URI=http://master:11311 ros2ascii bash  

then, inside that container run

  ./ros_entrypoint.sh 
  rosrun ros2ascii radar2ascii
  
