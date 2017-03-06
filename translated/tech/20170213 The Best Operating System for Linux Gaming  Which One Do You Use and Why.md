Linux 游戏最好的操作系统：该选哪个以及为什么？
============================================================


### 告我我们哪个 Linux 发型版是对游戏支持最好的


在过去几个月中，我们尝试了多种用于游戏的 GNU/Linux 发行版，我们得出的结论是没有完美的操作系统专为 Linux 游戏设计。

我们都知道，游戏世界在 Nvidia 和 AMD 用户之间分裂。现在，如果你使用的是 Nvidia 显卡，即使是五年前的一块显卡，也可以在大多数基于 Linux 的操作系统上使用，因为 Nvidia 为大多数（如果不是全部的话）GPU 提供了最新的视频驱动程序。

当然，这意味着如果你有一块 Nvidia GPU，你不应该有大多数 GNU/Linux 发行版的任何主要问题。至少与游戏中的图形或其他性能问题无关，这将严重影响你的游戏体验。

<q class="subhead" style="font-size: 18px; line-height: 26px; margin-top: 30px; margin-bottom: 10px; position: relative; display: block; font-weight: 700; letter-spacing: -0.6px; color: rgb(0, 40, 115); font-family: museo_slab, serif;">AMD Radeon 用户最好的游戏发行版</q>

如果你使用 AMD Radeon GPU，事情会是完全不同的。我们都知道，AMD 的专有显卡驱动程序仍然需要大量的工作来兼容最新的 GNU/Linux 发行版本，以及所有的 AMD GPU，以及最新的 X.Org 服务端和 Linux 内核版本。

目前 AMDGPU-PRO 视频驱动程序只能在 Ubuntu 16.04 LTS、CentOS 6.8/7.3、Red Hat Enterprise Linux 6.8/7.3、SUSE Linux Enterprise Desktop 和 Server 12 SP2 上运行。除了 Ubuntu 16.04 LTS 之外，我们不知道为什么 AMD 为所有这些面向服务器和企业级的操作系统提供支持。

我们不相信有 Linux 玩家会在这些系统上面玩游戏。[最新的 AMDGPU-PRO 更新][1]终于支持了HD 7xxx 和 8xxx 系列的 AMD Radeon GPU，但是如果我们不想使用 Ubuntu 16.04 LTS 呢？

另外我们有 Mesa 3D 图形库，这在大多数发行版上都有。Mesa 图形栈为我们的 AMD GPU 提供了功能强大的开源 Radeon 和 AMDGPU 驱动程序，但是为了享受最好的游戏体验，你还需要拥有最新的 X.Org 服务端和 Linux 内核。

并不是所有的 Linux 操作系统都附带最新的 Mesa（13.0）、X.Org服务端（1.19）和 Linux 内核（4.9）版本，它们支持较旧的AMD GPU。有些只有一两种技术，但我们需要它们，内核需要编译 AMD Radeon Southern Islands 和 Sea Island 来支持 AMDGPU 驱动程序工作。

我们发现整个情况相当令人沮丧，至少对于一些使用 AMD Radeon 老式一点显卡的玩家。现在，我们发现，使用 AMD Radeon HD 8xxx GPU 的最佳游戏体验只能通过使用 Git 和 Linux 内核 4.10 RC 的 Mesa 17 来实现。

所以我们现在请求你 - 如果你找到了游戏的完美的 GNU/Linux 发行版，无论你使用 AMD Radeon 还是 Nvidia GPU，但我们最感兴趣的是那些使用 AMD GPU，使用的是什么发行版，设置是什么，能不能玩最新的游戏后者有体验问题？谢谢！

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/the-best-operating-system-for-linux-gaming-which-one-do-you-use-and-why-512861.shtml

作者：[Marius Nestor ][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

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
