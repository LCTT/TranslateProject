[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12639-1.html)
[#]: subject: (Linux Jargon Buster: What is a Rolling Release Distribution?)
[#]: via: (https://itsfoss.com/rolling-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 黑话解释：什么是滚动发行版？
======

在了解了[什么是 Linux][1]、[什么是 Linux 发行版][2]之后，当你开始使用 Linux 时，你可能会在 Linux 论坛的讨论中遇到“<ruby>滚动发布<rt>rolling release</rt></ruby>”这个名词。

在这篇 Linux 黑话解释文章中，你将了解到 Linux 发行版的滚动发布模式。

### 什么是滚动发布？

在软件开发中，滚动发布是一种模式，在这种模式下，软件的更新是连续推出的，而不是分批的版本。这样软件就能始终保持更新。<ruby>滚动发行版<rt>rolling release distribution</rt></ruby>遵循同样的模式，它提供最新的 Linux 内核和软件版本，在它们一发布就提供。

[Arch Linux][3] 是滚动发行版中最流行的例子，然而 [Gentoo][4] 是最古老的滚动发行版，目前仍在开发中。

当你使用一个滚动发行版时，你会得到小而频繁的更新。这里没有像 Ubuntu 那样的重大 XYZ 版本发布。你会定期[更新 Arch][5]或其他滚动发行版，你将永远拥有最新版本的发行版。

滚动发布也是以测试为代价的。当最新的更新开始给你的系统带来问题时，你也许会受到“惊吓”。

### 对比滚动式发布与点版本式发布的发行版

![][6]

许多 Linux 发行版，如 Debian、Ubuntu、Linux Mint、Fedora 等都遵循<ruby>点版本<rt>point release</rt></ruby>模式。他们每隔几个月/年就会发布一个主要的 XYZ 版本。

点版本由 Linux 内核、桌面环境和其他软件的新版本组成。

当一个新的点版本发行版的主要版本发布时，你必须[专门来升级你的系统][7]。

相反，在滚动发行版中，当它从开发者那里发布时，你会不断地获得新的功能更新。这样，你不需要在几个月或几年后进行版本升级。你总是拥有最新的东西。

**哦，但我的 Ubuntu 也会定期更新，几乎每周一次。这是否意味着 Ubuntu 也在滚动发布？**

![][8]

不，Ubuntu 不是滚动发布。你看，你通常从 Ubuntu 得到的更新是安全和维护更新（除了一些软件，比如 Mozilla Firefox），而不是新功能的发布。

例如，GNOME 3.38 已经发布了，但 Ubuntu LTS 20.04 版不会给你 GNOME 3.38。它将坚持使用 3.36 版本。如果 GNOME 3.36 有安全或维护更新，你会在 Ubuntu 的更新中得到它。

LibreOffice 版本也是如此。Ubuntu 20.04 LTS 坚持使用 LibreOffice 6.x 系列，而 LibreOffice 7 已经发布了。请记住，我说的是官方软件库中的软件版本。你可以自由地从他们的官方网站上下载一个更新版本的 LibreOffice，或者使用 PPA。但你不会从 Ubuntu 的软件库中得到它。

当 Ubuntu 发布下一个版本 Ubuntu 20.10 时，你会得到 LibreOffice 7 和 GNOME 3.38。

**为什么一些滚动发行版有“版本号”和发行版名称？**

![][9]

这是一个合理的问题。Arch Linux 是滚动发布的，它总是让你的系统保持更新，然而你会看到像 Arch Linux 2020.9.01 这样的版本号。

现在想象一下，你在 2018 年安装了 Arch Linux。你定期更新你的 Arch Linux 系统，所以你在 2020 年 9 月拥有所有最新的内核和软件。

但是，如果你决定在 2020 年 9 月在一个新系统上安装 Arch Linux 会发生什么？如果你使用 2018 年使用的相同的安装介质，你将不得不安装过去两年或更长时间内发布的所有系统更新。这很不方便，不是吗？

这就是为什么 Arch Linux（和其他滚动发行版）每个月或每隔几个月都会提供一个新的 ISO（操作系统安装程序镜像文件），其中包含所有最新的软件。**这就是所谓的 ISO 刷新**。这样一来，新用户就会得到一个更新的 Linux 发行版。

如果你已经在使用滚动发行版，你就不用担心新的 ISO 刷新了。你的系统已经和它对等了。ISO 刷新对那些要在新系统上安装它的人是有帮助的。

### 滚动式发布的利与弊

滚动发布模式的好处是，你可以得到小而频繁的更新。你总是可以从你的发行版的仓库中获得最新的内核和最新的软件版本。

然而，这也可能带来新软件不可预见的问题。点版本发行版通常会对系统中集成的基本组件进行测试，以避免带来令人不便的错误。而在滚动发行版中，情况就不一样了，在滚动发行版中，软件一经开发者发布就会被推出。

### 你应该使用滚动发行版还是点版本发行版？

![][10]

这取决于你。如果你是一个新的 Linux 用户，或者如果你不习惯于排除你的 Linux 系统的故障，请坚持使用你选择的点版本发行版。这也建议用于你的生产和关键任务的机器，在这里你会想要一个稳定的系统。

如果你想要最新的和最棒的 Linux 内核和软件，并且你不害怕花费一些时间在故障排除上（时常发生），你可以选择滚动发行版。

在这一点上，我还想提到 Manjaro Linux 的混合滚动发布模式。Manjaro 确实遵循滚动发布模式，你不必将系统升级到较新的版本。不过，Manjaro 也会对基本的软件组件进行测试，而不是盲目的向用户推出。这也是[为什么这么多人使用 Manjrao Linux][11] 的原因之一。

### 我讲清楚了吗？

希望你现在对“滚动发行版”这个词有了稍微的了解。如果你对它仍有一些疑问，请留言，我会尽力回答。我可能会更新文章以涵盖你的问题。祝你愉快 :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/rolling-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux/
[2]: https://linux.cn/article-12609-1.html
[3]: https://www.archlinux.org/
[4]: https://www.gentoo.org/
[5]: https://itsfoss.com/update-arch-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/what-is-rolling-release-distribution.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/upgrade-ubuntu-version/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/updates-available-ubuntu.png?resize=800%2C433&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/arch-linux-iso-refresh.png?resize=799%2C388&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/rolling-vs-point-release-distribution.png?resize=800%2C350&ssl=1
[11]: https://itsfoss.com/why-use-manjaro-linux/
