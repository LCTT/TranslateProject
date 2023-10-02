[#]: subject: "Fedora 39 Features: It's Time To Talk About Them!"
[#]: via: "https://news.itsfoss.com/fedora-39-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16207-1.html"

Fedora 39 新特性抢先看
======

![][0]

> Fedora 39 即将热门登场！在你进行安装前，先在这里了解一下新的功能。

[Fedora 38][1] 的升级引人瞩目，带来了全新的定制版，同时可以无限制地访问 Flathub。

如今，我们再次迎来升级，也就是 **Fedora 39**。

如果一切按计划进行，Fedora 39 将在 **2023 年 10 月 17 日** 正式发布。然而，这次有何新奇特性呢？

一起来探索一下！

![][2]

### Fedora 39：重要亮点

在 Fedora 39 中，你能期待一些值得关注的更新和变化，以及其他一些内容。

其主要改进包括：

  * GNOME 45
  * Fedora Onyx 定制版
  * 彩色 Bash 提示符
  * 应用程序更新
  * 性能优化

### 彩色 Bash 提示符

![][3]

Bash 提示符有了微小修改，改变了默认配色。

过往的单色默认配色与长命令的输出在视觉上容易混淆，现在，这种区分就容易多了。

当然，你也可以根据个人喜好，随意更改提示符的颜色。

### GNOME 45

GNOME 45 是本次升级的一大亮点。

与 [Ubuntu 23.10][4] 一样，Fedora 39 也将是首批搭载 GNOME 45 的发行版之一。

GNOME 45 带来了大量实用的改动，以及一些微妙的视觉整改。

一些关键亮点包括：

  * 新增的核心应用
  * 系统设置新增的“<ruby>关于<rt>About</rt></ruby>”面板
  * 系统设置中的隐私中心
  * 对 Nautilus 文件管理器的改善

对文件管理器的性能优化应会带来显著提升。

重新设计的简洁的侧边栏使得文件与文件夹区域的区分比以往更为明显。

![左侧(GNOME 44)，右侧(GNOME 45)][5]

引入的核心应用，如 “<ruby>放大镜图像查看器<rt>Loupe Image Viewer</rt></ruby>” 和 “<ruby>快照<rt>Snapshot</rt></ruby>”，应当大有用处。这是一个简单且极简的图片查看器，以及一款网络摄像头应用。然而，Fedora 39 仍坚持使用较为经典的 “<ruby>茄子<rt>Cheese</rt></ruby>” 网络摄像头应用。

![][6]

不仅新增了应用，已有的核心应用也进行了很多优化，例如“<ruby>日历<rt>Calendar</rt></ruby>”应用有了新的应用图标，“<ruby>控制台<rt>Console</rt></ruby>”应用和“<ruby>天气<rt>Weather</rt></ruby>”应用的用户体验也得到了提升。

“<ruby>设置<rt>Settings</rt></ruby>”菜单在呈现信息方式上也进行了升级，目的在于更好地为最终用户呈现信息。

在 “<ruby>关于<rt>About</rt></ruby>” 面板，新增了一个 “<ruby>系统详情<rt>System Details</rt></ruby>”，在此你可以获取到你正在运行的系统详细信息以及其硬件规格。

![][8]

尽管在 Fedora 等 Linux 发行版中，隐私保护已经非常可靠，但 GNOME 45 给我们带来了更深一步的改进。

这些选项既便于快速访问，对于初次接触 Linux 的用户来说，也易于理解。

![][9]

当然，GNOME 45 还有更多的亮点，你可以在我们的 [GNOME 45 特性][10] 专题文章中详细略览：

> **[GNOME 45 带来令人兴奋的升级： 新功能介绍][10]**

### Fedora Onyx

Fedora 提供的 Silverblue 变体，被公认为 [最优秀的不可变发行版][11] 之一，其桌面环境采用的是 GNOME。

为了拓宽其产品线，Joshua Strobl 提出新增一款采用 Budgie 桌面环境的不可变版本，以此补充 Budgie 定制版，即 [Fedora Onyx][12]。

在 Fedora 39 的新版本发布时，你应可以找到这个全新的版本。

> **[11 个面向未来、不可改变的 Linux 发行版][11]**

### 默认废弃 fedora-repos-modular

Fedora 带有几个已预先启用的存储库，让你可以顺畅地安装软件包。

然而，根据开发者的观察，现在大多数用户并不使用模块化的存储库。因此，移除这些存储库将有助于提升 DNF 的性能。

> 💡 DNF 是 Fedora 的 [软件包管理器][14]。

因此，预计在默认不再包含 fedora-repos-modular 存储库的情况下，DNF 特别是在网络环境较差的情况下，其性能会得到一些改善。

### 应用和软件包更新

以下是最主要的应用程序更新：

  * [LibreOffice 7.6][15]
  * Python 3.12
  * RPM 4.19
  * Vagrant 2.3
  * Perl 5.38
  * LLVM 17
  * Golang 1.21
  * FontAwesome6

### 其它改进

虽然安装程序基本无变化（Anaconda Web UI 的 [目标][16] 是 Fedora 40），但是新的“<ruby>欢迎屏<rt>Welcome Screen</rt></ruby>”在帮助你开始使用时会提供些许便利。

![][17]

为了提供更好的用户体验，Fedora 39 加入了多项改进。

其中包括：

  * **Fedora Workstation 不再对 Qt 进行定制主题设计**：Qt 应用将遵循 Qt 上游的默认主题设置。
  * **Fedora Kinoite 变体启用自动更新**
  * **改变 Fedora 中的 Flatpak 构建方式（不用模块）**

更多细节改进，你可以在其 [官方变更集维基][18] 上查看。

💬 你对 Fedora 39 有怎样的期待？这是否对你将是一个重要的升级，或者只是类似常规新版本发布？


--------------------------------------------------------------------------------

via: https://news.itsfoss.com/fedora-39-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/fedora-38/
[2]: https://news.itsfoss.com/content/images/2023/09/fedora-39-home.jpg
[3]: https://news.itsfoss.com/content/images/2023/09/fedora-prompt.png
[4]: https://news.itsfoss.com/ubuntu-23-10/
[5]: https://news.itsfoss.com/content/images/2023/09/image.png
[6]: https://news.itsfoss.com/content/images/2023/09/image-1.png
[7]: https://news.itsfoss.com/content/images/size/w256h256/2022/08/android-chrome-192x192.png
[8]: https://news.itsfoss.com/content/images/2023/09/fedora-39-system-info.jpg
[9]: https://news.itsfoss.com/content/images/2023/09/image-2.png
[10]: https://news.itsfoss.com/gnome-45/
[11]: https://itsfoss.com/immutable-linux-distros/
[12]: https://news.itsfoss.com/fedora-onyx-official/
[13]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[14]: https://itsfoss.com/package-manager/
[15]: https://news.itsfoss.com/libreoffice-7-6/
[16]: https://fedoraproject.org/wiki/Changes/AnacondaWebUIforFedoraWorkstation
[17]: https://news.itsfoss.com/content/images/2023/09/fedora-39-installer.jpg
[18]: https://fedoraproject.org/wiki/Releases/39/ChangeSet
[0]: https://news.itsfoss.com/content/images/size/w1304/2023/09/fedora-39-features.png