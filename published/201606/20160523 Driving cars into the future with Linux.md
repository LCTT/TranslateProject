与 Linux 一同驾车奔向未来
===========================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/open-snow-car-osdc-lead.png?itok=IgYZ6mNY)

当我驾车的时候并没有这么想过，但是我肯定喜欢一个配有这样系统的车子，它可以让我按下几个按钮就能与我的妻子、母亲以及孩子们语音通话。这样的系统也可以让我选择是否从云端、卫星广播、以及更传统的 AM/FM 收音机收听音乐流媒体。我也会得到最新的天气情况，以及它可以引导我的车载 GPS 找到抵达下一个目的地的最快路线。[车载娱乐系统（In-vehicle infotainment）][1]，业界常称作 IVI，它已经普及出现在最新的汽车上了。

前段时间，我乘坐飞机跨越了数百英里，然后租了一辆汽车。令人愉快的是，我发现我租赁的汽车上配置了类似我自己车上同样的 IVI 技术。毫不犹豫地，我就通过蓝牙连接把我的联系人上传到了系统当中，然后打电话回家给我的家人，让他们知道我已经安全抵达了，然后我的主机会让他们知道我正在去往他们家的路上。

在最近的[新闻综述][2]中，Scott Nesbitt 引述了一篇文章，说福特汽车公司因其开源的[智能设备连接（Smart Device Link）][3]（SDL）从竞争对手汽车制造商中得到了足够多的回报，这个中间件框架可以用于支持移动电话。 SDL 是 [GENIVI 联盟][4]的一个项目，这个联盟是一个非营利性组织，致力于建设支持开源车载娱乐系统的中间件。据 GENIVI 的执行董事 [Steven Crumb][5] 称，他们的[成员][6]有很多，包括戴姆勒集团、现代、沃尔沃、日产、本田等等 170 个企业。

为了在同行业间保持竞争力，汽车生产企业需要一个中间设备系统，以支持现代消费者所使用的各种人机界面技术。无论您使用的是 Android、iOS 还是其他设备，汽车 OEM 厂商都希望自己的产品能够支持这些。此外，这些的 IVI 系统必须有足够适应能力以支持日益变化的移动技术。OEM 厂商希望提供有价值的服务，并可以在他们的 IVI 之上增加服务，以满足他们客户的各种需求。

### 步入 Linux 和开源软件

除了 GENIVI 在努力之外，[Linux 基金会][7]也赞助支持了[车载 Linux（Automotive Grade Linux）][8]（AGL）工作组，这是一个致力于为汽车应用寻求开源解决方案的软件基金会。虽然 AGL 初期将侧重于 IVI 系统，但是未来他们希望发展到不同的方向，包括[远程信息处理（telematics）][9]、抬头显示器（HUD）及其他控制系统等等。 现在 AGL 已经有超过 50 名成员，包括捷豹、丰田、日产，并在其[最近发布的一篇公告][10]中宣称福特、马自达、三菱、和斯巴鲁也加入了。

为了了解更多信息，我们采访了这一新兴领域的两位领导人。具体来说，我们想知道 Linux 和开源软件是如何被使用的，并且它们是如何事实上改变了汽车行业的面貌。首先，我们将与 [Alison Chaiken][11] 谈谈，她是一位任职于 Peloton Technology 的软件工程师，也是一位在车载 Linux 、网络安全和信息透明化方面的专家。她曾任职于 [Alison Chaiken][11] 公司、诺基亚和斯坦福直线性加速器。然后我们和 [Steven Crumb][12] 进行了交谈，他是 GENIVI 执行董事，他之前从事于高性能计算环境（超级计算机和早期的云计算）的开源工作。他说，虽然他再不是一个程序员了，但是他乐于帮助企业解决在使用开源软件时的实际业务问题。

### 采访 Alison Chaiken (by [Deb Nicholson][13])

#### 你是如何开始对汽车软件领域感兴趣的？

我曾在诺基亚从事于手机上的 [MeeGo][14] 产品，2009 年该项目被取消了。我想，我下一步怎么办？其时，我的一位同事正在从事于 [MeeGo-IVI][15]，这是一个早期的车载 Linux 发行版。 “Linux 在汽车方面将有很大发展，” 我想，所以我就朝着这个方向努力。

#### 你能告诉我们你在这些日子里工作在哪些方面吗？

我目前正在启动一个高级巡航控制系统的项目，它用在大型卡车上，使用实时 Linux 以提升安全性和燃油经济性。我喜欢在这方面的工作，因为没有人会反对提升货运的能力。

#### 近几年有几则汽车被黑的消息。开源代码方案可以帮助解决这个问题吗？

我恰好针对这一话题准备了一次讲演，我会在南加州 Linux 2016 博览会上就 Linux 能否解决汽车上的安全问题做个讲演 （[讲演稿在此][16]）。值得注意的是，GENIVI 和车载 Linux 项目已经公开了他们的代码，这两个项目可以通过 Git 提交补丁。（如果你有补丁的话），请给上游发送您的补丁！许多眼睛都盯着，bug 将无从遁形。

#### 执法机构和保险公司可以找到很多汽车上的数据的用途。他们获取这些信息很容易吗？

好问题。IEEE-1609 专用短程通信标准（Dedicated Short Range Communication Standard）就是为了让汽车的 WiFi 消息可以安全、匿名地传递。不过，如果你从你的车上发推，那可能就有人能够跟踪到你。

#### 开发人员和公民个人可以做些什么，以在汽车技术进步的同时确保公民自由得到保护？

电子前沿基金会（ Electronic Frontier Foundation）（EFF）在关注汽车问题方面做了出色的工作，包括对哪些数据可以存储在汽车 “黑盒子”里通过官方渠道发表了看法，以及 DMCA 规定 1201 如何应用于汽车上。

#### 在未来几年，你觉得在汽车方面会发生哪些令人激动的发展？

可以拯救生命的自适应巡航控制系统和防撞系统将取得长足发展。当它们大量进入汽车里面时，我相信这会使得（因车祸而导致的）死亡人数下降。如果这都不令人激动，我不知道还有什么会更令人激动。此外，像自动化停车辅助功能，将会使汽车更容易驾驶，减少汽车磕碰事故。

#### 我们需要做什么？人们怎样才能参与？

车载 Linux 开发是以开源的方式开发，它运行在每个人都能买得起的廉价硬件上（如树莓派 2 和中等价位的 Renesas Porter 主板）。 GENIVI 汽车 Linux 中间件联盟通过 Git 开源了很多软件。此外，还有很酷的 [OSVehicle 开源硬件][17]汽车平台。

只需要不太多的预算，人们就可以参与到 Linux 软件和开放硬件中。如果您感兴趣，请加入我们在 Freenode 上的IRC #automotive 吧。

### 采访 Steven Crumb (by Don Watkins)

#### GENIVI 在 IVI 方面做了哪些巨大贡献？

GENIVI 率先通过使用自由开源软件填补了汽车行业的巨大空白，这包括 Linux、非安全关键性汽车软件（如车载娱乐系统（IVI））等。作为消费者，他们很期望在车辆上有和智能手机一样的功能，对这种支持 IVI 功能的软件的需求量成倍地增长。不过不断提升的软件数量也增加了建设 IVI 系统的成本，从而延缓了其上市时间。

GENIVI 使用开源软件和社区开发的模式为汽车制造商及其软件提供商节省了大量资金，从而显著地缩短了产品面市时间。我为 GENIVI 而感到激动，我们有幸引导了一场革命，在缓慢进步的汽车行业中，从高度结构化和专有的解决方案转换为以社区为基础的开发方式。我们还没有完全达成目标，但是我们很荣幸在这个可以带来实实在在好处的转型中成为其中的一份子。

#### 你们的主要成员怎样推动了 GENIVI 的发展方向？

GENIVI 有很多成员和非成员致力于我们的工作。在许多开源项目中，任何公司都可以通过通过技术输出而发挥影响，包括简单地贡献代码、补丁、花点时间测试。前面说过，宝马、奔驰、现代汽车、捷豹路虎、标致雪铁龙、雷诺/日产和沃尔沃都是 GENIVI 积极的参与者和贡献者，其他的许多 OEM 厂商也在他们的汽车中采用了 IVI 解决方案，广泛地使用了 GENIVI 的软件。

#### 这些贡献的代码使用了什么许可证？

GENIVI 采用了一些许可证，包括从（L）GPLv2 到 MPLv2 和 Apache2.0。我们的一些工具使用的是 Eclipse 许可证。我们有一个[公开许可策略][18]，详细地说明了我们的许可证偏好。

#### 个人或团体如何参与其中？社区的参与对于这个项目迈向成功有多重要？

GENIVI 的开发完全是开放的（[projects.genivi.org][19]），因此，欢迎任何有兴趣在汽车中使用开源软件的人参加。也就是说，公司可以通过成员的方式[加入该联盟][20]，联盟以开放的方式资助其不断进行开发。GENIVI 的成员可以享受各种各样的便利，在过去六年中，已经有多达 140 家公司参与到这个全球性的社区当中。

社区对于 GENIVI 是非常重要的，没有一个活跃的贡献者社区，我们不可能在这些年开发和维护了这么多有价值的软件。我们努力让参与到 GENIVI 更加简单，现在只要加入一个[邮件列表][21]就可以接触到各种软件项目中的人们。我们使用了许多开源项目采用的标准做法，并提供了高品质的工具和基础设施，以帮助开发人员宾至如归而富有成效。

无论你是否熟悉汽车软件，都欢迎你加入我们的社区。人们已经对汽车改装了许多年，所以对于许多人来说，在汽车上修修改改是自热而然的做法。对于汽车来说，软件是一个新的领域，GENIVI 希望能为对汽车和开源软件有兴趣的人打开这扇门。

-------------------------------
via: https://opensource.com/business/16/5/interview-alison-chaiken-steven-crumb

作者：[Don Watkins][a]
译者：[erlinux](https://github.com/erlinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[1]: https://en.wikipedia.org/wiki/In_car_entertainment
[2]: https://opensource.com/life/16/1/weekly-news-jan-9
[3]: http://projects.genivi.org/smartdevicelink/home
[4]: http://www.genivi.org/
[5]: https://www.linkedin.com/in/stevecrumb
[6]: http://www.genivi.org/genivi-members
[7]: http://www.linuxfoundation.org/
[8]: https://www.automotivelinux.org/
[9]: https://en.wikipedia.org/wiki/Telematics
[10]: https://www.automotivelinux.org/news/announcement/2016/01/ford-mazda-mitsubishi-motors-and-subaru-join-linux-foundation-and
[11]: https://www.linkedin.com/in/alison-chaiken-3ba456b3
[12]: https://www.linkedin.com/in/stevecrumb
[13]: https://opensource.com/users/eximious
[14]: https://en.wikipedia.org/wiki/MeeGo
[15]: http://webinos.org/deliverable-d026-target-platform-requirements-and-ipr/automotive/
[16]: http://she-devel.com/Chaiken_automotive_cybersecurity.pdf
[17]: https://www.osvehicle.com/
[18]: http://projects.genivi.org/how
[19]: http://projects.genivi.org/
[20]: http://genivi.org/join
[21]: http://lists.genivi.org/mailman/listinfo/genivi-projects
