如何在 Linux 上安装设备驱动程序
======

> 学习 Linux 设备驱动如何工作，并知道如何使用它们。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc)

对于一个熟悉 Windows 或者 MacOS 的人，想要切换到 Linux，它们都会面临一个艰巨的问题就是怎么安装和配置设备驱动。这是可以理解的，因为 Windows 和 MacOS 都有一套机制把这个过程做得非常的友好。比如说，当你插入一个新的硬件设备， Windows 能够自动检测并会弹出一个窗口询问你是否要继续驱动程序的安装。你也可以从网络上下载驱动程序，仅仅需要双击解压或者是通过设备管理器导入驱动程序即可。

而这在 Linux 操作系统上并非这么简单。第一个原因是， Linux 是一个开源的操作系统，所以有 [数百种 Linux 发行版的变体][1]。也就是说不可能做一个指南来适应所有的 Linux 发行版。因为每种 Linux 安装驱动程序的过程都有差异。

第二，大多数默认的 Linux 驱动程序也都是开源的，并被集成到了系统中，这使得安装一些并未包含的驱动程序变得非常复杂，即使已经可以检测大多数的硬件设备。第三，不同发行版的许可也有差异。例如，[Fedora 禁止事项][2] 禁止包含专有的、受法律保护，或者是违反美国法律的驱动程序。而 Ubuntu 则让用户[避免使用受法律保护或闭源的硬件设备][3]。

为了更好的学习 Linux 驱动程序是如何工作的，我建议阅读 《Linux 设备驱动程序》一书中的 [设备驱动程序简介][4]。

### 两种方式来寻找驱动程序

#### 1、 用户界面

如果是一个刚从 Windows 或 MacOS 转过来的 Linux 新手，那你会很高兴知道 Linux 也提供了一个通过向导式的程序来查看驱动程序是否可用的方法。 Ubuntu 提供了一个 [附加驱动程序][5] 选项。其它的 Linux 发行版也提供了帮助程序，像 [GNOME 的包管理器][6]，你可以使用它来检查驱动程序是否可用。

#### 2、 命令行

如果你通过漂亮的用户界面没有找到驱动程序，那又该怎么办呢？或许你只能通过没有任何图形界面的 shell？甚至你可以使用控制台来展现你的技能。你有两个选择： 

1. **通过一个仓库**

    这和 MacOS 中的 [homebrew][7] 命令行很像。通过使用 `yum`、 `dnf`、`apt-get` 等等。你基本可以通过添加仓库，并更新包缓存。
2. **下载、编译，然后自己构建**

    这通常包括直接从网络，或通过 `wget` 命令下载源码包，然后运行配置和编译、安装。这超出了本文的范围，但是你可以在网络上找到很多在线指南，如果你选择的是这条路的话。

### 检查是否已经安装了这个驱动程序

在进一步学习安装 Linux 驱动程序之前，让我们来学习几条命令，用来检测驱动程序是否已经在你的系统上可用。

[lspci][8] 命令显示了系统上所有 PCI 总线和设备驱动程序的详细信息。

```
$ lscpci
```

或者使用 `grep`：

```
$ lscpci | grep SOME_DRIVER_KEYWORD
```

例如，你可以使用 `lspci | grep SAMSUNG` 命令，如果你想知道是否安装过三星的驱动。

[dmesg][9] 命令显示了所有内核识别的驱动程序。

```
$ dmesg
```

或配合 `grep` 使用：

```
$ dmesg | grep SOME_DRIVER_KEYWORD
```

任何识别到的驱动程序都会显示在结果中。

如果通过 `dmesg` 或者 `lscpi` 命令没有识别到任何驱动程序，尝试下这两个命令，看看驱动程序至少是否加载到硬盘。

```
$ /sbin/lsmod
```

和

```
$ find /lib/modules
```

技巧：和 `lspci` 或 `dmesg` 一样，通过在上面的命令后面加上 `| grep` 来过滤结果。

如果一个驱动程序已经被识别到了，但是通过 `lscpi` 或 `dmesg` 并没有找到，这意味着驱动程序已经存在于硬盘上，但是并没有加载到内核中，这种情况，你可以通过 `modprobe` 命令来加载这个模块。

```
$ sudo modprobe MODULE_NAME
```

使用 `sudo` 来运行这个命令，因为这个模块要使用 root 权限来安装。

### 添加仓库并安装

可以通过 `yum`、`dnf` 和 `apt-get` 几种不同的方式来添加一个仓库；一个个介绍完它们并不在本文的范围。简单一点来说，这个示例将会使用 `apt-get` ，但是这个命令和其它的几个都是很类似的。

#### 1、删除存在的仓库，如果它存在

```
$ sudo apt-get purge NAME_OF_DRIVER*
```

其中 `NAME_OF_DRIVER` 是你的驱动程序的可能的名称。你还可以将模式匹配加到正则表达式中来进一步过滤。

#### 2、将仓库加入到仓库表中，这应该在驱动程序指南中有指定

```
$ sudo add-apt-repository REPOLIST_OF_DRIVER
```

其中 `REPOLIST_OF_DRIVER` 应该从驱动文档中有指定（例如：`epel-list`）。

#### 3、更新仓库列表

```
$ sudo apt-get update
```

#### 4、安装驱动程序

```
$ sudo apt-get install NAME_OF_DRIVER
```

#### 5、检查安装状态

像上面说的一样，通过 `lscpi` 命令来检查驱动程序是否已经安装成功。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/how-install-device-driver-linux

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[Jamskr](https://github.com/Jamskr)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/List_of_Linux_distributions
[2]: https://fedoraproject.org/wiki/Forbidden_items?rd=ForbiddenItems
[3]: https://www.ubuntu.com/licensing
[4]: https://www.xml.com/ldd/chapter/book/ch01.html
[5]: https://askubuntu.com/questions/47506/how-do-i-install-additional-drivers
[6]: https://help.gnome.org/users/gnome-packagekit/stable/add-remove.html.en
[7]: https://brew.sh/
[8]: https://en.wikipedia.org/wiki/Lspci
[9]: https://en.wikipedia.org/wiki/Dmesg
