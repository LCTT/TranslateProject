网络与安全方面的最佳开源软件
================================================================================ 
InfoWorld 在部署、运营和保障网络安全领域精选出了年度开源工具获奖者。

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-net-sec-100614459-orig.jpg)

### 最佳开源网络和安全软件 ###

[BIND](https://en.wikipedia.org/wiki/BIND), [Sendmail](https://en.wikipedia.org/wiki/Sendmail), [OpenSSH](https://en.wikipedia.org/wiki/OpenSSH), [Cacti](https://en.wikipedia.org/wiki/Cactus), [Nagios](https://en.wikipedia.org/wiki/Nagios), [Snort](https://en.wikipedia.org/wiki/Snort_%28software%29) -- 这些为了网络而生的开源软件，好些家伙们老而弥坚。今年在这个范畴的最佳选择中，你会发现中坚、支柱、新人和新贵云集，他们正在完善网络管理，安全监控，漏洞评估，[rootkit](https://en.wikipedia.org/wiki/Rootkit) 检测，以及很多方面。

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-icinga-100614482-orig.jpg)

### Icinga 2 ###

Icinga 起先只是系统监控应用 Nagios 的一个衍生分支。[Icinga 2][1] 经历了完全的重写，为用户带来了时尚的界面、对多数据库的支持，以及一个集成了众多扩展的 API。凭借着开箱即用的负载均衡、通知和配置文件，Icinga 2 缩短了在复杂环境下安装的时间。Icinga 2 原生支持 [Graphite](https://github.com/graphite-project/graphite-web)（系统监控应用），轻松为管理员呈现实时性能图表。不过真的让 Icinga 今年重新火起来的原因是 Icinga Web 2 的发布，那是一个支持可拖放定制的 仪表盘 和一些流式监控工具的前端图形界面系统。

管理员可以查看、过滤、并按优先顺序排列发现的问题，同时可以跟踪已经采取的动作。一个新的矩阵视图使管理员能够在单一页面上查看主机和服务。你可以通过查看特定时间段的事件或筛选事件类型来了解哪些事件需要立即关注。虽然 Icinga Web 2 有着全新界面和更为强劲的性能，不过对于传统版 Icinga 和 Web 版 Icinga 的所有常用命令还是照旧支持的。这意味着学习新版工具不耗费额外的时间。

-- Fahmida Rashid

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-zenoss-100614465-orig.jpg)

### Zenoss Core ###

这是另一个强大的开源软件，[Zenoss Core][2] 为网络管理员提供了一个完整的、一站式解决方案来跟踪和管理所有的应用程序、服务器、存储、网络组件、虚拟化工具、以及企业基础架构的其他元素。管理员可以确保硬件的运行效率并利用 ZenPacks 中模块化设计的插件来扩展功能。

在2015年二月发布的 Zenoss Core 5 保留了已经很强大的工具，并进一步改进以增强用户界面和扩展 仪表盘。基于 Web 的控制台和 仪表盘 可以高度可定制并动态调整，而现在的新版本还能让管理员混搭多个组件图表到一个图表中。想来这应该是一个更好的根源分析和因果分析的工具。

Portlets 为网络映射、设备问题、守护进程、产品状态、监视列表和事件视图等等提供了深入的分析。而且新版 HTML5 图表可以从工具导出。Zenoss 的控制中心支持带外管理并且可监控所有 Zenoss 组件。Zenoss Core 现在拥有一些新工具，用于在线备份和恢复、快照和回滚以及多主机部署等方面。更重要的是，凭借对 Docker 的全面支持，部署起来更快了。

-- Fahmida Rashid

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-opennms-100614461-orig.jpg)

### OpenNMS ###

作为一个非常灵活的网络管理解决方案，[OpenNMS][3] 可以处理任何网络管理任务，无论是设备管理、应用性能监控、库存控制，或事件管理。凭借对 IPv6 的支持、强大的警报系统和记录用户脚本来测试 Web 应用程序的能力，OpenNMS 拥有网络管理员和测试人员需要的一切。OpenNMS 现在变得像一款移动版 仪表盘，称之为 OpenNMS Compass，可让网络专家随时，甚至在外出时都可以监视他们的网络。

该应用程序的 IOS 版本，可从 [iTunes App Store][4] 上获取，可以显示故障、节点和告警。下一个版本将提供更多的事件细节、资源图表、以及关于 IP 和 SNMP 接口的信息。安卓版可从 [Google Play][5] 上获取，可在 仪表盘 上显示网络可用性，故障和告警，以及可以确认、提升或清除告警。移动客户端与 OpenNMS Horizon 1.12 或更高版本以及 OpenNMS Meridian 2015.1.0 或更高版本兼容。

-- Fahmida Rashid

![](http://images.techhive.com/images/article/2015/09/bossies-2015-onion-100614460-orig.jpg)

### Security Onion ###

如同一个洋葱，网络安全监控是由许多层组成。没有任何一个单一的工具可以让你洞察每一次攻击，为你显示对你的公司网络中的每一次侦查或是会话的足迹。[Security Onion][6] 在一个简单易用的 Ubuntu 发行版中打包了许多久经考验的工具，可以让你看到谁留在你的网络里，并帮助你隔离这些坏家伙。

无论你是采取主动式的网络安全监测还是追查可能的攻击，Security Onion 都可以帮助你。Onion 由传感器、服务器和显示层组成，结合了基于网络和基于主机的入侵检测，全面的网络数据包捕获，并提供了所有类型的日志以供检查和分析。

这是一个众星云集的的网络安全工具链，包括用于网络抓包的 [Netsniff-NG](http://www.netsniff-ng.org/)、基于规则的网络入侵检测系统 Snort 和 [Suricata](https://en.wikipedia.org/wiki/Suricata_%28software%29)，基于分析的网络监控系统 Bro，基于主机的入侵检测系统 OSSEC 和用于显示、分析和日志管理的 Sguil、Squert、Snorby 和 ELSA （企业日志搜索和归档（Enterprise Log Search and Archive））。它是一个经过精挑细选的工具集，所有的这些全被打包进一个向导式的安装程序并有完整的文档支持，可以帮助你尽可能快地上手监控。

-- Victor R. Garza

![](http://images.techhive.com/images/article/2015/09/bossies-2015-kali-100614458-orig.jpg)

### Kali Linux ###

[Kali Linux][7] 背后的团队今年为这个流行的安全 Linux 发行版发布了新版本，使其更快，更全能。Kali 采用全新 4.0 版的内核，改进了对硬件和无线驱动程序的支持，并且界面更为流畅。最常用的工具都可从屏幕的侧边栏上轻松找到。而最大的改变是 Kali Linux 现在是一个滚动发行版，具有持续不断的软件更新。Kali 的核心系统是基于 Debian Jessie，而且该团队会不断地从 Debian 测试版拉取最新的软件包，并持续的在上面添加 Kali 风格的新特性。

该发行版仍然配备了很多的渗透测试，漏洞分析，安全审查，网络应用分析，无线网络评估，逆向工程，和漏洞利用工具。现在该发行版具有上游版本检测系统，当有个别工具可更新时系统会自动通知用户。该发行版还提过了一系列 ARM 设备的镜像，包括树莓派、[Chromebook](https://en.wikipedia.org/wiki/Chromebook) 和 [Odroid](https://en.wikipedia.org/wiki/ODROID)，同时也更新了 Android 设备上运行的 [NetHunter](https://www.kali.org/kali-linux-nethunter/) 渗透测试平台。还有其他的变化：Metasploit 的社区版/专业版不再包括在内，因为 Kali 2.0 还没有 [Rapid7 的官方支持][8]。

-- Fahmida Rashid

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-openvas-100614462-orig.jpg)

### OpenVAS ###

开放式漏洞评估系统（Open Vulnerability Assessment System） [OpenVAS][9]，是一个整合多种服务和工具来提供漏洞扫描和漏洞管理的软件框架。该扫描器可以使用每周更新一次的网络漏洞测试数据，或者你也可以使用商业服务的数据。该软件框架包括一个命令行界面（以使其可以用脚本调用）和一个带 SSL 安全机制的基于 [Greenbone 安全助手][10] 的浏览器界面。OpenVAS 提供了用于附加功能的各种插件。扫描可以预定运行或按需运行。

可通过单一的主控来控制多个安装好 OpenVAS 的系统，这使其成为了一个可扩展的企业漏洞评估工具。该项目兼容的标准使其可以将扫描结果和配置存储在 SQL 数据库中，这样它们可以容易地被外部报告工具访问。客户端工具通过基于 XML 的无状态 OpenVAS 管理协议访问 OpenVAS 管理器，所以安全管理员可以扩展该框架的功能。该软件能以软件包或源代码的方式安装在 Windows 或 Linux 上运行，或者作为一个虚拟应用下载。

-- Matt Sarrel

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-owasp-100614463-orig.jpg)

### OWASP ###

[OWASP][11]（开放式 Web 应用程序安全项目（Open Web Application Security Project））是一个专注于提高软件安全性的在全球各地拥有分会的非营利组织。这个社区性的组织提供测试工具、文档、培训和几乎任何你可以想象到的开发安全软件相关的软件安全评估和最佳实践。有一些 OWASP 项目已成为很多安全从业者工具箱中的重要组件：

[ZAP][12]（ZED 攻击代理项目（Zed Attack Proxy Project））是一个在 Web 应用程序中寻找漏洞的渗透测试工具。ZAP 的设计目标之一是使之易于使用，以便于那些并非安全领域专家的开发人员和测试人员能便于使用。ZAP 提供了自动扫描和一套手动测试工具集。

[Xenotix XSS Exploit Framework][13] 是一个先进的跨站点脚本漏洞检测和漏洞利用框架，该框架通过在浏览器引擎内执行扫描以获取真实的结果。Xenotix 扫描模块使用了三个智能模糊器（ intelligent fuzzers），使其可以运行近 5000 种不同的 XSS 有效载荷。它有个 API 可以让安全管理员扩展和定制漏洞测试工具包。

[O-Saft][14]（OWASP SSL 高级审查工具（OWASP SSL advanced forensic tool））是一个查看 SSL 证书详细信息和测试 SSL 连接的 SSL 审计工具。这个命令行工具可以在线或离线运行来评估 SSL ，比如算法和配置是否安全。O-Saft 内置提供了常见漏洞的检查，你可以容易地通过编写脚本来扩展这些功能。在 2015 年 5 月加入了一个简单的图形用户界面作为可选的下载项。

[OWTF][15]（攻击性 Web 测试框架（Offensive Web Testing Framework））是一个遵循 OWASP 测试指南和 NIST 和 PTES 标准的自动化测试工具。该框架同时支持 Web 用户界面和命令行，用于探测 Web 和应用服务器的常见漏洞，如配置失当和软件未打补丁。

-- Matt Sarrel

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-beef-100614456-orig.jpg)

### BeEF ###

Web 浏览器已经成为用于针对客户端的攻击中最常见的载体。[BeEF][15] （浏览器漏洞利用框架项目（Browser Exploitation Framework Project）），是一种广泛使用的用以评估 Web 浏览器安全性的渗透工具。BeEF 通过浏览器来启动客户端攻击，帮助你暴露出客户端系统的安全弱点。BeEF 建立了一个恶意网站，安全管理员用想要测试的浏览器访问该网站。然后 BeEF 发送命令来攻击 Web 浏览器并使用命令在客户端机器上植入软件。随后管理员就可以把客户端机器看作不设防般发动攻击了。

BeEF 自带键盘记录器、端口扫描器和 Web 代理这样的常用模块，此外你可以编写你自己的模块或直接将命令发送到被控制的测试机上。BeEF 带有少量的演示网页来帮你快速入门，使得编写更多的网页和攻击模块变得非常简单，让你可以因地适宜的自定义你的测试。BeEF 是一个非常有价值的评估浏览器和终端安全、学习如何发起基于浏览器攻击的测试工具。可以使用它来向你的用户综合演示，那些恶意软件通常是如何感染客户端设备的。

-- Matt Sarrel

![](http://images.techhive.com/images/article/2015/09/bossies-2015-unhide-100614464-orig.jpg)

### Unhide ###

[Unhide][16] 是一个用于定位开放的 TCP/UDP 端口和隐藏在 UNIX、Linux 和 Windows 上的进程的审查工具。隐藏的端口和进程可能是由于运行 Rootkit 或 LKM（可加载的内核模块（loadable kernel module）） 导致的。Rootkit 可能很难找到并移除，因为它们就是专门针对隐蔽性而设计的，可以在操作系统和用户前隐藏自己。一个 Rootkit 可以使用 LKM 隐藏其进程或冒充其他进程，让它在机器上运行很长一段时间而不被发现。而 Unhide 则可以使管理员们确信他们的系统是干净的。

Unhide 实际上是两个单独的脚本：一个用于进程，一个用于端口。该工具查询正在运行的进程、线程和开放的端口并将这些信息与系统中注册的活动比较，报告之间的差异。Unhide 和 WinUnhide 是非常轻量级的脚本，可以运行命令行而产生文本输出。它们不算优美，但是极为有用。Unhide 也包括在 [Rootkit Hunter][17] 项目中。

-- Matt Sarrel

![](http://images.techhive.com/images/article/2015/09/bossies-2015-main-100614457-orig.jpg)

### 查看更多的开源软件优胜者 ###

InfoWorld 网站的 2015 年最佳开源奖由下至上表扬了 100 多个开源项目。通过以下链接可以查看更多开源软件中的翘楚：

[2015 Bossie 评选：最佳开源应用程序][18]

[2015 Bossie 评选：最佳开源应用程序开发工具][19]

[2015 Bossie 评选：最佳开源大数据工具][20]

[2015 Bossie 评选：最佳开源数据中心和云计算软件][21]

[2015 Bossie 评选：最佳开源桌面和移动端软件][22]

[2015 Bossie 评选：最佳开源网络和安全软件][23]

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2982962/open-source-tools/bossie-awards-2015-the-best-open-source-networking-and-security-software.html

作者：[InfoWorld staff][a]
译者：[robot527](https://github.com/robot527)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/InfoWorld-staff/
[1]:https://www.icinga.org/icinga/icinga-2/
[2]:http://www.zenoss.com/
[3]:http://www.opennms.org/
[4]:https://itunes.apple.com/us/app/opennms-compass/id968875097?mt=8
[5]:https://play.google.com/store/apps/details?id=com.opennms.compass&hl=en
[6]:http://blog.securityonion.net/p/securityonion.html
[7]:https://www.kali.org/
[8]:https://community.rapid7.com/community/metasploit/blog/2015/08/12/metasploit-on-kali-linux-20
[9]:http://www.openvas.org/
[10]:http://www.greenbone.net/
[11]:https://www.owasp.org/index.php/Main_Page
[12]:https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project
[13]:https://www.owasp.org/index.php/O-Saft
[14]:https://www.owasp.org/index.php/OWASP_OWTF
[15]:http://www.beefproject.com/
[16]:http://www.unhide-forensics.info/
[17]:http://www.rootkit.nl/projects/rootkit_hunter.html
[18]:http://www.infoworld.com/article/2982622/bossie-awards-2015-the-best-open-source-applications.html
[19]:http://www.infoworld.com/article/2982920/bossie-awards-2015-the-best-open-source-application-development-tools.html
[20]:http://www.infoworld.com/article/2982429/bossie-awards-2015-the-best-open-source-big-data-tools.html
[21]:http://www.infoworld.com/article/2982923/bossie-awards-2015-the-best-open-source-data-center-and-cloud-software.html
[22]:http://www.infoworld.com/article/2982630/bossie-awards-2015-the-best-open-source-desktop-and-mobile-software.html
[23]:http://www.infoworld.com/article/2982962/bossie-awards-2015-the-best-open-source-networking-and-security-software.html
