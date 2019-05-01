[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10751-1.html)
[#]: subject: (How To Install And Enable Flatpak Support On Linux?)
[#]: via: (https://www.2daygeek.com/how-to-install-and-enable-flatpak-support-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 上安装并启用 Flatpak 支持？
======

目前，我们都在使用 Linux 发行版的官方软件包管理器来安装所需的软件包。

在 Linux 中，它做得很好，没有任何问题。（它不打折扣地很好的完成了它应该做的工作）

但在一些方面它也有一些限制，所以会让我们考虑其他替代解决方案来解决。

是的，默认情况下，我们不能从发行版官方软件包管理器获取到最新版本的软件包，因为这些软件包是在构建当前 OS 版本时构建的。它们只会提供安全更新，直到下一个主要版本发布。

那么，这种情况有什么解决办法吗？是的，我们有多种解决方案，而且我们大多数人已经开始使用其中的一些了。

有些什么呢，它们有什么好处？

  * **对于基于 Ubuntu 的系统：** PPA
  * **对于基于 RHEL 的系统：** [EPEL 仓库][1]、[ELRepo 仓库][2]、[nux-dextop 仓库][3]、[IUS 社区仓库][4]、[RPMfusion 仓库][5] 和 [Remi 仓库][6]

使用上面的仓库，我们将获得最新的软件包。这些软件包通常都得到了很好的维护，还有大多数社区的推荐。但这些只是建议，可能并不总是安全的。

近年来，出现了一下通用软件包封装格式，并且得到了广泛的应用。

  * Flatpak：它是独立于发行版的包格式，主要贡献者是 Fedora 项目团队。大多数主要的 Linux 发行版都采用了 Flatpak 框架。
  * Snaps：Snappy 是一种通用的软件包封装格式，最初由 Canonical 为 Ubuntu 手机及其操作系统设计和构建的。后来，更多的发行版都接纳了它。
  * AppImage：AppImage 是一种可移植的包格式，可以在不安装和不需要 root 权限的情况下运行。

我们之前已经介绍过 [Snap 包管理器和包封装格式][7]。今天我们将讨论 Flatpak 包封装格式。

### 什么是 Flatpak？

Flatpak（以前称为 X Desktop Group 或 xdg-app）是一个软件实用程序。它提供了一种通用的包封装格式，可以在任何 Linux 发行版中使用。

它提供了一个沙箱（隔离的）环境来运行应用程序，不会影响其他应用程序和发行版核心软件包。我们还可以安装并运行不同版本的软件包。

Flatpak 的一个缺点是不像 Snap 和 AppImage 那样支持服务器操作系统，它只在少数桌面环境下工作。

比如说，如果你想在系统上运行两个版本的 php，那么你可以轻松安装并按照你的意愿运行。

这就是现在通用包封装格式非常有名的地方。

### 如何在 Linux 中安装 Flatpak？

大多数 Linux 发行版官方仓库都提供 Flatpak 软件包。因此，可以使用它们来进行安装。

对于 Fedora 系统，使用 [DNF 命令][8] 来安装 flatpak。

```
$ sudo dnf install flatpak
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][9] 或 [APT 命令][10] 来安装 flatpak。

```
$ sudo apt install flatpak
```

对于较旧的 Ubuntu 版本：

```
$ sudo add-apt-repository ppa:alexlarsson/flatpak
$ sudo apt update
$ sudo apt install flatpak
```

对于基于 Arch Linux 的系统，使用 [Pacman 命令][11] 来安装 flatpak。

```
$ sudo pacman -S flatpak
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][12] 来安装 flatpak。

```
$ sudo yum install flatpak
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][13] 来安装 flatpak。

```
$ sudo zypper install flatpak
```

### 如何在 Linux 上启用 Flathub 支持？

Flathub 网站是一个应用程序商店，你可以在其中找到 flatpak 软件包。它是一个中央仓库，所有的 flatpak 应用程序都可供用户使用。

运行以下命令在 Linux 上启用 Flathub 支持：

```
$ sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

为 GNOME 桌面环境安装 Software Flatpak 插件。

```
$ sudo apt install gnome-software-plugin-flatpak
```

此外，如果你使用的是 GNOME 桌面环境，则可以启用 GNOME 仓库。它包含所有 GNOME 核心应用程序。

```
$ wget https://sdk.gnome.org/keys/gnome-sdk.gpg
$ sudo flatpak remote-add --gpg-import=gnome-sdk.gpg --if-not-exists gnome-apps https://sdk.gnome.org/repo-apps/
```

### 如何列出已配置的 flakpak 仓库？

如果要查看系统上已配置的 flatpak 仓库列表，运行以下命令：

```
$ flatpak remotes
Name       Options
flathub    system
gnome-apps system
```

### 如何列出已配置仓库中的可用软件包？

如果要查看已配置仓库中的可用软件包的列表（它将显示所有软件包，如应用程序和运行环境），运行以下命令：

```
$ flatpak remote-ls | head -10

org.freedesktop.GlxInfo gnome-apps
org.gnome.Books gnome-apps
org.gnome.Builder   gnome-apps
org.gnome.Calculator    gnome-apps
org.gnome.Calendar  gnome-apps
org.gnome.Characters    gnome-apps
org.gnome.Devhelp   gnome-apps
org.gnome.Dictionary    gnome-apps
org.gnome.Documents gnome-apps
org.gnome.Epiphany  gnome-apps
```

仅列出应用程序：

```
$ flatpak remote-ls --app
```

列出特定的仓库应用程序：

```
$ flatpak remote-ls gnome-apps
```

### 如何从 flatpak 安装包？

运行以下命令从 flatpak 仓库安装软件包：

```
$ sudo flatpak install flathub com.github.muriloventuroso.easyssh

Required runtime for com.github.muriloventuroso.easyssh/x86_64/stable (runtime/org.gnome.Platform/x86_64/3.30) found in remote flathub
Do you want to install it? [y/n]: y
Installing in system:
org.gnome.Platform/x86_64/3.30                          flathub 4e93789f42ac
org.gnome.Platform.Locale/x86_64/3.30                   flathub 6abf9c0e2b72
org.freedesktop.Platform.html5-codecs/x86_64/18.08      flathub d6abde36c0be
com.github.muriloventuroso.easyssh/x86_64/stable        flathub 337db43043d2
  permissions: ipc, network, wayland, x11, dri
  file access: home, xdg-run/dconf, ~/.config/dconf:ro
  dbus access: ca.desrt.dconf
com.github.muriloventuroso.easyssh.Locale/x86_64/stable flathub af837356b222
Is this ok [y/n]: y
Installing: org.gnome.Platform/x86_64/3.30 from flathub
[####################] 1 metadata, 14908 content objects fetched; 228018 KiB transferred in 364 seconds
Now at 4e93789f42ac.
Installing: org.gnome.Platform.Locale/x86_64/3.30 from flathub
[####################] 4 metadata, 1 content objects fetched; 16 KiB transferred in 2 seconds
Now at 6abf9c0e2b72.
Installing: org.freedesktop.Platform.html5-codecs/x86_64/18.08 from flathub
[####################] 26 metadata, 131 content objects fetched; 2737 KiB transferred in 8 seconds
Now at d6abde36c0be.
Installing: com.github.muriloventuroso.easyssh/x86_64/stable from flathub
[####################] 191 metadata, 3633 content objects fetched; 24857 KiB transferred in 117 seconds
Now at 337db43043d2.
Installing: com.github.muriloventuroso.easyssh.Locale/x86_64/stable from flathub
[####################] 3 metadata, 1 content objects fetched; 14 KiB transferred in 2 seconds
Now at af837356b222.
```

所有已安装的应用程序都将放在以下位置：

```
$ ls /var/lib/flatpak/app/
com.github.muriloventuroso.easyssh
```

### 如何运行已安装的应用程序？

运行以下命令以启动所需的应用程序，确保替换为你的应用程序名称：

```
$ flatpak run com.github.muriloventuroso.easyssh
```

### 如何查看已安装的应用程序？

运行以下命令来查看已安装的应用程序：

```
$ flatpak list
Ref                                                Options
com.github.muriloventuroso.easyssh/x86_64/stable   system,current
org.freedesktop.Platform.html5-codecs/x86_64/18.08 system,runtime
org.gnome.Platform/x86_64/3.30                     system,runtime
```

### 如何查看有关已安装应用程序的详细信息？

运行以下命令以查看有关已安装应用程序的详细信息：

```
$ flatpak info com.github.muriloventuroso.easyssh

Ref: app/com.github.muriloventuroso.easyssh/x86_64/stable
ID: com.github.muriloventuroso.easyssh
Arch: x86_64
Branch: stable
Origin: flathub
Collection ID: org.flathub.Stable
Date: 2019-01-08 13:36:32 +0000
Subject: Update com.github.muriloventuroso.easyssh.json (cd35819c)
Commit: 337db43043d282c74d14a9caecdc780464b5e526b4626215d534d38b0935049f
Parent: 6e49096146f675db6ecc0ce7c5347b4b4f049b21d83a6cc4d01ff3f27c707cb6
Location: /var/lib/flatpak/app/com.github.muriloventuroso.easyssh/x86_64/stable/337db43043d282c74d14a9caecdc780464b5e526b4626215d534d38b0935049f
Installed size: 100.0 MB
Runtime: org.gnome.Platform/x86_64/3.30
Sdk: org.gnome.Sdk/x86_64/3.30
```

### 如何更新已安装的应用程序？

运行以下命令将已安装的应用程序更新到最新版本：

```
$ flatpak update
```

对于特定应用程序，使用以下格式：

```
$ flatpak update com.github.muriloventuroso.easyssh
```

### 如何移除已安装的应用程序？

运行以下命令来移除已安装的应用程序：

```
$ sudo flatpak uninstall com.github.muriloventuroso.easyssh
```

进入 man 页面以获取更多细节和选项：

```
$ flatpak --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-and-enable-flatpak-support-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]: https://www.2daygeek.com/install-enable-elrepo-on-rhel-centos-scientific-linux/
[3]: https://www.2daygeek.com/install-enable-nux-dextop-repository-on-centos-rhel-scientific-linux/
[4]: https://www.2daygeek.com/install-enable-ius-community-repository-on-rhel-centos/
[5]: https://www.2daygeek.com/install-enable-rpm-fusion-repository-on-centos-fedora-rhel/
[6]: https://www.2daygeek.com/install-enable-remi-repository-on-centos-rhel-fedora/
[7]: https://www.2daygeek.com/linux-snap-package-manager-ubuntu/
[8]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[9]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[10]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[11]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[12]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[13]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
