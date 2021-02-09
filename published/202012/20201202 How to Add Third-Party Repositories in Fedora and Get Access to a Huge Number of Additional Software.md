[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12898-1.html)
[#]: subject: (How to Add Third-Party Repositories in Fedora and Get Access to a Huge Number of Additional Software)
[#]: via: (https://itsfoss.com/fedora-third-party-repos/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

如何在 Fedora 中添加第三方存储库以访问大量附加软件
======

![](https://img.linux.net.cn/data/attachment/album/202012/08/074323tkjpr2499rtjnjq0.jpg)

在你安装 Fedora 后。你可能会发现你想要安装和使用的一些软件在软件商店中找不到。出于一些原因，这些软件包不能出现在 Fedora 存储库中。

不用担心，我将告诉你如何为 Fedora 添加第三方存储库来使这些软件包可使用。

### 在 Fedora 中的第三方存储库是什么？

操作系统开发人员通常会决定哪些软件包可以在其存储库中使用，哪些软件包不可以在其存储库中使用。Fedora 也是如此。依据 [Fedora 文档][1] ，第三方存储库包含有 “拥有更为宽松的许可政策，并提供 Fedora 因各种原因所排除软件包” 的软件包。

Fedora 强制执行下面的 [准则][2] ，当它打包软件包时:

  * 如果它是专有的，它就不能包含在 Fedora 中
  * 如果它在法律上被限制，它就不能包含在 Fedora 中
  * 如果它违反美国法律（特别是联邦政府或适用于州政府的法律），它就不能包含在 Fedora 中

因此，有一些可以由用户自行添加的存储库。这使得用户能够访问附加的软件包。

### 在 Fedora 中启用 RPM Fusion 存储库 

[RPM Fusion][3] 是 Fedora 的第三方应用程序的主要来源。RPM Fusion 是由三个项目（Dribble、Freshrpms 和 Livna）合并而成的。RPM Fusion 提供两种不同的软件存储库。

  * free 存储库：包含开源软件。
  * nonfree 存储库：包含没有开源协议的软件，但是它们的源文件代码却是可以自由使用的。

这里有两种方法来启动 RPM Fusion：从终端启用，或通过点击几个按钮来启用。我们将逐一查看。

#### 方法 1：命令行方法

这是启用 RPM Fusion 存储库的最简单的方法。只需要输入下面的命令即可启用两个存储库：

```
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

会要求你输入密码、确认是否你想要安装这些存储库。在你确认后，安装过程将在几秒钟或几分钟内完成。

![通过命令行安装 RPM Fusion][4]

#### 方法 2：图形用户界面方法

使用这个方法来启用 RPM Fusion 存储库，你需要访问 [RPM Fusion 网站][5] 。你将看到针对不同 Fedora 版本的两个存储库的链接。

RPM Fusion 建议先安装 free 存储库。因此，单击针对你 Fedora 版本的 free 存储库的链接。然后会打开一个窗口来询问你是否想安装该存储库。单击安装。

![通过图形用户界面安装 RPM Fusion][6]

在安装过程完成后，返回并使用相同的步骤安装 nonfree 存储库。

### 启用 Fedora 的第三方存储库

Fedora 最近开始提供它自己的 [第三方应用程序存储库][7] 。在这个存储库中 [可使用的应用程序的数量][8] 是非常少的。你可以 [使用它来在 Fedora 上安装 Chrome 浏览器][9] 。除 Chrome 外，它也包含 Adobe Brackets、Atom、Steam、Vivaldi、Opera 等应用程序。

就像 RPM Fusion 一样，你可以通过终端或图形用户界面的方法来启用这个存储库。

#### 方法 1：命令行方法

为启用 Fedora 的第三方存储库，输入下面的命令到你的终端中：

```
sudo dnf install fedora-workstation-repositories
```

当被提示时，确保输入你的密码并输入 `Y` 来确认安装。

#### 方法 2：图形用户界面方法

如果你不习惯使用终端，你可以使用图形用户界面方法。

首先，你需要打开 Gnome “软件”。接下来，你需要单击右上角的汉堡菜单，并从菜单中选择“软件存储库”。

![Gnome 软件的菜单][10]

在软件存储库窗口中，你将在其顶部看到写着 “第三方存储库” 字样的部分。单击“安装”按钮。当你被提示时，输入你的密码。

![Fedora 第三方存储库安装][11]

随着这些附加存储库的启用，你可以安装软件到你的系统当中。你可以从软件中心管理器或使用 DNF 软件包管理器来轻松地安装它们。

如果你发现这篇文章很有趣，请花费一些时间来在社交媒体上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-third-party-repos/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/#third-party-repositories
[2]: https://fedoraproject.org/wiki/Forbidden_items
[3]: https://rpmfusion.org/RPM%20Fusion
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/install-rpmfusion-cli.png?resize=800%2C604&ssl=1
[5]: https://rpmfusion.org/Configuration
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/install-rpmfusion-gui.png?resize=800%2C582&ssl=1
[7]: https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories
[8]: https://fedoraproject.org/wiki/Workstation/Third_party_software_list
[9]: https://itsfoss.com/install-google-chrome-fedora/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/software-meni.png?resize=800%2C672&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-third-party-repo-gui.png?resize=746%2C800&ssl=1
[12]: https://%0Areddit.com/r/linuxusersgroup
