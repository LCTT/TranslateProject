Robot development made easy with Husarion CORE2-ROS running Ubuntu
============================================================



### Share or save

 _This is the first in a series of two posts by guest blogger; Dominik Nowak, CEO at Husarion._ 

We’ve seen many breakthroughs happening in the IT industry over the last decade. Arguably the most meaningful one on the consumer side was the adoption of smartphones and mobile development. What’s the next big thing, now that the smartphones are so common and, let’s face it, slightly boring? We say: robotics.

Business knows that well with many manufacturing lines running solely by robots. The consumer and service side, though, have yet to see a massive breakthrough. We believe it’s all a matter of accessibility and lowering the barrier to entry for developers. There just have to be good, simple tools to quickly prototype and develop robots. To test new ideas and empower engineers, so they can solve many of the issues humanity still faces. Issues that are trickier to tackle than a tap in an app.

Building robots is a challenging task that the [Husarion][2] team is trying to make easier. Husarion is a robotic company working on rapid development platform for robots. The products of the company are CORE2 robotic controller and the cloud platform to manage all CORE2 based robots. CORE2 is the second generation of Husarion’s robotics controller and it’s now available [here][3].

CORE2 combines a real-time microcontroller board and a single board computer running Ubuntu. Ubuntu is the most popular Linux distribution not only for [desktops][4], but also for embedded hardware in IoT & [robotics][5] applications.

![](https://insights.ubuntu.com/wp-content/uploads/2c47/husarion.png)

CORE2 controller comes in two configurations. The first one with ESP32 Wi-Fi module is dedicated for robotic applications that need low power consumption and real-time, secure remote control. The second one, called CORE2-ROS, basically integrates two boards in one:
– A board with real-time microcontroller running firmware using the Real-Time Operating System (RTOS) and integrating interfaces for motors, encoders and sensors
– A single board computer (SBC) running Linux with ROS packages ([Robot Operating System][6]) and other software tools.

The ‘real-time’ board does the low-level job. It contains the efficient STM32F4 series microcontroller which is great for driving motors, reading encoders, communicating with sensors and controlling the whole mechatronic or robotic system. In most applications, the CPU load does not exceed a few percents and the real-time operation is guaranteed by a dedicated programming framework based on RTOS. We also assured the compatibility with Arduino libraries. The majority of the tasks are processed in the microcontroller peripherals, such as timers, communication interfaces, ADCs etc. with the strong support of interrupts and DMA channels. In short, it is not a job for a single-board computer that has the other tasks.

On the other hand, it’s almost obvious that the modern and advanced robotic applications can no longer be based only on microcontrollers, for a few reasons:
– Autonomous robots need a lot of processing power to perform navigation, image and sound recognition, moving in a swarm etc.,
– Writing the advanced software requires standardisation to be efficient – SBCs become more and more popular in the industry and the same is observed for the software written for SBCs, which is very similar to PC computers
– SBCs are getting less expensive every year
– Husarion believes that combining these two worlds is very beneficial in robotics.

CORE2-ROS controller is available in two configurations with [Raspberry Pi 3 ][7]or [ASUS Tinker Board][8]. CORE-ROS is running Ubuntu, Husarion dev & management tools and ROS packets.

In the next post, find out why Husarion decided to use Ubuntu.

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/07/12/robot-development-made-easy-with-husarion-core2-ros-running-ubuntu/

作者：[Guest  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/guest/
[1]:https://insights.ubuntu.com/author/guest/
[2]:https://husarion.com/
[3]:https://www.crowdsupply.com/husarion/core2
[4]:https://www.ubuntu.com/desktop
[5]:https://www.ubuntu.com/internet-of-things/robotics
[6]:http://www.ros.org/
[7]:https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[8]:https://www.asus.com/uk/Single-Board-Computer/Tinker-Board/
