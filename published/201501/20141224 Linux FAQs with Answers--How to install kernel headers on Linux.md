Linux有问必答：如何在Linux上安装内核头文件
================================================================================
> **提问**:我在安装一个设备驱动前先要安装内核头文件。怎样安装合适的内核头文件？

当你在编译一个设备驱动模块时，你需要在系统中安装内核头文件。内核头文件同样在你编译与内核直接链接的用户空间程序时需要。当你在这些情况下安装内核头文件时，你必须确保内核头文件精确地与你当前内核版本匹配（比如：3.13.0-24-generic）。

如果你的内核是发行版自带的内核版本，或者使用默认的包管理器的基础仓库升级的（比如：apt-ger、aptitude或者yum），你也可以使用包管理器来安装内核头文件。另一方面，如果下载的是[kernel源码][1]并且手动编译的，你可以使用[make命令][2]来安装匹配的内核头文件。

现在我们假设你的内核是发行版自带的，让我们看下该如何安装匹配的头文件。

### 在 Debian、Ubuntu 或者 Linux Mint 上安装内核头文件 ###

假设你没有手动编译内核，你可以使用apt-get命令来安装匹配的内核头文件。

首先，使用dpkg-query命令检查是否有可用的内核头文件。

    $ dpkg-query -s linux-headers-$(uname -r) 

----------

    dpkg-query: package 'linux-headers-3.11.0-26-generic' is not installed and no information is available

接着使用下面的命令安装匹配的内核头文件。

    $ sudo apt-get install linux-headers-$(uname -r) 

![](https://farm9.staticflickr.com/8681/16000652415_a7c399992e_z.jpg)

验证头文件是否成功安装。

    $ dpkg-query -s linux-headers-$(uname -r) 

----------

    Package: linux-headers-3.11.0-26-generic
    Status: install ok installed

Debian、Ubuntu、Linux Mint默认头文件在**/usr/src**下。

### 在 Fedora、CentOS 或者 RHEL 上安装内核头文件 ###

假设你没有手动编译内核，你可以使用yum命令来安装匹配的内核头文件。

首先，用下面的命令检查系统是否已经安装了头文件。如果下面的命令没有任何输出，这就意味着还没有头文件。

    $ rpm -qa | grep kernel-headers-$(uname -r)

接着用yum命令安装头文件。这个命令会自动找出合适的头文件并安装。

    $ sudo yum install kernel-headers 

![](https://farm9.staticflickr.com/8594/15378403114_c51ff6f4ae_z.jpg)

验证包安装的状态。

    $ rpm -qa | grep kernel-headers-$(uname -r) 

----------

    kernel-headers-3.10.0-123.9.3.el7.x86_64

Fedora、CentOS 或者 RHEL上默认内核头文件的位置是**/usr/include/linux**。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-kernel-headers-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/
[2]:https://www.kernel.org/doc/Documentation/kbuild/headers_install.txt