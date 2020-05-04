[#]: collector: (lujun9972)
[#]: translator: (qfzy1233)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12155-1.html)
[#]: subject: (Bodhi Linux 5.1 Review: Slightly Different Lightweight Linux)
[#]: via: (https://itsfoss.com/bodhi-linux-review/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Bodhi Linux 5.1 一览: 略有不同的轻量化 Linux
======

Bodhi Linux 是一个基于 Ubuntu 的[轻量级 Linux 发行版][1]。与其他大多数发行版不同，Bodhi 使用自己的 Moksha 桌面，并专注于为你提供一个可以在旧计算机上运行的最简设置。

### 什么是 Bodhi Linux?

![](https://img.linux.net.cn/data/attachment/album/202004/27/093318yawppv07zqpva4j6.png)

[Bodhi Linux][3] 最早于 2011 年推出。它以“[简约、高效和用户自定义][4]”为设计理念。开发人员旨在提供一个“[实用但不臃肿的系统][5]”。因此，它使用轻量级的 Moksha 桌面，只预装了基本的应用程序。这一做法是为了给用户一个稳定的平台来构建他们想要的系统。它基于最新版的 Ubuntu 长期支持版本。

### Moksha 桌面

![Bodhi Desktop][6]

起初 Bodhi 是装载着 [Enlightenment 桌面环境][7]的。Bodhi Linux 一直被认为是“Enlightenment 系的” Linux 发行版。事实上，“Bodhi”（菩提）这个词是基于梵文的“<ruby>开悟<rt> enlightenment</rt></ruby>”。

然而，当 Enlightenment 18 版本发布以后，这一切都改变了。该版本是如此的糟糕，以至于它并没有集成到 Bodhi 中。Enlightenment 19 发布后修复了一些问题，但仍然存在一些不足。

在尝试与 Enlightenment 开发团队合作却毫无进展之后，Bodhi 开发者在 2015 年[复刻][8]了 Enlightenment 17。新的桌面环境被命名为 [Moksha][9]，它是基于梵文单词“解脱、解放或释放”。你可以在 [GitHub][10] 上找到它的代码。

### 5.1.0 有什么新特性？

- [Bodhi Linux 5.1 Trailer](https://youtu.be/e8wcRL9F3p8)

[Bodhi 5.1.0][12] 是这两年内发布的第一个版本，也是基于 Ubuntu 18.04 的第二个版本。除了更新包，它还有新的默认图标和主题。该版本对默认应用程序做了几处更改。预装版 Leafpad 取代了 epad 并且 [GNOME Web][13]（也被称为 Epiphany）代替了 [Midori][14]。删除了 eepDater 系统更新器。

目前有[四个不同的版本][15]的 Bodhi5.1.0 可以[下载][16]: <ruby>标准版<rt>Standard</rt></ruby>、<ruby>硬件支持版<rt>Hwe</rt></ruby>、<ruby>兼容版<rt>Legacy</rt></ruby> 和<ruby>软件包版<rt>AppPack</rt></ruby>。

* 标准适用于过去十年内电脑配置。它不推送内核更新。
* 硬件支持版是 Bodhi 家族的新成员，其设计用来包括对更新的硬件的支持，并会接收到内核更新。5.1 版本的使用的是 5.3.0-42 内核。
* 兼容版是仅有的 32 位版本。它使用“较旧的 4.9.0-6-686 Linux 内核，该内核针对旧的（15 年以上）硬件进行了优化。这个内核也不包括许多老系统不支持的 PAE 扩展。”
* 软件包版是为那些想要一个开箱即用的全载系统的人准备的，并预装了许多应用程序。

### Bodhi Linux 的系统要求

最低系统要求：

  * 500 MHz 处理器
  * 256 MB 内存
  * 5 GB 的硬盘存储空间

推荐系统要求：

  * 1.0 GHz 处理器
  * 512 MB 内存
  * 10 GB 的硬盘存储空间

### 体验 Bodhi Linux 

![Old Bodhi Linux][17]

由于它是基于 Ubuntu 的，所以安装 Bodhi 非常简单。当我登录到 Bodhi 后，新的主题和图标集让我大吃一惊。上次我安装 Bodhi（包括几个月前的 5.0）时，我认为它需要换一个新的外观。之前的主题并没有什么问题，但看起来像是二十一世纪初的东西。新的主题使它看起来更具现代感。

![Bodhi Linux 5.1][18]

我也很高兴看到 Midori 浏览器被 GNOME Web 所取代。我不是 [Midori 浏览器][19]的粉丝。对我来说，它总是显得功能太少了。（不过，随着 [Midori Next][20] 的推出，这种情况可能会改变。）GNOME Web 更像是我需要的网页浏览器。最重要的是它带有 Firefox Sync，这样我就可以同步我所有的书签和密码了。

与许多 Linux 发行版不同，Bodhi 并没有一个独立的软件中心。相反，如果你点击 AppCenter 图标，它会打开浏览器，并导航到 Bodhi 网站的软件中心页面 [AppCenter 页面][21]。这里的应用程序是按类别排序的，它们中的大多数是[轻量级应用程序][22]。

![Bodhi Linux Appcenter][23]

如果你点击其中一个页面并点击“安装”，（在你输入密码之后）Bodhi 就会安装它。这是通过一个名为 [apturl][24] 的小程序实现的，它是“是一个非常简单的从网页浏览器安装软件包的方法”。它非常灵巧，我希望更多基于 Ubuntu 的发行版使用它。

总的来说，我喜欢 Moksha 桌面。它坚持我们几十年来看到的桌面风格（这是我最喜欢的）。它不会影响你，却很容易改变和定制。我唯一怀念的是，当我按下超级键时，应用程序菜单不打开。但我猜你不可能拥有生活中的一切。

### 结语

我对最近发布的 Bodhi Linux 感到十分惊喜。过去，我经常折腾它。并且我一直很喜欢它，但最近的这个版本是迄今为止最好的。在某种程度上，他们打破了 Bodhi 只适合老系统的想法，加入了对较新内核的支持。

如果你想换换个环境，同时又想在 Ubuntu 的世界里寻找新的风景，那就试试[Bodhi Linux][3]吧。

你用过 Bodhi Linux 吗？你最喜欢的基于 Ubuntu 的发行版是什么？请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/bodhi-linux-review/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[qfzy1233](https://github.com/qfzy1233)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/lightweight-linux-beginners/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/bodhi-start-page.png?resize=800%2C500&ssl=1
[3]: https://www.bodhilinux.com/
[4]: https://www.bodhilinux.com/w/wiki/
[5]: https://www.bodhilinux.com/w/what-is-bodhi-linux/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/bodhi-desktop.jpg?resize=800%2C500&ssl=1
[7]: https://www.enlightenment.org/start
[8]: https://www.bodhilinux.com/2015/04/28/introducing-the-moksha-desktop/
[9]: https://www.bodhilinux.com/moksha-desktop/
[10]: https://github.com/JeffHoogland/moksha
[11]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[12]: https://www.bodhilinux.com/2020/03/25/bodhi-linux-5-1-0-released/
[13]: https://wiki.gnome.org/Apps/Web/
[14]: https://en.wikipedia.org/wiki/Midori_(web_browser
[15]: https://www.bodhilinux.com/w/selecting-the-correct-iso-image/
[16]: https://www.bodhilinux.com/download/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/bodhi.png?resize=800%2C400&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/bodhi-Linux-5-1-screenshot.jpg?ssl=1
[19]: https://itsfoss.com/midori-browser/
[20]: https://www.midori-browser.org/2020/01/15/midori-next-come-on-yarovi-we-can/
[21]: https://www.bodhilinux.com/a/
[22]: https://itsfoss.com/lightweight-alternative-applications-ubuntu/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Bodhi-Linux-AppCenter.png?resize=800%2C500&ssl=1
[24]: https://wiki.ubuntu.com/AptUrl
[25]: https://reddit.com/r/linuxusersgroup
