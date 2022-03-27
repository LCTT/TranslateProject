[#]: subject: (How I helped my mom switch from Windows to Linux)
[#]: via: (https://opensource.com/article/21/6/mom-switch-linux)
[#]: author: (Tomasz https://opensource.com/users/tomaszwaraksa)
[#]: collector: (lujun9972)
[#]: translator: (lkxed)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

我是如何帮助妈妈从 Windows 切换至 Linux 的
======
有了 Linux，即便是新手用户，也能通过大量熟悉的应用程序获得流畅、精致的桌面体验。
![Red Lego Heart][1]

大型强子对撞机是 [由 Linux 驱动][2] 的，国际空间站上的笔记本电脑是 [运行在 Linux 上][3] 的，[Instagram][4] 和 [Nest thermostats][5] 也是如此。最近，我们观看了 <ruby>机智号<rt>Ingenuity</rt></ruby> 在火星上空飞翔，它是一个令人惊叹的无人直升机，也是 [由 Linux 驱动的][6]！这进一步证明了这个操作系统的灵活性和通用性。

但是现在，真正的大新闻来了。我在这里“官宣”：Linux 也可以给父母使用！

### 事情经过

大约一年前，我决定把妈妈的电脑环境迁移至 Linux。现在，一年过去了，是时候回顾和总结一下了。

和大多数人一样，我是专属的 “妈妈的电脑管理员”。我的妈妈是一个 60 多岁的可爱老太太 —— 一个真正的甜心。她的电脑技能很基础，她的电脑使用需求也很基础：上上网，发发邮件，打打字，浏览、编辑照片，看看视频听听歌，还有就是在 Skype 或者 Signal 上和家里人或者朋友们打打电话。

直到去年之前，妈妈一直在使用一个 Windows 笔记本电脑。电脑已经很旧了，但还不算太糟糕。于是在某一天，通过欺骗、威胁和弹出讨厌的窗口等手段，微软终于成功让她点击了那个可怕的按钮 —— “升级到 Windows 10”。

她绝望地向我呼救。作为妈妈的电脑管理员，我的生活很快就变成了地狱。“为什么所有东西看起来都不一样了？我的应用列表跑去哪儿了？什么，这堆瓷块一样的东西变成我的应用列表了？我的电脑怎么变得这么慢？它怎么每天都要自动更新重启，而且偏偏就是在我想要用它的时候？为什么有东西（她指的是硬盘）一直嗡嗡嗡地叫？它到底一直在忙些什么啊？”

可是我又看不到源代码，我怎么它一直在忙些什么呢？

本来我是打算回滚这个升级的，但是 Windows 7 马上就要终止支持了，我担心会发生最坏的事情：没有了安全更新，妈妈的电脑很快就会变成数不清的<ruby>僵尸网络<rt>bot networks</rt></ruby>中的一员，一天到晚地挖矿、发送垃圾邮件，以及对全国的重要设施发动恶毒的 DDOS 攻击。最后还是需要我来清理这个烂摊子 —— （而且是）每一个周末。

### 大救星 Linux 来了

我决定把她的电脑环境迁移到 Linux 上，反正也没有什么可损失的。我自己在五年前就这么做了，我从未那么开心过。不如让妈妈也试试，肯定不会有什么坏处。

当妈妈知道我要一次性解决她所有的问题时，她非常开心。但她不知道的是，她将成为一项为期一年的科学实验的关键部分，这个实验叫做：“妈妈能学会使用 Linux 吗？”

![Cowsay "Can Mom Survive Linux?"][7]

(图源 Tomasz Waraksa，遵从[<ruby>署名-相同方式共享 4.0 国际协议<rt>CC BY-SA 4.0</rt></ruby>][8])

于是，在 2020 年 2 月的某一天，我从遥远的都柏林带着一台使用七年的联想 Yoga 13 来到这里，这台电脑和妈妈那台有着相似的参数，但它的屏幕要好很多，而且只有一半的重量。我在 VirtualBox 里讨论和测试了不同的 Linux 发行版，最终选择了 [Zorin OS][9] 发行版，一个自豪的“爱尔兰造”系统。我选择它是考虑到了下面几个因素：


  * 它基于我最熟悉的 Ubuntu Linux。
  * 它和 Windows 7 很像，在精心设计的同时考虑到了 Windows 难民。
  * 我感觉它很轻量、简单，对妈妈来说足够保守。完全没有 macOS Big Sur 上的花里胡哨！



![Zorin OS desktop][10]

(图源 Tomasz Waraksa，遵从[<ruby>署名-相同方式共享 4.0 国际协议<rt>CC BY-SA 4.0</rt></ruby>][8])

### 系统安装

我用自己一贯的方式安装了这个操作系统，为 `/home` 目录单独分了一个区，这样一来，系统重装时（尽管不大可能发生）妈妈的文件仍然能够保持安全。这是我的惯用技巧，它可以方便我安装发行版的深夜更新。

在安装过程中，我选择了波兰语作为用户界面语言。和我一样，妈妈也是个彻头彻尾的波兰人。不必担心，Linux 看起来支持所有语言，甚至包括 [克林贡语][11]。

接着，根据妈妈的需求，我安装了下面这些应用：

  * Skype
  * [Signal 桌面客户端][12]
  * 谷歌 Chrome 浏览器
  * [Geary][13] 邮件客户端
  * [gThumb][14]，用来浏览和编辑照片
  * [VLC][15]，用来播放视频和音乐
  * Softmaker Office，用来编辑文本和表格



注意到列表里没有杀毒软件了吗？好耶！

一个小时后，系统和应用全部安装完成，妈妈的 Zorin OS 已准备就绪。

![Zorin OS home folder][16]

(图源 Tomasz Waraksa，遵从[<ruby>署名-相同方式共享 4.0 国际协议<rt>CC BY-SA 4.0</rt></ruby>][8])

### 设置系统

我通过下面这几个步骤，让自己成为了妈妈的电脑管理员：

  * 为我自己创建了一个管理员账户
  * 把妈妈的账户设置为非管理员
  * 安装了用于远程无人值守访问的 `ssh` 守护程序
  * 把这台机器加入到了我的 Hamachi VPN 中：这样一来，我就可以安全地使用 ssh 连接，而不需要打开路由器上的 `22` 端口。Hamachi 是一个由 LogMeIn 提供的 VPN 服务。它是一个传统的 VPN，我的意思是，它的目标不是让你在另外一个国家运行 Netflix 应用，而是在互联网上为计算机之间建立一个安全的网络连接。
  * 启动了简单防火墙（`ufw`）并允许 ssh 流量
  * 安装了 AnyDesk 来远程登录到桌面



这样操作之后，我就可以通过安全的 ssh 连接访问到妈妈的笔记本电脑。我可以通过 shell 进行定期维护，而妈妈甚至不会注意到任何事情。这是因为 Linux 完成更新后通常 _不需要_ 重新启动。真是一个奇迹啊！简直不可能的事，它是怎么做到的呢？

![Updating software remotely][17]

(图源 Tomasz Waraksa，遵从[<ruby>署名-相同方式共享 4.0 国际协议<rt>CC BY-SA 4.0</rt></ruby>][8])

### 妈妈能学会使用 Linux 吗

毫无疑问！

尽管当我把新电脑展示给她看的时候，她确实有问到为什么这个新的 Windows 又看起来不一样了。我不得不解释说这个其实不是 Windows，而是 Linux，然后向她解释了为什么我们都爱 Linux。不过，她学得很快。这个经典的 Zorin OS 桌面和她用惯了的 Windows 7 十分相似。我看到她在系统里点来点去，然后很轻松地找到并且运行了她熟悉的应用程序。

她立刻就注意到电脑启动快了很多，表现也好了很多。

然后她开始问我什么时候会给她做电脑的定期清理，好让她电脑不会再一次变慢。我和她解释说，以她的日常使用量，不需要再做定期清理了。Linux 和 Windows 不一样，它不会自己“腐烂”的。目前来说，的确如此。她的电脑仍然像第一天那样流畅和快速。

我时不时地会问她对新电脑感觉怎么样，她总是回答说很满意。一切都很顺利。电脑也不会莫名其妙就变得忙起来。再也不会有一些“很重要的更新”来打断她。应用菜单也总是在它该在的地方。在这个全新的环境中，她对自己常用的应用程序也感到满意。

在这一年中，我远程登录过几次她的电脑，为的是进行常规的软件包升级。我还使用 AnyDesk 登录过两次她的桌面。一次是妈妈问我能不能帮她把 SD 卡里的照片自动导入到 `~/Pictures` 目录里，如果能够放到以日期命名的目录里就更好了。当然可以，只要懂一点点的 Bash，就可以使用 `gThumb` 很轻松地实现这个功能。另一次，我把她经常访问的网站添加到了桌面，这样她点击桌面图标就可以访问了。

这就是目前我作为妈妈的 Linux 管理员所做的全部事情！按照这个情况，我还可以再给 50 个妈妈当电脑管理员！

### 总结

我希望我的故事能够启发你考虑迁移到 Linux。过去，我们认为 Linux 对于普通用户来说太难了。但今天，我相信事实恰恰相反。用户使用电脑越不熟练，他们就越有理由迁移到 Linux！

有了 Linux，即便是新手用户，也能通过大量熟悉的应用程序获得流畅、精致的桌面体验。新手用户们将比在任何其他流行的计算平台上都要安全得多。并且，通过远程访问来帮助他们从未如此简单和安全！

_免责声明：本文不推广所描述的任何产品、服务或供应商。我与他们没有任何商业利益或联系。我并没有在暗示这些产品或服务是最适合你的，也不承诺你的体验会和我一样。_

* * *

_本文最初发布在 [Let's Debug It][18] 上，在获得许可后重新使用。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/mom-switch-linux

作者：[Tomasz][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomaszwaraksa
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/heart_lego_ccby20.jpg?itok=VRpHf4iU (Red Lego Heart)
[2]: https://www.redhat.com/en/about/press-releases/red-hat-provides-cern-platform-mission-critical-applications
[3]: https://www.extremetech.com/extreme/155392-international-space-station-switches-from-windows-to-linux-for-improved-reliability
[4]: https://instagram-engineering.com/what-powers-instagram-hundreds-of-instances-dozens-of-technologies-adf2e22da2ad
[5]: https://www.theverge.com/2011/11/14/2559567/tony-fadell-nest-learning-thermostat
[6]: https://www.zdnet.com/article/to-infinity-and-beyond-linux-and-open-source-goes-to-mars/
[7]: https://opensource.com/sites/default/files/uploads/intro.png (Cowsay "Can Mom Survive Linux?")
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://zorinos.com/
[10]: https://opensource.com/sites/default/files/uploads/zorin-os-desktop.png (Zorin OS desktop)
[11]: https://blogs.gnome.org/muelli/2010/04/klingon-language-support/
[12]: https://github.com/signalapp
[13]: https://wiki.gnome.org/Apps/Geary
[14]: https://wiki.gnome.org/Apps/Gthumb
[15]: https://www.videolan.org/vlc/
[16]: https://opensource.com/sites/default/files/uploads/zorin-os-home-folder.png (Zorin OS home folder)
[17]: https://opensource.com/sites/default/files/uploads/upgrading-software.png (Updating software remotely)
[18]: https://letsdebug.it/post/16-linux-for-mars-copters-moms-and-pops/
