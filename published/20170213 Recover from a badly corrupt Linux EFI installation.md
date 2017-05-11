从损坏的 Linux EFI 安装中恢复
=========

在过去的十多年里，Linux 发行版在安装前、安装过程中、以及安装后偶尔会失败，但我总是有办法恢复系统并继续正常工作。然而，[Solus][1] 损坏了我的笔记本。

GRUB 恢复。不行，重装。还不行！Ubuntu 拒绝安装，目标设备的报错一会这样，一会那样。哇。我之前还没有遇到过像这样的事情。我的测试机已变成无用的砖块。难道我该绝望吗？不，绝对不。让我来告诉你怎样你可以修复它吧。

### 问题详情

所有事情都从 Solus 尝试安装它自己的启动引导器 - goofiboot 开始。不知道什么原因、它没有成功完成安装，留给我的就是一个无法启动的系统。经过 BIOS 引导之后，我进入一个 GRUB 恢复终端。

![安装失败](http://www.dedoimedo.com/images/computers-years/2016-2/solus-installation-failed.png) 

我尝试在终端中手动修复，使用类似和我在我详实的 [GRUB2 指南][2]中介绍的各种命令。但还是不行。然后我尝试按照我在 [GRUB2 和 EFI 指南][3]中的建议从 Live CD 中恢复（LCTT 译注：Live CD 是一个完整的计算机可引导安装媒介，它包括在计算机内存中运行的操作系统，而不是从硬盘驱动器加载；CD 本身是只读的。 它允许用户为任何目的运行操作系统，而无需安装它或对计算机的配置进行任何更改）。我用 efibootmgr 工具创建了一个引导入口，确保标记它为有效。正如我们之前在指南中做的那样，之前这些是能正常工作的。哎，现在这个方法也不起作用。

我尝试做一个完整的 Ubuntu 安装，把它安装到 Solus 所在的分区，希望安装程序能给我一些有用的信息。但是 Ubuntu 无法完成安装。它报错：failed to install into /target。又回到开始的地方了。怎么办？

### 手动清除 EFI 分区

显然，我们的 EFI 分区出现了严重问题。简单回顾以下，如果你使用的是 UEFI，那么你需要一个单独的 FAT-32 格式化的分区。该分区用于存储 EFI 引导镜像。例如，当你安装 Fedora 时，Fedora 引导镜像会被拷贝到 EFI 子目录。每个操作系统都会被存储到一个它自己的目录，一般是 `/boot/efi/EFI/<操作系统版本>/`。

![EFI 分区内容](http://www.dedoimedo.com/images/computers-years/2016-2/grub2-efi-partition-contents.png) 

在我的 [G50][4] 机器上，这里有很多各种发行版测试条目，包括：centos、debian、fedora、mx-15、suse、Ubuntu、zorin 以及其它。这里也有一个 goofiboot 目录。但是，efibootmgr 并没有在它的菜单中显示 goofiboot 条目。显然这里出现了一些问题。

```
sudo efibootmgr -d /dev/sda
BootCurrent: 0001
Timeout: 0 seconds
BootOrder: 0001,0005,2003,0000,2001,2002
Boot0000* Lenovo Recovery System
Boot0001* ubuntu
Boot0003* EFI Network 0 for IPv4 (68-F7-28-4D-D1-A1)
Boot0004* EFI Network 0 for IPv6 (68-F7-28-4D-D1-A1)
Boot0005* Windows Boot Manager
Boot0006* fedora
Boot0007* suse
Boot0008* debian
Boot0009* mx-15
Boot2001* EFI USB Device
Boot2002* EFI DVD/CDROM
Boot2003* EFI Network
...
```

P.S. 上面的输出是在 LIVE 会话中运行命令生成的！


我决定清除所有非默认的以及非微软的条目然后重新开始。显然，有些东西被损坏了，妨碍了新的发行版设置它们自己的启动引导程序。因此我删除了 `/boot/efi/EFI` 分区下面除了 Boot 和 Windows 以外的所有目录。同时，我也通过删除所有额外的条目更新了启动管理器。

```
efibootmgr -b <hex> -B <hex>
```

最后，我重新安装了 Ubuntu，并仔细监控 GRUB 安装和配置的过程。这次，成功完成啦。正如预期的那样，几个无效条目出现了一些错误，但整个安装过程完成就好了。

![安装的错误消息](http://www.dedoimedo.com/images/computers-years/2016-2/grub2-install-errors.jpg) 

![安装的成功消息](http://www.dedoimedo.com/images/computers-years/2016-2/grub2-install-successful.jpg) 

### 额外阅读

如果你不喜欢这种手动修复，你可以阅读：

- [Boot-Info][5] 手册，里面有帮助你恢复系统的自动化工具
- [Boot-repair-cd][6] 自动恢复工具下载页面

### 总结

如果你遇到由于 EFI 分区破坏而导致系统严重瘫痪的情况，那么你可能需要遵循本指南中的建议。 删除所有非默认条目。 如果你使用 Windows 进行多重引导，请确保不要修改任何和 Microsoft 相关的东西。 然后相应地更新引导菜单，以便删除损坏的条目。 重新运行所需发行版的安装设置，或者尝试用之前介绍的比较不严谨的修复方法。

我希望这篇小文章能帮你节省一些时间。Solus 对我系统的更改使我很懊恼。这些事情本不应该发生，恢复过程也应该更简单。不管怎样，虽然事情似乎很可怕，修复并不是很难。你只需要删除损害的文件然后重新开始。你的数据应该不会受到影响，你也应该能够顺利进入到运行中的系统并继续工作。开始吧。

加油。

--------------------------------------------------------------------------------


作者简介：

我叫 Igor Ljubuncic。38 岁，已婚，但还没有小孩。我现在是一个云技术公司的首席工程师，前端新手。在 2015 年年初之前，我在世界上最大的 IT 公司之一的工程计算团队担任操作系统架构师，开发新的基于 Linux 的解决方案、优化内核、在 Linux 上实现一些好的想法。在这之前，我是一个为高性能计算环境设计创新解决方案团队的技术主管。其它一些头衔包括系统专家、系统开发员或者类似的。所有这些都是我的爱好，但从 2008 年开始，就是有报酬的工作。还有什么比这更令人满意的呢？

从 2004 到 2008 年，我通过在医疗图像行业担任物理专家养活自己。我的工作主要关注解决问题和开发算法。为此，我广泛使用 Matlab，主要用于信号和图像处理。另外，我已通过几个主要工程方法的认证，包括 MEDIC Six Sigma Green Belt、实验设计以及统计工程。


-------------


via: http://www.dedoimedo.com/computers/grub2-efi-corrupt-part-recovery.html

作者：[Igor Ljubuncic][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html

[1]:http://www.dedoimedo.com/computers/solus-1-2-review.html
[2]:http://www.dedoimedo.com/computers/grub-2.html
[3]:http://www.dedoimedo.com/computers/grub2-efi-recovery.html
[4]:http://www.dedoimedo.com/computers/lenovo-g50-distros-second-round.html
[5]:https://help.ubuntu.com/community/Boot-Info
[6]:https://sourceforge.net/projects/boot-repair-cd/
