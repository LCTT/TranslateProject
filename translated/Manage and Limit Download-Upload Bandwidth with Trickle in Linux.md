Linux 下使用Trickle管理和限制下载/上传带宽
================================================================================
你有没有遇到过一个程序占用了你所有的网络带宽的情况？如果你遇到过，那么你就需要限制带宽的应用。或者你是一个系统管理员或者只是一名Linux用户，你需要学习如何控制应用的上传和下载速度来确保你的网络带宽不会被一个程序耗光。

![](http://www.tecmint.com/wp-content/uploads/2013/11/Bandwidth-limit-trickle.png)

### Trickle 是什么? ###

**Trickle**是一款用来限制如**Firefox, FTP , SSH**和其他程序带宽使用的带宽限制工具来确保网络带宽。你希望你的**Youtube**音乐体验影响到你的ftp下载么？不过不想，继续阅读这篇文章，你会学到如何安装和使用trickle在你的机器上。

### 怎样在Linux上安装Trickle ###

trickle有它自己的依赖，你必须在安装和使用trickle之前安装了“**libevent 库**”，但这个在大多数现在Linux机器上已经默认安装。

#### 在 Debian/Ubuntu/Linux Mint 上####

在**Debian/Ubuntu/Mint** 机器上运行 **apt-get install trickle**会有效。请确保源列表已经更新，接着安装你想要的应用。

    $ sudo apt-get update
    $ sudo apt-get install trickle

#### 在 RHEL/CentOS/Fedora 上####

首先你需要更新系统接着使用接下来的命令安装trickle。

    # yum update
    # yum install trickle

### Trickle如何工作? ###

Trickle通过控制某个socket数据的写入和读取数量来控制和限制应用的**上传/下载**速度。它使用另一个版本的**BSD**套接字API，但是区别是trickle还管理socket调用。

要注意的是trickle使用动态链接和加载，所以它只对于使用"Glibc库"的程序有用。由于trickle可以设置数据在socket的传输延迟，因此它明显可以用来限制一个应用的网络带宽。

### Trickle不能做什么？ ###

Trickle不能限制使用**UDP**协议的应用的带宽，它只可用于**TCP**连接，但是你要知道它也并不是可以工作在所有的**TCP**连接。如果你到现在仔细地看了这篇文章，你可以猜到原因是什么。你能回忆起trickle可以工作在使用**Glibc库**应用的事实么？

我不得说一下trickle无法工作在使用静态链接的可执行程序上。

### 确定Trickle是否可运行在某个特定应用上 ###

既然trickle无法显示每个应用的**上传/下载**速度，那么有理由要使用一个方法来找出trickle可以工作的应用。

**ldd**工具可以帮我们找出某个特定的程序是否使用了**libc.so**库。如果程序使用了这个库，那么你可以使用trickle来限制它的网络带宽使用。

**ldd**命令被用来打印每个程序需要的共享库。如果你是一个好奇的**Linux Geek**，那么你可以使用man命令来找出关于ldd工具的更多信息。

    # man ldd

**Filezilla**是一款使用ftp协议传输文件的程序，trickle可以用来限制它的下载或者上传速度么？在你考虑的时候，我使用以下的命令来找出trickle是否可用在filezilla。

    # ldd filezilla | grep libc.so

就我而言，它输出了如下:

    oltjano@oltjano-X55CR:/usr/bin$ ldd filezilla | grep libc.so
    	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xb6bc4000)

既然filezilla使用了“**libc.so**”库，那么trickle可以用来限制它的网络带宽。这个方法可以用在任何你感兴趣的程序上。

### 学习如何使用Trickle ###

打印下面的命令打印trickle工具的**版本**。

    root@oltjano-X55CR:~# trickle -V
    trickle: version 1.07

Linux有很多命令行工具使得测试(实验)变得有趣和美丽。下载的命令使用[wget 工具][1]来下载最新的Pear OS镜像

root@oltjano-X55CR:~# wget http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download

    --2013-11-20 11:56:32--  http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download
    Resolving sourceforge.net (sourceforge.net)... 216.34.181.60
    Connecting to sourceforge.net (sourceforge.net)|216.34.181.60|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384928843&use_mirror=kaz [following]
    --2013-11-20 11:56:33--  http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384928843&use_mirror=kaz
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso [following]
    --2013-11-20 11:56:33--  http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso
    Resolving kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)... 88.204.157.163
    Connecting to kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)|88.204.157.163|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1093664768 (1.0G) [application/octet-stream]
    Saving to: ‘download’
    
    0% [                                                                                                    ] 30,78,278    381KB/s  eta 1h 50m

如你所见的输出，下载速度大约是**381 KB/s**。我想限制下载速度到**13 K/s**，这样我就可以用我的带宽做其他的事情了。下面的命令用来限制wget速度到**13 K/s**。

    root@oltjano-X55CR:~# trickle -d 13 wget http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download 
    
    ravisaive@ravisaive-OptiPlex-380:~$ trickle -d 13 wget http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download

    --2013-11-20 12:01:19--  http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download
    Resolving sourceforge.net (sourceforge.net)... 216.34.181.60
    Connecting to sourceforge.net (sourceforge.net)|216.34.181.60|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384929129&use_mirror=kaz [following]
    --2013-11-20 12:01:19--  http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384929129&use_mirror=kaz
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso [following]
    --2013-11-20 12:01:20--  http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso
    Resolving kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)... 88.204.157.163
    Connecting to kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)|88.204.157.163|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1093664768 (1.0G) [application/octet-stream]
    Saving to: ‘download.1’
    
    0% [                                                                                                   ] 2,01,550    13.1KB/s  eta 21h 5m

如你所见的输出，下载速度被限制到了**13K/s**。下载将会持续**21小时5分钟**。上面的“**-d**”意味着下载，你可以像下面的命令那样结合使用 “**-d**”选项和上传选项(**-u**)。

    # trickle -u 100 -d 50 ftp

上面的命令来限制**ftp 客户端**的上传速度为**100K/s**，下载速度为**50K/s**。你还可以在一个bash里面限制所有的命令的带宽。

    trickle -d 130 -u 13 bash

每个命令行工具对用户提供了帮助，使用trickle命令使用"-h"选项来找出更多trickle工具的用法。

root@oltjano-X55CR:/usr/bin# trickle -h

    Usage: trickle [-hvVs] [-d <rate>] [-u <rate>] [-w <length>] [-t <seconds>]
                   [-l <length>] [-n <path>] command ...
    	-h Help (this)
    	-v Increase verbosity level
    	-V Print trickle version
    	-s Run trickle in standalone mode independent of trickled
    	-d <rate>    Set maximum cumulative download rate to <rate> KB/s
    	-u <rate>    Set maximum cumulative upload rate to <rate> KB/s
    	-w <length>  Set window length to <length> KB 
    	-t <seconds> Set default smoothing time to <seconds> s
    	-l <length>  Set default smoothing length to <length> KB
    	-n <path>    Use trickled socket name <path>
    	-L <ms>      Set latency to <ms> milliseconds
    	-P <path>    Preload the specified .so instead of the default one

### 总结 ###

本篇文章教你如何安装trickle工具在你的Linux机器上，并用它如何做一些简单的事情。无论你为大公司还是为你自己，trickle都是高级Linux用户的必备工具。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-and-limit-downloadupload-bandwidth-with-trickle-in-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/