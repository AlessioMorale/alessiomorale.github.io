---
id: 905
description: Slammer, a rover robot project created as a learning platform for mobile robots
title: Slammer
date: 2021-06-17T01:02:29+02:00
guid: https://alessiomorale.com/wordpress/?page_id=905
image:
  title: 2021/06/IMG_20210114_224713-1.jpg
  thumb: 2021/06/IMG_20210114_224713-1.jpg
  homepage: 2021/06/IMG_20210114_224713-1.jpg
tags:
  - robot
  - ROS
  - slammer
  - uNav
  - uNav2
  - RTabMap

---


This project started a few years ago as my learning platform for robotic in general and ROS.

At that time i was working mostly with drones, but I realised that testing things like mapping and navigation would have been much more harder and almost impossible indoor. For this reason, I started learning the basics of rovers and mobile robotics. Thus Slammer was born.
<!--more-->
- [Slammer tech specs](#slammer-tech-specs)
  - [Mechanical and electrical specs](#mechanical-and-electrical-specs)
  - [Electronics and sensors](#electronics-and-sensors)
  - [Software](#software)
- [ROS](#ros)
- [Teleop](#teleop)
  - [Updated ExpressLRS Lora 2.4GHz Teleop](#updated-expresslrs-lora-24ghz-teleop)
  - [Old DS4DRV bluetooth joypad](#old-ds4drv-bluetooth-joypad)
- [Video](#video)
- [Additional pictures](#additional-pictures)

![Slammer](/images/2021/10/IMG_20211008_183528.jpg)

In its initial configuration it used four gearmotors for its locomotion using the [uNav2 prototype](./unav2). It was handling the feedback (encoders) on two motors only, with the two others (identical) simply wired in parallel. Not exactly optimal.

Recently I update the mechanical part using two planetary gear motors and a system of pulleys and belts to link front and rear wheels on each side.

![Slammer @ Maker Faire EU 2021](/images/2021/10/IMG_20210425_164140.jpg)

The control board is still my trusted [UNAV2 prototype](./unav2) (links to the [hardware](https://github.com/AlessioMorale/unav2_hardware/tree/master/integrated_board), [firmware](https://github.com/AlessioMorale/unav2_stm32) and [ROS drivers](https://github.com/AlessioMorale/unav2_ros)).

![uNav2](/images/2021/06/DSC8028.jpg)

## Slammer tech specs

### Mechanical and electrical specs

- Size(LxWxH): 32 x 20 x 15 cm
- Ground clearance: 4cm
- Weight: 2 Kg
- Motors: 2x 28mm planetary gearmotors - 10W - 3Nm (stall torque)
- Battery: 4S Li-ion battery pack with integrated balancer/protection, 3000mAh (replacement part for vacuum robots)
- Chassis: 3D printed, assembled using two 300mm 20x20 modular profiles as main carrier frame (parts design to be uploaded soon)

### Electronics and sensors

- [NVIDIA Jetson Nano](https://www.nvidia.com/object/embedded-systems-dev-kits-modules.html).
- [Unav2](https://blog.alessiomorale.com/unav2) motor controller.
- [Intel Realsense D435](https://www.intelrealsense.com/depth-camera-d435/) depth camera
- [Slamtech A1 LIDAR](https://www.slamtec.com/en/Lidar/A1)
- [Bosch Sensortec BNO055 based imu](https://www.bosch-sensortec.com/products/smart-sensors/bno055/)
- [Express LRS based teleop over Lora](https://github.com/ExpressLRS/ExpressLRS) using custom CRSF driver [ros-crsf-driver](https://github.com/AlessioMorale/ros_crsf_driver)
- [Littlewire](https://littlewire.github.io/) based WS281x smart lights based notification system, using custom [ROS signalling driver](https://github.com/AlessioMorale/ros_signalling)

### Software

- main [ROS robot packages](https://github.com/AlessioMorale/slammer_rover)
- ROS Melodic running on Jetpack 32.5 based [Docker images](https://github.com/AlessioMorale/jetson-ros-perception)
- OpenCV, PCL & librealsense compiled to use CUDA acceleration and offload the CPU.
- Custom [Docker](https://github.com/AlessioMorale/jetson-ros-rtabmap) image running RTABMap & ROS wrappers recompiled to use the above libraries
- [complete system](https://github.com/AlessioMorale/slammer_rover) can be started using [docker-compose](https://github.com/AlessioMorale/slammer_rover/tree/master/docker).

![Jetson Nano](/images/2021/06/IMG_20210321_235444.jpg)

## ROS

The system is currently based on ROS Melodic.

One of my requisites is to be able to use as much as possible the available GPU to free the CPU for tasks that cannot take advantage of it. For this reason I recompiled from sources both the Realsense drivers, OpenCV and part of RTABMap prerequisites (PCL).

As rebuilding the software onboard is a very slow process I managed to set up a series of Docker containers and their related CI process so that they are automatically built using Github actions (for example [ROS + RTABMap](https://github.com/AlessioMorale/jetson-ros-rtabmap) repository).

The ROS workspace used to run Slammer is available in my Github, [here](https://github.com/AlessioMorale/rover_launch_files). The docker folder contains several docker compose files used to start the various software components one by one, everything completely dockerised.

## Teleop

### Updated ExpressLRS Lora 2.4GHz Teleop

As part of the changes to use the robot at the last Maker Faire in Rome (8-10 Oct 2021), I replaced the bluetooth joypad with an [ExpressLRS](https://www.expresslrs.org) receiver and a Jumper T-Lite transmitter. The additional benefit is the possibility to rely on the extensive [OpenTX](https://www.open-tx.org/) telemetry and configurability.

![](/images/2021/10/IMG_20211006_232200.jpg)

For this pourpose I wrote a [CRSF protocol parser](https://github.com/AlessioMorale/crsf_parser) and a [ROS driver](https://github.com/AlessioMorale/ros_crsf_driver).

### Old DS4DRV bluetooth joypad

Teleop was previousluy handled using a bluetooth PS4 joypad as input device using [DS4DRV](https://pypi.org/project/ds4drv/)

## Video

Below a simple test after installing the four new motors and the unav2 prototype.

<div class="flex-video">
<iframe width="420" height="315" src="https://www.youtube.com/embed/TDbqgjx-6oY" frameborder="0" allowfullscreen></iframe>
</div>

Find additional Slammer related blog entries [here](/tag/slammer)

## Additional pictures

![](/images/2021/10/IMG_20210423_173919.jpg)
![](/images/2021/10/IMG_20210425_164120.jpg)
