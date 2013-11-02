Ubuntu 升级到Linux内核3.11.6

================================================================================

昨天已经发布了Ubuntu 13.10但是你可能仍然运行着Linux 3.11.0 内核.当然坚持Ubuntu 13.10 当前内核不是一件坏事.事实上,不建议升级超出你的Linux发行版的官方仓库测试的特定版本.

另一方面,如果你不害怕折腾再折腾Ubuntu那么你应该升级到最新Ubuntu支持的 Linux 内核.你会发觉,最新的内核总是有改善,漏洞修补和添加特性的.

所以,如果你的电脑有些运行不正常,那么更新Linux内核可能会被修复.但记住,当你升级时你也有可能导致崩溃.

如果你不再惧怕,和我一起永往直前吧,让我们开始升级Ubuntu Linux 内核到 3.11.6!!

首先,在你开始升级之前,请先备份你的数据,以防升级时出错无法恢复.小心不出大错!!!

更多关于这个内核版本信息,[阅读更改日志][1]

当你一切就绪,运行下列命令来升级你的机器并删除旧包,包括旧内核.

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

另外,进到/tmp目录.

    cd /tmp

接着,复制粘贴下列命令,按回车下载32位的Linux内核

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106-generic_3.11.6-031106.201310181453_i386.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106_3.11.6-031106.201310181453_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-image-3.11.6-031106-generic_3.11.6-031106.201310181453_i386.deb 

下载64位Linux 内核版本,复制粘贴下行.

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106-generic_3.11.6-031106.201310181453_amd64.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-headers-3.11.6-031106_3.11.6-031106.201310181453_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.11.6-saucy/linux-image-3.11.6-031106-generic_3.11.6-031106.201310181453_amd64.deb

下载适合的版本,运行下列命令,开始安装.

    sudo dpkg -i *.deb

最后,运行下列命令升级Grub.

    sudo update-grub2

就这样!重启你的电脑,完成升级!!

玩的开心!


--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/upgrade-linux-kernel-3-11-6-ubuntu/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.11.6
