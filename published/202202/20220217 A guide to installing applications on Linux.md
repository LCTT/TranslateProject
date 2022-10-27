[#]: subject: "A guide to installing applications on Linux"
[#]: via: "https://opensource.com/article/22/2/installing-applications-desktop-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14305-1.html"

在 Linux 上安装应用指南：软件中心篇
======

> 从我们的新电子书中获得关于在 Linux 上安装应用的所有不同方法的信息。

![](https://img.linux.net.cn/data/attachment/album/202202/25/111618skx1ckb35r3kmx4k.jpg)

当你想在你的手机上尝试一个新的应用时，你打开应用商店并安装该应用。这很简单，很快速，很高效。在这种提供应用的模式中，手机供应商可以让你确切地知道到哪里去获得一个应用，而应用的开发者也知道将他们的应用放在哪里，以便人们能够找到它们。

在手机使用这种创新的软件分发模式之前，Linux 正以“软件仓库”的形式使用它。正如这个术语所暗示的，这些是在互联网上传应用的地方，这样 Linux 用户就可以从一个中心位置浏览和安装它们。这个术语被缩短为 “repo”（代表 “repository”，而不是 “reposession”），但无论你叫它“仓库”、“应用商店”、“软件中心”、“包管理器”，还是其他什么，它都是一个好系统，几十年来一直为 Linux 桌面用户服务。

最起码在 Linux 上安装应用很像在手机上安装应用。如果你能用一个安装，你也可以用另外一个安装。

- 下载我们的电子书：[在 Linux 上安装应用指南][2]

### 软件中心

在 GNOME 桌面上，你在桌面上看到的软件仓库是一个应用，简单地说，叫 “<ruby>软件<rt>Software</rt></ruby>”。你可以把这个应用看成是一个极其特殊的网页浏览器。它寻找可以从互联网上安装的软件，将所有可用的软件收集到分类中，并将其显示在你的桌面上。

![GNOME Software][3]

在开始屏幕中，你有几个选项：

  * 搜索一个你已经熟悉的应用。要做到这一点，点击窗口左上角的放大镜图标。
  * 按类别浏览。这可以在窗口的底部找到。
  * 按最近时间和推荐浏览。这些都列在动画横幅和它下面的图标中。

当你点击一个你看起来感兴趣的应用时，会打开一个功能页面，这样你就可以看到截图并阅读软件的简短描述。

### 安装一个应用

当你找到了你想要安装的软件，点击应用功能页面顶部的“<ruby>安装<rt>Install</rt></ruby>”按钮。

![An application page in GNOME Software][5]

安装完毕后，“<ruby>安装<rt>Install</rt></ruby>”按钮就会变成“<ruby>启动<rt>Launch</rt></ruby>”按钮，所以你可以选择启动你刚刚安装的应用。

如果你现在不想启动该应用，你可以随时在你的“<ruby>活动<rt>Activities</rt></ruby>”菜单中找到它，它与你电脑上已有的所有其他应用放在一起。

### 从更多的地方获得更多的应用

你的 Linux 桌面有专门为它打包的应用，但在今天的世界里，到处都有很多开源的东西。你可以通过将“第三方”仓库添加到你的桌面应用商店中来获得更多的应用。当然，这些术语并不完全正确：在一个无论如何都是由每个人创造软件的世界里，什么是“第三方”？当没有任何东西需要花钱时，什么是应用商店？撇开术语不谈，一个流行的第三方软件库是 [Flathub.org][6]。

要在你的 Linux 桌面上增加另一个应用源，基本上是“安装”一个源到你的应用商店。对于 Flathub，下载 **Flathub 仓库文件**，然后用 **GNOME 软件**安装它，就像它是一个应用一样。它不是一个应用。它是一个应用 _源_，但过程是一样的。

### 了解更多

如果没有一堆其他方法来执行任何给定的任务，那就不是 Linux 了。灵活性是建立在 Linux 系统中的，所以虽然 GNOME “软件”提供了一种获取应用的简单方法，但还有很多其他方法，包括安装脚本、安装向导、AppImages，当然还有直接从源代码编译。你可以从我们的新电子书 [在 Linux 上安装应用][2] 中获得所有这些安装方法的信息。它是免费的，所以请阅读吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/installing-applications-desktop-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/bitmap_1.png?itok=YkthYzSf (Linux packages)
[2]: https://opensource.com/downloads/installing-linux-applications-ebook
[3]: https://opensource.com/sites/default/files/gnome-software_1.png (GNOME Software)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/gnome-software-steam.png (An application page in GNOME Software)
[6]: http://flathub.org/setup
