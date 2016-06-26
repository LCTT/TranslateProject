两个出色的一体化 Linux 服务器软件
================================================

回到2000年那时，微软发布小型商务服务器（SBS：Small Business Server）。这个产品改变了很多人们对科技在商务领域的看法。你可以部署一个单独的服务器，它能处理邮件，日历，文件共享，目录服务，VPN，以及更多，而不是很多机器处理不同的任务。对很多小型公司来说，这是实实在在的好处，但是对于一些公司来说 Windows SMB 是昂贵的。对于另外一些人，根本不会考虑使用这种微软设计的单一服务器的想法。

对于后者也有替代方案。事实上，在 Linux 和开源领域里，你可以选择许多稳定的平台，它可以作为一站式服务商店服务于你的小型企业。如果你的小型企业有10到50员工，一体化服务器也许是你所需的理想方案。

这里，我将要展示两个 Linux 一体化服务器，你可以看看它们哪个能完美适用于你的公司。

记住，这些服务器不适用于（不管是哪种方式）大型商务或企业。大公司无法依靠一体化服务器，那是因为一台服务器不能负担得起企业所需的期望。也就是说，Linux 一体化服务器适合于小型企业。

### ClearOS

[ClearOS][1] 最初发布于 2009 年，那时名为 ClarkConnect，是一个路由和网关的发行版。从那以后，ClearOS 增加了所有一体化服务器必要的特性。CearOS 提供的不仅仅是一个软件，你可以购买一个 [ClearBox 100][2] 或 [ClearBox 300][3]。这些服务器搭载了完整的 ClearOS，作为一个 IT 设备被销售。在[这里][4]查看特性比对/价格矩阵。

如果你已经有响应的硬件，你可以下载这些之一：

- [ClearOS 社区版][5] — 社区（免费）版的 ClearOS
- [ClearOS 家庭版][6] — 理想的家庭办公室（详细的功能和订阅费用，见[这里][12]）
- [ClearOS商务][7] — 理想的小型企业（详细的功能和订阅费用，见[这里][13]）

使用 ClearOS 能给你你带来什么？你得到了一个商业级的服务器，带有单一的精美 Web 界面。是什么让 ClearOS 从标准的服务器所提供的一大堆功能中脱颖而出？除了那些基础的部分，你可以从 [Clear 市场][8] 中增加功能。在这个市场里，你可以安装免费或付费的应用来扩展 ClearOS 服务器的特性。这里你可以找到支持 Windows 服务器活动目录，OpenLDAP，Flexshares，Antimalware，云，Web 访问控制，内容过滤等等很多的补充插件。你甚至可以找到一些第三方组件，比如谷歌应用同步，Zarafa 合作平台，卡巴斯基杀毒。

ClearOS 的安装就像其他的 Linux 发行版一样（基于红帽的 Anaconda 安装程序）。安装完成后，系统将提示您设置网络接口，这个地址用来供你的浏览器（需要与 ClearOS 服务器在同一个网络里）访问。地址格式如下：

	https://IP_OF_CLEAROS_SERVER:81

IP_OF_CLEAROS_SERVER 就是服务器的真实 IP 地址。注：当你第一次在浏览器访问这个服务器时，你将收到一个“Connection is not private”的警告。继续访问，以便你可以继续设置。

当浏览器最终连接上之后，就会提示你 root 用户认证（在初始化安装中你设置的 root 用户密码）。一通过认证，你将看到 ClearOS 的安装向导（图1）

![](http://www.linux.com/images/stories/66866/jack-clear_a.png)

*图1: ClearOS安装向导。*

点击下一步按钮，开始设置你的 ClearOS 服务器。这个向导无需加以说明，在最后还会问你想用那个版本的 ClearOS。点击“社区”，“家庭”，或者“商业”。选择之后，你就被要求注册一个账户。创建了一个账户并注册了你的服务器后，你可以开始更新服务器，配置服务器，从市场添加模块（图2）。

![](http://www.linux.com/images/stories/66866/jack-clear_b.png)

*图2: 从市场安装模块。*

此时，一切准备就绪，可以开始深入挖掘配置你的 ClearOS 小型商务服务器了。

### Zentyal

[Zentyal][10] 是一个基于 Ubuntu 的小型商务服务器，有段时期的名字是 eBox。Zentyal 提供了大量的服务器/服务来适应你的小型商务需求：

- 电子邮件 — 网页邮件；支持原生的微软 Exchange 协议和活动目录；日历和通讯录；手机设备电子邮件同步；反病毒/反垃圾；IMAP，POP，SMTP，CalDAV，和 CardDAV 支持。
- 域和目录 — 中央域目录管理；多个组织部门；单点登录身份验证；文件共享；ACL，高级域管理，打印机管理。
- 网络和防火墙 — 支持静态和 DHCP 接口；对象和服务；包过滤；端口转发。
- 基础设施 — DNS；DHCP；NTP；认证中心；VPN。
- 防火墙

安装 Zentyal 很像Ubuntu服务器的安装，基于文本界面而且很简单：从安装镜像启动，做一些简单的选择，然后等待安装完成。当这个最初的基于文本的安装完成之后，就会显示桌面 GUI，提供选择软件包的向导程序。你可以选择所有你想安装的包，让安装程序继续完成这些工作。

最终，你可以通过网页界面来访问 Zentyal 服务器（浏览器访问 https://IP_OF_SERVER:8443 - 这里 IP_OF_SERVER是你的 Zentyal 服务器的局域网地址）或使用独立的桌面 GUI 程序来管理服务器（Zentyal 包括一个可以快速访问管理员和用户控制台的 Zentyal 管理控制台）。当真系统已经保存并启动，你将看到 Zentyal 面板（图3）。

![](http://www.linux.com/images/stories/66866/jack-zentyal_a.png)

*图3: Zentyal活动面板。*

这个面板允许你控制服务器所有方面，比如更新，管理服务器/服务，获取服务器的敏捷状态更新。您也可以进入组件区域，然后安装在部署过程中没有选择的组件或更新当前的软件包列表。点击“软件管理” > “系统更新”并选择你想更新的（图4），然后在屏幕最底端点击“更新”按钮。

![](http://www.linux.com/images/stories/66866/jack-zentyal_b.png)

*图4: 更新你的Zentyal服务器很简单。*

### 那个服务器适合你？

回答这个问题要看你有什么需求。Zentyal 是一个不可思议的服务器，它可以很好的胜任你的小型商务网络。如果你需要更多，如群件，我觉得你可以试试 ClearOS。如果你不需要群件，其它的服务器也不错。

我强烈建议你安装一下这两个一体化的服务器，看看哪个更适合你的小公司。

------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/882146-two-outstanding-all-in-one-linux-servers

作者：[Jack Wallen][a]
译者：[wyangsun](https://github.com/wyangsun)
校对：[wxy](https://github.com/wxy)

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
[12]: https://www.clearos.com/products/clearos-editions/clearos-7-home
[13]: https://www.clearos.com/products/clearos-editions/clearos-7-business
