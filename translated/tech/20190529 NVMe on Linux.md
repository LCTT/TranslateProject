[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NVMe on Linux)
[#]: via: (https://www.networkworld.com/article/3397006/nvme-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux 上的 NVMe
===============

如果你还没注意到，一些极速的固态磁盘技术对于Linux和其他操作系统都是可用的。
![Sandra Henry-Stocker][1]

NVMe 代表“非易失性内存快车”，它是一个主机控制器接口和存储协议，用于加速企业和客户端系统以及固态驱动器(SSD)之间的数据传输。它通过电脑的高速外围组件互联快车总线（PCIe）工作。当我看到这些名词时，我感到“羡慕”。羡慕的原因很重要。

使用 NVMe，数据传输的速度比旋转磁盘快很多。事实上，NVMe 驱动能够比 SATA SSD 快 7 倍。这比我们今天很多人用的固态硬盘快了 7 倍多。这意味着，如果你用一个 NVMe 驱动盘作为启动盘，你的系统能够启动的非常快。事实上，如今任何人买一个新的系统可能都不会考虑那些没有自带 NVMe 的，不管是服务器或者个人电脑。

### NVMe 在 Linux 下能工作吗？

是的！NVMe 自 Linux 内核 3.3 版本就支持了。更新一个系统，然而，通常同时需要一个 NVMe 控制器和一个 NVMe 磁盘。一些外置磁盘也行，但是为了添加到系统中，需要的不仅仅是通用的 USB 接口。

[MORE ON NETWORK WORLD: Linux: Best desktop distros for newbies][2]

为了检查内核版本，使用下列命令：

```
$ uname -r
5.0.0-15-generic
```

如果你的系统已经用了 NVMe，你将看到一个设备（例如， /dev/nvme0），但是仅在你安装了 NVMe 控制器的情况下。如果你没有，你可以用下列命令获取使用 NVMe 的相关信息。

```
$ modinfo nvme | head -6
filename:       /lib/modules/5.0.0-15-generic/kernel/drivers/nvme/host/nvme.ko
version:        1.0
license:        GPL
author:         Matthew Wilcox <willy@linux.intel.com>
srcversion:     AA383008D5D5895C2E60523
alias:          pci:v0000106Bd00002003sv*sd*bc*sc*i*
```

### 了解更多

如果你想了解极速的 NVMe 存储的更多细节，可在  _[PCWorld][3]_ 获取。

规格，白皮书和其他资源可在 [NVMexpress.org][4] 获取。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397006/nvme-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/nvme-100797708-large.jpg
[2]: https://www.networkworld.com/slideshow/153439/linux-best-desktop-distros-for-newbies.html#tk.nww-infsb
[3]: https://www.pcworld.com/article/2899351/everything-you-need-to-know-about-nvme.html
[4]: https://nvmexpress.org/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
