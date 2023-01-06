[#]: subject: (What is fog computing?)
[#]: via: (https://opensource.com/article/21/5/fog-computing)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14782-1.html)

什么是雾计算？
======

> 了解由我们生活中的所有连接设备组成的网络。

![](https://img.linux.net.cn/data/attachment/album/202207/01/120728yne9qv0e2vc5ucm3.jpg)

在早期，计算机既笨重又昂贵，计算机用户很少，他们必须在计算机上的预留时间内亲自来处理他们的<ruby>打孔卡<rt>punchcard</rt></ruby>。被称为 <ruby>[大型机][2]<rt>Mainframe</rt></ruby> 的系统进行了许多创新，并在<ruby>终端机<rt>terminal</rt></ruby>（没有自己的 CPU 的桌面计算机）上实现了<ruby>分时<rt>time-shared</rt></ruby>任务。

时至今日，强大的计算设备能做到 [价格低至 35 美元，且大小不超过一张信用卡][3]。这甚至还没有涵盖现代生活中负责收集和处理数据的所有小设备。从高层次的角度来看这些计算机的集合，你可以想象得到，所有这些设备多得像云中的水滴一样。

碰巧“<ruby>云计算<rt>cloud computing</rt></ruby>”一词已经被占用，因此需要为由物联网（IoT）和其他具有战略意义的服务器组成的网络提供一个独特的名称。此外，如果已经有一个代表数据中心节点的云，那么在云之外与我们交融的这些节点肯定有其独特之处。

### 欢迎来到雾计算

云通过互联网提供计算服务。构成云的数据中心很大，但与潜在客户的数量相比相对较少。这表明当数据在云及其众多用户之间来回传送时存在潜在的瓶颈。

相比之下，<ruby>雾计算<rt>Fog Computing</rt></ruby>可以在数量上超过其潜在客户，而不会出现瓶颈，因为设备执行大部分数据的收集或计算。它是云的外部“边缘”，是云落地的部分。

### 雾和边缘计算

雾计算和 <ruby>[边缘计算][4]<rt>edge computing</rt></ruby> 本质上是同义词。两者都与云和物联网密切相关，并做出相同的架构假设：

- 你离 CPU 越近，数据传输就越快。
- 像 [Linux][5] 一样，小型专用计算机，可以“做一件事并把它做好”，这是一个强大的优势（当然，我们的设备实际上不仅仅做一件事，但从高层次上看，你购买的用于监测健康的智能手表本质上是在做“一”件事）。
- 离线是不可避免的，但好的设备可以在此期间同样有效地运行，然后在重新连接时同步。
- 本地设备能比大型数据中心更简单、更便宜。

### 边缘网络

将雾计算视为与云完全分离的实体很诱人，但它们毕竟是组成一个整体的两个部分。云需要数字企业的基础设施，包括公共云提供商、电信公司，甚至是运行自己服务的专业公司。本地化服务也很重要，可以在云核心与其数以百万计的客户之间提供<ruby>中转站<rt>waystations</rt></ruby>。

雾计算位于云的边缘，无论客户身在何处，都与他们紧密联系在一起。有时这是一个消费环境，例如你自己的家或汽车，而另一些时候这是一种商业利益，例如零售店中的价格监控设备或工厂车间的重要的安全传感器。

### 雾计算就在你身边

雾计算由我们生活中的所有连接设备组成：<ruby>无人机<rt>drone</rt></ruby>、电话、手表、健身监视器、安全监视器、家庭自动化、便携式游戏设备、园艺自动化、天气传感器、空气质量监视器等等。理想情况下，它提供的数据有助于建立一个更好、更明智的未来。有许多伟大的开源项目正朝着改善健康的方向而努力 —— 甚至只是让生活变得更有趣一点儿 —— 这一切都得益于雾和云计算。无论如何，_我们的_ 工作是确保它 [保持开放][7]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/fog-computing

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_laptop_code_programming_mountain_view.jpg?itok=yx5buqkr (Man at laptop on a mountain)
[2]: https://opensource.com/article/19/9/linux-mainframes-part-1
[3]: https://opensource.com/resources/raspberry-pi
[4]: https://www.redhat.com/en/topics/edge-computing/what-is-edge-computing
[5]: https://opensource.com/resources/linux
[6]: https://www.redhat.com/architect/edge-computing-essentials
[7]: https://opensource.com/article/20/10/keep-cloud-open
