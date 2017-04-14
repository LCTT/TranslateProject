哪个 Linux 系统最适合玩游戏？
============================================================

> 告诉我们哪个 Linux 发型版对游戏支持的最好

在过去几个月中，出于游戏目的，我们尝试了多种 GNU/Linux 发行版，我们得出的结论是没有专为 Linux 游戏设计的完美的操作系统。

我们都知道，游戏世界分成 Nvidia 和 AMD 两个阵营。现在，如果你使用的是 Nvidia 显卡，即使是五年前的一块显卡，也可以在大多数基于 Linux 的操作系统上使用，因为 Nvidia 差不多为其所有的 GPU 都提供了最新的视频驱动程序。

当然，这意味着如果你有一块 Nvidia GPU，在大多数 GNU/Linux 发行版上你不会有什么大问题。至少与游戏中的图形或其他性能问题无关，这种问题将严重影响你的游戏体验。

### AMD Radeon 用户最好的游戏发行版

如果你使用 AMD Radeon GPU，事情会是完全不同的。我们都知道，AMD 的专有显卡驱动程序仍然需要大量的工作来兼容最新的 GNU/Linux 发行版本。所有的 AMD GPU ，即便是在最新的 X.Org 服务端和 Linux 内核版本上都是这样。

目前，AMDGPU-PRO 视频驱动程序只能在 Ubuntu 16.04 LTS、CentOS 6.8/7.3、Red Hat Enterprise Linux 6.8/7.3、SUSE Linux Enterprise Desktop 和 Server 12 SP2 上运行。除了 Ubuntu 16.04 LTS 之外，我们不知道为什么 AMD 为所有这些面向服务器和企业级的操作系统提供支持。

我们不相信有 Linux 玩家会在这些系统上面玩游戏。[最新的 AMDGPU-PRO 更新][1]终于支持了 HD 7xxx 和 8xxx 系列的 AMD Radeon GPU，但是如果我们不想使用 Ubuntu 16.04 LTS 呢？

另外，我们有 Mesa 3D 图形库，这在大多数发行版上都有。Mesa 图形栈为我们的 AMD GPU 提供了功能强大的开源 Radeon 和 AMDGPU 驱动程序，但是为了享受最好的游戏体验，你还需要拥有最新的 X.Org 服务端和 Linux 内核。

并不是所有的 Linux 操作系统都附带最新的 Mesa（13.0）、X.Org 服务端（1.19）和 Linux 内核（4.9）版本，它们支持较旧的 AMD GPU。有些系统只有其中一两种技术，但我们这些都需要，而且内核需要编译进 AMD Radeon Southern Islands 和 Sea Island 驱动来支持 AMDGPU。

我们发现整个情况相当令人沮丧，至少对于一些使用 AMD Radeon 老式显卡的玩家来说是这样的。现在，我们发现，使用 AMD Radeon HD 8xxx GPU 的最佳游戏体验只能通过使用 Git 获取到的 Mesa 17 以及 Linux 内核 4.10 RC 来实现。

所以我们现在请求你 - 如果你找到了玩游戏的完美的 GNU/Linux 发行版，无论你使用的是 AMD Radeon 还是 Nvidia GPU，但我们最感兴趣的是那些使用 AMD GPU 的玩家，请告知我们你使用的是什么发行版，设置是什么，能不能玩最新的游戏，或者有无体验问题。谢谢！

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/the-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml

作者：[Marius Nestor][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
[1]:http://news.softpedia.com/news/amdgpu-pro-16-60-linux-driver-finally-adds-amd-radeon-hd-7xxx-8xxx-support-512280.shtml
[2]:http://news.softpedia.com/editors/browse/marius-nestor
[3]:http://news.softpedia.com/news/the-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml#
[4]:https://share.flipboard.com/bookmarklet/popout?v=2&title=The+Best+Operating+System+for+Linux+Gaming%3A+Which+One+Do+You+Use+and+Why%3F&url=http%3A%2F%2Fnews.softpedia.com%2Fnews%2Fthe-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml&t=1487038258&utm_campaign=widgets&utm_medium=web&utm_source=flipit&utm_content=news.softpedia.com
[5]:http://news.softpedia.com/news/the-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml#
[6]:http://twitter.com/intent/tweet?related=softpedia&via=mariusnestor&text=The+Best+Operating+System+for+Linux+Gaming%3A+Which+One+Do+You+Use+and+Why%3F&url=http%3A%2F%2Fnews.softpedia.com%2Fnews%2Fthe-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml
[7]:https://plus.google.com/share?url=http://news.softpedia.com/news/the-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml
[8]:https://twitter.com/intent/follow?screen_name=mariusnestor
