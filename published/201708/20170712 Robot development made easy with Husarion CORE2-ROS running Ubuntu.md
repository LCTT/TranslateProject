运行 Ubuntu 的 Husarion CORE2-ROS 使得机器人开发变得容易
============================================================


_这是游客投稿的本系列两篇中的第一篇；作者：Dominik Nowak，Husarion 的 CEO _

过去十年，我们见证了 IT 行业的许多突破。可以说对消费者最有意义的一个方面是智能手机和移动开发的普及。接下来的大事件是什么，现在智能手机是如此常见，我们天天对着它，是不是有点无聊吗？所以，我们猜是：机器人。

众所周知，许多生产线完全由机器人运行。但在消费者和服务方面，还没有看到巨大的突破。我们认为这是一个可达性和降低开发人员进入的门槛的问题。只需要有好的、简单的工具来快速做出原型和开发机器人。为了测试新的想法并赋予工程师们更多能力，以便他们可以解决许多人类仍然面临的问题，那些比在应用中的点按一下更棘手的问题。

构建机器人是一个具有挑战性的任务，[Husarion][2] 团队正在努力使其更容易。Husarion 是一家从事于机器人快速开发平台的机器人公司。该公司的产品是 CORE2 机器人控制器和用于管理所有基于 CORE2 的机器人的云平台。CORE2 是第二代 Husarion 机器人控制器，它可在[这里][3]找到。

CORE2 结合了实时微控制器板和运行 Ubuntu 的单板计算机。Ubuntu 是最受欢迎的 Linux 发行版，不仅适用于[桌面][4]，还适用于物联网和 [机器人][5]程序中的嵌入式硬件。

![](https://insights.ubuntu.com/wp-content/uploads/2c47/husarion.png)

CORE2 控制器有两种配置。第一款是采用 ESP32 Wi-Fi 模块的，专用于需要低功耗和实时、安全遥控的机器人应用。第二款，称为 CORE2-ROS，基本上是将两块板子集成到了一起：

- 使用实时操作系统（RTOS）的实时微控制器并集成电机、编码器和传感器接口的电路板
- 带有 ROS（[Robot Operating System] [6]）包的运行 Linux 的单板计算机（SBC）和其他软件工具。

“实时”电路板做底层工作。它包含高效的 STM32F4 系列微控制器，非常适用于驱动电机、读码器、与传感器通信，并控制整个机电或机器人系统。在大多数应用中，CPU 负载不超过几个百分点，实时操作由基于 RTOS 的专用编程框架支持。我们还保证与 Arduino 库的兼容性。大多数任务都在微控制器外设中处理，如定时器、通信接口、ADC 等，它具有中断和 DMA 通道的强大支持。简而言之，对于具有其他任务的单板计算机来说，这不是一项任务。

另一方面，很显然，现代先进的机器人程序不能仅仅基于微控制器，原因如下：

- 自动机器人需要大量的处理能力来执行导航、图像和声音识别、移动等等，
- 编写先进的软件需要标准化才能有效 - SBC 在行业中越来越受欢迎，而对于为 SBC 编写的软件也是如此，这与 PC 电脑非常相似
- SBC 每年都变得越来越便宜
– Husarion 认为，结合这两个世界在机器人技术方面是非常有益的。

CORE2-ROS 控制器有两种配置：[Raspberry Pi 3][7] 或 [ASUS Tinker Board][8]。CORE-ROS 运行于 Ubuntu、Husarion 开发和管理工具以及 ROS 软件包上。

下篇文章将介绍为何 Husarion 决定使用 Ubuntu 。

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2017/07/12/robot-development-made-easy-with-husarion-core2-ros-running-ubuntu/

作者：[Dominik Nowak][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
