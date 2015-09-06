在 Ubuntu 中如何安装或升级 Linux 内核到4.2
================================================================================
![](http://ubuntuhandbook.org/wp-content/uploads/2014/12/linux-kernel-icon-tux.png)

Linux 内核 4.2已经发布了。Linus Torvalds 在 [lkml.org][1] 上写到:

> 通过这周这么小的变动，看来在最后一周 发布 4.2 版本应该不会有问题，当然还有几个修正，但是看起来也并不需要延迟一周。 
> 所以这就到了，而且 4.3 的合并窗口现已打开。我已经有了几个等待处理的合并请求，明天我开始处理它们，然后在适当的时候放出来。
> 从 rc8 以来的简短日志很小，已经附加。这个补丁也很小...

### 新内核 4.2 有哪些改进？: ###

- 重写英特尔的x86汇编代码
- 支持新的 ARM 板和 SoC
- 对 F2FS 的 per-file 加密
- AMDGPU 的内核 DRM 驱动程序
- 对 Radeon DRM 驱动的 VCE1 视频编码支持
- 初步支持英特尔的 Broxton Atom SoC
- 支持 ARCv2 和 HS38 CPU 内核
- 增加了队列自旋锁的支持
- 许多其他的改进和驱动更新。

### 在 Ubuntu 中如何下载4.2内核 : ###

此内核版本的二进制包可供下载链接如下：

- [下载 4.2 内核(.DEB)][1]

首先检查你的操作系统类型，32位（i386）的或64位(amd64)的，然后使用下面的方式依次下载并安装软件包：

1. linux-headers-4.2.0-xxx_all.deb
1. linux-headers-4.2.0-xxx-generic_xxx_i386/amd64.deb
1. linux-image-4.2.0-xxx-generic_xxx_i386/amd64.deb

安装内核后，在终端（(Ctrl+Alt+T)）运行`sudo update-grub`命令来更新 grub boot-loader。

如果你需要一个低延迟系统（例如用于录制音频），请下载并安装下面的包：

1. linux-headers-4.2.0_xxx_all.deb
1. linux-headers-4.2.0-xxx-lowlatency_xxx_i386/amd64.deb
1. linux-image-4.2.0-xxx-lowlatency_xxx_i386/amd64.deb

对于没有图形用户界面的 Ubuntu 服务器，你可以运行下面的命令通过 wget 来逐一抓下载，并通过 dpkg 来安装：

对于64位的系统请运行:

    cd /tmp/
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200_4.2.0-040200.201508301530_all.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200-generic_4.2.0-040200.201508301530_amd64.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-image-4.2.0-040200-generic_4.2.0-040200.201508301530_amd64.deb
    
    sudo dpkg -i linux-headers-4.2.0-*.deb linux-image-4.2.0-*.deb

对于32位的系统,请运行:

    cd /tmp/
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200_4.2.0-040200.201508301530_all.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-headers-4.2.0-040200-generic_4.2.0-040200.201508301530_i386.deb
    
    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/linux-image-4.2.0-040200-generic_4.2.0-040200.201508301530_i386.deb
    
    sudo dpkg -i linux-headers-4.2.0-*.deb linux-image-4.2.0-*.deb

最后，重新启动计算机才能生效。

要恢复或删除旧的内核，请参阅[通过脚本安装内核][3]。

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/08/upgrade-kernel-4-2-ubuntu/

作者：[Ji m][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://lkml.org/lkml/2015/8/30/96
[2]:http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.2-unstable/
[3]:http://ubuntuhandbook.org/index.php/2015/08/install-latest-kernel-script/
