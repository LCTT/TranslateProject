每日 Ubuntu 小技巧：怎样在Ubuntu升级新的 Linux Kernel 3.12.7
================================================================================

Linux Kernel 版本3.12.7主线已经发布了，而这篇简短教程将会向你展示怎样简单地在 Ubuntu 中升级。如果你正好运行 Ubuntu 13.10 或者更低版本，还碰巧你的系统还不是安装最新的内核，读完吧。

Linux Kernel 是 linux 操作系统的核心，包括了 Ubuntu。内核使 Ubuntu 可以与系统硬件（内存，CPU，设备等等）通信。内核管理资源并掌管你机器设备的所有重要部分。

没有 Linux Kernel， Ubuntu 只是一串幻想应用而不能连接硬件或者你机器所有的重要部分。这就是为什么Linux Kernel 如此的重要。

### 为什么升级你的 Ubuntu Kernel? ###

在升级你的系统内核之前，第一件需要知道的事情就是升级可能会破坏你的系统，使它无法使用。事实上，并不推荐你自己升级内核。Ubuntu 的总公司 Canonical 在 Ubuntu 内核升级上做得很好。

在新版本发布之前，他们测试并且确定内核的安装是兼容的。所以，如果你的设备工作良好，没有问题，你应该保持现有内核，不要升级。

另一方面，如果 Ubuntu 不能识别所有系统的元件或者你的设备功能不正确，升级 Linux kernel 也许会有帮助。

这是因为新的内核为你的新机器增加了新的驱动和功能。如果现在安装的内核不支持机器上的某些功能，你应该升级一下。

更多关于内核3.12.7，[点这里阅读更新日志][1]。

### 现在升级 Linux Kernel ###

要想升级你的内核，运行下列命令来升级所有安装包和现存内核。

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

升级完成后，重启你的设备。在安装完系统包和内核后重启机器是一个好习惯。这样做是为了让新的内核能够被应用。

接下来，运行下列命令来下载 Linux Kernel 3.12.7 

#### 32位设备，运行下列命令 ####

    cd /tmp && wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207-generic_3.12.7-031207.201401091657_i386.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207_3.12.7-031207.201401091657_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-image-3.12.7-031207-generic_3.12.7-031207.201401091657_i386.deb

#### 64位设备，运行下列命令 ####

    cd /tmp && wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207-generic_3.12.7-031207.201401091657_amd64.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207_3.12.7-031207.201401091657_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-image-3.12.7-031207-generic_3.12.7-031207.201401091657_amd64.deb

下载你的系统对应版本后，运行下列命令

    sudo dpkg -i *.deb

安装完成后，重启你的设备，如果一切都按照上面描述一样进展顺利，你的系统应该拥有了最新稳定的内核版本。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/linuxkernel3127.jpg)

卸载内核3.12.7版本，使用下列命令

    sudo apt-get remove linux-headers-3.12.7-* linux-image-3.13.7-*

好好享受吧！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-linux-kernel-3-12-7-released-heres-how-to-upgrade-in-ubuntu/

译者：[Vic___](http://blog.csdn.net/Vic___) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.12.7
