Linux 开发者如何看待 Git 和 Github？
=====================================================

### Linux 开发者如何看待 Git 和 Github？

Git 和 Github 在 Linux 开发者中有很高的知名度。但是开发者如何看待它们呢？另外，Github 是不是真的和 Git 是一个意思？一个 Linux reddit 用户最近问到了这个问题，并且得到了很有意思的答案。

Dontwakemeup46 提问：

> 我正在学习 Git 和 Github。我感兴趣社区如何看待两者？据我所知，Git 和 Github 应用十分广泛。但是 Git 或 Github 有没有严重的不足？社区喜欢去改变些什么呢？

[更多见 Reddit](https://www.reddit.com/r/linux/comments/45jy59/the_popularity_of_git_and_github/)

与他志同道合的 Linux reddit 用户回答了他们对于 Git 和 Github的观点：

>**Derenir**: “Github 并不附属于 Git。

> Git 是由 Linus Torvalds 开发的。

> Github 几乎不支持 Linux。

> Github 是一家企图借助 Git 赚钱的公司。

> https://desktop.github.com/ 并没有支持 Linux。”

---
>**Bilog78**: “一个小的补充： Linus Torvalds 已经不再维护 Git了。维护者是 Junio C Hamano，以及 在他之后的主要贡献者是 Jeff King 和 Shawn O. Pearce。”

---

>**Fearthefuture**: “我喜欢 Git，但是不明白人们为什么还要使用 Github。从我的角度，Github 比 Bitbucket 好的一点是用户统计和更大的用户基础。Bitbucket 有无限的免费私有库，更好的 UI，以及更好地集成了其他服务，比如说 Jenkins。”

---

>**Thunger**: “Gitlab.com 也很不错，特别是你可以在自己的服务器上架设自己的实例。”

---

>**Takluyver**: “很多人熟悉 Github 的 UI 以及相关联的服务，比如说 Travis 。并且很多人都有 Github 账号，所以它是存储项目的一个很好的地方。人们也使用他们的 Github 个人信息页作为一种求职用的作品选辑，所以他们很积极地将更多的项目放在这里。Github 是一个存放开源项目的事实标准。”

---

>**Tdammers**: “Git 严重问题在于 UI，它有些违反直觉，以至于很多用户只能达到使用一些容易记住的咒语的程度。”

> Github：最严重的问题在于它是商业托管的解决方案；你买了方便，但是代价是你的代码在别人的服务器上面，已经不在你的掌控范围之内了。另一个对于 Github 的普遍批判是它的工作流和 Git 本身的精神不符，特别是 pull requests 工作的方式。最后， Github 垄断了代码的托管环境，同时对于多样性是很不好的，这反过来对于旺盛的免费软件社区很重要。”

---

>**Dies**: “更重要的是，如果一旦是这样，按照现状来说，我猜我们会被 Github 所困，因为它们控制如此多的项目。”

---

>**Tdammers**: “代码托管在别人的服务器上，这里"别人"指的是 Github。这对于开源项目来说，并不是什么太大的问题，但是尽管如此，你无法控制它。如果你在 Github 上有私有项目，“它将保持私有”的唯一的保险只是 Github 的承诺而已。如果你决定删除东西，你不能确定东西是否被删除了，或者只是隐藏了。

Github 并不自己控制这些项目（你总是可以拿走你的代码，然后托管到别的地方，声明新位置是“官方”的），它只是有比开发者本身有更深的使用权。”

---

>**Drelos**: “我已经读了大量的关于 Github 的赞美与批评。（这里有一个[例子](http://www.wired.com/2015/06/problem-putting-worlds-code-github/)），但是我的幼稚问题是为什么不向一个免费开源的版本努力呢？”

---

>**Twizmwazin**: “Gitlab 的源码就存在这里”

---

[更多见 Reddit](https://www.reddit.com/r/linux/comments/45jy59/the_popularity_of_git_and_github/)

### DistroWatch 评估 XStream 桌面 153 版本

XStreamOS 是一个由 Sonicle 创建的 Solaris 的一个版本。XStream 桌面将 Solaris 的强大带给了桌面用户，同时新手用户很可能有兴趣体验一下。DistroWatch 对于 XStream 桌面 153 版本做了一个很全面的评估，并且发现它运行相当好。

Jesse Smith 为 DistroWatch 报道:

> 我认为 XStream 桌面做好了很多事情。诚然，当操作系统无法在我的硬件上启动，同时当运行在 VirtualBox 中时我无法使得桌面使用我显示器的完整分辨率，我的开端并不很成功。不过，除此之外，XStream 表现的很好。安装器工作的很好，该系统自动设置和使用了引导环境（boot environments），这让我们可以在发生错误时恢复该系统。包管理器有工作的不错， XStream 带了一套有用的软件。

> 我确实在播放多媒体文件时遇见一些问题，特别是使声卡工作。我不确定这是不是又一个硬件兼容问题，或者是该操作系统自带的多媒体软件的问题。另一方面，像 Web 浏览器，电子邮件，生产工具套件以及配置工具这样的工作的很好。

> 我最欣赏 XStream 的地方是这个操作系统是 OpenSolaris 家族的一个使用保持最新的分支。OpenSolaris 的其他衍生系统有落后的倾向，但是至少在桌面软件上，XStream 搭载最新版本的火狐和 LibreOffice。

> 对我个人来说，XStream 缺少一些组件，比如打印机管理器，多媒体支持和我的特定硬件的驱动。这个操作系统的其他方面也是相当吸引人的。我喜欢开发者搭配了 LXDE，也喜欢它的默认软件集，以及我最喜欢文件系统快照和启动环境开箱即用的方式。大多数的 Linux 发行版，openSUSE 除外，并没有利用好引导环境（boot environments）的用途。我希望它是一个被更多项目采用的技术。

[更多见 DistroWatch](http://distrowatch.com/weekly.php?issue=20160215#xstreamos)

### 街头霸王 V 和 SteamOS

街头霸王是最出名的游戏之一，并且 [Capcom 已经宣布](http://steamcommunity.com/games/310950/announcements/detail/857177755595160250) 街头霸王 V 将会在这个春天进入 Linux 和 StreamOS。这对于 Linux 游戏者是非常好的消息。

Joe Parlock 为 Destructoid 报道：

> 你是不足 1% 的那些在 Linux 系统上玩游戏的 Stream 用户吗？你是更少数的那些在 Linux 平台上玩游戏，同时也很喜欢街头霸王 V 的人之一吗？是的话，我有一些好消息要告诉你。

> Capcom 已经宣布，这个春天街头霸王 V 通过 Stream 进入 StreamOS 以及其他 Linux 发行版。它无需任何额外的花费，所以那些已经在自己的个人电脑上安装了该游戏的人可以很容易在 Linux 上安装它并玩了。

[更多 Destructoid](https://www.destructoid.com/street-fighter-v-is-coming-to-linux-and-steamos-this-spring-341531.phtml)

你是否错过了摘要？检查 [开源之眼的主页](http://www.infoworld.com/blog/eye-on-open/) 来获得关于 Linux 和开源的最新的新闻。

------------------------------------------------------------------------------

via: http://www.infoworld.com/article/3033059/linux/what-do-linux-developers-think-of-git-and-github.html

作者：[Jim Lynch][a]
译者：[mudongliang](https://github.com/mudongliang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Jim-Lynch/

