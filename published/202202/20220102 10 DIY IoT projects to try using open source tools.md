[#]: via: "https://opensource.com/article/22/1/open-source-internet-of-things"
[#]: author: "Joshua Allen Holm https://opensource.com/users/holmja"
[#]: collector: "lujun9972"
[#]: translator: "CN-QUAN"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14238-1.html"

2021 总结：10 个值得尝试的 DIY 物联网项目
======

> 在 2021 年，我们的作者们多次分享了他们关于各种物联网项目的专业知识。

![](https://img.linux.net.cn/data/attachment/album/202202/03/141552nxzj9alj5z7y5eyz.jpg)

物联网（IoT）是计算领域的一个令人着迷的发展方向。互联智能设备、家庭自动化以及相关的发展领域正在产生许多有趣的项目。在 2021 年，我们的作者们多次分享了他们关于各种物联网项目的专业知识。以下是十大最佳物联网文章。

### 如何使用你选择的声音定制你的语音助手

在这篇由 Rich Lucente 撰写的这篇文章中 [了解 Nana and Poppy 项目][2]。Nana and Poppy 项目是 Rich Lucente 为人工智能语音助手创建自定义问候的开源项目。他描述了整个过程，从录制必要的音频片段到编写代码将这些片段组合成完整的问候语。成品是五个送给曾祖父母和祖父母的定制语音助手，他们现在无论何时与语音助手互动都能听到孙辈的声音。

### 用树莓派和 Prometheus 监测你家的温湿度

Chris Collins 描述了他如何 [利用 Prometheus 监测家中的温度和湿度][3]。他提供了关于在树莓派操作系统上安装 Prometheus、检测 Prometheus 应用程序、设置 systemd 单元和日志记录等方面的详细说明，以创建用于监控温度和湿度数据的工具。本文建立在 Chris 以前写的一篇文章的基础上，这篇文章是这个系列的下一篇文章。

### 用树莓派在家里设置温度传感器

学习如何通过使用树莓派、DHT22 数字传感器和一些 Python 代码 [设置温度传感器][4]。在本文中，Chris Collins 解释了如何将传感器连接到树莓派，安装 DHT 传感器软件，并使用 Python 脚本获取传感器数据。他最后调侃说，未来的文章将更多地自动化从该设备收集数据，这是本列表中的前一篇文章。

### 用智能手机远程控制你的树莓派

Stephan Avenwede 解释了如何 [使用你的智能手机来控制树莓派的 GPIO][5]。本教程描述了如何安装和使用 Pythonic 来使用 Telegram 通过网络连接控制树莓派。在写这篇文章时，他并没有考虑到具体的最终项目，因此本文提供了广泛的指导，你可以将其应用于许多项目。Stephan 建议的一些可能的项目包括草坪灌溉和车库开门器。

### 家庭自动化项目为什么选择开源

Alan Smithee 在本文中 [介绍了家庭自动化电子书][6]。这本电子书包含了与家庭自动化相关的内容。Alan 的文章概述了为什么技术能让每个人的生活变得更好，并提供了一个下载电子书的链接。

### 用 Grafana Cloud 监控你的树莓派

在 Matthew Helmke 的这篇教程中，了解如何 [用 Grafana Cloud 监控你的树莓派][7]。该项目使用树莓派、Prometheus 时间序列数据库和 Grafana Cloud 帐户。Matthew 解释了如何在树莓派上安装 Prometheus，并将其连接到 Grafana Cloud，为你的树莓派提供监控。

### 一种新的嵌入式开源操作系统

Zhu Tianlong 提供了 [RT-Thread 智能操作系统简介][8]。本文解释了什么是 RT-Thread Smart，谁可能需要使用它，以及它是如何工作的。本文中还有一个章节对 RT-Thread Smart 和 RT Thread 进行了对比。

### 使用 Rust 进行嵌入式开发

本文由 Alan Smithee 撰写，Liu Kang 供稿，介绍了 [使用 Rust 进行嵌入式开发][9]。这个包含大量代码的教程展示了如何在 C 中调用 Rust，以及如何在 Rust 中调用 C。这里有大量使用 Rust 工具（如 Cargo）进行开发的代码示例和详细说明。

### 开源 Linux 边缘开发入门

Daniel Oh 解释了如何使用 Quarkus 云原生 Java 框架来 [开始边缘开发][10]。Daniel 首先简要介绍了他在教程中使用的操作系统 CentOS Stream。然后他介绍了教程的三个主要步骤:

* 将物联网数据发送到轻量级消息代理。
* 使用 Quarkus 处理反应性数据流。
* 监控实时数据通道。

### 什么是雾计算？

你可能听说过云计算，但是 [什么是雾计算][11]？Seth Kenlon 将<ruby>雾计算<rt>fog computing</rt></ruby>描述为“云的外部‘边缘’”——由手机、手表和其他组成物联网的各种设备组成。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/open-source-internet-of-things


作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[CN-QUAN](https://github.com/CN-QUAN)
校对：[wxy](https://github.com/wxy)

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
