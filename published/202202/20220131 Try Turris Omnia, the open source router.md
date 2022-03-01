[#]: subject: "Try Turris Omnia, the open source router"
[#]: via: "https://opensource.com/article/22/1/turris-omnia-open-source-router"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14278-1.html"

Turris Omnia：一个黑客喜欢的开源路由器
======

> 无论你是一个网络工程师还是一个好奇的爱好者，当你在市场上购买网络设备时，都你应该看看开源的 Turris Omnia 路由器。

在 21 世纪初，我对 OpenWrt 很着迷，只想在自己的路由器上运行它。不幸的是，我没有一个能够运行自定义固件的路由器，所以我花了很多周末去旧货地摊，希望能偶然发现一个 “Slug”（黑客们对 NSLU2 路由器的俚语），但这是徒劳的。最近，我买到了 Turris Omnia，除了有一个更酷的名字外，它是一个来自捷克的路由器，使用建立在 OpenWrt 之上的开源固件。它拥有你对运行开源硬件所期望的一切，而且还有很多东西，包括可安装的软件包，因此你可以准确地添加你的家庭或企业网络最需要的东西，而忽略你不会使用的部分。如果你认为路由器是简单的设备，没有定制的余地，甚至除了 DNS 和 DHCP 之外没有其他用途，那么你需要看看 Turris Omnia。它将改变你对路由器是什么的看法，路由器能为你的网络做什么，甚至是你与整个网络的互动方式。

![The Turris Omnia on my desk][2]

### 开始使用 Turris Omnia

尽管 Turris Omnia 的功能很强大，但它给人的感觉却很熟悉。开始使用的步骤与任何其他路由器基本相同：

  1. 打开电源
  2. 加入它提供的网络
  3. 在网络浏览器中进入 192.168.1.1 进行配置

如果你过去买过路由器，你以前会执行过这些相同的步骤。如果你不熟悉这个过程，要知道它并不比任何其他路由器复杂，而且里面有足够的文档。

![Configuration][4]

### 简单和高级配置

在初始设置之后，当你进入 Turris Omnia 路由器时，你可以选择简单配置环境或高级配置。你必须从简单配置开始。在<ruby>密码<rt>Password</rt></ruby>面板中，你可以为高级界面设置一个密码，这也可以让你对路由器进行 SSH 访问。

简单界面让你配置如何连接到广域网（WAN），并为你的局域网（LAN）设置参数。它还允许你设置一个个人 WiFi 接入点、一个访客网络，以及安装插件并与之互动。

它所声称的高级界面叫做 LuCI。它是为熟悉网络拓扑和设计的网络工程师设计的，它基本上是一个键值对的集合，你可以通过一个简单的网络界面进行编辑。如果你喜欢直接编辑数值，你可以用 SSH 进入路由器。

```
$ ssh root@192.168.1.1
root@192.168.1.1's password:

BusyBox v1.28.4 () built-in shell (ash)

      ______                _         ____  _____
     /_  __/_  ____________(_)____   / __ \/ ___/
      / / / / / / ___/ ___/ / ___/  / / / /\__
     / / / /_/ / /  / /  / (__  )  / /_/ /___/ /
    /_/  \__,_/_/  /_/  /_/____/   \____//____/  
                                             
 -----------------------------------------------------
 TurrisOS 4.0.1, Turris Omnia
 -----------------------------------------------------
root@turris:~#
```

### 插件

除了界面的灵活性之外，Turris Omnia 还有一个包管理器。你可以安装插件，包括网络附加存储（NAS）配置、Nextcloud 服务器、SSH 蜜罐、速度测试、OpenVPN、打印服务器、Tor 节点、运行容器的 LXC 等等。

![Package management for your router][5]

只需点击几下，你就可以安装自己的 [Nextcloud][6] 服务器，这样你就可以运行自己的云服务或 OpenVPN，这样你就可以在离家时安全地访问你的网络。

### 开源路由器

这个路由器最好的部分是它是开源的，并且通过开源提供支持。你可以从他们的 [gitlab.nic.cz][7] 下载 Turris 操作系统和许多相关的开源工具。你也不必满足于设备上的固件。有了 2GB 的内存和 miniPCIe 插槽，你可以在上面运行 Debian。甚至前面板上的 LED 灯也是可编程的。这是一个黑客的路由器，无论你是一个网络工程师还是一个好奇的业余爱好者，当你在市场上购买网络设备时，你都应该看一看它。

你可以从 [turris.com][8] 网站上获得 Turris Omnia 和其他几个型号的路由器，然后加入 [forum.turris.cz][9] 的社区。他们是一群友好的爱好者，热衷于分享知识、技巧和很酷的黑客技术，以促进你对开源路由器的使用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/turris-omnia-open-source-router

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mesh_networking_dots_connected.png?itok=ovINTRR3 (Mesh networking connected dots)
[2]: https://opensource.com/sites/default/files/uploads/turris-omnia.jpg (The Turris Omnia on my desk)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/turris-omnia-wifi.jpg (Configuration)
[5]: https://opensource.com/sites/default/files/uploads/turris-omnia-packages.jpg (Package management for your router)
[6]: https://opensource.com/tags/nextcloud
[7]: https://gitlab.nic.cz/turris
[8]: https://www.turris.com/en/
[9]: http://forum.turris.cz
