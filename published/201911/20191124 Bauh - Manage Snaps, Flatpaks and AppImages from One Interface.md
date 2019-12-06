[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11617-1.html)
[#]: subject: (Bauh – Manage Snaps, Flatpaks and AppImages from One Interface)
[#]: via: (https://itsfoss.com/bauh-package-manager/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

bauh：在一个界面中管理 Snap、Flatpak 和 AppImage
======

![](https://img.linux.net.cn/data/attachment/album/201911/27/092926pzzdtytda80yaany.jpg)

[Snap][1]、[Flatpak][2] 和 [AppImage][3] 等通用软件包的最大问题之一就是管理它们。大多数内置的软件包管理器都不能全部支持这些新格式。

幸运的是，我偶然发现了一个支持这几种通用包格式的应用程序。

### bauh：多包装需求的管理器

[bauh][4]（LCTT：我给该软件建议一个中文名：“包豪”）最初名为 fpakman，旨在处理 Flatpak、Snap、[AppImage][5] 和 [AUR][6] 软件包。创建者 [vinifmor][7] 在 2019 年 6 月启动了该项目，[意图][8]“为 Manjaro 用户提供管理 Flatpak 的图形界面”。此后，他扩展了该应用程序，以添加对基于 Debian 的系统的支持。

![Bauh About][9]

首次打开 bauh 时，它将扫描已安装的应用程序并检查更新。如果有任何需要更新的内容，它们将列在前面并居中。更新所有软件包后，你将看到已安装的软件包列表。你可以取消选择不需要更新的软件包，以防止其被更新。你也可以选择安装该应用程序的早期版本。

![With Bauh you can manage various types of packages from one application][10]

你也可以搜索应用程序。bauh 提供了有关已安装和已搜索软件包的详细信息。如果你对一种（或多种）软件包类型不感兴趣，则可以在设置中取消选择它们。

![Bauh Search][22]

![Bauh Package Info][13]

![Bauh Updating][19]

### 在你的 Linux 发行版上安装 bauh

让我们看看如何安装 bauh。

#### 基于 Arch 的发行版

如果你安装的是最近的 [Manjaro][11]，则应该一切已经就绪。bauh 默认情况下已安装。如果你安装的是较早版本的 Manjaro（如我一样）或其他基于 Arch 的发行版，则可以在终端中输入以下内容从 [AUR][12] 中进行安装：

```
sudo pacman -S bauh
```

#### 基于 Debian/Ubuntu 的发行版

如果你拥有基于 Debian 或 Ubuntu 的 Linux 发行版，则可以使用 `pip` 安装 bauh。首先，请确保[在 Ubuntu 上安装了 pip][14]。

```
sudo apt install python3-pip
```

然后使用它来安装 bauh：

```
pip3 install bauh
```

但是，该软件的创建者建议[手动][15]安装它，以避免弄乱系统的库。

要手动安装 bauh，你必须先下载其[最新版本][16]。下载后，可以[使用图形工具][17]或 [unzip 命令][18]解压缩。接下来，在终端中打开该文件夹。你将需要使用以下步骤来完成安装。

首先，在名为 `env` 的文件夹中创建一个虚拟环境：

```
python3 -m venv env
```

现在在该环境中安装该应用程序的代码：

```
env/bin/pip install .
```

启动该应用程序：

```
env/bin/bauh
```

一旦完成了 bauh 的安装，就可以通过更改环境设置和参数来对其进行[微调][20]。

### bauh 的未来之路

bauh 在短短的几个月中增长了很多。它有计划继续增长。当前的[路线图][21]包括：

* 支持其他打包技术
* 每种打包技术一个单独模块
* 内存和性能改进
* 改善用户体验

### 结语

当我尝试 bauh 时，遇到了两个问题。当我第一次打开它时，它告诉我尚未安装 Snap，如果要使用 Snap 软件包，则必须安装它。我知道我已经安装了 Snap，因为我在终端中运行了 `snap list`，并且可以正常工作。我重新启动系统，Snap 才工作正常。

我遇到的另一个问题是我的一个 AUR 软件包无法更新。我可以用 `yay` 更新软件包，而没有任何问题。可能是我的 Manjaro 有问题，我已经使用了它 3 到 4 年。

总体而言，bauh 可以工作。它做到了宣称的功能。我不能要求更多。

你有没有用过 hauh？如果有的话，你最喜欢的用于管理不同打包格式的工具是什么？在下面的评论中让我们知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/bauh-package-manager/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://snapcraft.io/
[2]: https://flatpak.org/
[3]: https://appimage.org/
[4]: https://github.com/vinifmor/bauh
[5]: https://itsfoss.com/use-appimage-linux/
[6]: https://itsfoss.com/best-aur-helpers/
[7]: https://github.com/vinifmor
[8]: https://forum.manjaro.org/t/bauh-formerly-known-as-fpakman-a-gui-for-flatpak-and-snap-management/96180
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-about.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh.jpg?ssl=1
[11]: https://manjaro.org/
[12]: https://aur.archlinux.org/packages/bauh
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-package-info.jpg?ssl=1
[14]: https://itsfoss.com/install-pip-ubuntu/
[15]: https://github.com/vinifmor/bauh#manual-installation
[16]: https://github.com/vinifmor/bauh/releases
[17]: https://itsfoss.com/unzip-linux/
[18]: https://linuxhandbook.com/unzip-command/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-updating.jpg?ssl=1
[20]: https://github.com/vinifmor/bauh#general-settings
[21]: https://github.com/vinifmor/bauh#roadmap
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-search.png?resize=800%2C319&ssl=1
[23]: https://reddit.com/r/linuxusersgroup
