如何使用 GRUB 2 直接从硬盘运行 ISO 文件
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-featured.png)

大多数 Linux 发行版都会提供一个可以从 USB 启动的 live 环境，以便用户无需安装即可测试系统。我们可以用它来评测这个发行版或仅仅是当成一个一次性系统，并且很容易将这些文件复制到一个 U 盘上，在某些情况下，我们可能需要经常运行同一个或不同的 ISO 镜像。GRUB 2 可以配置成直接从启动菜单运行一个 live 环境，而不需要烧录这些 ISO 到硬盘或 USB 设备。

### 获取和检查可启动的 ISO 镜像 ###

为了获取 ISO 镜像，我们通常应该访问所需的发行版的网站下载与我们架构兼容的镜像文件。如果这个镜像可以从 U 盘启动，那它也应该可以从 GRUB 菜单启动。

当镜像下载完后，我们应该通过 MD5 校验检查它的完整性。这会输出一大串数字与字母合成的序列。

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-md5.png)

将这个序列与下载页提供的 MD5 校验码进行比较，两者应该完全相同。

### 配置 GRUB 2 ###

ISO 镜像文件包含了整个系统。我们要做的仅仅是告诉 GRUB 2 哪里可以找到 kernel 和 initramdisk 或 initram 文件系统（这取决于我们所使用的发行版）。

在下面的例子中，一个 Kubuntu 15.04 live 环境将被配置到 Ubuntu 14.04 机器的 Grub 启动菜单项。这应该能在大多数新的以 Ubuntu 为基础的系统上运行。如果你是其它系统并且想实现一些其它的东西，你可以从[这些文件][1]了解更多细节，但这会要求你拥有一点 GRUB 使用经验。

这个例子的文件 `kubuntu-15.04-desktop-amd64.iso` 放在位于 `/dev/sda1` 的 `/home/maketecheasier/TempISOs/` 上。

为了使 GRUB 2 能正确找到它，我们应该编辑

    /etc/grub.d40-custom

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-40-custom-empty.png)

    menuentry "Kubuntu 15.04 ISO" {
    set isofile="/home/maketecheasier/TempISOs/kubuntu-15.04-desktop-amd64.iso"
    loopback loop (hd0,1)$isofile
    echo "Starting $isofile..."
    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash
    initrd (loop)/casper/initrd.lz
    }

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-40-custom-new.png)

### 分析上述代码 ###

首先设置了一个变量名 `$menuentry` ，这是 ISO 文件的所在位置 。如果你想换一个 ISO ，你应该修改 `isofile="/path/to/file/name-of-iso-file-.iso"`.

下一行是指定回环设备，且必须给出正确的分区号码。

    loopback loop (hd0,1)$isofile

注意 hd0,1 这里非常重要，它的意思是第一硬盘，第一分区 (`/dev/sda1`)。

GRUB 的命名在这里稍微有点困惑，对于硬盘来说，它从 “0” 开始计数，第一块硬盘为 #0 ，第二块为 #1 ，第三块为 #2 ，依此类推。但是对于分区来说，它从 “1” 开始计数，第一个分区为 #1 ，第二个分区为 #2 ，依此类推。也许这里有一个很好的原因，但肯定不是明智的（明显用户体验很糟糕）..

在 Linux 中第一块硬盘，第一个分区是 `/dev/sda1` ，但在 GRUB2 中则是 `hd0,1` 。第二块硬盘，第三个分区则是 `hd1,3`, 依此类推.

下一个重要的行是：

    linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=${isofile} quiet splash

这会载入内核镜像，在新的 Ubuntu Live CD 中，内核被存放在 `/casper` 目录，并且命名为 `vmlinuz.efi` 。如果你使用的是其它系统，可能会没有 `.efi` 扩展名或内核被存放在其它地方 (可以使用归档管理器打开 ISO 文件在 `/casper` 中查找确认)。最后一个选项， `quiet splash` ，是一个常规的 GRUB 选项，改不改无所谓。

最后

    initrd (loop)/casper/initrd.lz

这会载入 `initrd` ，它负责载入 RAMDisk 到内存用于启动。 

### 启动 live 系统 ###

做完上面所有的步骤后，需要更新 GRUB2：

    sudo update-grub

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-updare-grub.png)

当重启系统后，应该可以看见一个新的、并且允许我们启动刚刚配置的 ISO 镜像的 GRUB 条目：

![](https://www.maketecheasier.com/assets/uploads/2015/07/rundirectiso-grub-menu.png)

选择这个新条目就允许我们像从 DVD 或 U 盘中启动一个 live 环境一样。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/run-iso-files-hdd-grub2/

作者：[Attila Orosz][a]
译者：[Locez](https://github.com/locez)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
[1]:http://git.marmotte.net/git/glim/tree/grub2