TrueOS 不再想要成为“桌面 BSD”了
============================================================


[TrueOS][9] 很快会有一些非常重大的变化。今天，我们将了解桌面 BSD 领域将会发生什么。

### 通告

![TrueOS: Core Operating System BSD](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/true-os-bsd-desktop.jpeg)

[TrueOS][10] 背后的团队[宣布][11]，他们将改变项目的重点。到目前为止，TrueOS 使用开箱即用的图形用户界面来轻松安装 BSD。然而，它现在将成为“一个先进的操作系统，保留你所知道和喜欢的 ZFS（[OpenZFS][12]）和 [FreeBSD][13]的所有稳定性，并添加额外的功能来创造一个全新的、创新的操作系统。我们的目标是创建一个核心操作系统，该系统具有模块化、实用性，非常适合自己动手和高级用户。“

从本质上讲，TrueOs 将成为 FreeBSD 的下游分支。他们将集成更新一些的软件到系统中，例如 [OpenRC][14] 和 [LibreSSL][15]。他们希望能坚持 6 个月的发布周期。

其目标是使 TrueOS 成为可以作为其他项目构建的基础。缺少图形部分以使其更加地与发行版无关。

### 桌面用户如何？

如果你读过我的[TrueOS 评论][17]并且有兴趣尝试使用桌面 BSD 或已经使用 TrueOS，请不要担心（这对于生活来说也是一个很好的建议）。TrueOS 的所有桌面元素都将剥离到 [Project Trident][18]。目前，Project Trident 网站的细节不多。他们仿佛还在进行剥离的幕后工作。

如果你目前拥有 TrueOS，则无需担心迁移。TrueOS 团队表示，“对于那些希望迁移到其他基于 FreeBSD 的发行版，如 Project Trident 或 [GhostBSD][19] 的人而言将会有迁移方式。”

### 想法

当我第一次阅读该公告时，坦率地说有点担心。改变名字可能是一个坏主意。客户将习惯使用一个名称，但如果产品名称发生变化，他们可能很容易失去对项目的跟踪。TrueOS 经历过名称更改。该项目于 2006 年启动时，它被命名为 PC-BSD，但在 2016 年，名称更改为 TrueOS。它让我想起了[ArchMerge 和 Arcolinux 传奇][21]。

话虽这么说，我认为这对 BSD 的桌面用户来说是一件好事。我常听见对 PC-BSD 和 TrueOS 的一个批评是它不是很精致。剥离项目的两个部分将有助于提高相关开发人员的关注度。TrueOS 团队将能够为缓慢进展的 FreeBSD 添加更新的功能，Project Trident 团队将能够改善用户的桌面体验。

我希望两个团队都好。请记住，当有人为开源而努力时，即使是我们不会使用的部分，我们也都会受益。

你对 TrueOS 和 Project Trident 的未来有何看法？请在下面的评论中告诉我们。


------------------------------

关于作者：

我叫 John Paul Wohlscheid。我是一个有抱负的神秘作家，喜欢玩技术，尤其是 Linux。你可以在[我的个人网站][23]关注我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/trueos-plan-change/

作者：[John Paul Wohlscheid][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/john/
[1]:https://itsfoss.com/author/john/
[2]:https://itsfoss.com/trueos-plan-change/#comments
[3]:https://itsfoss.com/category/bsd/
[4]:https://itsfoss.com/category/news/
[5]:https://itsfoss.com/tag/bsd/
[6]:https://itsfoss.com/tag/freebsd/
[7]:https://itsfoss.com/tag/project-trident/
[8]:https://itsfoss.com/tag/trueos/
[9]:https://www.trueos.org/
[10]:https://www.trueos.org/
[11]:https://www.trueos.org/blog/trueosdownstream/
[12]:http://open-zfs.org/wiki/Main_Page
[13]:https://www.freebsd.org/
[14]:https://en.wikipedia.org/wiki/OpenRC
[15]:http://www.libressl.org/
[16]:https://itsfoss.com/midnightbsd-founder-lucas-holt/
[17]:https://itsfoss.com/trueos-bsd-review/
[18]:http://www.project-trident.org/
[19]:https://www.ghostbsd.org/
[20]:https://itsfoss.com/interview-freedos-jim-hall/
[21]:https://itsfoss.com/archlabs-vs-archmerge/
[22]:http://reddit.com/r/linuxusersgroup
[23]:http://johnpaulwohlscheid.work/
