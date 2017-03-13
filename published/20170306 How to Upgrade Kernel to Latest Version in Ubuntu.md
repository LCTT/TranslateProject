如何在 Ubuntu 中升级到最新内核
============================================================

每过段时间，就有新的设备和技术出来，因此如果我们想要充分利用它，保持最新的 Linux 内核就显得很重要。此外，更新系统内核将使我们能够利用新的内核优化，并且它还可以帮助我们避免在早期版本中发现的漏洞。

**建议阅读：** [如何升级 CentOS 7内核][1]

准备好了在 Ubuntu 16.04 或其衍生版本（如 Debian 和 Linux Mint）中更新你的内核了么？如果准备好了，请你继续阅读！

### 第一步：检查安装的内核版本

要发现当前系统安装的版本，我们可以：

```
$ uname -sr
```

下面的截图显示了在 Ubuntu 16.04 server 中上面命令的输出：

[
 ![Check Kernel Version in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Kernel-Version-in-Ubuntu.png) 
][2]

*在 Ubuntu 中检查内核版本*

### 第二步：在 Ubuntu 16.04 中升级内核

要升级 Ubuntu 16.04 的内核，打开 [http://kernel.ubuntu.com/~kernel-ppa/mainline/][3] 并选择列表中需要的版本（发布此文时最新内核是 4.10.1）。

接下来，根据你的系统架构下载 `.deb` 文件：

对于 64 位系统：
```
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-headers-4.10.1-041001_4.10.1-041001.201702260735_all.deb
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-headers-4.10.1-041001-generic_4.10.1-041001.201702260735_amd64.deb
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-image-4.10.1-041001-generic_4.10.1-041001.201702260735_amd64.deb
 
```

这是 32 位系统的：
```
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-headers-4.10.1-041001_4.10.1-041001.201702260735_all.deb
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-headers-4.10.1-041001-generic_4.10.1-041001.201702260735_i386.deb
$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10.1/linux-image-4.10.1-041001-generic_4.10.1-041001.201702260735_i386.deb
```

下载完成这些所有内核文件后，如下安装：

```
$ sudo dpkg -i *.deb
```

安装完成后，重启并验证新的内核已经被使用了：

```
$ uname -sr
```

就是这样。你下载就可以使用比 Ubuntu 16.04 默认安装的内核的更新版本了。

### 总结

本文我们展示了如何在 Ubuntu 系统上轻松升级Linux内核。这里还有另一个流程，但我们在这里没有展示，因为它需要从源代码编译内核，这不推荐在生产 Linux 系统上使用。

如果你仍然有兴趣编译内核作为一个学习经验，你可以在 [Kernel Newbies][4] 网站中得到指导该如何做。

一如既往，如果你对本文有任何问题或意见，请随时使用下面的评论栏。

--------------------------------------------------------------------------------
作者简介：

Gabriel Cánepa - 一位来自阿根廷圣路易斯梅塞德斯镇 (Villa Mercedes, San Luis, Argentina) 的 GNU/Linux 系统管理员，Web 开发者。就职于一家世界领先级的消费品公司，乐于在每天的工作中能使用 FOSS 工具来提高生产力。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/upgrade-kernel-in-ubuntu/

作者：[Gabriel Cánepa][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/install-upgrade-kernel-version-in-centos-7/
[2]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Kernel-Version-in-Ubuntu.png
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/
[4]:https://kernelnewbies.org/KernelBuild
[5]:http://www.tecmint.com/author/gacanepa/
[6]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[7]:http://www.tecmint.com/free-linux-shell-scripting-books/
