如何在Ubuntu 13.10上安装Linux内核 3.12
================================================================================

**Ubuntu 13.10 的用户不必再用羡慕的眼神看着新版Linux内核发布，他们也可以相对轻松地更新他们的系统。**

Canonical公司一贯的做法是，在整个开发周期中始终使用一个Linux内核。例如，Ubuntu 13.10始终基于Linux内核 3.11，但现在已经推出一个新的稳定的Linux内核3.12。

Ubuntu用户只有等到14.04 LTS发布以后，才能得到一个较新版本的Linux内核，但到那之前他们也可以选择安装新的版本。

不过，我们必须从一开始就提醒你。Canonical不建议你更新官方渠道以外的Linux内核版本。这不是一个完全安全的过程，你以后可能会遇到问题，甚至系统故障。但另一方面，你的系统性能可能会得到提升。

你将要下载的内核来自Canonical公司，这意味着它已经在.deb格式。你不需要再自己编译。打开一个终端，导航到Downloads文件夹，输入以下命令：

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12-saucy/linux-image-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12-saucy/linux-headers-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

如果你有一个32位的操作系统，你也可以下载32位版本。可见只需替换链接中的64bit为32bit即可，[点此下载][1].

现在,你将像运行任何其它程序一样运行这些.deb文件。在你下载软件包的同一个终端，输入下面的命令（你需要root权限才能正常运行）：

    sudo dpkg -i linux-image-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb
    sudo dpkg -i linux-headers-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

此过程结束后，你需要重启系统。瞧，新版本的Linux内核更新成功。好消息是，旧版本内核仍然存在，如果你要删除3.12版的内核，只需使用众所周知命令。

    sudo apt-get purge linux-image-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb
    sudo apt-get linux-headers-3.12.0-031200-generic_3.12.0-031200.201311031935_amd64.deb

记住，以上所示的文件名变化很快。如果无法下载，请更新新的链接。
开始享受Linux 3.12内核吧！

--------------------------------------------------------------------------------

来源于: http://news.softpedia.com/news/How-to-Install-Linux-Kerrnel-3-12-in-Ubuntu-13-10-397013.shtml

译者：[coolpigs](https://github.com/coolpigs) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12-saucy/ 
