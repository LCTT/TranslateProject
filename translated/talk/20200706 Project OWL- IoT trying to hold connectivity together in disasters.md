[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Project OWL: IoT trying to hold connectivity together in disasters)
[#]: via: (https://www.networkworld.com/article/3564980/project-owl-iot-trying-to-hold-connectivity-together-in-disasters.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

OWL 项目：物联网正尝试在灾难中让一切保持联络
======

当自然灾害破坏了传统的通信连接时，配置在<ruby>多跳网络<rt>mesh network</rt></ruby>的物联网设备可以迅速部署以提供基本的连接。[AK Badwolf][1] [(CC BY 2.0)][2]

OWL 项目负责人在最近的开源峰会上说，一个以多跳网络、物联网和 LoRa 连接为中心的开源项目可以帮助急救和受灾人员在自然灾害之后保持联系。

OWL 项目的应用场景是当在自然灾害之后频繁发生的通信中断时。无论是蜂窝网络还是有线网络，大范围的中断会频繁阻碍急救服务、供应和在暴风雨或其他重大灾难后必须解决关键问题的信息流。
 
**学习 5G 和 WiFi 6**

  * [如何判断 WiFi 6 是否适合你][4]
  * [什么是 MU-MIMO？为什么在你的无线路由器中需要它？][5]
  * [什么时候使用 5G，什么时候使用 WiFi 6][6]
  * [企业如何为 5G 网络做准备][7]

该项目通过一大群”鸭子“（便宜、易于部署且不需要现有基础设施支持的小型无线模块）实现这个目的。一些鸭子是太阳能的，其他一些则用的是耐用电池。每只鸭子配备一个 LoRa 无线电，用于在网络上和其他鸭子进行通信，同时还配备有 Wi-Fi，而且可能配备蓝牙和 GPS 来实现其他功能。

这个想法是这样的，当网络瘫痪时，用户可以使用他们的智能手机或者笔记本电脑与鸭子建立一个 Wi-Fi 连接，这个鸭子可以将小块的信息传递到网络的其他部分。信息向网络后端传递，直到到达”papaduck“，”papaduck“装备了可以与云上的 OWL 数据管理系统连接的卫星系统。（OWL 代表 ”<ruby>组织<rt>organization</rt></ruby>，<ruby>位置<rt>whereabouts</rt></ruby>和<ruby>物流<rt>logistics</rt></ruby>”。）信息可以通过云在智能手机或者网页上进行可视化，甚至可以通过 API 插入到现有的系统中。

秘密在于 ClusterDuck 协议，这是一个开源固件，即使在一些模块不能正常工作的网络中，它仍然能保持信息流通。它就是设计用来工作在大量便宜且容易获取的计算硬件上，类似树莓派的硬件，这样可以更容易且更快捷的建立一个 ClusterDuck 网络。

创始人 Bryan Knouse 表示，这个项目的创建，是因为在 2017 年和 2018 年的毁灭性飓风中，要与受影响社区进行有效的通信而采取救援措施，面临着巨大的困难。

“我们的一些创始成员经历了这些灾难，然后我们会问‘我们该做些什么？’”，他说道。

在马亚圭斯，该项目有一批来自波多黎各大学的学生和教授，大多数的系统测试都在那里进行。Knouse 说，校园中目前有 17 个太阳能鸭子，分布在屋顶和树上，并且计划增加数量。

他说，“这种关系实际上创建了一个开源社区，这些学生和教授正在帮助我们开发这个项目。”

在 [Facebook][9] 和[领英][10]上加入网络世界社区，并对重要话题发表评论。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564980/project-owl-iot-trying-to-hold-connectivity-together-in-disasters.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[Yufei-Yan](https://github.com/Yufei-Yan)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/spiderkat/8487309555/in/photolist-dVZFrn-dDctnA-8WuLez-6RBSHn-bQa5F8-syyFcV-rvxKJT-5bSAh-2Xey4-3D4xww-4t1ZYv-dMgY7k-mHeMk1-xsPw6B-EiD3UR-k1rNkD-atorAv-f58MG9-g2QCe-Zr1wAC-ewx5Px-6vrwz7-8CCPSd-hAC5HZ-aHJC1B-9ovTST-Wqj4Sk-fiJjWG-28ATb9y-6tHHiR-8VZrmy-8iUVNB-DzSQV5-j6gpDL-2c2C5Re-kmbqae-Th4XGx-g325LW-cC1cp-26aa3aC-X7ruJo-jDkSKD-57695d-8Dz2hm-fPsDJr-gxcdoV-iSVsHR-dWWbct-ejvCrM-8ofaVz
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[4]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[5]: https://www.networkworld.com/article/3250268/what-is-mu-mimo-and-why-you-need-it-in-your-wireless-routers.html
[6]: https://www.networkworld.com/article/3402316/when-to-use-5g-when-to-use-wi-fi-6.html
[7]: https://www.networkworld.com/article/3306720/mobile-wireless/how-enterprises-can-prep-for-5g.html
[8]: https://www.networkworld.com/article/3560993/what-is-wi-fi-and-why-is-it-so-important.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
