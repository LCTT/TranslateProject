用 Tails 1.4 Linux 系统来保护隐私和保持匿名
================================================================================
在这个互联网世界和互联网的世界中，我们在线执行我们的大多数任务，无论是订票，汇款，研究，商务，娱乐，社交网络，还是其它。每天我们花费大部分时间在网络上。在过去这些的日子里，在网络中保持匿名变得越来越难，尤其是在被某些机构例如 NSA (National Security Agency) 植入后门的情况下，他们嗅探着我们在网络中的所有动作。在网络中，我们有着极少的，或者说根本就没有隐私。基于用户浏览网络的活动和机器的活动的搜索都被记录了下来。

一款来自于 Tor 项目的绝妙浏览器正被上百万人使用，它帮助我们匿名地浏览网络，即使这样，跟踪你的浏览习惯也并不难，所以只使用 Tor 并不能保证你的网络安全。你可以从下面的链接中查看 Tor 的特点及安装指南。
 
- [使用 Tor 来进行匿名网络浏览][1]

Tor 项目中有一个名为 Tails 的操作系统。Tails (The Amnesic Incognito Live System) 是一个 live 操作系统，基于 Debian Linux 发行版本，主要着眼于在浏览网络时在网络中保护隐私和匿名，这意味着所有的外向连接都强制通过 Tor 来连接，直接的(非匿名的) 连接请求都会被阻挡。该系统被设计为可在任何可启动介质上运行，例如 USB 棒或 DVD。

Tails OS 的最新稳定发行版本为 1.4 ， 于 2015 年 5 月 12 日发行。Tails 由开源的 Linux 宏内核所驱动，构建在 Debian GNU/Linux 之上，着眼于个人电脑市场， 使用 GNOME 3 作为其默认的用户界面。

#### Tails OS 1.4 的特点 ####

- Tails 是一个 free 的操作系统, free 的意义不仅是免费(free)啤酒的免费，也是言论自由(free) 中的自由
- 构建在 Debian/GNU Linux 操作系统之上， Debian 是使用最广泛的通用操作系统
- 着眼于安全的发行版本
- 伪装成 Windows 8 外观
- 不必安装就可以使用 Live Tails CD/DVD 来匿名浏览网络
- 当 Tails 运行时，不会在计算机上留下任何痕迹
- 使用先进的加密工具来加密任何相关文件，邮件等内容
- 通过 Tor 网络来发送和接收流量
- 真正意义地无论何时何处保护隐私
- 在 Live 环境中带有一些立即可用的应用
- 系统自带的所有软件都预先配置好只通过 Tor 网络来连接到互联网
- 任何不通过 Tor 网络而尝试连接网络的应用都将被自动阻拦
- 限制那些想查看你正在浏览什么网站的人的行动，并限制网站获取你的地理位置
- 连接到那些被墙或被审查的网站
- 特别设计不使用主操作系统的空间，即便是 swap 空间也不用
- 整个操作系统加载在内存中，在每次重启或关机后会自动擦除掉，所以不会留下任何运行的痕迹。
- 先进的安全实现，通过加密 USB 磁盘， HTTPS 应答加密和对邮件，文档进行签名。

#### 在 Tails 1.4 中所期待的东西 ####

- 带有安全滑块的 Tor 浏览器 4.5 
- Tor 被升级到版本 0.2.6.7
- 修补了几个安全漏洞
- 针对诸如 curl、 OpenJDK 7、 tor Network、 openldap 等应用， 许多漏洞被修复并打上了补丁

要得到完整的更改记录，你需要访问 [这里][2]
 
**注意**: 假如你使用 Tails 的任何旧版本，强烈建议升级到 Tails 1.4 。

#### 为什么我应该使用 Tails 操作系统 ####

你需要 Tails 因为你想：

- 在网络监控下保持自由
- 捍卫自由，隐私和秘密
- 流量分析下保持安全

这个教程将带你了解 Tails 1.4 操作系统的安装并给出一个简短的评论。

### Tails 1.4 安装指南 ###

1. 为了下载最新的 Tails OS 1.4，你可以使用 wget 命令来直接下载它

    $ wget http://dl.amnesia.boum.org/tails/stable/tails-i386-1.4/tails-i386-1.4.iso

或者你可以直接下载 Tails 1.4 的 ISO 镜像文件，或使用一个 Torrent 客户端来为你获取 ISO 镜像文件：
 
- [tails-i386-1.4.iso][3]
- [tails-i386-1.4.torrent][4]

2. 下载后，可使用 sha256sum 来获取 ISO 文件的哈希值并与官方提供的值相比较，以核实 ISO 文件的完整性

    $ sha256sum tails-i386-1.4.iso
    
    339c8712768c831e59c4b1523002b83ccb98a4fe62f6a221fee3a15e779ca65d

假如你熟悉 OpenPGP ，将 Tails 的签名密钥与 Debian 的 keyring 相比较以验证其签名，若想了解任何有关 Tails 的加密签名，请用浏览器访问 [这里][5]

3. 下一步，你需要将镜像写入 USB 棒或 DVD ROM 中。或许你需要看看这篇文章 “[如何创建一个 Live 可启动的 USB棒][6] ”以了解如何使得一个闪存盘变得可启动并向它写入 ISO 镜像文件。

4. 插入 Tails OS 的可启动闪存盘或 DVD ROM，并从那里启动 (在 BIOS 中选择该介质来启动)。第一个屏幕中会有两个选项 'Live' 和 'Live (failsafe)' 让你选择。选择 'Live' 并确定。

![Tails 启动菜单](http://www.tecmint.com/wp-content/uploads/2015/05/1.png)

*Tails 启动菜单*

5. 在登录之前，你有两个选项， 假如你想配置并设定高级选项，点击 '更多选项' 否则点击 'NO'。

![Tails 欢迎界面](http://www.tecmint.com/wp-content/uploads/2015/05/2.png)

*Tails 欢迎界面*

6. 在点击高级选项后，你需要设置 root 密码。假如你想升级它，这是非常重要的。这个 root 密码的有效期将持续到你关机或重启。

另外，若你想开启 Windows 伪装，假如你想在一个公共场所运行这个操作系统，这将使得看起来你正在运行 Windows 8 操作系统。这真是一个好的选项！不是吗？另外，你还有一个选项来配置网络和 Mac 地址，当一切准备完毕后，点击 '登录' ！

![Tails OS 的配置](http://www.tecmint.com/wp-content/uploads/2015/05/3.png)

*Tails OS 的配置*

7. 这是使用 Windows 皮肤伪装的 Tails GNU/Linux OS：

![Tails 的 Windows 伪装](http://www.tecmint.com/wp-content/uploads/2015/05/4.jpg)

*Tails 的 Windows 伪装*

8. 系统将在后台启动 Tor 网络。在屏幕的右上角查看通知 ：“Tor 已经准备好了，现在你已经连接上了互联网”。

你也可以在 Internet 菜单下查看它包含了哪些东西。 注意 ：它包含有 Tor 浏览器(安全的) 和 不安全的网络浏览器(其中的向内和向外数据不通过 Tor 网络) 和其他应用。

![Tails 菜单和工具](http://www.tecmint.com/wp-content/uploads/2015/05/5.jpg)

*Tails 菜单和工具*

9. 点击 Tor 并检查你的 IP 地址。 它确认我的物理位置没有被分享以及我的隐私未被触动。

![在 Tails 上检查隐私](http://www.tecmint.com/wp-content/uploads/2015/05/6.jpg)

*在 Tails 上检查隐私*

10. 你还可以激活 Tails 安装器来“克隆和安装”， “克隆和升级”以及“从 ISO 镜像文件中升级系统”。

![Tails 安装器选项](http://www.tecmint.com/wp-content/uploads/2015/05/7.jpg)

*Tails 安装器选项*

11. 如果选择另外的那个不带有高级选项的方式，那就直接登录。(查看上面的第 5 步).

![不设置高级选项的 Tails](http://www.tecmint.com/wp-content/uploads/2015/05/8.png)

*不设置高级选项的 Tails*

12. 这将登录到 Gnome3 桌面环境。

![Tails Gnome 桌面](http://www.tecmint.com/wp-content/uploads/2015/05/9.png)

*Tails Gnome 桌面*

13. 假如你点击启动不安全的浏览器，无论是否带有地址伪装，你都将会收到弹窗通知。

![Tails 浏览通知](http://www.tecmint.com/wp-content/uploads/2015/05/10.png)

*Tails 浏览通知*

假如你仍启动不安全的浏览器，你将在浏览器中看到如下网页：

![Tails 浏览警告](http://www.tecmint.com/wp-content/uploads/2015/05/11.png)

*Tails 浏览警告*

#### Tails 适合我吗？####

要想得到上面问题的答案，首先回答如下的问题：

- 在上网时，你想你的隐私不被触动吗？
- 你想在窃取身份信息的人的眼皮底下保持隐身吗？
- 你想在你的网上私人聊天过程中被他人嗅探吗？
- 你真的想向任何人展示你的地理位置吗？
- 你开展银行网上交易吗？
- 你愿意受政府和 ISP的审查吗？

假如以上问题中，任意一个问题的答案为 'YES'，则你最好需要 Tails。假如上面所有的问题的答案都是 'NO'，则或许你不需要它。

想对 Tails 了解更多？请将你的浏览器指向它的用户文档页面： 

文档: [https://tails.boum.org/doc/index.en.html][7]

### 总结 ###

对于那些工作在不安全环境中的人来说，Tails 是一个必需的操作系统。Tails 还是一个着眼于安全的操作系统，现在为止，包含了一大批应用 – Gnome 桌面、Tor、 Firefox (Iceweasel)、 Network Manager、 Pidgin、 Claws mail、 Liferea feed addregator、 Gobby、 Aircrack-ng、 I2P。

同时，它含有一些有关加密和隐私的工具，即 UKS、 GnuPG、 PWGen、 Shamir's Secret Sharing、 Virtual Keyboard (对付硬件的键盘记录器)、 MAT、 KeePassX Password Manager 等。

这就是全部了。关注我们。请分享你的有关 Tails GNU/Linux 操作系统的想法。对于这个项目的未来，你怎么看？同时在实际中测试它，并让我们获知你的体验感受。

你也可以在 [Virtualbox][8] 中运行它。 Tails 在内存中加载整个操作系统，所以在虚拟机中你需要给定足够的内存来运行 Tails。

我在 1GB 内存的环境中测试了 Tails，它工作起来毫无滞后感。谢谢我们的所有用户的支持。使我们成为一个包含所有 Linux 相关信息的地方，你的支持是必需的。 Kudos！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-tails-1-4-linux-operating-system-to-preserve-privacy-and-anonymity/

作者：[Avishek Kumar][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-3566-1.html
[2]:https://tails.boum.org/news/version_1.4/index.en.html
[3]:http://dl.amnesia.boum.org/tails/stable/tails-i386-1.4/tails-i386-1.4.iso
[4]:https://tails.boum.org/torrents/files/tails-i386-1.4.torrent
[5]:https://tails.boum.org/download/index.en.html#verify
[6]:http://www.tecmint.com/install-linux-from-usb-device/
[7]:https://tails.boum.org/doc/index.en.html
[8]:http://www.tecmint.com/install-virtualbox-on-redhat-centos-fedora/