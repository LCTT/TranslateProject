如何在 Arch Linux 中降级软件包
=====

![](https://www.ostechnix.com/wp-content/uploads/2016/05/Arch-Linux-720x340.jpg)
正如你了解的，Arch Linux 是一个滚动版本和 DIY（自己动手）发行版。因此，在经常更新时必须小心，特别是从 AUR 等第三方存储库安装或更新软件包。如果你不知道自己在做什么，那么最终很可能会破坏系统。你有责任使 Arch Linux 更加稳定。但是，我们都会犯错误，要时刻小心是很难的。有时候，你想更新到最新的版本，但你可能会被破损的包卡住。不要惊慌！在这种情况下，你可以简单地回滚到旧的稳定包。这个简短的教程描述了如何在 Arch Linux 中以及它的变体，如 Antergos，Manjaro Linux 中降级一个包，

### 在 Arch Linux 中降级一个包

在 Arch Linux 中，有一个名为 **“downgrade”** 的实用程序，可帮助你将安装的软件包降级为任何可用的旧版本。此实用程序将检查你的本地缓存和远程服务器（Arch Linux 仓库）以查找所需软件包的旧版本。你可以从该列表中选择任何一个旧的稳定的软件包并进行安装。

该软件包在官方仓库中不可用，你需要添加非官方的 **archlinuxfr** 仓库。

为此，请编辑 **/etc/pacman.conf** 文件：
```
$ sudo nano /etc/pacman.conf
```

添加以下行：
```
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

保存并关闭文件。

使用以下命令来更新仓库：
```
$ sudo pacman -Sy
```

然后在终端中使用以下命令安装 “Downgrade” 实用程序：
```
$ sudo pacman -S downgrade
```

**示例输出：**
```
resolving dependencies...
 looking for conflicting packages...

Packages (1) downgrade-5.2.3-1

Total Download Size: 0.01 MiB
 Total Installed Size: 0.10 MiB

:: Proceed with installation? [Y/n]

```

“downgrade” 命令的典型用法是：

```
$ sudo downgrade [PACKAGE, ...] [-- [PACMAN OPTIONS]]
```

让我们假设你想要将** opera web 浏览器 **降级到任何可用的旧版本。

为此，运行：
```
$ sudo downgrade opera

```

此命令将从本地缓存和远程镜像列出所有可用的 opera 包（新旧两种版本）。

**示例输出：**
```
Available packages:

 1) opera-37.0.2178.43-1-x86_64.pkg.tar.xz (local)
 2) opera-37.0.2178.43-1-x86_64.pkg.tar.xz (remote)
 3) opera-37.0.2178.32-1-x86_64.pkg.tar.xz (remote)
 4) opera-36.0.2130.65-2-x86_64.pkg.tar.xz (remote)
 5) opera-36.0.2130.65-1-x86_64.pkg.tar.xz (remote)
 6) opera-36.0.2130.46-2-x86_64.pkg.tar.xz (remote)
 7) opera-36.0.2130.46-1-x86_64.pkg.tar.xz (remote)
 8) opera-36.0.2130.32-2-x86_64.pkg.tar.xz (remote)
 9) opera-36.0.2130.32-1-x86_64.pkg.tar.xz (remote)
 10) opera-35.0.2066.92-1-x86_64.pkg.tar.xz (remote)
 11) opera-35.0.2066.82-1-x86_64.pkg.tar.xz (remote)
 12) opera-35.0.2066.68-1-x86_64.pkg.tar.xz (remote)
 13) opera-35.0.2066.37-2-x86_64.pkg.tar.xz (remote)
 14) opera-34.0.2036.50-1-x86_64.pkg.tar.xz (remote)
 15) opera-34.0.2036.47-1-x86_64.pkg.tar.xz (remote)
 16) opera-34.0.2036.25-1-x86_64.pkg.tar.xz (remote)
 17) opera-33.0.1990.115-2-x86_64.pkg.tar.xz (remote)
 18) opera-33.0.1990.115-1-x86_64.pkg.tar.xz (remote)
 19) opera-33.0.1990.58-1-x86_64.pkg.tar.xz (remote)
 20) opera-32.0.1948.69-1-x86_64.pkg.tar.xz (remote)
 21) opera-32.0.1948.25-1-x86_64.pkg.tar.xz (remote)
 22) opera-31.0.1889.174-1-x86_64.pkg.tar.xz (remote)
 23) opera-31.0.1889.99-1-x86_64.pkg.tar.xz (remote)
 24) opera-30.0.1835.125-1-x86_64.pkg.tar.xz (remote)
 25) opera-30.0.1835.88-1-x86_64.pkg.tar.xz (remote)
 26) opera-30.0.1835.59-1-x86_64.pkg.tar.xz (remote)
 27) opera-30.0.1835.52-1-x86_64.pkg.tar.xz (remote)
 28) opera-29.0.1795.60-1-x86_64.pkg.tar.xz (remote)
 29) opera-29.0.1795.47-1-x86_64.pkg.tar.xz (remote)
 30) opera-28.0.1750.51-1-x86_64.pkg.tar.xz (remote)
 31) opera-28.0.1750.48-1-x86_64.pkg.tar.xz (remote)
 32) opera-28.0.1750.40-1-x86_64.pkg.tar.xz (remote)
 33) opera-27.0.1689.76-1-x86_64.pkg.tar.xz (remote)
 34) opera-27.0.1689.69-1-x86_64.pkg.tar.xz (remote)
 35) opera-27.0.1689.66-1-x86_64.pkg.tar.xz (remote)
 36) opera-27.0.1689.54-2-x86_64.pkg.tar.xz (remote)
 37) opera-27.0.1689.54-1-x86_64.pkg.tar.xz (remote)
 38) opera-26.0.1656.60-1-x86_64.pkg.tar.xz (remote)
 39) opera-26.0.1656.32-1-x86_64.pkg.tar.xz (remote)
 40) opera-12.16.1860-2-x86_64.pkg.tar.xz (remote)
 41) opera-12.16.1860-1-x86_64.pkg.tar.xz (remote)

select a package by number:

```

只需输入你选择的包号码，然后按回车即可安装。

就这样。当前安装的软件包将被降级为旧版本。

**另外阅读：[在 Arch Linux 中如何将所有软件包降级到特定日期][1]**

##### 那么，如何避免已损坏的软件包并使 Arch Linux 更加稳定？

在更新 Arch Linux 之前查看[** Arch Linux 新闻**][2]和[**论坛**][3]，看看是否有任何已报告的问题。过去几周我一直在使用 Arch Linux 作为我的主要操作系统，以下是我在这段时间内发现的一些简单提示，以避免在 Arch Linux 中安装不稳定的软件包。

  1. 避免部分升级。这意味着永远不会运行 “pacman -Sy <软件包名称>”。此命令将在安装软件包时部分升级你的系统。相反，优先使用 “pacman -Syu” 来更新系统，然后使用 “package -S <软件包名称>” 安装软件包。
  2. 避免使用 “pacman -Syu -force” 命令。-force 标志将忽略程序包和文件冲突，并且可能会以破损的程序包或损坏的系统结束。
  3. 不要跳过依赖性检查。这意味着不要使用 “pacman -Rdd <软件包名称>”。此命令将在删除软件包时避免依赖性检查。如果你运行这个命令，另一个重要的包所需的关键依赖也可以被删除。最终，它会损坏你的 Arch Linux。
  4. 定期备份重要数据和配置文件以避免数据丢失总是一个好习惯。
  5. 安装第三方软件包和 AUR 等非官方软件包时要小心。不要安装那些正在经历重大发展的软件包。

有关更多详细信息，请查看[** Arch Linux维护指南**][4]。

我不是 Arch Linux 专家，我仍然在学习如何使它更稳定。如果你有任何技巧让 Arch Linux 保持稳定和安全，请在下面的评论部分保持稳定和安全告诉我，我将洗耳恭听。

希望这可以有帮助。目前为止这就是全部了。我很快会再次在这里与另一篇有趣的文章。在此之前，请继续关注 OSTechNix。

干杯！


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/downgrade-package-arch-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/downgrade-packages-specific-date-arch-linux/
[2]:https://www.archlinux.org/news/
[3]:https://bbs.archlinux.org/
[4]:https://wiki.archlinux.org/index.php/System_maintenance
