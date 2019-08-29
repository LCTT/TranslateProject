[#]: collector: (lujun9972)
[#]: translator: (beamrolling)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11282-1.html)
[#]: subject: (How to Install VirtualBox on Ubuntu [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/install-virtualbox-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 上安装 VirtualBox
======

> 本新手教程解释了在 Ubuntu 和其他基于 Debian 的 Linux 发行版上安装 VirtualBox 的各种方法。

![](https://img.linux.net.cn/data/attachment/album/201908/30/072113uzitwinnt9betilt.jpg)

Oracle 公司的自由开源产品 [VirtualBox][1] 是一款出色的虚拟化工具，专门用于桌面操作系统。与另一款虚拟化工具 [Linux 上的 VMWare Workstation][2] 相比起来，我更喜欢它。

你可以使用 VirtualBox 等虚拟化软件在虚拟机中安装和使用其他操作系统。

例如，你可以[在 Windows 上的 VirtualBox 中安装 Linux][3]。同样地，你也可以[用 VirtualBox 在 Linux 中安装 Windows][4]。

你也可以用 VirtualBox 在你当前的 Linux 系统中安装别的 Linux 发行版。事实上，这就是我用它的原因。如果我听说了一个不错的 Linux 发行版，我会在虚拟机上测试它，而不是安装在真实的系统上。当你想要在安装之前尝试一下别的发行版时，用虚拟机会很方便。

![Linux installed inside Linux using VirtualBox][5]

*安装在 Ubuntu 18.04 内的 Ubuntu 18.10*

在本新手教程中，我将向你展示在 Ubuntu 和其他基于 Debian 的 Linux 发行版上安装 VirtualBox 的各种方法。

### 在 Ubuntu 和基于 Debian 的 Linux 发行版上安装 VirtualBox

这里提出的安装方法也适用于其他基于 Debian 和 Ubuntu 的 Linux 发行版，如 Linux Mint、elementar OS 等。

#### 方法 1：从 Ubuntu 仓库安装 VirtualBox

**优点**：安装简便

**缺点**：较旧版本

在 Ubuntu 上下载 VirtualBox 最简单的方法可能是从软件中心查找并下载。

![VirtualBox in Ubuntu Software Center][6]

*VirtualBox 在 Ubuntu 软件中心提供*

你也可以使用这条命令从命令行安装：

```
sudo apt install virtualbox
```

然而，如果[在安装前检查软件包版本][7]，你会看到 Ubuntu 仓库提供的 VirtualBox 版本已经很老了。

举个例子，在写下本教程时 VirtualBox 的最新版本是 6.0，但是在软件中心提供的是 5.2。这意味着你无法获得[最新版 VirtualBox ][8]中引入的新功能。

#### 方法 2：使用 Oracle 网站上的 Deb 文件安装 VirtualBox

**优点**：安装简便，最新版本

**缺点**：不能更新

如果你想要在 Ubuntu 上使用 VirtualBox 的最新版本，最简单的方法就是[使用 Deb 文件][9]。

Oracle 为 VirtiualBox 版本提供了开箱即用的二进制文件。如果查看其下载页面，你将看到为 Ubuntu 和其他发行版下载 deb 安装程序的选项。

![VirtualBox Linux Download][10]

你只需要下载 deb 文件并双击它即可安装。就是这么简单。

- [下载 virtualbox for Ubuntu](https://www.virtualbox.org/wiki/Linux_Downloads)
 
然而，这种方法的问题在于你不能自动更新到最新的 VirtualBox 版本。唯一的办法是移除现有版本，下载最新版本并再次安装。不太方便，是吧？

#### 方法 3：用 Oracle 的仓库安装 VirtualBox

**优点**：自动更新

**缺点**：安装略微复杂

现在介绍的是命令行安装方法，它看起来可能比较复杂，但与前两种方法相比，它更具有优势。你将获得 VirtualBox 的最新版本，并且未来它还将自动更新到更新的版本。我想那就是你想要的。

要通过命令行安装 VirtualBox，请在你的仓库列表中添加 Oracle VirtualBox 的仓库。添加 GPG 密钥以便你的系统信任此仓库。现在，当你安装 VirtualBox 时，它会从 Oracle 仓库而不是 Ubuntu 仓库安装。如果发布了新版本，本地 VirtualBox 将跟随一起更新。让我们看看怎么做到这一点：

首先，添加仓库的密钥。你可以通过这一条命令下载和添加密钥：

```
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```

> Mint 用户请注意：

> 下一步只适用于 Ubuntu。如果你使用的是 Linux Mint 或其他基于 Ubuntu 的发行版，请将命令行中的 `$(lsb_release -cs)` 替换成你当前版本所基于的 Ubuntu 版本。例如，Linux Mint 19 系列用户应该使用 bionic，Mint 18 系列用户应该使用 xenial，像这样：

> ```
> sudo add-apt-repository “deb [arch=amd64] <http://download.virtualbox.org/virtualbox/debian> **bionic** contrib“`
> ```

现在用以下命令来将 Oracle VirtualBox 仓库添加到仓库列表中：

```
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
```

如果你有读过我的文章[检查 Ubuntu 版本][11]，你大概知道 `lsb_release -cs` 将打印你的 Ubuntu 系统的代号。

**注**：如果你看到 “[add-apt-repository command not found][12]” 错误，你需要下载 `software-properties-common` 包。

现在你已经添加了正确的仓库，请通过此仓库刷新可用包列表并安装 VirtualBox:

```
sudo apt update && sudo apt install virtualbox-6.0
```

**提示**：一个好方法是输入 `sudo apt install virtualbox-` 并点击 `tab` 键以查看可用于安装的各种 VirtualBox 版本，然后通过补全命令来选择其中一个版本。

![Install VirtualBox via terminal][13]

### 如何从 Ubuntu 中删除 VirtualBox

现在你已经学会了如何安装 VirtualBox，我还想和你提一下删除它的步骤。

如果你是从软件中心安装的，那么删除它最简单的方法是从软件中心下手。你只需要在[已安装的应用程序列表][14]中找到它，然后单击“删除”按钮。

另一种方式是使用命令行：

```
sudo apt remove virtualbox virtualbox-*
```

请注意，这不会删除你用 VirtualBox 安装的操作系统关联的虚拟机和文件。这并不是一件坏事，因为你可能希望以后或在其他系统中使用它们是安全的。

### 最后…

我希望你能在以上方法中选择一种安装 VirtualBox。我还将在另一篇文章中写到如何有效地使用 VirtualBox。目前，如果你有点子、建议或任何问题，请随时在下面发表评论。


--------------------------------------------------------------------------------

via: https://itsfoss.com/install-virtualbox-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[beamrolling](https://github.com/beamrolling)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.virtualbox.org
[2]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[3]: https://itsfoss.com/install-linux-in-virtualbox/
[4]: https://itsfoss.com/install-windows-10-virtualbox-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/linux-inside-linux-virtualbox.png?resize=800%2C450&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/virtualbox-ubuntu-software-center.jpg?ssl=1
[7]: https://itsfoss.com/know-program-version-before-install-ubuntu/
[8]: https://itsfoss.com/oracle-virtualbox-release/
[9]: https://itsfoss.com/install-deb-files-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/virtualbox-download.jpg?resize=800%2C433&ssl=1
[11]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[12]: https://itsfoss.com/add-apt-repository-command-not-found/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/install-virtualbox-ubuntu-terminal.png?resize=800%2C165&ssl=1
[14]: https://itsfoss.com/list-installed-packages-ubuntu/
