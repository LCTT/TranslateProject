[#]: subject: "Install Specific Package Version With Apt Command in Ubuntu"
[#]: via: "https://itsfoss.com/apt-install-specific-version-2/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14760-1.html"

如何在 Ubuntu 中安装具体指定的软件包版本
======

![](https://img.linux.net.cn/data/attachment/album/202206/26/145335zcrpducpup4p2ugy.jpg)

在 Ubuntu 中想安装一个软件包的一个特别指定的版本？你可以通过下面的方式来轻松地完成：

```
sudo apt install package_name=package_version
```

你如何知道某个软件包有哪些可用的版本？可以使用这个命令：

```
apt list --all-versions package_name
```

在下面的屏幕截屏中，你可以看到，我有两个可用的 VLC 版本，我使用命令来安装较旧的版本：

![install specific versions apt ubuntu][1]

听起来像一个简单的任务，对吧？但是事情并非看起来那么简单。这里有一些不确定是否会出现，但是可能会涉及的东西。

这篇教程将涵盖使用 `apt` 或 `apt-get` 命令来安装一个具体指定的程序的版本的所有的重要的方面。

### 安装一个具体指定版本的程序需要知道的事

在基于 Ubuntu 和 Debian 发行版中，你需要知道一些关于 APT 和存储库是如何工作的知识。

#### 同一个软件包源没有较旧的版本

Ubuntu 在其存储库中不保留较旧版本的软件包。在特殊的情况下，你可以暂时性地看到多个版本。例如，你运行 APT 更新（但不升级）时，可能会有一个可用的新版本。在 APT 缓存中，你可以看到同一个软件包的两个版本。但是，一旦软件包被升级到了新的版本，较旧版本的软件包将从 **APT 缓存** 和存储库中移除。

#### 使用多个软件包源来使用不同的版本

为获取同一个的软件包的多个版本，你必须得添加多个软件包源。例如，VLC 是版本 3.x 系列。添加 [VLC 每日构建 PPA][2] 将会提供（不稳定的）版本 4.x 系列。

同样，**你可以下载不同版本的 DEB 文件，并安装它**。

#### 较高版本编号的版本通常有优先权

如果你有来自多个软件包源的相同名称的软件，默认情况下，Ubuntu 将安装可用的最高版本编号的版本。

在前面的示例中，如果我安装 VLC ，那么它将会安装 4.x 系列的版本，而不是 3.x 系列的版本。

#### 较旧版本将升级到可用的较新版本

这是另外一个可能存在的问题。即使你安装较旧版本的软件包，它也会升级到较新的版本（如果存在可用的较新版本）。你必须 [保留该软件包来防止其升级][3] 。

#### 依赖关系也需要安装

如果软件包有依赖关系，你也需要安装必要的依赖关系软件包。

现在，你已经知道一些可能存在的问题，让我们看看如何解决它们。

### 安装一个软件包的具体指定版本

在这篇教程中，我将以 VLC 为例。在 Ubuntu 的存储库中可获得 VLC 版本。我添加了每日构建 PPA ，它将向我提供 VLC 的 4.0 版本的候选版本。

如你所见，在现在的系统中，我有两个可用的 VLC 版本：

![install specific versions apt ubuntu][4]

```
~$ apt list -a vlc
Listing... Done
vlc/jammy 4.0.0~rc1~~git20220516+r92284+296~ubuntu22.04.1 amd64
vlc/jammy 3.0.16-1build7 amd64
vlc/jammy 3.0.16-1build7 i386
```

因为较高版本编号版本有优先权，使用 `apt install vlc` 命令将会导致安装 VLC 的 4.0 版本。但是，因为这篇教程的缘由，我想安装较旧的版本 3.0.16 。

```
sudo apt install vlc=3.0.16-1build7
```

但是，这里会有这样的事。VLC 软件包有一些依赖关系，并且这些依赖关系也需要具体指定的版本。因此，在 Ubuntu 为其尝试安装最新的版本时，你将会遇到经典的 <ruby>[你已保留残缺软件包][5]<rt>you have held broken packages</rt></ruby> 错误。

![problem installing specific version apt ubuntu][6]

为修复这个错误，你需要为其提供它所投诉的所有依赖关系的软件包的具体指定版本。因此，该命令会变成这样：

```
sudo apt install vlc=3.0.16-1build7 \
		 vlc-bin=3.0.16-1build7 \
		 vlc-plugin-base=3.0.16-1build7 \
		 vlc-plugin-qt=3.0.16-1build7 \
		 vlc-plugin-video-output=3.0.16-1build7 \
		 vlc-l10n=3.0.16-1build7 \
		 vlc-plugin-access-extra=3.0.16-1build7 \
		 vlc-plugin-notify=3.0.16-1build7 \
		 vlc-plugin-samba=3.0.16-1build7 \
		 vlc-plugin-skins2=3.0.16-1build7 \
		 vlc-plugin-video-splitter=3.0.16-1build7 \
		 vlc-plugin-visualization=3.0.16-1build7
```

说明一下，每行结尾处的 `\` 只是用来将多行命令来写入同一个命令的一种方式。

**它有作用吗？在很多情况下，它是有作用的。** 但是，我选择了一个复杂的 VLC 示例，它有很多依赖关系。甚至这些所涉及的依赖关系也依赖于其它的软件包。所以，它就变得令人难以处理。

一种替代的方法是在安装时指定软件包源。

#### 替代方式，指定存储库

你已经添加多个软件包源，因此，你应该对这些软件包的来源有一些了解。

使用下面的命令来搜索存储库：

```
apt-cache policy | less
```

注意存储库名称后面的行：

```
500 http://security.ubuntu.com/ubuntu jammy-security/multiverse i386 Packages
     release v=22.04,o=Ubuntu,a=jammy-security,n=jammy,l=Ubuntu,c=multiverse,b=i386
     origin security.ubuntu.com
```

你可以具体指定 `o`、`l`、`a` 等参数。

在我原来的示例中，我想安装来自 Ubuntu 存储库的 VLC（获取版本 3.16），而不是安装来 PPA 的版本（它将向我提供版本 4）。

因此，下面的命令将安装 VLC 版本 3.16 及其所有的依赖关系：

```
sudo apt install -t "o=ubuntu" vlc
```

![install from repository source][7]

看起来令人满意？但是，当你必须更新系统时，问题就来了。它接下来会控诉找不到指定的软件包版本。

**还能做什么？**

为安装较旧的软件包版本，从你的系统中移除较新版本的软件包源（如果可能的话）。它将有助于逃脱这些依赖关系地狱。

如果不能这么做，检查你是否可以从其它一些软件包的打包格式来获取，像 Snap、Flatpak、AppImage 等等。事实上，Snap 和 Flatpak 也允许你从可用的版本中选择和安装。因为这些应用程序是沙盒模式的，所以它很容易管理不同版本的依赖关系。

#### 保留软件包，防止升级

如果你完成安装一个指定的程序版本，你可能想避免意外地升级到较新的版本。实现这一点并不太复杂。

```
sudo apt-mark hold package_name
```

你可以免除保留软件包，以便它能稍后升级：

```
sudo apt-mark unhold package_name
```

注意，软件包的依赖关系不会自动地保留。它们需要单独地指明。

### 结论

如你所见，安装选定软件包版本有一定之规。只有当软件包有依赖关系时，那么事情就会变得复杂，然后，你就会进入依赖关系地狱。

我希望你在这篇教程中学到一些新的东西。如果你有问题或建议来改善它，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-install-specific-version-2/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/05/install-specific-versions-apt-ubuntu.png
[2]: https://launchpad.net/~videolan/+archive/ubuntu/master-daily
[3]: https://itsfoss.com/prevent-package-update-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2022/05/install-specific-versions-apt-ubuntu.png
[5]: https://itsfoss.com/held-broken-packages-error/
[6]: https://itsfoss.com/wp-content/uploads/2022/05/problem-installing-specific-version-apt-ubuntu-800x365.png
[7]: https://itsfoss.com/wp-content/uploads/2022/05/install-from-repository-source-800x578.png
