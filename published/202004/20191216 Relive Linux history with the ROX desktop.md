[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12123-1.html)
[#]: subject: (Relive Linux history with the ROX desktop)
[#]: via: (https://opensource.com/article/19/12/linux-rox-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

用 ROX 桌面重温 Linux 历史
======

> 这篇文章是 Linux 桌面 24 天特别系列的一部分。如果你想来一次有趣的时光之旅，ROX 桌面非常值得一试。

![](https://img.linux.net.cn/data/attachment/album/202004/18/151533n196wag64gwhs0ga.jpg)

[ROX][2] 桌面已经不再积极开发，而它的遗留问题至今仍然存在，但即使在它活跃开发的时候，它也是一个另类的 Linux 桌面。当其他的桌面感觉与旧式的 Unix 或 Windows 界面大致相似时，ROX 则属于 BeOS、AmigaOS 和 [RISC OS][3] 桌面阵营。

它专注于拖放式操作（这使得它的可访问性对某些用户来说并不理想）、点击式操作、弹出式上下文菜单，以及一个独特的应用程序目录系统，无需安装即可运行本地应用程序。

### 安装 ROX

如今，ROX 基本上都被遗弃了，只剩下一点残渣碎片留给用户自己去收集整理。幸运的是，这个难题相对来说比较容易解决，但是当你在发行版的软件仓库中找到 ROX 桌面的碎片时，不要被迷惑了，因为那并不是 ROX 桌面全部的碎片。ROX 常用的部分 —— 文件管理器（[ROX-Filer][4]）和终端（[ROXTerm][5]） —— 似乎在大多数流行的发行版软件仓库中都有存在，你可以将它们作为独立的应用程序安装（并使用）。然而，要运行 ROX 桌面，你必须同时安装 ROX-Session 和它所依赖的库。

我在 Slackware 14.2 上安装了 ROX，但它应该可以在任何 Linux 或 BSD 系统上运行。

首先，你必须从其版本库中安装 [ROX-lib2][6]。你要安装 ROX-lib2，按照它的理念，只需下载tarball、[解压][7]，然后将 `ROX-lib` 目录移动到 `/usr/local/lib` 下就行。

接下来，你要安装 [ROX-Session][8]。这可能需要从源码中编译，因为它很可能不在你的软件仓库中。编译过程需要编译工具，这些工具在 Slackware 上是默认提供的，但在其他发行版中往往会被省略，以节省初始下载空间。根据你的发行版不同，你必须安装的包的名称也不同，所以请参考文档来了解具体内容。例如，在 Debian 发行版中，你可以在 [Debian 的 wiki][9] 中了解构建需求，而在 Fedora 发行版中，请参考 [Fedora 的文档][10]。安装了构建工具后，执行自定义的 ROX-Session 构建脚本。

```
$ ./AppRun
```

这个脚本会自己管理构建和安装，并提示你需要 root 权限，以在你的登录屏上将其添加为一个选项。

如果你还没有从你的软件库中安装 ROX-Filer，请在继续之前安装。

这些组件共同组成了一个完整的 ROX 桌面。要登录到新桌面，请从当前桌面会话中注销。默认情况下，你的会话管理器（KDM、GDM、LightDM 或 XDM，视你的设置而定）会继续登录到你之前的桌面，所以在登录前必须覆盖。

使用 SDDM：

![][11]

使用 GDM：

![][12]

### ROX 桌面特性

ROX 桌面默认情况下很简单，屏幕底部有一个面板，桌面上有一个通往主目录的快捷方式图标。面板中包含了一些常用位置的快捷方式。这就是 ROX 桌面的全部功能，至少在安装后就是这样。如果你想要时钟、日历或系统托盘，你需要找到提供这些功能的应用程序。

![Default ROX desktop][13]

虽然没有任务栏，但当你将窗口最小化时，它就会成为桌面上的一个临时图标。你可以点击该图标，将其窗口恢复到以前的大小和位置。

面板也可以进行一些修改。你可以在其中放置不同的快捷方式，甚至可以创建自己的小程序。

它没有应用菜单，也没有上下文菜单中的应用快捷方式。相反，你可以手动导航到 `/usr/share/applications`，或者你可以将你的应用目录或目录添加到 ROX 面板中。

![ROX desktop][14]

ROX 桌面的工作流程集中在鼠标驱动上，让人联想到 Mac OS 7.5 和 8 系统。通过 ROX-filer，你可以管理权限、文件管理、<ruby>内省<rt>introspection</rt></ruby>、脚本启动、后台设置，以及几乎所有你能想到的东西，只要你有足够的耐心，就可以实现点击式的交互。对于高级用户来说，这似乎很慢，但 ROX 设法让它变得相对无痛，而且非常直观。

### 应用程序目录、AppRun 和 AppImage

ROX 桌面有一个优雅的惯例，按照此惯例，包含一个名为 `AppRun` 的脚本的目录就可以像一个应用程序一样被执行。这意味着，要制作一个 ROX 应用程序，你所要做的就是将代码编译到一个目录中，将一个名为`AppRun` 的脚本放在该目录的根目录下，来执行你所编译的二进制文件，然后将该目录标记为可执行即可。ROX-Filer 会按照你设置的方式来显示一个目录，并以特殊的图标和颜色显示一个目录。当你点击一个应用程序目录，ROX-Filer 会自动运行里面的 `AppRun` 脚本。它的外观和行为就像一个已经安装好的应用程序，但它是在用户的主目录下的本地目录，不需要特殊的权限。

这是一个方便的功能，但它是那些你使用时感觉很好的小功能之一，因为它很容易做到。它绝不是必要的，它只是比在本地建立一个应用程序，将目录隐藏在某个不显眼的地方，并建立一个快速的 `.desktop` 文件作为你的启动器，要领先了几步。然而，应用程序目录的概念已经当做灵感被 [AppImage][16] 打包系统所 [借鉴][15]。

### 为什么应该试试 ROX 桌面

把 ROX 设置好并使用是有些困难的，它似乎真的被抛弃了。然而，它的遗产在今天以多种方式继续存在，它是 Linux 历史上的一段迷人而有趣的历史。它可能不会成为你的主要桌面，但如果你想来一次有趣的回溯之旅，那么 ROX 非常值得一试。探索它、定制它，看看它包含了哪些巧妙的想法。也许还有一些隐藏的宝石可以让开源社区受益。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-rox-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: http://rox.sourceforge.net/desktop/
[3]: https://www.riscosopen.org/content/
[4]: http://rox.sourceforge.net/desktop/ROX-Filer
[5]: http://roxterm.sourceforge.net/
[6]: http://rox.sourceforge.net/desktop/ROX-Lib
[7]: https://opensource.com/article/17/7/how-unzip-targz-file
[8]: http://rox.sourceforge.net/desktop/ROX-Session.html
[9]: https://wiki.debian.org/BuildingTutorial
[10]: https://docs.pagure.org/docs-fedora/installing-software-from-source.html
[11]: https://opensource.com/sites/default/files/advent-kdm_0.jpg
[12]: https://opensource.com/sites/default/files/advent-gdm_1.jpg
[13]: https://opensource.com/sites/default/files/uploads/advent-rox.jpg (Default ROX desktop)
[14]: https://opensource.com/sites/default/files/uploads/advent-rox-custom.jpg (ROX desktop)
[15]: https://github.com/AppImage/AppImageKit/wiki/AppDir
[16]: https://appimage.org/
