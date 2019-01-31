[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10490-1.html)
[#]: subject: (Top 5 Linux Server Distributions)
[#]: via: (https://www.linux.com/blog/learn/2019/1/top-5-linux-server-distributions)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)

5 个用于 SOHO 的 Linux 服务器发行版
======

> Jack Wallen 为 Linux 服务器发行版提供了一些可靠的选择，绝对值回票价。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/rockstor-main.jpg?itok=VNvfEIlf)

啊，这个古老的问题：哪种 Linux 发行版最适合做服务器？通常，问这种问题时，所浮现出来的标准的答复就是：

  * RHEL
  * SUSE
  * Ubuntu 服务器
  * Debian
  * CentOS

然而，假如你将眼界放得更宽（不将服务器只看做是 IDC 托管的那种互联网服务器时），可能答案会有点不同。我准备稍微来点不同的。我想做出一个满足入选标准的发行版列表，这些发行版不仅是优秀的候选者，而且易于使用，可以为你的业务中的许多功能提供服务。在某些情况下，我选择的是一些替代品，可以取代其它需要一些工作才能达成要求的操作系统。

我的一些选择是企业级服务器的社区版本，它们可以被视为购买更强大平台的入门级产品。你甚至可以在这里找到一两个作为特定任务平台的候选者。然而，最重要的是，你在此列表中找到的并非寻常的泛泛之辈。

### ClearOS

什么是 ClearOS？对于家庭和小型企业用途，你可能找不到比它更好的解决方案。ClearOS 开箱即用，包括了入侵检测、强大的防火墙、带宽管理工具、邮件服务器、域控制器等工具。其目的是将服务器作为一个简单的家庭和 SOHO 服务器，并具有用户友好的基于 Web 的图形化界面，这使得 ClearOS 在某些评比中脱颖而出。从其界面中，你可以找到一个应用程序市场（图 1），其中包含数百个应用程序（其中一些是免费的，而另一些则具有相关费用），这使得扩展 ClearOS 功能集非常容易。换句话说，你可以将 ClearOS 作为你的家庭和小型企业所需的平台。最重要的是，与许多其他替代方案不同，你只需支付所需的软件和支持。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/clearos.jpg?itok=knQkn5ch)

*图 1：ClearOS 应用程序市场*

有三种版本的 ClearOS：

  * [ClearOS Community][1] - 免费版 ClearOS
  * [ClearOS Home][2] - 适于家庭办公
  * [ClearOS Business][3] - 适于小型企业，包括了付费支持。

为了使软件安装更加容易，ClearOS 应用市场允许你通过以下方式进行选择软件：

   * 按功能（根据任务显示应用程序）
   * 按类别（显示相关应用程序组）
   * 快速选择文件（允许你按预先配置的模板选择，以帮助你快速启动和运行）

换句话说，如果你正在寻找 Linux 的家庭、SOHO 或 SMB 服务器，ClearOS 是一个出色的选择（特别是如果你没有启动和运行标准的 Linux 服务器的能力时）。

### Fedora 服务器

你肯定听说过 Fedora Linux。它是市场上最好的前沿发行版之一。但是你知道这个出色的 Fedora 桌面发行版的开发者们也开发了服务器版吗？Fedora 服务器平台是一个短生命周期的、社区支持的服务器操作系统。这使得经验丰富的、或对任何类型的 Linux（或任何操作系统）有经验的系统管理员，可以使用开源社区中提供的最新技术。在这段描述中有三个关键词：

  * 经验丰富
  * 系统
  * 管理员

换言之，新用户就不要考虑了。虽然 Fedora 服务器完全能够处理你抛出的任何任务，但它需要一些拥有更多的 Linux 功夫的人来使它工作并且运行良好。Fedora 服务器非常好的一点是，开箱即用，它包括了市场上用于服务器的开源的基于 Web 的最好的界面之一。通过 Cockpit（图 2），你可以快速浏览系统资源、日志、存储、网络以及拥有管理帐户、服务、应用程序和更新的能力。

![Fedora Server][5]

*图 2：运行在 Fedora 服务器上的 Cockpit*

如果你可以使用最前沿的软件，并想要一个出色的管理仪表板，Fedora 服务器可能就是你要的平台。

### NethServer

正如你所发现的那样，NethServer 是每个人都知道的简单 SMB Linux 服务器。通过 NethServer 的最新版本，你的小型企业将得到：

   * 内置 Samba 活动目录控制器
   * 与 Nextcloud 的无缝集成
   * 证书管理
   * HTTPS 透明代理
   * 防火墙
   * 邮件服务器和过滤器
   * Web 服务器和过滤器
   * 群件
   * IPS / IDS 或 VPN

所有包含的功能都可以通过用户友好的基于 Web 的界面轻松配置，包括单击安装模块以扩展 NethServer 功能集（图 3）。NethServer 与 ClearOS 的区别在于它的设计目的是使管理工作更轻松。换句话说，这个平台提供了更多的灵活性和功能。与面向家庭办公室和 SOHO 部署的 ClearOS 不同，NethServer 在小型商业环境中用起来就像在家庭里使用一样方便。

![NethServer][8]

*图 3：给 NethServer 添加模块*

### Rockstor

Rockstor 是采用 Linux 和 Btfrs 的高级网络附加存储（NAS）和云存储服务器，可部署用于家庭、SOHO 以及中小型企业。借助 Rockstor，你可以获得一个完整的 NAS /云解决方案，其中包含一个用户友好的基于 Web 的 GUI 工具，管理员可以像普通用户一样轻松使用它来设置。一旦部署好了 Rockstor，你就可以创建存储池、共享、快照、管理复制和用户、共享文件（借助 Samba、NFS、SFTP 和 AFP），甚至扩展它的功能集，这要归功于附加组件（称为 Rock-ons）。Rock-ons 列表包括：

  * CouchPotato（Usenet 和 BitTorrent 用户的下载器）
  * Deluge（BitTorrent 用户的电影下载器）
  * EmbyServer（Emby 媒体服务器）
  * Ghost（专业博主的发布平台）
  * GitLab CE（Git 仓库托管和协作）
  * Gogs Go Git Service（轻量级 Git 版本控制服务器和前端）
  * Headphones（NZB 和 Torrent 的音乐自动下载器）
  * 用于 Squeezebox 设备的罗技 Squeezebox 服务器
  * MariaDB（关系型数据管理系统）
  * NZBGet（高效的 usenet 下载器）
  * OwnCloud-Official（安全的文件共享和托管）
  * Plexpy（基于 Python 的 Plex 用量跟踪器）
  * Rocket.Chat（开源聊天平台）
  * SaBnzbd（Usenet 下载器）
  * Sickbeard（用于电视节目的互联网个人视频录像机）
  * Sickrage（电视节目的自动视频库管理器）
  * Sonarr（Usenet 和 BitTorrent 用户的个人视频录像机）
  * Symform（备份设备）

Rockstor 还包括了一目了然的仪表板，使管理员可以快速访问他们所需的有关其服务器的所有信息（图 4）。

![Rockstor][10]

*图 4： Rockstor 面板*

### Zentyal

Zentyal 是另一个小型企业服务器，可以很好地处理多个任务。如果你正在寻找可以处理以下内容的 Linux 发行版：

  * 目录和域服务器
  * 邮件服务器
  * 网关
  * DHCP、DNS 和 NTP 服务器
  * 认证机构（CA）
  * VPN
  * 实时消息（IM）
  * FTP 服务器
  * 反病毒
  * SSO 认证
  * 文件共享
  * RADIUS 认证
  * 虚拟化管理
  * 等等

Zentyal 可能是你的新选择。从 2004 年 Zentyal 就存在了，它基于 Ubuntu Server，因此它拥有坚实的基础和丰富的应用程序。在 Zentyal 仪表板的帮助下（图 5），管理员可以轻松管理：

  * 系统
  * 网络
  * 日志
  * 软件更新和安装
  * 用户/组
  * 域
  * 文件共享
  * 邮件
  * DNS
  * 防火墙
  * 证书
  * 等等

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/zentyal.jpg?itok=Un9lpgh6)

*图 5：Zentyal 仪表板*

向 Zentyal 服务器添加新组件只需要打开仪表板，单击“软件管理” -> “Zentyal 组件”，选择要添加的组件，然后单击安装。Zentyal 可能会遇到的一个问题是，它提供不了与 Nethserver 和 ClearOS 一样多的插件。但它提供的服务，则做得非常好。

### 更多来自于

这个 Linux 服务器列表显然不是详尽无遗的。然而，这是一种对你可能没有听说过的五大服务器发行版的独特视角。当然，如果你更愿意使用更传统的 Linux 服务器发行版，你可以随时坚持使用 [CentOS][11]、[Ubuntu 服务器][12]、[SUSE][13]、[RHEL][14] 或 [Debian][15]……它们大多都出现在市场上最好的服务器发行版列表中。但是，如果你正在寻找一些不同的东西，那么试试这五个发行版中的一个。

通过 Linux 基金会和 edX 的免费[“Linux 简介”][16]课程了解有关 Linux 的更多信息。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/top-5-linux-server-distributions

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://www.clearos.com/clearfoundation/software/clearos-7-community
[2]: https://www.clearos.com/products/clearos-editions/clearos-7-home
[3]: https://www.clearos.com/products/clearos-editions/clearos-7-business
[4]: https://www.linux.com/files/images/fedoraserverjpg
[5]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fedoraserver.jpg?itok=phaAIRXW (Fedora Server)
[6]: https://www.linux.com/licenses/category/used-permission
[7]: https://www.linux.com/files/images/nethserverjpg
[8]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/nethserver.jpg?itok=HO-CRbOV (NethServer)
[9]: https://www.linux.com/files/images/rockstorejpg
[10]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/rockstore.jpg?itok=EN_5oFxQ (Rockstor)
[11]: https://www.centos.org/
[12]: https://www.ubuntu.com/download/server
[13]: https://www.suse.com/
[14]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[15]: https://www.debian.org/
[16]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
