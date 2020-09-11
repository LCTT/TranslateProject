[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12059-1.html)
[#]: subject: (Meet DebianDog – Puppy sized Debian Linux)
[#]: via: (https://itsfoss.com/debiandog/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

体验 DebianDog：Puppy 式的 Debian Linux
======

不久前，我偶然发现了一个有趣的 Linux 项目。这个项目旨在为 Debian 和基于 Debian 的系统创建一个小型的现场版 CD，类似于 [Puppy Linux 项目][1] 。让我们看看 DebianDog 。

### DebianDog 是什么？

正如字面所述，[DebianDog][2] “是一个被塑造成一个外观和动作都像 Puppy Linux 的小型 Debian 现场版 CD。没有改动 Debian 结构和方式，Debian 的文档对 DebianDog 来说是完全有效的。你可以使用 `apt-get` 或 synaptic 来访问所有的 Debian 存储库。”

![DebianDog][3]

对于那些不熟悉 [Puppy Linux][1] 的人来说，该项目是 “多个 Linux 发行版的一个集合，建立在相同的共享准则之上”。这些准则能够实现快速、小型（300 MB 或更少）、易于使用。这里有为支持 Ubuntu, Slackware 和 Raspbian 软件包构建的 Puppy Linux 变种。

DebianDog 和 Puppy Linux 之间最大的不同是，Puppy Linux 有其自己的软件包管理器 [Puppy 软件包管理器][4] 。如上所述，DebianDog 使用 Debian 软件包管理器及其软件包。甚至 DebianDog 网站也试图澄清这一点：“它不是 Puppy Linux，并且也与基于 Debian 的 Puppy 无关。”

### 为什么一些人使用 DebianDog ？

安装 DebianDog（或其任何衍生产品）的主要原因是让一台较旧电脑重焕新生。在 DebianDog 上的每个版本都有一个 32 位版本。它们还有更轻量级的桌面环境/窗口管理器，例如 [Openbox][5] 或 [Trinity Desktop][6] 环境。它们中大多数也都有一个 systemd 的可替代版本。它们也安装更轻的应用程序，例如 [PCManFM][7] 。

### DebianDog 有哪些可用的变体版本？

尽管 DebianDog 在本系列中是第一个，但是该项目被称为 ‘Dog Linux’ ，提供各种基于Debian 和 Ubuntu的流行发行版的 ‘Dog 变体’。

#### DebianDog Jessie

DebianDog 的第一个（也是最初的）版本是 DebianDog Jessie。它有两个 [32 位版本][8] ，一个使用 [Joe’s Window Manager (JWM)][9] 作为默认桌面环境，另一个使用 XFCE 作为默认桌面环境。systemd 和 sysvinit 都是可用的。它还有一个 [64 位版本][10]。DebianDog Jessie 基于 Debian 8.0（Jessie）。Debian 8.0 的支持将于 2020 年 6 月 30 日结束，因此安装需谨慎。

#### StretchDog

[StretchDog][12] 基于 Debian 9.0（Stretch）。它有 32 位和 64 位两种版本可用。Openbox 是默认的窗口管理器，但是我们可以切换到 JWM 。Debian 9.0 的支持将于 2022 年 6 月 30 日结束。

#### BusterDog

[BusterDog][13] 是很有趣的。它基于 [Debian 10][14]（Buster）。它不使用 systemd，反而像 [AntiX][16] 一样使用 [elogind][15] 。Debian 10.0 的支持将于 2024 年 6 月结束。

#### MintPup

[MintPup][17] 基于 [Linux Mint][18] 17.1。现场版 CD 仅有 32 位版本。你也可以使用 “apt-get 或 synaptic 访问 Ubuntu/Mint 的存储库”。考虑到 Mint 17 已经到了生命的尽头，这一版本必须避免使用。

#### XenialDog

XenialDog 有 [32 位][19]和 [64 位][20] 两种变种，基于 Ubuntu 16.04 LTS 。两个变种都使用 Openbox 作为默认版本，JWM 可选。Ubuntu 16.04 LTS 的支持将于 2021 年 4 月结束, 因此安装需谨慎。

#### TrinityDog

[TrintyDog][21] 有两种变体。一个基于 Debian 8 ，另一个基于 Debian 9 。两种变体都有 32 位版本，并且都使用 [Trinity Desktop Environment][6] ，以此得名。

![TrinityDog][11]

#### BionicDog

你应该能够从名称猜到。[BionicDog][23] 基于 [Ubuntu 18.04 LTS][24]。主要版本有 32 位和 64 位两个版本，Openbox 是默认的窗口管理器。这里也有一个使用 [Cinnamon desktop][25] 的版本，并且只有 64 位版本。

![BionicDog][22]

### 结束语

我喜欢任何 [想让较旧电脑系统有用的 Linux 项目][26]。但是，通过 DebianDog 项目提供的大多数操作系统不再受支持，或者接近它们的生命尽头。从长远来看，这就不那么有用了。

**我不建议在你的主计算机上使用它。**在现场版 USB 中或一台闲置的系统上尝试它。此外，如果你想使用较新的基础系统，[你可以创建][27]你自己的现场版 CD 。

似乎冥冥中自有天意，我总是在探索鲜为人知的 Linux 发行版的路上艰难地前行，像 [FatDog64][28]、[4M Linux][29] 以及 [Vipper Linux][30] 。虽然我不建议使用它们，但是知晓这些项目的存在的意义总是好的。

你对 DebianDog 有什么看法？你最最喜欢的 Puppy 式的操作系统是什么？请在下面的评论区中告诉我们。

如果你觉得这篇文章很有趣，请花点时间在社交媒体、黑客新闻或 Reddit 上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/debiandog/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: http://puppylinux.com/
[2]: https://debiandog.github.io/doglinux/
[3]: https://www.linuxinsider.com/article_images/2017/84328_990x556.jpg
[4]: http://wikka.puppylinux.com/PPM?redirect=no
[5]: http://openbox.org/wiki/Main_Page
[6]: https://www.trinitydesktop.org/
[7]: https://wiki.lxde.org/en/PCManFM
[8]: https://debiandog.github.io/doglinux/zz01debiandogjessie.html
[9]: https://en.wikipedia.org/wiki/JWM
[10]: https://debiandog.github.io/doglinux/zz02debiandog64.html
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/TrinityDog.jpg?ssl=1
[12]: https://debiandog.github.io/doglinux/zz02stretchdog.html
[13]: https://debiandog.github.io/doglinux/zz03busterdog.html
[14]: https://itsfoss.com/debian-10-buster/
[15]: https://github.com/elogind/elogind
[16]: https://antixlinux.com/
[17]: https://debiandog.github.io/doglinux/zz04mintpup.html
[18]: https://linuxmint.com/
[19]: https://debiandog.github.io/doglinux/zz05xenialdog.html
[20]: https://debiandog.github.io/doglinux/zz05zxenialdog.html
[21]: https://debiandog.github.io/doglinux/zz06-trinitydog.html
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/BionicDog.jpg?ssl=1
[23]: https://debiandog.github.io/doglinux/zz06-zbionicdog.html
[24]: https://itsfoss.com/ubuntu-18-04-released/
[25]: https://en.wikipedia.org/wiki/Cinnamon_(desktop_environment)
[26]: https://itsfoss.com/lightweight-linux-beginners/
[27]: https://github.com/DebianDog/MakeLive
[28]: https://itsfoss.com/fatdog64-linux-review/
[29]: https://itsfoss.com/4mlinux-review/
[30]: https://itsfoss.com/viperr-linux-review/
[31]: https://reddit.com/r/linuxusersgroup
