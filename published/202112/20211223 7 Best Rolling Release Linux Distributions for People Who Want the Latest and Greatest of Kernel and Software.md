[#]: subject: "7 Best Rolling Release Linux Distributions for People Who Want the Latest and Greatest of Kernel and Software"
[#]: via: "https://itsfoss.com/best-rolling-release-distros/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14112-1.html"

7 个最好的 Linux 滚动发行版
======

![](https://img.linux.net.cn/data/attachment/album/202112/24/121027sioukeih5bmp5c5l.jpg)

林林总总的 Linux 发行版可以根据它们的特点、功能、预期用户群等分为不同的类别。在这篇文章中，我将列出一些最好的滚动发布的 Linux 发行版。

你知道什么是 [滚动发布的发行版][1] 吗？这些发行版不会等待 6 个月或更长时间才发布一个新的版本，提供给你更新的 Linux 内核、桌面环境和其他主要软件组件。它们会在这些组件发布后很快就进行更新。你不必将你的发行版从一个主要版本升级到下一个版本，因为你的发行版会定期得到升级。

现在你已经知道了，让我们来看看一些最好的滚动发布的 Linux 发行版。

### 你可以在桌面上使用的最佳滚动发行版

是的，这个列表主要是针对桌面用户。这里列出的一些发行版可能有服务器版本，但这不是这里的重点。

请注意，这并不是一个排名表。

#### 1、openSUSE Tumbleweed

![OpenSUSE Tumbleweed][2]

老派的 openSUSE 多年来一直按部就班地顺着版本号发布他们的系统。但在几年前，他们决定改变他们的产品，创建了 [openSUSE Leap 和 Tumbleweed][3]。

openSUSE Leap 采用的是版本式发布，每隔几年就会有一个新的版本，而 Tumbleweed 则是滚动式发布，新的软件在发布后不久就会出现在这个系统中。

[openSUSE Tumbleweed][4] 对于那些想留在红帽 RPM 阵营的人来说是一个很好的选择。openSUSE 有多样化的生态系统，它有一个巨大的软件库，Zypper 和 YaST 为你的软件包管理提供了很多选择。

#### 2、Arch Linux

![Arch Linux][5]

毋庸置疑，[Arch Linux][6] 是最流行的滚动发布版本。它几乎就是滚动发布的同义词。

[Arch Linux][7] 在 Linux 用户中具有崇高地位的原因有很多。我认为这更多是与 [安装 Arch Linux][8] 后的成就感有关，因为即使是安装程序，它都很别人不一样。

Arch 在其软件库中正式提供了一大批软件。而 [AUR 则通过社区的努力，几乎使所有其他的 Linux 软件都可以使用][9]。

如果你对 Linux 有一定的经验，想挑战自己的水平，这是一个不错的选择。

#### 3、Manjaro Linux

![Manjaro Linux][10]

[Manjaro][11] 基本上是免除了所有麻烦的 Arch Linux。

它是基于 Arch Linux 的，所以它具有 Arch Linux 的大部分优点。你可以得到 Pacman 和 AUR 的滚动发布模式。同时，Manjaro 有图形化的安装程序、基于 GUI 的软件包管理器和其他图形化工具来改善你的桌面体验。

Manjaro 更容易安装，也更容易使用。对于那些想舒适地呆在 Arch 领域的人来说是个不错的选择。

注意: 还有 [许多其他基于 Arch Linux 的优秀发行版][12]，但我无法将其列入此列表中。如果你愿意，你可以试试 Garuda Linux、[EndeavourOS][13] 和其他许多基于 Arch 的发行版。

#### 4、Solus Linux

![Solus Linux][14]

和 Manjaro 一样，[Solus][15] 也是一个 “谨慎” 的滚动发行版。与 Manjaro 不同的是，它不是基于 Arch 的。它是从头开始创建的，使用的是 [eopkg 软件包管理器][16]。Solus 因创造了现代而直观的 Budgie 桌面环境备受赞誉。

像其他滚动发布的发行版一样，一旦你安装了 Solus，你就不需要升级到下一个版本的发行版（也可以像 ISO 刷新一样进行全新安装，带有更新的软件包）。

万一有欠缺的软件包也可以用 Snap 应用程序来补足。

如果你想要一些不同的东西，但又不至于复杂到让你感到不舒服，那么 Solus 是一个不错的选择。

#### 5、Debian Testing

![Debian][17]

你没有想到吧？Debian 以其对稳定性的关注而闻名，以至于其稳定的有时就像是陈旧，因为它提供的软件版本已经相当老旧。

但那是针对稳定分支的。Debian 有几个分支，其中一个叫做 Testing 分支。

看起来 Testing 是某种测试版、不稳定的版本，但这并不完全正确。[Debian Testing][18] 其实是下一个 Debian 稳定版本。实际的开发分支是 Debian Unstable（即 Sid）。Debian Testing 介于不稳定版和稳定版分支之间，它会在稳定版之前添加新的功能。

有些人在配置 Debian 时，在源列表中加入 `testing`。这使得他们的 Debian 系统永远停留在测试阶段。这是一种滚动发布的模式，Debian 用户可以不必离开舒适的 APT 和 deb 软件包管理系统。

#### 6、Void Linux

![Void Linux][19]

这是一个不寻常的、不太出名的发行版。[Void][20] 也是从头开始创建的，也就是说，它不是基于 Arch、Red Hat 或 Debian。

它是滚动发布的，但不像 Arch 那样激进。它优先考虑的是稳定性。这意味着当新的版本发布时，你不需要升级版本，但你也不会在最新的桌面环境版本一发布就得到它。

与其他发行版不同的另一点是，它使用 [runit][21] 作为初始化系统。

总的来说，如果你是一个有经验的 Linux 用户，Void 是一个不错的选择。

#### 7、Gentoo Linux

![Gentoo Linux][22]

另一个是你的同行们警告过的 [专家级 Linux 发行版][23] 之一。

[Gentoo][24] 不是每个人都能享用的茶或咖啡（无论你喜欢哪一种）。从安装到配置再到软件包管理都需要一定的专业知识和时间。

但是它有一个小众的专家用户群，他们会在编译一切需要的组件时废寝忘食。

如果你觉得其他发行版都不够有挑战性，Gentoo 可能是你的选择。

### 你对滚动发布的发行版有什么建议？

正如我之前提到的，我在这里特意将其他基于 Arch 的发行版排除在外，否则列表中就只有 Arch 的衍生产品了。

但你可以自由地投出你的推荐，即使它是基于 Arch 的。评论区都是你的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-rolling-release-distros/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/rolling-release/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/opensuse-tumbleweed.png?resize=800%2C350&ssl=1
[3]: https://itsfoss.com/opensuse-leap-vs-tumbleweed/
[4]: https://get.opensuse.org/tumbleweed/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/arch-linux.png?resize=800%2C350&ssl=1
[6]: https://archlinux.org/
[7]: https://itsfoss.com/why-arch-linux/
[8]: https://itsfoss.com/install-arch-linux/
[9]: https://itsfoss.com/aur-arch-linux/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/manjaro-linux.png?resize=800%2C350&ssl=1
[11]: https://manjaro.org/
[12]: https://itsfoss.com/arch-based-linux-distros/
[13]: https://endeavouros.com/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/solus-linux.png?resize=800%2C350&ssl=1
[15]: https://getsol.us/home/
[16]: https://itsfoss.com/eopkg-commands/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/debian-testing.png?resize=800%2C350&ssl=1
[18]: https://wiki.debian.org/DebianTesting
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/void-linux.png?resize=800%2C350&ssl=1
[20]: https://voidlinux.org/
[21]: http://smarden.org/runit/
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/gentoo-linux.png?resize=800%2C350&ssl=1
[23]: https://itsfoss.com/advanced-linux-distros/
[24]: https://www.gentoo.org/
