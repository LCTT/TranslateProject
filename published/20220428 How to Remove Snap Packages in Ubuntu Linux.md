[#]: subject: "How to Remove Snap Packages in Ubuntu Linux"
[#]: via: "https://www.debugpoint.com/2022/04/remove-snap-ubuntu/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "turbokernel, wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14567-1.html"

怎样在 Ubuntu Linux 中移除 Snap 软件包
======

![](https://img.linux.net.cn/data/attachment/album/202205/09/103449pfqp2yp2rpzgp92l.jpg)

> 这是一篇关于在 Ubuntu Linux 系统中如何删除 Snap，以得到一个无 Snap 系统的教程。

由 Canonical 开发的 Snap 软件包在一些场景下是有益的。它为终端用户直接提供了轻便且快速的程序更新。不仅如此，它还有其他的好处，比如它打包了所有依赖包，并允许安装同一个应用的多个版本。此外，它运行在沙盒模式，提供了安全和其他方面的好处。

在这些好处中， Snap 技术也有一些地方备受争论。举个例子，几乎所有使用 Snap 软件包的用户都说它的性能较差，包括它的启动时间要比本地 deb 或者 RPM 软件包时间要长。另外，由于它的设计，程序安装的体积巨大，浪费磁盘空间，因为它打包了所有用到的依赖包。

不仅如此，由于沙盒的天然属性，Snap 程序可能无法访问你的 Linux 桌面的几个部分，除非提供了适当的权限。

这个指南阐述了你如何从 Ubuntu 系统中完全移除 Snap。

这些步骤在 [Ubuntu 22.04 LTS Jammy Jellyfish][1] 中进行了测试。然而，它应该也适用于所有的 Ubuntu 系统版本。

> **警告：这些步骤将会移除 Ubuntu 系统中两个关键的程序：软件商店和 Firefox。尝试这些步骤之前确认你已经对书签和 Firefox 的其它设置做了备份。**

### 在 Ubuntu Linux 移除 Snap 软件包

1、在你的系统中打开一个终端，使用以下命令查看已经安装的 Snap 软件包的列表。它显示了 Snap 软件包，比如 Firefox，软件商店，主题以及其它默认已经安装的核心软件包。

```
snap list
```

![ Ubuntu Snap 包列表][2]

2、按照以下的顺序移除 Snap 软件包。首先移除 Firefox。然后是软件商店，和用以上命令看到的你的系统中的其它软件包。

```
sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-3-38-2004
```

```
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core20
sudo snap remove --purge snapd
```

3、最后，通过 `apt` 命令移除 Snap 服务。

```
sudo apt remove --autoremove snapd
```

![移除 Snap 包和其它][3]

这还没完，即使你用以上命令移除了 Snap 软件包，但是如果你没有关闭 apt 触发器，`sudo apt update` 命令会再一次将 Snap 安装回来。

4、所以，要关闭它，我们需要在 `/etc/apt/preferences.d/` 目录下创建一个 apt 设置文件 `nosnap.pref` 来关闭 Snap 服务。

```
sudo gedit /etc/apt/preferences.d/nosnap.pref
```

5、添加以下的命令行，并保存该文件。

```
Package: snapd
Pin: release a=*
Pin-Priority: -10
```

![创建设置文件][4]

如果你知道如何使用它，那么这个 apt 设置文件是一个潜在的工具。举个例子，在以上的状态中，`Pin-Priority -10` 意思就是阻止 Snap 软件包的安装。

与这个教程不相关的，举个例子，如果你想给所有发行版代号为 “bulleye” 的软件包超高优先权的话，那么就可以查看这些设置文件。如果你想了解更多，你可以访问 [apt 手册页][5]。

```
Package: *
Pin: release n=bullseye
Pin-Priority: 900
```

6、回到我们的主题，一旦你已经保存和关闭以上文件，从终端中再次运行以下命令。 

```
sudo apt update
```

7、最后，从 Ubuntu 中移除 Snap 的步骤全部完成。

### 从 Ubuntu 移除 Snap 后使用 deb 文件安装软件商店和 Firefox 

你已经移除了 Firefox 和软件商店，但是你的工作还需要它们。

要安装 apt 版的 GNOME 软件商店，你可以使用以下命令。确保使用 `--install-suggests` 参数。否则，将会再次安装上 Snap 版本的软件包管理器！

```
sudo apt install --install-suggests gnome-software
```

要安装 Firefox，通过以下命令使用官方 PPA 仓库。

```
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install -t 'o=LP-PPA-mozillateam' firefox
```

![添加 PPA 仓库][7]

![从 PPA 仓库以 deb 文件形式安装 Firefox][8]

一旦你已经安装完 Firefox，使用以下命令开启自动更新。要了解更多，[访问此页][9]。

```
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
```

最后但同样重要，当运行 `apt` 时，为 Firefox 创建另一个设置文件给予以上 PPA 仓库超高优先权。如果你不这么做，`apt update` 命令会再次安装 Snap 版本 Firefox，并把它的“ Snap 朋友们”带回来 😂😂😂。

```
sudo gedit /etc/apt/preferences.d/mozillateamppa
```

最后，添加这些命令行并保存文件。

```
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
```

完成。

### 在 Ubuntu 系统恢复到 Snap 软件包

如果你改变想法，移除该设置文件，并通过以下命令再次启动安装程序。

```
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update && sudo apt upgrade
sudo snap install snap-store
sudo apt install firefox
```

### 总结

关于在 Ubuntu 下移除 Snap 软件包做个总结，我想说的是这些处理 Snap 软件包的方法实属无奈。主要是这对新用户来说很困难。我希望这个指南能帮助你处理好 Snap 软件包。完结撒花。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/remove-snap-ubuntu/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[turbokernel](https://github.com/turbokernel), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Snap-list-in-Ubuntu.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/remove-snap-and-others-1024x544.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/create-a-pref-file.jpg
[5]: https://manpages.ubuntu.com/manpages/focal/man5/apt_preferences.5.html
[6]: https://www.debugpoint.com/2016/07/how-to-install-and-use-snap-packages-in-ubuntu/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Add-the-PPA-1024x550.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Install-Firefox-as-deb-file-from-PPA-1024x548.jpg
[9]: https://www.debugpoint.com/2021/09/remove-firefox-snap-ubuntu/
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint
