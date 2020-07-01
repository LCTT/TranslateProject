[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12307-1.html)
[#]: subject: (Looking for Some Good Note Taking Apps on Linux? Here are the Best Notes Apps we Found for You)
[#]: via: (https://itsfoss.com/note-taking-apps-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

9 款 Linux 上的最佳笔记应用
======

无论你做什么，做笔记总是一个好习惯。是的，有很多笔记应用可以帮助你实现这个目标。但是，Linux 上的开源笔记应用怎么样呢？

别担心，你不需要无休止地在互联网上搜索，就能找到 Linux 下最好的笔记应用。在这里，我挑选了一些最令人印象深刻的开源笔记应用。

![][1]

请注意，此列表没有特定的排名顺序。

### 1、Joplin

![][2]

主要功能：

* 支持 Markdown
* 支持附件
* 支持加密
* 跨平台，包括 Android 应用

[Joplin][9] 是一款令人印象深刻的自由开源笔记应用，支持加密。凭借其提供的出色的功能，它也是目前[最好的 Evernote 替代品][3]之一。事实上，我就是因为它提供的功能才从 Evernote 转移到 Joplin。

你可以选择添加待办事项列表、普通笔记，或者把它作为一个 Markdown 编辑器来写东西。它适用于 Linux、Windows、macOS、Android 和 iOS。你还可以选择使用 [Dropbox][4]、OneDrive、[NextCloud][5] 或 WebDAV 来同步你的笔记。

如果你好奇，可以阅读我们关于 [Joplin][6] 的详细文章来了解更多。

#### 如何安装？

你可以用一个 AppImage 文件来安装 Joplin。我已经在 Ubuntu 20.04 LTS 上试过了，和预期的一样没有问题。要找到该文件，你可以前往其官方网站或探索他们的 [GitHub 页面][7]。

如果你不知道如何安装它，请按照我们的[使用 AppImage 文件][8]指南来开始。

另外，如果你想使用终端，你可以键入下面的命令，通过脚本来安装它（在这个过程中还会添加一个桌面图标）。

```
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
```

### 2、Simplenote

![][10]

主要功能：

* 支持 Markdown
* 简约的用户界面
* 通过你的 Simplenote 帐户轻松地进行同步
* 有 32 位软件包
* 跨平台，包括移动应用程序

顾名思义，它是一款简约的自由开源笔记应用。

由 [Automattic][11]（WordPress 背后的公司）开发，[Simplenote][13] 可以让你在多个设备上无缝同步你的笔记。它支持 Android、iOS、Windows、Linux，以及 macOS。

与其它一些笔记应用不同的是，你会注意到它的界面非常简单，可能不会提供很多功能。但是，你可以为你的笔记添加标签。

#### 如何安装？

它提供了 .deb / .rpm 软件包以及一个 AppImage 文件。你可以在它的 [GitHub 发布部分][12]中找到这些文件。

### 3、Laverna

**注：** 它已经不再积极开发了，但它仍然可以正常工作。

![][14]

主要功能：

* 支持 Markdown
* 支持加密
* 支持同步

[Laverna][15] 是一个有趣的开源笔记应用程序，还提供加密（这是可选的）。

你可以把它作为一个基于 Web 的笔记应用，也可以作为电脑上的应用使用。它适用于 Linux、Mac 和 Windows。

虽然它除了支持加密外，还具有记事本应用的所有基本功能，但并没有一个可以使用的移动应用。所以，这是一个只有当你是一个桌面用户，并且在 Web 浏览器上完成大部分事情时才能使用的东西。

#### 如何安装？

它提供了一个压缩文件，可在其[官方网站][15]上获得。下载之后，你需要解压并启动可执行文件来开始。

### 4、Standard Notes

![][16]

主要功能：

* 支持 Markdown
* 支持加密
* 支持同步
* 笔记的版本历史（付费计划）
* 跨平台，包括移动应用程序
* 提供了 32 位包。
* 提供付费选择

又一款开源笔记应用，为你的笔记和附件提供加密。

与 Laverna 不同，[Standard Notes][18] 正在积极开发中。虽然它提供了大量的功能，但其中一些功能以“扩展功能”或扩展插件仅提供给付费用户，这是偏昂贵的（每月订阅）。你也可以参考我们另外一篇关于 [Standard Notes][17] 的文章来了解更多信息。

总的来说，你会得到 Markdown 支持、加密附件和笔记的能力、版本历史、备份支持（OneDrive、Google Drive 等）以及更多这样有用的功能。

#### 如何安装？

它提供了一个 AppImage 文件，可以在你的 Linux 发行版上安装它。你只需要前往它的[官方网站][18]下载即可。如果你不知道如何使用这个文件，可以参考我们的 [AppImage 指南][8]。

对于其他可用的软件包或源代码，你可以参考他们的 [GitHub 页面][19]。

### 5、Boost Note

![][20]

主要功能：

* 支持 Markdown
* 适用于开发者
* 跨平台

[Boost Note][21] 是一款对使用 Linux 的程序员有用的笔记应用。你可以用它写你的代码，也可以用来写笔记、文档等等。

它提供了一个简洁直观的用户界面，并提供了 Linux 上笔记应用的所有基本功能。

#### 如何安装？

你可以选择其[官网][22]上为 Ubuntu 提供的 .deb 文件。如果你想在其他 Linux 发行版上尝试，你还可以找到一个 AppImage 文件来开始使用。

如果你好奇，也可以查看他们的 [GitHub 页面][23]来探索更多关于它的内容或复刻它。

### 6、Tomboy Notes（新一代）

![][24]

主要功能：

* 轻量级笔记应用
* 支持同步
* 跨平台

一款轻量级且极其简单的记事应用怎么样？

好吧，你可能知道旧版的 [Tomboy Notes][25] 已经不再开发了。幸运的是，有一个新一代的 [Tomboy Notes NG][27] 版本。你可以配置存储笔记的路径，并快速开始记笔记。

这款应用仅仅只有约 2MB 的下载量。所以，如果你正在寻找一个轻量级的解决方案 —— 那就是它。它可能无法用于智能手机，但你肯定可以在 Windows、Linux 和 MacOS 上使用它。

#### 如何安装？

你可以在他们的 [GitHub 发布部分][26]中找到 .deb / .rpm 和其他包。对于其他的 Linux 发行版，你可以关注他们 GitHub 页面的文档来了解更多。

### 7、RedNoteBook

![][28]

主要功能

* 传统的日记式记事应用
* 有模板
* 离线使用

对于想要在 Linux 上使用离线笔记应用的用户来说，[RedNotebook][30] 应该是一个不错的选择。

是的，它不支持同步，如果你是一个不想要同步功能的人，RedNoteBook 应该是一款传统风格的记事应用，侧边栏为日历。

它主要是为喜欢离线日记的用户量身定做的。它还为你提供了几个模板，方便你创建某些笔记。

#### 如何安装？

如果你使用的是 Ubuntu（或者其他基于 Ubuntu 的发行版），你可以通过 PPA 来安装它。下面是你在终端中输入的安装方法：

```
sudo add-apt-repository ppa:rednotebook/stable
sudo apt-get update
sudo apt-get install rednotebook
```

对于其他的 Linux 发行版，你可以得到 [Flatpak 软件包][29]。

### 8、TagSpaces

![][31]

主要特点：

* 丰富的用户界面
* 支持管理文件
* 支持同步
* 提供付费选择

[TagSpaces][34] 是一款适用于 Linux 的精美笔记应用。不仅仅局限于创建笔记，你还可以管理照片和其他文档。

与其他一些可用的笔记应用不同，它不提供加密功能。所以，你可以尝试像 [Syncthing][32] 这样支持 Dropbox 和 Nextcloud 的工具来安全地同步你的数据。

如果你想要特定的功能和支持，你也可以选择它的付费计划。

#### 如何安装？

你可以在他们的 [GitHub 发布区][33]中找到 .deb 文件和一个 AppImage 文件来安装。无论哪种情况，你都可以把它也构建起来。

### 9、Trilium Notes

![][35]

主要功能：

* 分层记事应用
* 支持加密
* 支持同步

[Trilium Notes][39] 并不只是又一款笔记应用，它是一款专注于建立个人知识库的分层笔记应用。

是的，你也可以将它用于普通用途 —— 但它是为特定用户量身定制的，他们希望能够以分层方式管理笔记。

我个人还没有使用过 —— 除了测试。欢迎试用，多多探讨。

#### 如何安装？

只需前往其 [GitHub 发布区][36]，并抓取 [.deb 文件在 Ubuntu 上安装][37]。如果你正在寻找其他 Linux 发行版上可用的软件包，你也可以从源代码构建它，或者下载并[解压缩文件][38]。

### 总结

我对 Linux 上的笔记应用的推荐到此结束。我已经用过很多个，目前决定用 Simplenote 来做快速笔记，用 Joplin 来收集章节中的笔记。

你是否知道一些应该包括在这个列表中的其它 Linux 笔记应用程序？为什么不在评论区告诉我们呢？

你更喜欢哪个笔记应用程序？我很想知道你通常在 Linux 上寻找的最好的笔记应用程序是什么。

欢迎在下面的评论部分分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/note-taking-apps-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/Note-Taking-Apps-linux.jpg?ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/joplin_ubuntu.jpg?ssl=1
[3]: https://itsfoss.com/5-evernote-alternatives-linux/
[4]: https://www.dropbox.com/
[5]: https://nextcloud.com/
[6]: https://linux.cn/article-11896-1.html
[7]: https://github.com/laurent22/joplin
[8]: https://itsfoss.com/use-appimage-linux/
[9]: https://joplinapp.org/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/simplenote-new.jpg?ssl=1
[11]: https://automattic.com/
[12]: https://github.com/Automattic/simplenote-electron/releases/tag/v1.16.0
[13]: https://simplenote.com
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/laverna.png?resize=800%2C623&ssl=1
[15]: https://laverna.cc
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/standard-notes-shot.jpg?resize=800%2C578&ssl=1
[17]: https://itsfoss.com/standard-notes/
[18]: https://standardnotes.org
[19]: https://github.com/standardnotes
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/boostnote.png?resize=800%2C579&ssl=1
[21]: https://itsfoss.com/boostnote-linux-review/
[22]: https://boostnote.io/
[23]: https://github.com/BoostIO/Boostnote
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/tomboy-notes-ng.jpg?ssl=1
[25]: https://github.com/tomboy-notes/tomboy
[26]: https://github.com/tomboy-notes/tomboy-ng/releases
[27]: https://github.com/tomboy-notes/tomboy-ng
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/rednotebook.png?ssl=1
[29]: https://flathub.org/apps/details/app.rednotebook.RedNotebook
[30]: https://rednotebook.sourceforge.io
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/tagspaces.png?resize=800%2C523&ssl=1
[32]: https://itsfoss.com/syncthing/
[33]: https://github.com/tagspaces/tagspaces/releases/
[34]: https://www.tagspaces.org/
[35]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/trilium-notes.png?ssl=1
[36]: https://github.com/zadam/trilium/releases
[37]: https://itsfoss.com/install-deb-files-ubuntu/
[38]: https://itsfoss.com/unzip-linux/
[39]: https://github.com/zadam/trilium/
