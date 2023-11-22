[#]: subject: "Install VSCodium on Fedora"
[#]: via: "https://itsfoss.com/install-vscodium-fedora/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Fedora 上安装 VSCodium
======

Visual Studio Code（VS Code）是微软开发的一款流行的跨平台文本编辑器。它基于 Electron 框架构建，被开发人员广泛用于编码和文本编辑任务。VS Code 的核心，称为 “Code - OSS”，是开源的，并在 MIT 许可证下分发。然而，微软添加了特定的自定义功能，并在专有许可下发布了其品牌版本的编辑器。

为了解决有关[遥测][1]和许可的问题，有一个名为 “[VSCodium][2]” 的替代方案，它是社区驱动、禁用遥测且获得 MIT 许可的 VS Code 版本。

![VSCodium running on Fedora 39][3]

在本教程中，我将指导你完成在 Fedora Linux 系统上安装和运行 VSCodium 的过程。

有三种方法可以做到这一点：

   1. 从发布页面下载 rpm 文件进行安装。但是，你需要重复该过程才能更新软件包（这可能会令人沮丧）。
   2. 添加 [paulcarroty][4] 仓库（如 [VSCodium][5] 网站所述）。因此，当你[更新你的 Fedora 系统][6] VScodium 也会得到更新（这是相当无缝的）。
   3. 使用 flatpak 版本，你可能已经尝试过从 Gnome 软件中安装该版本（我有过同样的糟糕经历，因此可能会有所不同）。



第一个非常简单，即从[发布页面][8]下载并[安装 rpm 文件][7]。那么，让我们切入主题并遵循其他两种方法。

### 方法 1：通过添加仓库来安装 VSCodium

打开终端：你可以通过在应用菜单中搜索 “Terminal” 来打开终端。

添加 GPG 密钥：以便包管理器信任仓库的打包者。

````

     sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

````

添加 VSCodium 仓库：以下命令会将仓库添加到你的 Fedora 系统。

````

     printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab .com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

````

安装VSCodium：现在你已经添加了 VSCodium 存储库，你可以使用以下命令安装它（喜欢前沿软件的人可以将软件包名称替换为 **codium-insiders** 来安装 insider 版本）：

````

     sudo dnf install codium

````

启动 VSCodium：你现在可以从应用菜单或在终端中运行以下命令来启动 VSCodium：

````

     codium

````

#### 删除 VSCodium

如果你不喜欢 VSCodium 以及它基于 Electron 的事实，或者改用 Neovim。你可以使用以下命令删除它：

````

     sudo dnf remove codium

````

你可以将仓库和签名添加到你的系统中，也可以不保留（为什么不）。

因此，让我们摆脱该仓库：

````

     sudo rm /etc/yum.repos.d/vscodium.repo

````

### 方法 2：使用 flatpak 安装 VSCodium

你也可以安装 flatpak。因此，以下是在 Fedora 上使用 Flatpak 安装 VSCodium 的步骤：

你可以通过启用 flathub 直接在 Fedora 上安装它，如果你使用的是最新版本之一并且为 Fedora 启用了第三方仓库，那么可能会启用该功能。只需在 Gnome Software 中搜索 VSCodium 并单击安装即可。

![Installing the flatpak from Gnome Software][9]

不过，由于某些原因运行旧版本的用户，或者他们可能有一个未启用 flatpak 的分叉，也可以效仿。

安装 Flatpak 并启用 Flathub：Fedora 通常预装了 Flatpak。如果尚未安装，你可以使用以下命令进行安装：

````

     sudo dnf install flatpak

````

要启用 Flathub 仓库，请使用以下命令：

````

     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

````

现在你已经设置了 Flatpak，你可以使用 Flathub 仓库安装 VSCodium。运行以下命令：

````

     flatpak install flathub com.vscodium.codium

````

启动 VSCodium：你可以使用以下命令通过 Flatpak 启动 VSCodium：

````

     flatpak run com.vscodium.codium

````

或者，你也可以在应用菜单中搜索 “VSCodium” 并从那里启动它。

就是这样！ 你现在应该已经使用 Flatpak 在 Fedora 系统上安装并运行了 VSCodium。

要删除它，请使用以下命令：

````

     sudo flatpak uninstall com.vscodium.codium

````

### 下面是底线

如果你使用过 VS Code，那么你不会发现这两个软件之间有任何区别。这只是为了开放和免受微软版本的邪恶遥测的影响。

在 Fedora，我首先安装了 flatpak 版本，但在 Wayland 会话中，VSCodium 没有显示任何窗口装饰（这显然是默认的）。这让我很难用鼠标导航。

![VSCodium flatpak showing no window decorations.][10］

我尝试了一些方法来解决这个问题，但由于 flatpak 配置文件的位置很奇怪，所以没有成功。如果有人有或能找到解决上述问题的办法，请在下面发表评论。不过，使用 rpm 版本倒是天衣无缝（也许怀疑论者对替代软件包管理系统的看法是对的）。

扩展和插件在大部分情况下都没有问题。你也可以按照本教程在企业 Linux 系列的任何发行版（如 Alma Linux、Rocky Linux 等）上安装。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vscodium-fedora/

作者：[Anuj Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lujun9972
[1]: https://code.visualstudio.com/docs/getstarted/telemetry
[2]: https://itsfoss.com/vscodium/
[3]: https://itsfoss.com/content/images/2023/10/codium-on-fedora.png
[4]: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo
[5]: https://vscodium.com/
[6]: https://itsfoss.com/update-fedora/
[7]: https://itsfoss.com/install-rpm-files-fedora/
[8]: https://github.com/VSCodium/vscodium/releases
[9]: https://itsfoss.com/content/images/2023/10/codium-flatpak-fedora.png
[10]: https://itsfoss.com/content/images/2023/10/codium-flatpak-no-decorations.png
