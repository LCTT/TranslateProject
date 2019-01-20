Flatpak 新手指南
======

![](https://www.ostechnix.com/wp-content/uploads/2016/06/flatpak-720x340.jpg)

以前，我们介绍 Ubuntu 推出的 [Snaps][1]。Snaps 是由 Canonical 公司为 Ubuntu 开发的，并随后移植到其他的 Linux 发行版，如 Arch、Gentoo、Fedora 等等。由于一个 snap 包中含有软件的二进制文件和其所需的所有依赖和库，所以可以在无视软件版本、在任意 Linux 发行版上安装软件。和 Snaps 类似，还有一个名为 Flatpak 的工具。也许你已经知道，为不同的 Linux 发行版打包并分发应用是一件多么费时又复杂的工作，因为不同的 Linux 发行版的库不同，库的版本也不同。现在，Flatpak 作为分发桌面应用的新框架可以让开发者完全摆脱这些负担。开发者只需构建一个 Flatpak app 就可以在多种发行版上安装使用。这真是又酷又棒！

用户也完全不用担心库和依赖的问题了，所有的东西都和 app 打包在了一起。更重要的是 Flatpak app 们都自带沙箱，而且与宿主操作系统的其他部分隔离。对了，Flatpak 还有一个很棒的特性，它允许用户在同一个系统中安装同一应用的多个版本，例如 VLC 播放器的 2.1 版、2.2 版、2.3 版。这使开发者测试同一个软件的多个版本变得更加方便。

在本文中，我们将指导你如何在 GNU/Linux 中安装 Flatpak。

### 安装 Flatpak

Flatpak 可以在大多数的主流 Linux 发行版上安装使用，如 Arch Linux、Debian、Fedora、Gentoo、Red Hat、Linux Mint、openSUSE、Solus、Mageia 还有 Ubuntu。

在 Arch Linux 上，使用这一条命令来安装 Flatpak：

```
$ sudo pacman -S flatpak
```

对于 Debian 用户，Flatpak 被收录进 Stretch 或之后版本的默认软件源中。要安装 Flatpak，直接执行：

```
$ sudo apt install flatpak
```

对于 Fedora 用户，Flatpak 是发行版默认安装的软件。你可以直接跳过这一步。

如果因为某种原因没有安装的话，可以执行：

```
$ sudo dnf install flatpak
```

对于 RHEL 7 用户，安装 Flatpak 的命令为：

```
$ sudo yum install flatpak
```

如果你在使用 Linux Mint 18.3，那么 Flatpat 也随系统默认安装，所以跳过这一步。

在 openSUSE Tumbleweed 中，使用 Zypper 包管理来安装 Flatpak：

```
$ sudo zypper install flatpak
```

而 Ubuntu 需要添加下面的软件源再安装 Flatpak，命令如下：

```
$ sudo add-apt-repository ppa:alexlarsson/flatpak
$ sudo apt update
$ sudo apt install flatpak
```

Gnome 提供了一个 Flatpak 插件，安装它就可以使用图形界面来安装 Flatpak app 了。插件的安装命令为：

```
$ sudo apt install gnome-software-plugin-flatpak
```

如果你是用发行版没有在上述的说明里，请你参考官方[安装指南][2]。

### 开始使用 Flatpak

有不少流行应用都支持 Flatpak 安装，如 Gimp、Kdenlive、Steam、Spotify、Visual Sudio Code 等。

下面让我来一起学习 flatpak 的基本操作命令。

首先，我们需要添加远程仓库。

#### 添加软件仓库

**添加 Flathub 仓库：**

Flathub 是一个包含了几乎所有 flatpak 应用的仓库。运行这条命令来启用它：

```
$ sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

对于流行应用来说，Flathub 已经可以满足需求。如果你想试试 GNOME 应用的话，可以添加 GNOME 的仓库。

**添加 GNOME 仓库：**

GNOME 仓库包括了所有的 GNOME 核心应用，它提供了两种版本：<ruby>稳定版<rt>stable</rt></ruby>和<strong><ruby>每日构建版<rt>nightly</rt></ruby></strong>。

使用下面的命令来添加 GNOME 稳定版仓库：

```
$ wget https://sdk.gnome.org/keys/gnome-sdk.gpg
$ sudo flatpak remote-add --gpg-import=gnome-sdk.gpg --if-not-exists gnome-apps https://sdk.gnome.org/repo-apps/
```

需要注意的是，GNOME 稳定版仓库中的应用需要 **3.20 版本的 org.gnome.Platform 运行时环境**。

安装稳定版运行时环境，请执行：

```
$ sudo flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/
```

如果想使用每日构建版的 GNOME 仓库，使用如下的命令：

```
$ wget https://sdk.gnome.org/nightly/keys/nightly.gpg
$ sudo flatpak remote-add --gpg-import=nightly.gpg --if-not-exists gnome-nightly-apps https://sdk.gnome.org/nightly/repo-apps/
```

同样，每日构建版的 GNOME 仓库也需要 **org.gnome.Platform 运行时环境的每日构建版本**。

执行下面的命令安装每日构建版的运行时环境：

```
$ sudo flatpak remote-add --gpg-import=nightly.gpg gnome-nightly https://sdk.gnome.org/nightly/repo/
```

#### 查看软件仓库

要查看已经添加的软件仓库，执行下面的命令：

```
$ flatpak remotes
Name Options
flathub system
gnome system
gnome-apps system
gnome-nightly system
gnome-nightly-apps system
```

如你所见，上述命令会列出你添加到系统中的软件仓库。此外，执行结果还表明了软件仓库的配置是<ruby>用户级<rt>per-user</rt></ruby>还是<ruby>系统级<rt>system-wide</rt></ruby>。

#### 删除软件仓库

要删除软件仓库，例如 flathub，用这条命令：

```
$ sudo flatpak remote-delete flathub
```

这里的 flathub 是软件仓库的名字。

#### 安装 Flatpak 应用

这一节，我们将学习如何安装 flatpak 应用。

要安装一个应用，只要一条命令就能完成：

```
$ sudo flatpak install flathub com.spotify.Client
```

所有的稳定版 GNOME 软件仓库中的应用，都使用“stable”作为版本名。

例如，想从稳定版 GNOME 软件仓库中安装稳定版 Evince，就执行：

```
$ sudo flatpak install gnome-apps org.gnome.Evince stable
```

所有的每日构建版 GNOME 仓库中的应用，都使用“master”作为版本名。

例如，要从每日构建版 GNOME 软件仓库中安装 gedit 的每次构建版本，就执行：

```
$ sudo flatpak install gnome-nightly-apps org.gnome.gedit master
```

如果不希望应用安装在<ruby>系统级<rt>system-wide</rt></ruby>，而只安装在<ruby>用户级<rt>per-user</rt></ruby>，那么你可以这样安装软件：

```
$ flatpak install --user <name-of-app>
```

所有的应用都会被存储在 `$HOME/.var/app/` 目录下.

```
$ ls $HOME/.var/app/
com.spotify.Client
```

#### 执行 Flatpak 应用

你可以直接使用<ruby>应用启动器<rt>application launcher</rt></ruby>来运行已安装的 Flatpak 应用。如果你想从命令行启动的话，以 Spotify 为例，执行下面的命令：

```
$ flatpak run com.spotify.Client
```

#### 列出已安装的 Flatpak 应用

要查看已安装的应用程序和运行时环境，执行：

```
$ flatpak list
```

想只查看已安装的应用，那就用这条命令：

```
$ flatpak list --app
```

如果想查询已添加的软件仓库中的可安装程序和可安装的运行时环境，使用命令：

```
$ flatpak remote-ls
```

只列出可安装的应用程序的命令是：

```
$ flatpak remote-ls --app
```

查询指定远程仓库中的所有可安装的应用程序和运行时环境，这里以 gnome-apps 为例，执行命令：

```
$ flatpak remote-ls gnome-apps
```

只列出可安装的应用程序，这里以 flathub 为例：

```
$ flatpak remote-ls flathub --app
```

#### 更新应用程序

更新所有的 Flatpak 应用程序，执行：

```
$ flatpak update
```

更新指定的 Flatpak 应用程序，执行：

```
$ flatpak update com.spotify.Client
```

#### 获取应用详情

执行下面的命令来查看已安装应用程序的详细信息：

```
$ flatpak info io.github.mmstick.FontFinder
```

输出样例：

```
Ref: app/io.github.mmstick.FontFinder/x86_64/stable
ID: io.github.mmstick.FontFinder
Arch: x86_64
Branch: stable
Origin: flathub
Date: 2018-04-11 15:10:31 +0000
Subject: Workaround appstream issues (391ef7f5)
Commit: 07164e84148c9fc8b0a2a263c8a468a5355b89061b43e32d95008fc5dc4988f4
Parent: dbff9150fce9fdfbc53d27e82965010805f16491ec7aa1aa76bf24ec1882d683
Location: /var/lib/flatpak/app/io.github.mmstick.FontFinder/x86_64/stable/07164e84148c9fc8b0a2a263c8a468a5355b89061b43e32d95008fc5dc4988f4
Installed size: 2.5 MB
Runtime: org.gnome.Platform/x86_64/3.28
```

#### 删除应用程序

要删除一个 Flatpak 应用程序，这里以 spotify 为例，执行：

```
$ sudo flatpak uninstall com.spotify.Client
```

如果你需要更多信息，可以参考 Flatpak 的帮助。

```
$ flatpak --help
```

到此，希望你对 Flatpak 有了一些基础了解。

如果你觉得这篇指南有些帮助，请在你的社交媒体上分享它来支持我们。

稍后还有更多精彩内容，敬请期待~


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wwhio](https://github.com/wwhio)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/introduction-ubuntus-snap-packages/
[2]:https://flatpak.org/setup/
