[#]: subject: "Minetest, an Open Source Minecraft Alternative"
[#]: via: "https://itsfoss.com/minetest/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Minetest，一个开源的 Minecraft 替代品
======
早在 2009 年，Minecraft 就被介绍给了世界。从那时起，它已经成为一种文化现象。在这段时间里，一些开发者发布了具有类似想法和机制的开源游戏。今天，我们将看看其中最大的一个：Minetest。

### 什么是 Minetest？

![minetest start][1]

[Minetest][2]，简单地说，是一个基于体素的沙盒游戏，与 Minecraft 非常相似。与 Minecraft 不同的是，Minetest 是用 C++ 编写的，并被设计成可以在大多数系统上原生运行。它也有一个非常大的地图区域。地图大小为 “62,000 × 62,000 × 62,000 块”，“你可以向下开采 31,000 块，或向上建造 31,000 块”。

有趣的是，Minetest 最初是以专有许可证发布的，但后来被重新授权为 GPL。此后，它又被重新授权为 LGPL。

Minetest 有几种模式。你可以建造并发挥创意，或者你可以尝试在各种元素中生存。你并不局限于这些模式。Minetest 有大量的[可用的额外内容][3]，包括 mods、纹理包和在 Minetest 中建立的游戏。这主要是通过 Minetest 的 [modding API][4] 和 Lua 完成的。

![minetest packages][5]

对于那些玩过 Minecraft 的人来说，你会发现 Minetest 中的体验非常相似。你可以挖掘资源，建造结构，并结合材料来制作工具。我在 Minetest 中没有注意到的一件事是怪物。我认为 Minetest 中没有任何生物，但话说回来，我只在创意模式中玩过。我还没有玩过生存模式。

Minetest 也被用于[教育][6]。例如，瑞士 CERN 的人用 Minetest 创造了一个游戏，以[展示互联网是如何工作的][7]以及它是如何被创造出来的。Minetest 还被[用于教授][8]编程、地球科学以及微积分和三角学。

![minetes map1][9]

### 如何安装 Minetest?

Minetest 几乎在每个系统上都可以使用。下面是一个命令列表，你可以用它来在一些最流行的 Linux 发行版中安装 Minetest。

#### Ubuntu 或者 Debian

如果你有一个基于 Ubuntu 或 Debian 的发行版，只要在终端输入这个命令：

```
sudo apt install mintest
```

#### Arch 或者 Manjaro

对于基于 Arch 的系统（如 Manjaro），使用：

```
sudo pacman -S minetest
```

#### Fedora

你可以从 Fedora 服务器中输入以下命令安装 Mintest：

```
sudo dnf install mintest
```

#### openSUSE

openSUSE 用户可以用这个命令安装 Minetest：

```
sudo zypper in mintest
```

#### FreeBSD

FreeBSD 用户很幸运。他们可以用这个命令安装 Mintest：

```
pkg install minetest minetest_game
```

![minetest map2][10]

#### Snap

要安装 Minetest 的 Snap 包，请在终端输入以下命令：

```
sudo snap install minetest
```

#### Flathub

要安装，请输入：

```
flatpak install flathub net.minetest.Minetest
```

你可以在[这里][11]下载 Windows 的可移植执行文件。你也可以在 Android 上安装 Minetest，可以通过 [Google Play][12] 或[下载 APK][13]。

### 最后的想法

![minetest about][14]

我已经在 Minetest 中花了几个小时在我的本地系统上进行构建和探索。它非常有趣。我还没来得及尝试任何额外的内容，因为我对我玩过的相对较少的游戏部分非常满意。我遇到的唯一麻烦是，由于某种原因，它在 Fedora 上运行缓慢。我可能有一些配置上的错误。

如果你曾经认为 Minecraft 看起来很有趣，但不想花钱，那就去看看 Minetest。你会很高兴你这么做。

如果你玩过 Minetest，在评论中告诉我们你的体验如何。

--------------------------------------------------------------------------------

via: https://itsfoss.com/minetest/

作者：[John Paul][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-start-800x411.jpg
[2]: https://www.minetest.net/
[3]: https://content.minetest.net/
[4]: https://dev.minetest.net/Modding_Intro
[5]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-packages-800x411.jpg
[6]: https://www.minetest.net/education/
[7]: https://forum.minetest.net/viewtopic.php?t=22871
[8]: https://en.wikipedia.org/wiki/Minetest#Usage_in_education
[9]: https://itsfoss.com/wp-content/uploads/2022/03/minetes-map1-800x411.png
[10]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-map2-800x413.png
[11]: https://www.minetest.net/downloads/
[12]: https://play.google.com/store/apps/details?id=net.minetest.minetest&utm_source=website&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1
[13]: https://github.com/minetest/minetest/releases/download/5.5.0/app-armeabi-v7a-release.apk
[14]: https://itsfoss.com/wp-content/uploads/2022/03/minetest-about-800x407.jpg
