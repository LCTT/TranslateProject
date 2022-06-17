[#]: subject: "5 Tiny Yet Useful Features I Would Like to See in GNOME in 2022"
[#]: via: "https://news.itsfoss.com/gnome-features-i-want/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14168-1.html"

我希望在 GNOME 中看到的 5 个微小而有用的功能
======

> 我知道对于圣诞愿望清单来说已经太晚了，但我仍然想分享我希望在 GNOME 中看到的东西。

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/gnome-wallpaper.png?w=1200&ssl=1)

GNOME 是许多 Linux 发行版的默认桌面环境。它也是我最喜欢的一个，因为它提供了一种现代的桌面体验。

但这并不意味着 GNOME 是完美的，不需要改进。事实上，这里有几个建议可以改善整个用户体验。

### 1、方便的应用程序卸载选项

桌面 Linux 是碎片化的。为了增加混乱，连软件包也是零零散散的。而最糟糕的是当你从系统中删除一个应用程序时。

举个例子，你要通过 DEB 包安装一个应用程序，并使用 GNOME 软件中心界面来安装它。

但如果你不喜欢这个应用程序，想把它删除呢？

你不会在软件中心中找到该应用程序。相反，你得必须使用命令行的方法。

这还没完。还有 Snap 和 [Flatpak][1] 软件包。如果你已经使用了其中之一，你必须先找出来，然后使用正确的命令才行。

GNOME 采用了类似于 Android/iOS 的方法，将应用程序显示在一个网格中，并将它们组织在文件夹中。移动操作系统为用户提供了一种方式，即按住图标并删除应用程序。如果能有一个类似的选项，右键点击应用程序图标并选择卸载，那就更好了。

![][2]

这样，终端用户就不用管所安装的应用程序是 Deb 包还是 Snap 包。没有必要为此进入终端，而且它就发生在访问应用程序地方，这不是挺好吗？

Linux Mint Cinnamon 版有这样的功能，你在菜单中右键点击一个应用程序条目，选择删除它。

![Linux Mint Cinnamon 中可以使用右键删除选项][3]

如果 Cinnamon 能做到，GNOME 应该也能做到，对吗？

### 2、在应用程序商店中设置默认软件源

如果一个应用程序有多种格式，GNOME 软件中心可以让你选择软件源。至少这是我在 Fedora 的 GNOME 软件中看到的，但在 Ubuntu 中没有。

![][4]

假设有人在软件中心同时添加了 Flatpak 和 Snap 支持，而一个应用程序在 Flatpak、Snap 和软件包管理器（apt、DNF 等）中都可用，它可能会在搜索结果中显示多次。

如果能够设置一个默认的打包格式，使其优先于其他格式，那就更好了。如果你把 Flatpak 作为默认，它就不会显示 Snap 版本，默认只安装 Flatpak 版本。

### 3、跨系统同步安装的应用程序

这一点可能取决于发行版情况，从技术和策略的角度看都比较复杂。

安卓、iOS、macOS 和 Windows 都有这个功能，这样可以更容易开始使用新设备或重置的同一设备。你从他们的官方应用程序商店安装的应用程序与你的个人资料相关联。你重新安装/重置操作系统，或者在一个新系统上，登录应用程序商店，它就会显示你以前使用过的应用程序。

在 Linux 上，如果你由于某种原因重新安装系统，你就会失去你所安装的应用程序。当然，你可以重新安装它们，但你也必须回忆起你以前安装的应用程序。

我记得 Ubuntu 曾经有个 Ubuntu One 云，我以为他们会推出这个功能，但他们关闭了这个云服务。然而，Ubuntu One 仍然活着，并被用作 SSO 登录。事实上，你可以在 Ubuntu 软件中心看到 Ubuntu One 的登录选项，但它并没有做任何事情。

![Ubuntu 软件中心的登录选项][5]

知道你之前从 GNOME 软件中心安装了哪些软件，将使电脑的格式化和在电脑之间的移动更加容易。你不觉得吗？

当然，许多 Linux 用户不一定依靠软件中心来获取应用程序，但这对一些人来说可能是一个有用的功能。

### 4、面部解锁和/或指纹登录

我喜欢用密码登录并解锁 Windows 的方式。是的，我偶尔会使用  Windows。不，不是用来玩游戏，而是用超高清观看流媒体内容。过去几周我用得比较频繁，因为我在另一个城市，我必须依靠我的笔记本电脑来观看 4K 的 Netflix，而不是使用我的电视。

输入整个 8 到 10 个字符的长密码，加上特殊字符，总觉得是件麻烦事。值得庆幸的是，我的笔记本电脑有一个指纹识别器，但不是每个人都有这种奢侈。

对于许多已经习惯于在移动设备上使用这些方法的用户来说，使用指纹或面部来解锁设备可能会很好。

已经有一些项目允许你在 Linux 上使用面部解锁，GNOME 确实可以考虑将其加入到其产品中。

### 5、带回“添加新文档”选项

几年前，GNOME 删除了从右键菜单中创建一个新文档的功能。

现在仍然可以实现这个功能。你必须先在你的主目录的 Templates 文件夹中创建一个模板文档。然后所有的模板文档都可以在右键菜单中找到。

![][6]

但这本应是一个默认功能。人们不应该胡乱摆弄而试图找出“创建新文档”选项的去处。

现在是时候让 GNOME 恢复这个功能了。

### 你希望在 GNOME 中看到什么功能？

由于我主要使用 Ubuntu，它的定制 GNOME 与原生 GNOME 不同。原生 GNOME 也应该把小程序指示器带回来，这样像 Dropbox 等应用程序就可以快速访问。

GNOME 开发者不太可能关注像我们这样的普通 Linux 用户的想法，但我还是要问问你怎么看。

你希望在 GNOME 或桌面 Linux 中看到什么新功能？你也可以分享一些你最喜欢的、已经从 GNOME 中删除的，但你希望它们能重新出现的功能。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gnome-features-i-want/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-flatpak/
[2]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/Remove-application-option-gnome.png?w=800&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/removing-google-chrome-from-mint.webp?resize=799%2C562&ssl=1
[4]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/choosing-software-source-gnome.png?resize=1568%2C1007&ssl=1
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/sign-in-ubuntu-software-center.png?resize=1568%2C836&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/templates-in-ubuntu.png?resize=800%2C479&ssl=1