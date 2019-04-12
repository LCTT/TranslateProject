每个 Linux 游戏玩家都绝不想要的恼人体验
===================

[![Linux 平台上玩家的问题](https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg)][10]

（LCTT 译注：本文原文发表于 2016 年，可能有些信息已经过时。）

[在 Linux 平台上玩游戏][12] 并不是什么新鲜事，现在甚至有专门的 [Linux 游戏发行版][13]，但是这不意味着在 Linux 上打游戏的体验和在 Windows 上一样顺畅。

为了确保我们和 Windows 用户同样地享受游戏乐趣，哪些问题是我们应该考虑的呢？

[Wine][14]、[PlayOnLinux][15] 和其它类似软件不总是能够让我们玩所有流行的 Windows 游戏。在这篇文章里，我想讨论一下为了拥有最好的 Linux 游戏体验所必须处理好的若干因素。 

### #1 SteamOS 是开源平台，但 Steam for Linux 并不是 

正如 [StemOS 主页][16]所说， 即便 SteamOS 是一个开源平台，但 Steam for Linux 仍然是专有的软件。如果 Steam for Linux 也开源，那么它从开源社区得到的支持将会是巨大的。既然它不是，那么 [Ascension 计划的诞生自然是不可避免的][17]：

- [Destination: Project Ascension • UI Design Mockups Reveal](https://youtu.be/07UiS5iAknA)

Ascension 是一个开源的游戏启动器，旨在能够启动从任何平台购买、下载的游戏。这些游戏可以是 Steam 平台的、[Origin 游戏][18]平台的、Uplay 平台的，以及直接从游戏开发者主页下载的，或者来自 DVD、CD-ROM 的。

Ascension 计划的开端是这样：[某个观点的分享][19]激发了一场与游戏社区读者之间有趣的讨论，在这场讨论中读者们纷纷发表了自己的观点并给出建议。

### #2 与 Windows 平台的性能比较

在 Linux 平台上运行 Windows 游戏并不总是一件轻松的任务。但是得益于一个叫做 [CSMT][20]（多线程命令流）的特性，尽管离 Windows 级别的性能还有相当长的路要走，PlayOnLinux 现在依旧可以更好地解决这些性能方面的问题。

Linux 对游戏的原生支持在过去发行的游戏中从未尽如人意。

去年，有报道说 SteamOS 比 Windows 在游戏方面的表现要[差得多][21]。古墓丽影去年在 SteamOS 及 Steam for Linux 上发行，然而其基准测试的结果与 Windows 上的性能无法抗衡。

- [Destination: Tomb Raider benchmark video comparison, Linux vs Windows 10](https://youtu.be/nkWUBRacBNE)

这明显是因为游戏是基于 [DirectX][23] 而不是 [OpenGL][24] 开发的缘故。

古墓丽影是[第一个使用 TressFX 的游戏][25]。下面这个视频包涵了 TressFX 的比较：

- [Destination: Tomb Raider Benchmark  - Ubuntu 15.10 vs Windows 8.1 + Ubuntu 16.04 vs Windows 10](https://youtu.be/-IeY5ZS-LlA)

下面是另一个有趣的比较，它显示出使用 Wine + CSMT 带来的游戏性能比 Steam 上原生的 Linux 版游戏带来的游戏性能要好得多！这就是开源的力量！ 

- [Destination: [LinuxBenchmark] Tomb Raider Linux vs Wine comparison](https://youtu.be/sCJkC6oJ08A)

以防 FPS 损失，TressFX 已经被关闭。

以下是另一个有关在 Linux 上最新发布的 “[Life is Strange][27]” 在 Linux 与 Windows 上的比较：

- [Destination: Life is Strange on radeonsi (Linux nine_csmt vs Windows 10)](https://youtu.be/Vlflu-pIgIY)

[Steam for Linux][28] 开始在这个新游戏上展示出比 Windows 更好的游戏性能，这是一件好事。

在发布任何 Linux 版的游戏前，开发者都应该考虑优化游戏，特别是基于 DirectX 并需要进行 OpenGL 转制的游戏。我们十分希望 Linux 上的<ruby>[杀出重围：人类分裂][29]<rt>Deus Ex: Mankind Divided</rt></ruby> 在正式发行时能有一个好的基准测试结果。由于它是基于 DirectX 的游戏，我们希望它能良好地移植到 Linux 上。[该游戏执行总监说过这样的话][30]。

### #3 专有的 NVIDIA 驱动

相比于 [NVIDIA][32]，[AMD 对于开源的支持][31]绝对是值得称赞的。尽管 [AMD][33] 因其更好的开源驱动在 Linux 上的驱动支持挺不错，而 NVIDIA 显卡用户由于开源版本的 NVIDIA 显卡驱动 “Nouveau” 有限的能力，仍不得不用专有的 NVIDIA 驱动。

曾经，Linus Torvalds 大神也分享过他关于“来自 NVIDIA 的 Linux 支持完全不可接受”的想法。

- [Destination: Linus Torvalds Publicly Attacks NVidia for lack of Linux & Android Support](https://youtu.be/O0r6Pr_mdio)

你可以在这里观看完整的[谈话][35]，尽管 NVIDIA 回应 [承诺更好的 Linux 平台支持][36]，但其开源显卡驱动仍如之前一样毫无起色。

### #4 需要 Linux 平台上的 Uplay 和 Origin 的 DRM 支持

- [Destination: Uplay #1 Rayman Origins em Linux - como instalar - ago 2016](https://youtu.be/rc96NFwyxWU)

以上的视频描述了如何在 Linux 上安装 [Uplay][37] DRM。视频上传者还建议说并不推荐使用 Wine 作为 Linux 上的主要的应用和游戏支持软件。相反，更鼓励使用原生的应用。

以下视频是一个关于如何在 Linux 上安装 [Origin][38] DRM 的教程。

- [Destination: Install EA Origin in Ubuntu with PlayOnLinux (Updated)](https://youtu.be/ga2lNM72-Kw)

数字版权管理（DRM）软件给游戏运行又加了一层阻碍，使得在 Linux 上良好运行 Windows 游戏这一本就充满挑战性的任务更有难度。因此除了使游戏能够运行之外，W.I.N.E 不得不同时负责运行像 Uplay 或 Origin 之类的 DRM 软件。如果能像 Steam 一样，Linux 也能够有自己原生版本的 Uplay 和 Origin 那就好了。

### #5 DirectX 11 对于 Linux 的支持

尽管我们在 Linux 平台上有可以运行 Windows 应用的工具，每个游戏为了能在 Linux 上运行都带有自己的配套调整需求。尽管去年在 Code Weavers 有一篇关于 [DirectX 11 对于 Linux 的支持][40] 的公告，在 Linux 上畅玩新发大作仍是长路漫漫。

现在你可以[从 Codweavers 购买 Crossover][41] 以获得可得到的最佳 DirectX 11 支持。这个在 Arch Linux 论坛上的[频道][42]清楚展现了将这个梦想成真需要多少的努力。以下是一个 [Reddit 频道][44] 上的有趣 [发现][43]。这个发现提到了[来自 Codeweavers 的 DirectX 11 补丁][45]，现在看来这无疑是好消息。 

### #6 不是全部的 Steam 游戏都可跑在 Linux 上

随着 Linux 游戏玩家一次次错过主要游戏的发行，这是需要考虑的一个重点，因为大部分主要游戏都在 Windows 上发行。这是[如何在 Linux 上安装 Windows 版的 Steam 的教程][46]。

### #7 游戏发行商对 OpenGL 更好的支持

目前开发者和发行商主要着眼于用 DirectX 而不是 OpenGL 来开发游戏。现在随着 Steam 正式登录 Linux，开发者应该同样考虑在 OpenGL 下开发。 

[Direct3D][47] 仅仅是为 Windows 平台而打造。而 OpenGL API 拥有开放性标准，并且它不仅能在 Windows 上同样也能在其它各种各样的平台上实现。

尽管是一篇很老的文章，但[这个很有价值的资源][48]分享了许多有关 OpenGL 和 DirectX 现状的很有想法的信息。其所提出的观点确实十分明智，基于按时间排序的事件也能给予读者启迪。

在 Linux 平台上发布大作的发行商绝不应该忽视一个事实：在 OpenGL 下直接开发游戏要比从 DirectX 移植到 OpenGL 合算得多。如果必须进行平台转制，移植必须被仔细优化并谨慎研究。发布游戏可能会有延迟，但这绝对值得。

有更多的烦恼要分享？务必在评论区让我们知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-gaming-problems/

作者：[Avimanyu Bandyopadhyay][a]
译者：[tomjlw](https://github.com/tomjlw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/avimanyu/
[1]:https://itsfoss.com/author/avimanyu/
[2]:https://itsfoss.com/linux-gaming-problems/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Flinux-gaming-problems%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=Annoying+Experiences+Every+Linux+Gamer+Never+Wanted%21&url=https://itsfoss.com/linux-gaming-problems/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=itsfoss2
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Flinux-gaming-problems%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Flinux-gaming-problems%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:http://www.stumbleupon.com/submit?url=https://itsfoss.com/linux-gaming-problems/&title=Annoying+Experiences+Every+Linux+Gamer+Never+Wanted%21
[8]:https://www.reddit.com/submit?url=https://itsfoss.com/linux-gaming-problems/&title=Annoying+Experiences+Every+Linux+Gamer+Never+Wanted%21
[9]:https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg
[10]:https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg
[11]:http://pinterest.com/pin/create/bookmarklet/?media=https://itsfoss.com/wp-content/uploads/2016/09/Linux-Gaming-Problems.jpg&url=https://itsfoss.com/linux-gaming-problems/&is_video=false&description=Linux%20gamer%27s%20problem
[12]:https://itsfoss.com/linux-gaming-guide/
[13]:https://itsfoss.com/linux-gaming-distributions/
[14]:https://itsfoss.com/use-windows-applications-linux/
[15]:https://www.playonlinux.com/en/
[16]:http://store.steampowered.com/steamos/
[17]:http://www.ibtimes.co.uk/reddit-users-want-replace-steam-open-source-game-launcher-project-ascension-1498999
[18]:https://www.origin.com/
[19]:https://www.reddit.com/r/pcmasterrace/comments/33xcvm/we_hate_valves_monopoly_over_pc_gaming_why/
[20]:https://github.com/wine-compholio/wine-staging/wiki/CSMT
[21]:http://arstechnica.com/gaming/2015/11/ars-benchmarks-show-significant-performance-hit-for-steamos-gaming/
[22]:https://www.gamingonlinux.com/articles/tomb-raider-benchmark-video-comparison-linux-vs-windows-10.7138
[23]:https://en.wikipedia.org/wiki/DirectX
[24]:https://en.wikipedia.org/wiki/OpenGL
[25]:https://www.gamingonlinux.com/articles/tomb-raider-released-for-linux-video-thoughts-port-report-included-the-first-linux-game-to-use-tresfx.7124
[26]:https://itsfoss.com/osu-new-linux/
[27]:http://lifeisstrange.com/
[28]:https://itsfoss.com/install-steam-ubuntu-linux/
[29]:https://itsfoss.com/deus-ex-mankind-divided-linux/
[30]:http://wccftech.com/deus-ex-mankind-divided-director-console-ports-on-pc-is-disrespectful/
[31]:http://developer.amd.com/tools-and-sdks/open-source/
[32]:http://nvidia.com/
[33]:http://amd.com/
[34]:http://www.makeuseof.com/tag/open-source-amd-graphics-now-awesome-heres-get/
[35]:https://youtu.be/MShbP3OpASA
[36]:https://itsfoss.com/nvidia-optimus-support-linux/
[37]:http://uplay.com/
[38]:http://origin.com/
[39]:https://itsfoss.com/linux-foundation-head-uses-macos/
[40]:http://www.pcworld.com/article/2940470/hey-gamers-directx-11-is-coming-to-linux-thanks-to-codeweavers-and-wine.html
[41]:https://itsfoss.com/deal-run-windows-software-and-games-on-linux-with-crossover-15-66-off/
[42]:https://bbs.archlinux.org/viewtopic.php?id=214771
[43]:https://ghostbin.com/paste/sy3e2
[44]:https://www.reddit.com/r/linux_gaming/comments/3ap3uu/directx_11_support_coming_to_codeweavers/
[45]:https://www.codeweavers.com/about/blogs/caron/2015/12/10/directx-11-really-james-didnt-lie
[46]:https://itsfoss.com/linux-gaming-guide/
[47]:https://en.wikipedia.org/wiki/Direct3D
[48]:http://blog.wolfire.com/2010/01/Why-you-should-use-OpenGL-and-not-DirectX
