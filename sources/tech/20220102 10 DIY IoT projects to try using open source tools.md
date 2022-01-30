[#]: via: "https://opensource.com/article/22/1/open-source-internet-of-things"
[#]: author: "Joshua Allen Holm https://opensource.com/users/holmja"
[#]: collector: "lujun9972"
[#]: translator: "CN-QUAN "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

尝试使用开源工具的10个DIY物联网项目
======
在2021年期间，Opensource.com的作者们多次分享了他们关于各种物联网项目的专业知识。
！[蓝色背景上的硬件集合][1]

物联网(IoT)是计算领域的一个令人着迷的发展方向。互联智能设备、家庭自动化以及相关的发展领域正在产生许多有趣的项目。在2021年期间，Opensource.com的作者们多次分享了他们关于各种物联网项目的专业知识。以下是Opensource.com今年的十大最佳物联网文章。

###如何使用您选择的声音定制您的语音助手

在这篇由Rich Lucente撰写的文章中[了解Nana和Poppy项目][2]。Nana and Poppy项目是Rich Lucente为人工智能语音助手创建自定义问候的开源项目。他描述了整个过程，从录制必要的音频片段到编写代码将这些片段组合成完整的问候语。成品是五个定制的语音助手，送给曾祖父母和祖父母，他们现在无论何时与语音助手互动都能听到孙辈的声音。

###用树莓派和普罗米修斯监测你家的温湿度

克里斯·柯林斯（Chris Collins）描述了他如何[利用普罗米修斯（Prometheus）监测家中的温度和湿度][3]。他提供了关于在Raspberry PI OS上安装普罗米修斯、检测普罗米修斯应用程序、设置系统单元和日志记录等方面的详细说明，以创建用于监控温度和湿度数据的工具。本文建立在克里斯（Chris）以前写的一篇文章的基础上，是这个系列的下一篇文章。

###用树莓派在家里设置温度传感器

学习[如何设置温度传感器][4]通过使用树莓派、DHT22数字传感器和一些Python代码。在本文中，Chris Collins解释了如何将传感器连接到树莓派，安装DHT传感器软件，并使用Python脚本获取传感器数据。他最后调侃了一篇未来的文章，这篇文章将更多地自动化从该设备收集数据，这是本列表中的前一篇文章。

###用智能手机远程控制你的树莓派

斯蒂芬·艾文韦德(Stephan Avenwede)解释了如何[使用你的智能手机来控制树莓派的gpio][5]。本教程描述了如何安装和使用python来使用Telegram通过网络连接控制树莓派。在写这篇文章时，他并没有考虑到具体的最终项目，因此本文提供了广泛的指导，您可以将其应用于许多项目。斯蒂芬建议的一些可能的项目包括草坪灌溉和车库开门器。

#家庭自动化项目为什么选择开源

Alan Smithee在本文中[介绍了Opensource.com家庭自动化电子书][6]。这本电子书包含了Opensource.com网站上与家庭自动化相关的内容。Alan的文章概述了为什么技术让每个人的生活变得更好，并提供了一个下载电子书的链接。

###用Grafana Cloud监控你的树莓派

在Matthew Helmke的这篇教程中，了解如何[用Grafana Cloud监控你的树莓派][7]。该项目使用树莓派、Prometheus时间序列数据库和Grafana Cloud帐户。Matthew解释了如何在树莓派上安装Prometheus，并将其连接到Grafana Cloud，为您的树莓派提供监控。

###一种新的嵌入式开源操作系统

朱天龙提供了[RT-Thread智能操作系统简介][8]。本文解释了什么是RT-Thread Smart，谁可能需要使用它，以及它是如何工作的。本文中还有一个章节对RT Thread Smart和RT Thread进行了对比。

###使用Rust进行嵌入式开发

本文由Alan Smithee撰写，刘康提供，介绍了[使用Rust进行嵌入式开发][9]。这个包含大量代码的教程展示了如何在C中调用Rust，以及如何在Rust中调用C。这里有大量使用Rust工具(如Cargo)进行开发的代码示例和详细说明。

###开源Linux边缘开发入门

Daniel Oh解释了如何使用Quarkus云原生Java框架来[开始边缘开发][10]。Daniel首先简要介绍了他在教程中使用的操作系统CentOS Stream。然后他介绍了教程的三个主要步骤:

*将物联网数据发送到轻量级消息代理。
*使用Quarkus处理反应性数据流。
*监控实时数据通道。

#什么是雾计算？

您可能听说过云计算，但是[什么是雾计算][11]?Seth Kenlon将雾计算描述为“云的外部‘边缘’”——由手机、手表和其他组成物联网的各种设备组成。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-internet-of-things


作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[CN-QUAN](https://github.com/CN-QUAN)
校对：[校对者ID](https://github.com/校对者ID)
本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_BUS_Apple_520.png?itok=ZJu-hBV1 (collection of hardware on blue backround)
[2]: https://opensource.com/article/21/1/customize-voice-assistant
[3]: https://opensource.com/article/21/7/home-temperature-raspberry-pi-prometheus
[4]: https://opensource.com/article/21/7/temperature-sensors-pi
[5]: https://opensource.com/article/21/9/raspberry-pi-remote-control
[6]: https://opensource.com/article/21/6/home-automation-ebook
[7]: https://opensource.com/article/21/3/raspberry-pi-grafana-cloud
[8]: https://opensource.com/article/21/7/rt-thread-smart
[9]: https://opensource.com/article/21/10/rust-embedded-development
[10]: https://opensource.com/article/21/5/edge-quarkus-linux
[11]: https://opensource.com/article/21/5/fog-computing
