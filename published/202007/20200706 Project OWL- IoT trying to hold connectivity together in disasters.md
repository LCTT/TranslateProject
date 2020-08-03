[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12435-1.html)
[#]: subject: (Project OWL: IoT trying to hold connectivity together in disasters)
[#]: via: (https://www.networkworld.com/article/3564980/project-owl-iot-trying-to-hold-connectivity-together-in-disasters.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

OWL 项目：物联网正尝试在灾难中让一切保持联络
======

> 当自然灾害破坏了传统的通信连接时，配置在<ruby>多跳网络<rt>mesh network</rt></ruby>的物联网设备可以迅速部署以提供基本的连接。

![](https://img.linux.net.cn/data/attachment/album/202007/21/135614mwr8rxr6lw5xefjs.jpg)

OWL 项目负责人在最近的开源峰会上说，一个以多跳网络、物联网和 LoRa 连接为中心的开源项目可以帮助急救和受灾人员在自然灾害之后保持联系。

OWL 项目的应用场景是当在自然灾害之后频繁发生的通信中断时。无论是蜂窝网络还是有线网络，大范围的中断会频繁阻碍急救服务、供应和在暴风雨或其他重大灾难后必须解决关键问题的信息流。

该项目通过一大群“<ruby>鸭子<rt>duck</rt></ruby>”（便宜、易于部署且不需要现有基础设施支持的小型无线模块）实现这个目的。一些“鸭子”是太阳能的，其它一些则用的是耐用电池。每只“鸭子”配备一个 LoRa 无线电，用于在网络上和其它“鸭子”进行通信，同时还配备有 Wi-Fi，而且可能配备蓝牙和 GPS 来实现其他功能。

这个想法是这样的，当网络瘫痪时，用户可以使用他们的智能手机或者笔记本电脑与“鸭子”建立一个 Wi-Fi 连接，这个“鸭子”可以将小块的信息传递到网络的其他部分。信息向网络后端传递，直到到达“<ruby>鸭子爸爸<rt>papaduck</rt></ruby>”，“鸭子爸爸”装备了可以与云上的 OWL 数据管理系统连接的卫星系统（OWL 代表 ”<ruby>组织<rt>organization</rt></ruby>、<ruby>位置<rt>whereabouts</rt></ruby>和<ruby>物流<rt>logistics</rt></ruby>”）。信息可以通过云在智能手机或者网页上进行可视化，甚至可以通过 API 插入到现有的系统中。

秘密在于“<ruby>鸭群<rt>ClusterDuck</rt></ruby>” 协议，这是一个开源固件，即使在一些模块不能正常工作的网络中，它仍然能保持信息流通。它就是设计用来工作在大量便宜且容易获取的计算硬件上，类似树莓派的硬件，这样可以更容易且更快捷的建立一个“鸭群”网络。

创始人 Bryan Knouse 表示，这个项目的创建，是因为在 2017 年和 2018 年的毁灭性飓风中，要与受影响社区进行有效的通信而采取救援措施，面临着巨大的困难。

“我们的一些创始成员经历了这些灾难，然后我们会问‘我们该做些什么？’”，他说道。

在马亚圭斯，该项目有一批来自波多黎各大学的学生和教授，大多数的系统测试都在那里进行。Knouse 说，校园中目前有 17 个太阳能“鸭子”，分布在屋顶和树上，并且计划增加数量。

他说，“这种关系实际上创建了一个开源社区，这些学生和教授正在帮助我们开发这个项目。”

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564980/project-owl-iot-trying-to-hold-connectivity-together-in-disasters.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/01/owl-face-100785829-large.jpg
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[4]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[5]: https://www.networkworld.com/article/3250268/what-is-mu-mimo-and-why-you-need-it-in-your-wireless-routers.html
[6]: https://www.networkworld.com/article/3402316/when-to-use-5g-when-to-use-wi-fi-6.html
[7]: https://www.networkworld.com/article/3306720/mobile-wireless/how-enterprises-can-prep-for-5g.html
[8]: https://www.networkworld.com/article/3560993/what-is-wi-fi-and-why-is-it-so-important.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
