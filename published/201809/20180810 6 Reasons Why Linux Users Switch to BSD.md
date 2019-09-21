Linux 用户应该换到 BSD 的 6 个理由
======

迄今我因 BSD 是 <ruby>自由及开源软件<rt>Free and Open Source Software</rt></ruby>（FOSS） 已经写了数篇关于它的文章。但总有人会问：“为什么要纠结于 BSD？”。我认为最好的办法是写一篇关于这个话题的文章。

### 为什么用 BSD 取代 Linux？

为了准备这篇文章，我与几位 BSD 的用户聊了聊，其中有人使用了多年 Linux 而后转入 BSD。因而这篇文章的观点都来源于真实的 BSD 用户。本文希望提出一个不同的观点。

![why use bsd over linux][2]

#### 1、BSD 不仅仅是一个内核

几个人都指出 BSD 提供的操作系统对于终端用户来说就是一个巨大而统一的软件包。他们指出所谓 “Linux” 仅仅说的是内核。一个 Linux 发行版由上述的内核与许多由发行者所选取的不同的应用与软件包组成。有时候安装新的软件包所导致的不兼容会使系统产生崩溃。

一个典型的 BSD 由内核和许多必要的软件包组成。这些包里的大多数是通过活跃的项目所开发，因此其具备高集成度与高响应度的特点。

#### 2、软件包更值得信赖

说起软件包，BSD 用户提出的另一点是软件包的可信度。在 Linux 上，软件包可以从一堆不同的源上获得，一些是发行版的开发者提供的，另一些是第三方。[Ubuntu][3]  和[其他发行版][4]就遇到了在第三方应用里隐藏了恶意软件的问题。

在 BSD 上，所有的软件包由“集中式软件包/ ports 系统”所提供，“每个软件包都是单一仓库的一部分，并且每一步都设有安全系统”。这就确保了黑客不能将恶意软件潜入到看似稳定的应用程序中，保障了 BSD 的长期稳定性。

#### 3、更新缓慢 = 更好的长期稳定性

如果更新是一场竞赛，那么 Linux 就是兔子，BSD 就是乌龟。甚至最慢的 Linux 发行版每年至少发布一个新版本（当然，除了 Debian）。在 BSD 的世界里，重大版本的发布需要更长时间。这就意味着可以更关注于将事情做完善之后再将它推送给用户。

这也意味着操作系统的变化会随着时间的推移而发生。Linux 世界经历了数次快速而重大的变化，我们至今仍感觉如此（咳咳， [systemD][5]，咳咳）。就像 Debian 那样，长时间的开发周期可以帮助 BSD 去测试新的想法，保证在它在永久改变之前正常工作。它也有助于生产出不太可能出现问题的代码。

#### 4、Linux 太乱了

没有一个 BSD 用户直截了当地指出这一点，但这是他们许多经验所显示出的情况。很多用户从一个 Linux 发行版跳到另一个发行版去寻找适合他的版本。很多情况下，他们无法使所有的软件或硬件正常工作。这时，他们决定尝试使用 BSD，接着，所有的东西都正常工作了。

当考虑到如何选择 BSD 时，一切就变得相当简单。目前只有六个 BSD 发行版在积极开发。这些 BSD 中的每一个都有特定的用途。“[OpenBSD][6] 更安全，[FreeBSD][7] 适用于桌面或服务器，[NetBSD][8] 无所不包，[DragonFlyBSD][9] 精简高效”。与此同时，充斥着 Linux 世界的许多发行版仅仅是在现有的发行版上增加了主题或者图标而已。BSD 项目数量之少意味着它重复性低并且更加专注。

#### 5、ZFS 支持

一个 BSD 用户说到他选择 BSD 最主要的原因是 [ZFS][10]。事实上，几乎所有我谈过的人都提到 BSD 支持 ZFS 是他们没有返回 Linux 的原因。

这一点是 Linux 从一开始就处于下风的地方。虽然在一些 Linux 发行版上可以使用 [OpenZFS][11]，但是 ZFS 已经内置在了 BSD 的内核中。这意味着 ZFS 在 BSD 上将会有更好地性能。尽管有过将 ZFS 加入到 Linux 内核中的数次尝试，但许可证问题依旧无法解决。

#### 6、许可证

就许可证而言也有不同的看法。大多数人所持有的想法是，GPL 不是真正的自由，因为它限制了如何使用软件。一些人也认为 GPL “太庞大而复杂而难于理解，如果在开发过程中不仔细检查许可证会导致法律问题。”

另一方面，BSD 协议只有 3 条，并且允许任何人“使用软件、进行修改、做任何事，并且对开发者提供了保护”。

### 总结

这些仅仅只是一小部分人们使用 BSD 而不使用 Linux 的原因。如果你感兴趣，你可以[在这][12]阅读其他人的评论。如果你是 BSD 用户并且觉得我错过什么重要的地方，请在评论里说出你的想法。

如果你觉得这篇文章有意思，请在社交媒体上、技术资讯或者 [Reddit][13] 上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-use-bsd/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:https://itsfoss.com/category/bsd/
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/why-BSD.png
[3]:https://itsfoss.com/snapstore-cryptocurrency-saga/
[4]:https://www.bleepingcomputer.com/news/security/malware-found-in-arch-linux-aur-package-repository/
[5]:https://www.freedesktop.org/wiki/Software/systemd/
[6]:https://www.openbsd.org/
[7]:https://www.freebsd.org/
[8]:http://netbsd.org/
[9]:http://www.dragonflybsd.org/
[10]:https://en.wikipedia.org/wiki/ZFS
[11]:http://open-zfs.org/wiki/Main_Page
[12]:https://discourse.trueos.org/t/why-do-you-guys-use-bsd/2601
[13]:http://reddit.com/r/linuxusersgroup
