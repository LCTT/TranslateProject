在Ubuntu上升级到Linux内核3.11.6
================================================================================

Ubuntu 13.10已经发布，不过它的内核可不是最新的。当然坚持Ubuntu 13.10当前内核不是一件坏事。事实上。不特别建议升级超出你的Linux发行版的官方仓库测试过的特定版本。

但另一方面,如果你不害怕一再折腾Ubuntu，那么你可以试试升级到最新Ubuntu支持的Linux内核。你会发觉最新的内核总是有改善的、修补了漏洞和添加特性的.

所以，如果你的电脑有些运行不正常，那么更新Linux内核可能就能修复。但记住，当你升级时你也有可能导致系统崩溃。

如果你不再惧怕，和我一起永往直前吧，让我们开始升级Ubuntu Linux 内核到 3.11.6!!

首先，在你开始升级之前，请先备份你的数据，以防升级时出错无法恢复。小心行得万年船!!!

更多关于这个内核版本信息，[阅读更改日志][1]。

当你一切准备就绪，运行下列命令来升级你的机器并删除包括比当前更旧的内核在内的旧软件包。

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

然后，进到/tmp目录。

    cd /tmp

接着，复制粘贴下列命令，按回车下载32位的Linux内核

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106-generic_3.11.6-031106.201310181453_i386.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106_3.11.6-031106.201310181453_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-image-3.11.6-031106-generic_3.11.6-031106.201310181453_i386.deb 

对于64位Linux内核版本，则复制粘贴下行。

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106-generic_3.11.6-031106.201310181453_amd64.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106_3.11.6-031106.201310181453_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-image-3.11.6-031106-generic_3.11.6-031106.201310181453_amd64.deb

下载适合你的版本，运行下列命令，开始安装：

    sudo dpkg -i *.deb

最后，运行下列命令升级Grub。

    sudo update-grub2

就这样！重启你的电脑，完成升级!!

玩的开心!


--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/upgrade-linux-kernel-3-11-6-ubuntu/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.11.6
