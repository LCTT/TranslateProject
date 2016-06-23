
驾车通往未来Linux
===========================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/open-snow-car-osdc-lead.png?itok=IgYZ6mNY)


当我开车的时候不认为和 Linux 有多大联系，但是我肯定我是喜欢一个配备有系统的车子，让我按几个按钮语音就可以传给我的妻子母亲以及孩子。同样，这样的系统可以让我选择是否从云端流媒体收听音乐，卫星广播，以及传统的 AM/FM 收音机。我也会得到天气更新以及可以给我的车载信息娱乐 GPS 找到最快的下一个目的地[In-vehicle infotainment][1]，以及 IVI 作为行业知名产业，已经普及到最新的汽车生产商。

前段时间，我不得坐飞机飞跃数百英里，租一辆车。令人愉快的是，我发现我的租凭车配置了 IVI 技术。任何时候，我只要通过蓝牙连接，上传联系人到系统中，打电话回家给我的家人，让他们知道我已经安全到家了。然后“主人“会知道我再途中还是已经到他们家了。

在最近的 [news roundup][2]，Scott Nesbitt 引用一篇文章，说福特汽车公司是由它的开源 [Smart Device Link][3]（SDL）中间设备框架，对手汽车制造商，支持那个移动手机获得大量的支持。 SDL 是 [GENIVI Alliance][4] 的项目，一个非营利性的致力于建设中间件支持开源的车载信息娱乐系统。根据文献 [[Steven Crumb][5]，GENIVI 执行董事，他们 [membership][6] 很广，包括 Daimler 集团，现代，沃尔沃，日产，本田等等 170 个。

为了在同行业中保持竞争力，汽车企业需要一个中间设备系统，可以支持当今消费者提供的各种人机界面技术。无论您拥有 Android，iOS 或其他设备，汽车 OEM 厂商希望自己的系统单位能够支持这些。此外，这些的 IVI 系统必须有足够适应能力以支持移动技术的不断下降，半衰期。 OEM 厂商要提供价值服务，并在他们的 IVI 堆栈支持各种为他们的客户添加选择。进入 Linux 和开源软件。

除了 GENIVI 的努力下，[Linux Foundation][7] 赞助 [Automotive Grade Linux][8]（AGL）工作组，一个软件基金会，致力于寻找针对汽车应用的开源解决方案。虽然 AGL 初期将侧重于 IVI 系统，他们展望不同的分歧，包括  [telematics][9]，小心显示器和其他控制系统。 AGL 有超过 50 名成员在这个时候，包括捷豹，丰田，日产，并在 [recent press release][10] 宣布福特、马自达、三菱、和斯巴鲁加入。


为了了解更多信息，我们在这一新鲜兴领域采访了两位领导人。明确地来说，我们想知道是如何被使用的 Linux 和开源软件，如果它们实际上是改变汽车行业的面貌。首先，我们谈谈  [Alison Chaiken][11]，在大集团技术的软件工程师和汽车 Linux 专家，网络安全和透明度。她曾任职于 [Alison Chaiken][11] 公司，诺基亚和斯坦福直线性加速器。然后我们用 [Steven Crumb][12]，GENIVI 执行董事，谁得到了在开源环境高性能计算（超级计算机和早期的云计算）开始聊天。他说，虽然他再不是一个程序员了，但是他喜欢帮助企业解决开源软件的实际业务问题。

### 采访 Alison Chaiken (by [Deb Nicholson][13])

#### 你是如何开始对汽车软件空间感兴趣的？

我是在诺基亚手机产品时， 2009 年该项目被取消。我想，下一步是什么？一位同事正在对 [MeeGo-IVI][15]，早期的汽车 Linux 发行版。 “Linux 在汽车是大了，” 我想，所以我在朝着这个方向努力。

#### 你能告诉我们你这些日子工作在哪些方面？

我目前正在启动为使用 Linux 系统增加大货车钻机的安全性和燃油经济性的先进巡航控制。我喜欢在这方面的工作，因为没有人会反对卡车得以提升。

#### 目前关于汽车已在近年来砍死几个人故事。开源代码方案可以帮助解决这个问题吗？

I presented a talk on precisely this topic, on how Linux can (and cannot) contribute to security solutions in automotive at Southern California Linux Expo 2016 ([Slides][16]). Notably, GENIVI and Automotive Grade Linux have published their code and both projects take patches via Git. Please send your fixes upstream! Many eyes make all bugs shallow.
我提出的谈话正是这一主题，就如何 Linux 可以（或不可以）在南加州 2016 年世博会作出贡献的安全解决方案的 Linux汽车([Slides][16])。值得注意的是，GENIVI 和汽车级 Linux 已经公布了他们的代码，这两个项目的 Git 通过采取补丁。请上游发送您的修复！许多眼睛都盯着肤浅的bugs。

#### 执法机构和保险公司可以找到很多有关数据用途的驱动程序。它将如何容易成为他们获取这些信息？

好问题。该专用短程通信标准（IEEE-1609），以保持匿名的 Wi-Fi 安全消息驱动程序。不过，如果你从你的车张贴到 Twitter，有人能够跟踪你。

#### 有什么可以开发人员和公民个人一起完成，以确保公民自由受到保护作为汽车技术发展的？

电子前沿基金会（EFF）一样对汽车保持的问题上，通过什么样的数据可以存储在汽车 “黑盒子”，并在 DMCA 的规定 1201 如何应用于汽车官方渠道评论已经出色的工作了。

#### 在未来几年令人兴奋的事情上，那些是你看到的驱动因素？

自适应巡航控制和防撞系统有足够的预付款来挽救生命。当他们通过运输车队的推出，我真的相信死亡人数会下降。如果这还不是令人兴奋的，我不知道是什么。此外，像自动化停车辅助功能，将会使汽车更容易驾驶，减少汽车相撞事故。

#### 有什么是需要人参与以及如何建造？

汽车 Linux 级开发是开放源代码的，运行在廉价硬件（如树莓派 Pi 2 和中等价位的 Renesas Porter board），任何人都可以购买。 GENIVI 汽车 Linux 的中间设备联盟有很多软件通过 Git 的公开。此外，还有很酷的 [OSVehicle open hardware][17] 汽车平台。

#### 这里是 Linux 软件和开放硬件，许多方面具有中等人数预算的参与。如果您有任何疑问，加入我们在 Freenode 上 IRC#automotive。

### 采访 Steven Crumb (by Don Watkins)

#### 关于GENIVI's 对 IVI 为什么那么大 ?

GENIVI 率先通过使用自由和开源软件，包括 Linux，像车载信息娱乐（IVI）系统的非安全关键汽车软件填补了汽车行业的巨大差距。作为消费者来到期望在他们的车辆相同的功能在智能手机上的软件，以支持 IVI 功能所需的量成倍增长。软件增加量也增加了建设 IVI 系统的成本，从而延缓了上市时间。

GENIVI 的使用开源软件和社区发展模式节省了汽车制造商和他们的软件提供商显著大量的资金，而显著减少了产品上市时间。我很兴奋，因为 GENIVI 我们很幸运慢慢从高度结构化和专有的方法来社区为基础的方法不断发展的组织​​领导排序在汽车行业的一场革命。我们还没有完成，但它一直是一个荣幸参加正在产生实实在在的好处的转换。

#### 你的庞大会员怎么才可以驱动 GENIVI 方向？

GENIVI 有很多会员和非会员促进我们的工作。与许多开源项目，任何公司都可以通过简单地贡献代码，修补程序和时间来检验影响的技术输出。随着中说，宝马，奔驰，现代汽车，捷豹路虎，标致雪铁龙，雷诺 / 日产和沃尔沃是所有积极采用者和贡献者 GENIVI 和其他许多 OEM 厂商已经在他们的汽车 IVI 解决方案，广泛使用 GENIVI 的软件。

#### 贡献的代码使用了什么许可证？

GENIVI 采用数量的许可证从（L）GPLv2 许可，以 MPLv2 到 Apache2.0。我们的一些工具使用 Eclipse 许可证。我们有一个[public licensing policy][18]，详细说明我们的许可偏好。

#### 一个人或一群人如何参与其中？重要的是如何对项目的持续成功的社区贡献？

GENIVI 完全做它开放发展的在([projects.genivi.org][19])，因此，有兴趣的人在汽车使用开源软件，欢迎参加。这就是说，该联盟能够通过公司 [joining GENIVI][20] 作为成员不断发展的开放基金。 GENIVI 会员享受各种各样的福利，而不是其中最重要的是在已经发展了近六年来 140 家公司全球社区参与。

社区是 GENIVI 非常重要的，我们不可能生产和维护我们发展了很多年没有贡献者一个活跃的社区有价值的软件。我们努力做出贡献 GENIVI 简单，只要加入一个 [邮件列表] [21] 并连接到人们在不同的软件项目。我们使用许多开源项目采用的标准做法，并提供高质量的工具和基础设施，以帮助开发人员有宾至如归的感觉，并富有成效。

无论在汽车软件某人的熟悉，欢迎他们加入我们的社区。人们已经改装车多年，所以对于许多人来说，是一种天然的抽奖，任何汽车。软件是汽车的新域，GENIVI 希望成为敞开的门有兴趣的人与汽车，开源软件的工作。

-------------------------------
via: https://opensource.com/business/16/5/interview-alison-chaiken-steven-crumb

作者：[Don Watkins][a]
译者：[erlinux](https://github.com/erlinux)
校对：[校对者ID](https://github.com/校对者ID)

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
