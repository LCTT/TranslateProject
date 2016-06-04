Linux 4.1 系列的最大版本 4.1.18 LTS发布，带来大量修改
=================================================================================
（LCTT 译注：这是一则过期的消息，但是为了披露更新内容，还是发布出来给大家参考）

**著名的内核维护者Greg Kroah-Hartman貌似正在度假中，因为Sasha Levin2016年2月16日的早些时候来[宣布](http://lkml.iu.edu/hypermail/linux/kernel/1602.2/00520.html)，第十八个Linux内核维护版本Linux Kernel 4.1 LTS通用版本正式发布。**

作为长期支持的内核分支，Linux 4.1还会在几年内得到更新和补丁，而今天的维护构建版本也证明一点，就是内核开发者们正致力于保持该系列在所有使用该版本的GNU/Linux操作系统上稳定和可靠。Linux Kernel 4.1.18 LTS是一个大的发布版本，它带来了总计达228个文件修改，这些修改包含了多达5304个插入修改和1128个删除修改。

Linux Kernel 4.1.18 LTS更新了什么呢？好吧，首先是对ARM，ARM64（AArch64），MIPS，PA-RISC，m32r，PowerPC（PPC），s390以及x86等硬件架构的改进。此外，还有对Btrfs，CIFS，NFS，XFS，OCFS2，OverlayFS以及UDF文件系统的加强。对网络堆栈的修复，尤其是对mac80211的修复。同时，还有多核心、加密和mm等方面的改进和对声音的更新。

“我宣布4.1.18内核正式发布，所有4.1内核系列的用户都应当升级。”Sasha Levin说，“更新的4.1.y git树可以在这里找到：git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.1.y，并且可以在 kernel.org 的 git 网站上浏览：http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git;a=summary 进行浏览。”

### 大量驱动被更新

除了架构、文件系统、声音、网络、加密、mm和核心内核方面的改进之外，Linux Kernel 4.1.18 LTS更新了各个驱动，以提供更好的硬件支持，特别是像蓝牙、DMA、EDAC、GPU（主要是Radeon和Intel i915）、无限带宽技术、IOMMU、IRQ芯片、MD、MMC、DVB、网络（主要是无线）、PCI、SCSI、USB、散热、暂存和Virtio等此类东西。

和以往一样，我们鼓励所有基于Linux内核的操作系统平台的用户，凡是使用了Linux 4.1 LTS系列内核包的，尽快更新到今天的4.1.18版本。这些用户可以通过默认软件仓库安装更新，也可以手动编译源码包，这些包你现在就可以从[kernel.org](http://kernel.org/)网站或者[Softpedia](http://linux.softpedia.com/get/System/Operating-Systems/Kernels/Linux-Kernel-Stable-1960.shtml)下载。

------------------------------------------------------------------------------

via: http://news.softpedia.com/news/linux-kernel-4-1-18-lts-is-the-biggest-in-the-series-with-hundreds-of-changes-500500.shtml

作者：[Marius Nestor][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
