LFCS 系列第十三讲：如何配置并排除 GNU 引导加载程序（GRUB）故障
=====================================================================================

由于 LFCS 考试需求的变动已于 2016 年 2 月 2 日生效，因此我们向 [LFCS 系列][1] 添加了一些必要的话题。为了准备认证考试，我们也强烈推荐你去看看 [LFCE 系列][2]。

![](http://www.tecmint.com/wp-content/uploads/2016/03/Configure-Troubleshoot-Grub-Boot-Loader.png)

*LFCS 系列第十三讲：配置并排除 Grub 引导加载程序故障。*

本文将会向你介绍 GRUB 的知识，并会说明你为什么需要一个引导加载程序，以及它是如何给系统增加功能的。

[Linux 引导过程][3] 是从你按下你的电脑电源键开始，直到你拥有一个全功能的系统为止，整个过程遵循着这样的主要步骤：

* 1. 一个叫做 **POST**（**上电自检**）的过程会对你的电脑硬件组件做全面的检查。
* 2. 当 **POST** 完成后，它会把控制权转交给引导加载程序，接下来引导加载程序会将 Linux 内核（以及 **initramfs**）加载到内存中并执行。
* 3. 内核首先检查并访问硬件，然后运行初始化进程（主要以它的通用名 **init** 而为人熟知），接下来初始化进程会启动一些服务，最后完成系统启动过程。

在该系列的第七讲（“[SysVinit、Upstart 和 Systemd][4]”）中，我们介绍了现代 Linux 发行版使用的一些服务管理系统和工具。在继续学习之前，你可能想要回顾一下那一讲的知识。

### GRUB 引导装载程序介绍

在现代系统中，你会发现有两种主要的 **GRUB** 版本（一种是有时被称为 **GRUB Legacy** 的 **v1** 版本，另一种则是 **v2** 版本），虽说多数最新版本的发行版系统都默认使用了 **v2** 版本。如今，只有 **红帽企业版 Linux 6** 及其衍生系统仍在使用 **v1** 版本。

因此，在本指南中，我们将着重关注 **v2** 版本的功能。

不管 **GRUB** 的版本是什么，一个引导加载程序都允许用户：

1. 通过指定使用不同的内核来修改系统的行为；
2. 从多个操作系统中选择一个启动；
3. 添加或编辑配置区块来改变启动选项等。

如今，**GNU** 项目负责维护 **GRUB**，并在它们的网站上提供了丰富的文档。当你在阅读这篇指南时，我们强烈建议你看下 [GNU 官方文档][6]。

当系统引导时，你会在主控制台看到如下的 **GRUB** 画面。最开始，你可以根据提示在多个内核版本中选择一个内核（默认情况下，系统将会使用最新的内核启动），并且可以进入 **GRUB** 命令行模式（使用 `c` 键），或者编辑启动项（按下 `e` 键）。

![](http://www.tecmint.com/wp-content/uploads/2016/03/GRUB-Boot-Screen.png)

*GRUB 启动画面*

你会考虑使用一个旧版内核启动的原因之一是之前工作正常的某个硬件设备在一次升级后出现了“怪毛病（acting up）”（例如，你可以参考 AskUbuntu 论坛中的[这条链接][7]）。

在启动时会从 `/boot/grub/grub.cfg` 或 `/boot/grub2/grub.cfg` 文件中读取**GRUB v2** 的配置文件，而 **GRUB v1** 使用的配置文件则来自 `/boot/grub/grub.conf` 或 `/boot/grub/menu.lst`。这些文件**不应该**直接手动编辑，而应通过 `/etc/default/grub` 的内容和 `/etc/grub.d` 目录中的文件来更新。

在 **CentOS 7** 上，当系统最初完成安装后，会生成如下的配置文件：

```
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="vconsole.keymap=la-latin1 rd.lvm.lv=centos_centos7-2/swap crashkernel=auto  vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos_centos7-2/root rhgb quiet"
GRUB_DISABLE_RECOVERY="true"
```

除了在线文档外，你也可以使用下面的命令查阅 GNU GRUB 手册：

```
# info grub
```

如果你对 `/etc/default/grub` 文件中的可用选项特别感兴趣的话，你可以直接查阅配置一节的帮助文档：

```
# info -f grub -n 'Simple configuration'
```

使用上述命令，你会发现 `GRUB_TIMEOUT` 用于设置启动画面出现和系统自动开始启动（除非被用户中断）之间的时间。当该变量值为 `-1` 时，除非用户主动做出选择，否则不会开始启动。

当同一台机器上安装了多个操作系统或内核后，`GRUB_DEFAULT` 就需要用一个整数来指定 GRUB 启动画面默认选择启动的操作系统或内核条目。我们既可以通过上述启动画面查看启动条目列表，也可以使用下面的命令：

### 在 CentOS 和 openSUSE 系统上

```
# awk -F\' '$1=="menuentry " {print $2}' /boot/grub2/grub.cfg
```

### 在 Ubuntu 系统上

```
# awk -F\' '$1=="menuentry " {print $2}' /boot/grub/grub.cfg
```

如下图所示的例子中，如果我们想要使用版本为 `3.10.0-123.el7.x86_64` 的内核（第四个条目），我们需要将 `GRUB_DEFAULT` 设置为 `3`（条目从零开始编号），如下所示：

```
GRUB_DEFAULT=3
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Boot-System-with-Old-Kernel-Version.png)

*使用旧版内核启动系统*

最后一个需要特别关注的 GRUB 配置变量是 `GRUB_CMDLINE_LINUX`，它是用来给内核传递选项的。我们可以在 [内核变量文件][8] 和 [`man 7 bootparam`][9] 中找到能够通过 GRUB 传递给内核的选项的详细文档。

我的 **CentOS 7** 服务器上当前的选项是：

```
GRUB_CMDLINE_LINUX="vconsole.keymap=la-latin1 rd.lvm.lv=centos_centos7-2/swap crashkernel=auto  vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos_centos7-2/root rhgb quiet"
```

为什么你希望修改默认的内核参数或者传递额外的选项呢？简单来说，在很多情况下，你需要告诉内核某些由内核自身无法判断的硬件参数，或者是覆盖一些内核检测的值。

不久之前，就在我身上发生过这样的事情，当时我在自己已用了 10 年的老笔记本上尝试了衍生自 **Slackware** 的 **Vector Linux**。完成安装后，内核并没有检测出我的显卡的正确配置，所以我不得不通过 GRUB 传递修改过的内核选项来让它工作。

另外一个例子是当你需要将系统切换到单用户模式以执行维护工作时。为此，你可以直接在 `GRUB_CMDLINE_LINUX` 变量中直接追加 `single` 并重启即可：

```
GRUB_CMDLINE_LINUX="vconsole.keymap=la-latin1 rd.lvm.lv=centos_centos7-2/swap crashkernel=auto  vconsole.font=latarcyrheb-sun16 rd.lvm.lv=centos_centos7-2/root rhgb quiet single"
```

编辑完 `/etc/default/grub` 之后，你需要运行 `update-grub` （在 Ubuntu 上）或者 `grub2-mkconfig -o /boot/grub2/grub.cfg` （在 **CentOS** 和 **openSUSE** 上）命令来更新 `grub.cfg` 文件（否则，改动会在系统启动时丢失）。

这条命令会处理早先提到的那些启动配置文件来更新 `grub.cfg` 文件。这种方法可以确保改动持久化，而在启动时刻通过 GRUB 传递的选项仅在当前会话期间有效。

### 修复 Linux GRUB 问题

如果你安装了第二个操作系统，或者由于人为失误而导致你的 GRUB 配置文件损坏了，依然有一些方法可以让你恢复并能够再次启动系统。

在启动画面中按下 `c` 键进入 GRUB 命令行模式（记住，你也可以按下 `e` 键编辑默认启动选项），并可以在 GRUB 提示中输入 `help` 命令获得可用命令：

![](http://www.tecmint.com/wp-content/uploads/2016/03/Fix-Grub-Issues-in-Linux.png)

*修复 Linux 的 Grub 配置问题*

我们将会着重关注 **ls** 命令，它会列出已安装的设备和文件系统，并且我们将会看看它查找到的东西。在下面的图片中，我们可以看到有 4 块硬盘（`hd0` 到 `hd3`）。

貌似只有 `hd0` 已经分区了（msdos1 和 msdos2 可以证明，这里的 1 和 2 是分区号，msdos 则是分区方案）。

现在我们来看看能否在第一个分区 `hd0`（**msdos1**）上找到 GRUB。这种方法允许我们启动 Linux，并且使用高级工具修复配置文件，或者如果有必要的话，干脆重新安装 GRUB：

```
# ls (hd0,msdos1)/
```

从高亮区域可以发现，`grub2` 目录就在这个分区：

![](http://www.tecmint.com/wp-content/uploads/2016/03/Find-Grub-Configuration.png)

*查找 Grub 配置*
 
一旦我们确信了 GRUB 位于 (**hd0, msdos1**)，那就让我们告诉  GRUB 该去哪儿查找它的配置文件并指示它去尝试启动它的菜单：

```
set prefix=(hd0,msdos1)/grub2
set root=(hd0,msdos1)
insmod normal
normal
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Find-and-Launch-Grub-Menu.png)

*查找并启动 Grub 菜单*

然后，在 GRUB 菜单中，选择一个条目并按下回车键以使用它启动。一旦系统成功启动后，你就可以运行 `grub2-install /dev/sdX` 命令修复问题了（将 `sdX` 改成你想要安装 GRUB 的设备）。然后启动信息将会更新，并且所有相关文件都会得到恢复。

```
# grub2-install /dev/sdX
```

其它更加复杂的情景及其修复建议都记录在 [Ubuntu GRUB2 故障排除指南][10] 中。该指南中阐述的概念对于其它发行版也是有效的。

### 总结

本文向你介绍了 GRUB，并指导你可以在何处找到线上和线下的文档，同时说明了如何面对由于引导加载相关的问题而导致系统无法正常启动的情况。

幸运的是，GRUB 是文档支持非常丰富的工具之一，你可以使用我们在文中分享的资源非常轻松地获取已安装的文档或在线文档。

你有什么问题或建议吗？请不要犹豫，使用下面的评论框告诉我们吧。我们期待着来自你的回复！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/configure-and-troubleshoot-grub-boot-loader-linux/

作者：[Gabriel Cánepa][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[2]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[3]: http://www.tecmint.com/linux-boot-process/
[4]: https://linux.cn/article-7365-1.html
[5]: http://www.tecmint.com/best-linux-log-monitoring-and-management-tools/
[6]: http://www.gnu.org/software/grub/manual/
[7]: http://askubuntu.com/questions/82140/how-can-i-boot-with-an-older-kernel-version
[8]: https://www.kernel.org/doc/Documentation/kernel-parameters.txt
[9]: http://man7.org/linux/man-pages/man7/bootparam.7.html
[10]: https://help.ubuntu.com/community/Grub2/Troubleshooting
