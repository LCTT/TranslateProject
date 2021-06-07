[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10375-1.html)
[#]: subject: (11 Uses for a Raspberry Pi Around the Office)
[#]: via: (https://blog.dxmtechsupport.com.au/11-uses-for-a-raspberry-pi-around-the-office/)
[#]: author: (James Mawson https://blog.dxmtechsupport.com.au/author/james-mawson/)

树莓派在办公室的 11 种用法
======

我知道你在想什么：树莓派只能用在修修补补、原型设计和个人爱好中。它实际不能用在业务中。

毫无疑问，这台电脑的处理能力相对较低、易损坏的 SD 卡、缺乏电池备份以及支持的 DIY 性质，这意味着它不会是一个能在任何时候执行最关键的操作的[专业的、已安装好、配置好的商业服务器][1]的可行替代品。

但是它电路板便宜、功耗很小、小到几乎适合任何地方、无限灵活 —— 这实际上是处理办公室一些基本任务的好方法。

而且，更好的是，已经有一些人完成了这些项目并很乐意分享他们是如何做到的。

### DNS 服务器

每次在浏览器中输入网站地址或者点击链接时，都需要将域名转换为数字 IP 地址，然后才能显示内容。

通常这意味着向互联网上某处 DNS 服务器发出请求 —— 但你可以通过本地处理来加快浏览速度。

你还可以分配自己的子域，以便本地访问办公室中的计算机。

[这里了解它是如何工作的。][2]

### 厕所占用标志

在厕所排过队吗？

这对于那些等待的人来说很烦人，花在处理它上面的时间会耗费你在办公室的工作效率。

我想你希望在办公室里也悬挂飞机上那个厕所有人的标志。

[Occu-pi][3] 是一个非常简单的解决方案，使用磁性开关和树莓派来判断螺栓何时关闭，并在 Slack 频道中更新“厕所在使用中” —— 这意味着整个办公室的人都可以看一眼电脑或者移动设备知道是否有空闲的隔间。

### 针对黑客的蜜罐陷阱

黑客破坏了网络的第一个线索是一些事情变得糟糕，这应该会吓到大多数企业主。

这就是可以用到蜜罐的地方：一台没有任何服务的计算机位于你的网络，将特定端口打开，伪装成黑客喜欢的目标。

安全研究人员经常在网络外部部署蜜罐，以收集攻击者正在做的事情的数据。

但对于普通的小型企业来说，这些作为一种绊脚石部署在内部更有用。因为普通用户没有真正的理由想要连接到蜜罐，所以任何发生的登录尝试都是正在进行捣乱的非常好的指示。

这可以提供对外部人员入侵的预警，并且也可以提供对值得信赖的内部人员的预警。

在较大的客户端/服务器网络中，将它作为虚拟机运行可能更为实用。但是在无线路由器上运行的点对点的小型办公室/家庭办公网络中，[HoneyPi][4] 之类的东西是一个很小的防盗报警器。

### 打印服务器

联网打印机更方便。

但更换所有打印机可能会很昂贵 —— 特别是如果你对现有的打印机感到满意的话。

[将树莓派设置为打印服务器][5]可能会更有意义。

### 网络附加存储（NAS）

将硬盘变为 NAS 是树莓派最早的实际应用之一，并且它仍然是最好的之一。

[这是如何使用树莓派创建 NAS。][6]

### 工单服务器

想要在预算不足的情况下在服务台中支持工单？

有一个名为 osTicket 的完全开源的工单程序，它可以安装在你的树莓派上，它甚至还有[随时可用的 SD 卡镜像][7]。

### 数字标牌

无论是用于活动、广告、菜单还是其他任何东西，许多企业都需要一种显示数字标牌的方式 —— 而树莓派的廉价和省电使其成为一个非常有吸引力的选择。

[这有很多可供选择的选项。] [8]

### 目录和信息亭

[FullPageOS][9] 是一个基于 Raspbian 的 Linux 发行版，它直接引导到 Chromium 的全屏版本 —— 这非常适合导购、图书馆目录等。

### 基本的内联网 Web 服务器

对于托管一个面向公众的网站，你最好有一个托管帐户。树莓派不适合面对真正的网络流量。

但对于小型办公室，它可以托管内部业务维基或基本的公司内网。它还可以用作沙箱环境，用于试验代码和服务器配置。

[这里是如何在树莓派上运行 Apache、MySQL 和 PHP。][10]

### 渗透测试器

Kali Linux 是专为探测网络安全漏洞而构建的操作系统。通过将其安装在树莓派上，你就拥有了一个超便携式穿透测试器，其中包含 600 多种工具。

[你可以在这里找到树莓派镜像的种子链接。][11]

绝对要小心只在你自己的网络或你有权对它安全审计的网络中使用它 —— 使用此方法来破解其他网络是严重的犯罪行为。

### VPN 服务器

当你外出时，依靠的是公共无线互联网，你无法控制还有谁在网络中、谁在窥探你的所有流量。这就是为什么通过 VPN 连接加密所有内容可以让人放心。

你可以订阅任意数量的商业 VPN 服务，并且你可以在云中安装自己的服务，但是在办公室运行一个 VPN，这样你也可以从任何地方访问本地网络。

对于轻度使用 —— 比如偶尔的商务旅行 ——  树莓派是一种强大的，节约能源的设置 VPN 服务器的方式。（首先要检查一下你的路由器是不是不支持这个功能，许多路由器是支持的。）

[这是如何在树莓派上安装 OpenVPN。][12]

### 无线咖啡机

啊，美味：好喝的饮料是神赐之物，也是公司内工作效率的支柱。

那么，为什么不[将办公室的咖啡机变成可以精确控制温度和无线连接的智能咖啡机呢？][13]

--------------------------------------------------------------------------------

via: https://blog.dxmtechsupport.com.au/11-uses-for-a-raspberry-pi-around-the-office/

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.dxmtechsupport.com.au/author/james-mawson/
[b]: https://github.com/lujun9972
[1]: https://dxmtechsupport.com.au/server-configuration
[2]: https://www.1and1.com/digitalguide/server/configuration/how-to-make-your-raspberry-pi-into-a-dns-server/
[3]: https://blog.usejournal.com/occu-pi-the-bathroom-of-the-future-ed69b84e21d5
[4]: https://trustfoundry.net/honeypi-easy-honeypot-raspberry-pi/
[5]: https://opensource.com/article/18/3/print-server-raspberry-pi
[6]: https://howtoraspberrypi.com/create-a-nas-with-your-raspberry-pi-and-samba/
[7]: https://everyday-tech.com/a-raspberry-pi-ticketing-system-image-with-osticket/
[8]: https://blog.capterra.com/7-free-and-open-source-digital-signage-software-options-for-your-next-event/
[9]: https://github.com/guysoft/FullPageOS
[10]: https://maker.pro/raspberry-pi/projects/raspberry-pi-web-server
[11]: https://www.offensive-security.com/kali-linux-arm-images/
[12]: https://medium.freecodecamp.org/running-your-own-openvpn-server-on-a-raspberry-pi-8b78043ccdea
[13]: https://www.techradar.com/au/how-to/how-to-build-your-own-smart-coffee-machine
