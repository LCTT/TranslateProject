两个杰出的一体化Linux服务器
================================================

关键词：Linux服务器，SMB，clearos，Zentyal

![](http://www.linux.com/images/stories/66866/jack-clear_a.png)

>图1: ClearOS安装向导。

回到2000年，微软发布小型商务服务器。这个产品改变了很多人们对科技在商务领域的看法。你可以部署一个单独的服务器，它能处理邮件，日历，文件共享，目录服务，VPN，以及更多，而不是很多机器处理不同的任务。对很多小型商务来说，这是非常好的恩惠，但是Windows SMB的一些花费是昂贵的。对于其他人，微软设计的依赖于一个服务器的想法，根本不是一个选项。

对于最近的用户群，有些替代品。事实上，在Linux和开源领域里，你可以选择许多稳定的平台，它可以作为一站式服务商店服务于你的小型企业。如果你的小型企业有10到50员工，一体化服务器也许是你所需的理想方案。

这里，我将要看看两个Linux一体化服务器，所以你可以查看他们哪个能完美适用于你的公司。

记住，这些服务器不能，以任何方式，适用于大型商务或企业。大公司无法依靠一体化服务器，仅仅是因为一台服务器不能负荷在企业内所需的企望。除此之外，这就是小型企业可以从Linux一体化服务器期待什么。

### ClearOS

[ClearOS][1]是在2009年在ClarkConnect下发行的，作为一个路由和网关的分支。从那以后，ClearOS已经增加了所有一体化服务器必要的特性。CearOS提供的不仅仅是一个软件。你可以购买一个[ClearBox 100][2] 或[ClearBox 300][3]。这些服务器搭载完整的ClearOS作为一个IT设备被销售。在[这里][4]查看特性比对/价格矩阵。

家里已经有这些硬件，你可以下载这些之一：

- [ClearOS社区][5] — 社区（免费）版的ClearOS

- [ClearOS家庭][6] — 理想的家庭办公室（详细的功能和订阅费用，见这里）

- [ClearOS商务][7] — 理想的小型商务（详细的功能和订阅费用，见这里）

使用ClearOS你得到了什么？你得到了一个单机的业务合作服务器，设计精美的网页。ClearOS独特的是什么？你可以在基础服务中得到很多特性。除了这个，你必须从 [Clear Marketplace][8]增加特性。在市场上，你可以安装免费或付费的应用程序，扩展集的ClearOS服务器的特性。这里你可以找到附加的Windows服务器活动目录，OpenLDAP，Flexshares，Antimalware，云，Web访问控制，内容过滤，还有更多。你甚至可以找到一些第三方组件像谷歌应用同步，Zarafa合作平台，卡巴斯基杀毒。

ClearOS的安装像其他Linux发行版（基于红帽的Anaconda安装程序）。安装完成后，系统将提示您设置网络接口就是提供你浏览器访问的地址（与ClearOS服务器在同一个网络里）。地址格式如下：

[https://IP_OF_CLEAROS_SERVER:81][9]

IP_OF_CLEAROS_SERVER就是服务器的真实IP地址。注：当你第一次在浏览器访问这个服务器时，你将收到一个“Connection is not private”的警告。继续访问这个地址你才能继续设置。

当浏览器连接上，就会提示你root用户认证（在初始化安装中你设置的root用户密码）。一通过认证，你将看到ClearOS的安装向导（上图1）

点击下一步按钮，开始设置你的ClearOS服务器。这个向导无需加以说明，在最后还会问你想用那个版本的ClearOS。点击社区，家庭，或者商业。一旦选择，你就需要注册一个账户。创建了一个账户注册了服务器后，你可以开始更新服务器，配置服务器，从市场添加模块（图2）。

![](http://www.linux.com/images/stories/66866/jack-clear_b.png)

>图2: 从市场安装模块。

此时，你已经准备开始深入挖掘配置你的ClearOS小型商务服务器了。

### Zentyal

[Zentyal][10]是一个基于Ubuntu的小型商务服务器，现在，发布在eBox域名下。Zentyal提供了大量的服务器/服务来适应你的小型商务需求：

- 电子邮件 — 网页邮件；原生微软邮件协议和活动目录支持；日历和通讯录；手机设备电子邮件同步；反病毒/反垃圾；IMAP，POP，SMTP，CalDAV，和CardDAV支持。

- 域和目录 — 核心域目录管理；多个组织单元；单点登录身份验证；文件共享；ACLs，高级域名管理，打印机管理。

- 网络和防火墙 — 静态和DHCP接口；对象和服务；包过滤；端口转发。

- 基础设施 — DNS；DHCP；NTP；认证中心；VPN。

- 防火墙

安装Zentyal很像Ubuntu服务器的文本安装而且很简单：启动安装镜像，做一些选择，等待安装完成。一旦初始化，完成基于文本安装，就提供给你桌面GUI，向导程序提供选择包。选择所有你想安装的包，让安装程序完成这些工作。

最终，你可以通过网页接口来访问Zentyal服务器（浏览器访问[https://IP_OF_SERVER:8443][11] - IP_OF_SERVER是Zentyal服务器的内网地址）或使用独立的桌面GUI来管理服务器（Zentyal包括快速访问管理员和用户控制台就像Zentyal管理控制台）。当全部系统已经保存开启，你将看到Zentyal面板（图3）。

![](http://www.linux.com/images/stories/66866/jack-zentyal_a.png)

>图3: Zentyal活动面板.

这个面板允许你控制服务器所有方面，比如更新，管理服务器/服务，获取服务器的敏捷状态更新。您也可以进入组件领域，然后安装部署过程中选择出来的组件或更新当前的软件包列表。点击 软件管理 > 系统更新 并选择你想更新的（图4），然后在屏幕最底端点击更新按钮。

![](http://www.linux.com/images/stories/66866/jack-zentyal_b.png)

>图4: 更新你的Zentyal服务器很简单。

### 那个服务器适合你？

回答这个问题要看你有什么需求。Zentyal是一个不可思议的服务器，它很好的胜任于你的小型商务网络中。如果你需要更多，如组合软件，你最好赌在ClearOS上。如果你不需要组合软件，任意的服务器将表现杰出的工作。

我强烈建议安装这两个一体化的服务器，看看哪个是你的小公司所需的最好服务。

------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/882146-two-outstanding-all-in-one-linux-servers

作者：[Jack Wallen][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linux.com/community/forums/person/93
[1]: http://www.linux.com/learn/tutorials/882146-two-outstanding-all-in-one-linux-servers#clearfoundation-overview
[2]: https://www.clearos.com/products/hardware/clearbox-100-series
[3]: https://www.clearos.com/products/hardware/clearbox-300-series
[4]: https://www.clearos.com/products/hardware/clearbox-overview
[5]: http://mirror.clearos.com/clearos/7/iso/x86_64/ClearOS-DVD-x86_64.iso
[6]: http://mirror.clearos.com/clearos/7/iso/x86_64/ClearOS-DVD-x86_64.iso
[7]: http://mirror.clearos.com/clearos/7/iso/x86_64/ClearOS-DVD-x86_64.iso
[8]: https://www.clearos.com/products/purchase/clearos-marketplace-overview
[9]: https://ip_of_clearos_server:81/
[10]: http://www.zentyal.org/server/
[11]: https://ip_of_server:8443/
