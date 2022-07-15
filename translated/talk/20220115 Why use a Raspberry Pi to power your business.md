[#]: subject: "Why use a Raspberry Pi to power your business"
[#]: via: "https://opensource.com/article/22/1/raspberry-pi-business"
[#]: author: "Giuseppe Cassibba https://opensource.com/users/peppe8o"
[#]: collector: "lujun9972"
[#]: translator: " void-mori"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

为何要使用树莓派为你的业务提供动力
======
为何小小的单板机是智能工作以及小型办公室的未来
![A chair in a field.][1]

随着疫情的大流行，我们的工作方式也正在发生着改变。工作的分散化正在成为所有公司需要面临的一项重要挑战。

### 智能办公室

即使所有的工厂都能和智能工作搭上一点边，哪怕仅仅是通过VPN来对员工的笔记本电脑进行远程控制，添加evolution而带来一些基本办公服务，尽可能的拉近人与人之间的距离，这些都能够极大降低数据中心的负载，并且提高人们的工作体验。这个方案还有一个额外的影响就是从信息和通信技术上来说消除了许多单点故障。

和在公司外部有成百上千的工作场地不同，更像是在世界范围内有着成百上千的小型办公室/分支，这就是所谓的“智能办公室”。

这种表述可能会让许多的ICT专家感到恐慌，因为这种文化使得一台大机器（即服务器）关联了每个办公室，即使摊开计算资源的优势非常明显。

### 一个不同的角度

如果你能够通过一个50美金的小开发板在大服务器上交付服务会怎么样？如果这个小板子只需要一张SD卡和一个普通的USB电源支持，那又会怎么样呢？这就是[Raspberry Pi][2]是最灵活的解决方案的原因所在。

树莓派开发板是尺寸非常小的运行Linux的计算机。它有一个由树莓派基金会提供和维护的操作系统—Raspberry Pi OS。它基于Debian，和最知名的Linux发行版共享许多软件包。此外，许多树莓派的开发板能够完美运行最知名的Ubuntu Server，它涵盖了ARM处理器，给予了对低功耗处理器的支持。

**[ 阅读下一篇: [在enterprise IT中使用树莓派的7种方式][3] ]**

但树莓派开发板对小公司来说也是一个很好的机会，以能够承担得起的代价获得大量的（开源）服务。这种情况下，你必须考虑数据丢失的风险，因为你把所有的服务运行在一个小的，消费级的硬件上。不过设置正确的备份/还原程序能够降低这些风险。

### 你能从树莓派开发板上提供什么服务？

大多数服务通常由更昂贵的服务器提供。“大多数”属性取决于一些限制：

  * **ARM处理器:** 一些软件包只支持X86/X64处理器。这是最难克服的挑战之一。另一方面，ARM处理器的市场份额不断增长，使得程序员让他们的软件有兼容ARM处理器的版本。
  * **内存容量:** 这是一个仅限于在复杂应用以复杂的方式进行复杂的计算的情况下讨论的问题。很多时候，只不过是关于重新访问代码，拆分步骤，并保持简单高效的问题。此外，如果一个服务因为少数几个用户而需要大量的内存/CPU，这大概也意味着此服务没有正常工作。这可能是你消除浪费资源的旧问题的一个机会。 最后，最新的树莓派开发板把内存容量升级到了8GB，是一个很大的提升。
  * **对服务器没有经验的用户:** 这是另一个问题，你可以在存储了系统和运行数据的树莓派上使用micro-SD卡中的基础镜像。



咱就是说，你能够用树莓派做很多有趣的事情。在[我的博客][4]里，我通过运行各种服务进行了测试—从基本的LAMP服务器到复杂的CRM。从简单到复杂系统，全部都是开源的，例如：

  * 代理服务器(也能够添加广告拦截服务)
  * 电子邮件服务器
  * 打印服务器
  * [酒店管理][5]
  * 联系人关系管理
  * [私人社交网络][6]
  * 私人论坛
  * 私有Git门户网站
  * 网络监控服务器
  * [许多其他有用的服务][7]



对树莓派来说，另一个有趣的机会是在你的远程办公室获得提供高级服务的wifi热点，并且可以从它的以太网端口进行控制。 

最后，[树莓派也能够运行容器][8]，这是一个额外的工具，从这个不可思议的开发板中获得一个可用的服务世界。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/raspberry-pi-business

作者：[Giuseppe Cassibba][a]
选题：[lujun9972][b]
译者：[void-mori](https://github.com/void-mori)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/peppe8o
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_WorkInPublic_4618517_1110_CS_A.png?itok=RwVrWArk "A chair in a field."
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://enterprisersproject.com/article/2020/11/raspberry-pi-7-enterprise-it-uses
[4]: https://peppe8o.com
[5]: https://opensource.com/article/20/4/qloapps-raspberry-pi
[6]: https://opensource.com/article/20/3/raspberry-pi-open-source-social
[7]: https://peppe8o.com/category/raspberrypi/
[8]: https://opensource.com/article/20/8/kubernetes-raspberry-pi
