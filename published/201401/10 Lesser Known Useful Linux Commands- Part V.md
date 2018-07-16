十个鲜为人知的Linux命令 - Part 5
================================================================================

在前四篇 **“鲜为人知的Linux命令”** 系列文章受到高度赞赏之后，我们将为广大读者呈上此系列的最后一篇文章，虽然是最后一篇，但是其重要性毫不逊于前几篇。

![](http://www.tecmint.com/wp-content/uploads/2013/12/10-Lesser-Known-Useful-Commands-V.png)

前几篇文章的地址如下：

- [十一个鲜为人知的 Linux 命令 - Part 1][1]
- [十个鲜为人知的 Linux 命令 - Part 2][2]
- [十个鲜为人知的 Linux 命令 - Part 3][3]
- [十个鲜为人知的 Linux 命令 - Part 4][4]

### 42. lsb_release ###

 **‘lsb_release’** 命令会打印特殊发行版的信息。如果 **lsb_release** 还没安装，你可以在基于 **Debain** 的发行版中用命令 apt 安装，在基于 **Red Hat** 系统下用 yum 来安装包。 

    # lsb_release -a
    LSB Version:    :base-4.0-ia32:base-4.0-noarch:core-4.0-ia32:core-4.0-noarch:graphics-4.0-ia32:
    Distributor ID: CentOS
    Description:    CentOS release 6.3 (Final)
    Release:        6.3
    Codename:       Final

**注意：**选项‘**-a**’，会显示有关**版本、ID、详情、发行号**和**研发代号**的全部可用信息。

### 43. nc -zv localhost 80 ###

检查 **80** 端口是否被打开。我们可以用任何其他端口号替换‘**80**’来检查端口是否被打开或关闭。

    $ nc -zv localhost 80
    Connection to localhost 80 port [tcp/http] succeeded!

 （译注：出现该信息表示80端口已被打开。）

检查 **8080** 端口是否启用

    $ nc -zv localhost 8080
    nc: connect to localhost port 8080 (tcp) failed: Connection refused
    
（译注：该信息显示了8080端口并未打开。）

### 44. curl ipinfo.io ###

该命令会输出并提供 **IP 地址** 的 **‘地理位置’** 。

    $ curl ipinfo.io 
   "ip": "xx.xx.xx.xx",
    "hostname": "triband-del-aa.bbb.cc.ddd.bol.net.in",
    "city": "null",
    "region": "null",
    "country": "IN",
    "loc": "20,77",
    "org": "AS17813 Mahanagar Telephone Nigam Ltd".

### 45. find . -user root ###

该命令会输出当前目录下( **root** )用户所拥有的文件（译注：即owner为root）。下面是在当前目录下列出的所有 ‘root’用户拥有的文件。

    # find . -user root
    ./.recently-used.xbel
    ./.mysql_history
    ./.aptitude
    ./.aptitude/config
    ./.aptitude/cache
    ./.bluefish
    ./.bluefish/session-2.0
    ./.bluefish/autosave
    ./.bash_history

在当前路径下列出所有 **‘avi’** 用户拥有的文件

    # find . -user avi
    ./.cache/chromium/Cache/f_002b66
    ./.cache/chromium/Cache/f_001719
    ./.cache/chromium/Cache/f_001262
    ./.cache/chromium/Cache/f_000544
    ./.cache/chromium/Cache/f_002e40
    ./.cache/chromium/Cache/f_00119a
    ./.cache/chromium/Cache/f_0014fc
    ./.cache/chromium/Cache/f_001b52
    ./.cache/chromium/Cache/f_00198d
    ./.cache/chromium/Cache/f_003680

### 46. sudo apt-get build-dep ffmpeg ###

该命令会在相应的包安装时自动构建依赖关系。因此包安装的过程将非常流畅，也是非常容易的。

    # apt-get build-dep ffmpeg
    libxinerama-dev libxml-namespacesupport-perl libxml-sax-expat-perl
    libxml-sax-perl libxml-simple-perl libxrandr-dev libxrender-dev
    x11proto-render-dev x11proto-xinerama-dev xulrunner-dev
    The following packages will be upgraded:
    libpixman-1-0
    
    1 upgraded, 143 newly installed, 0 to remove and 6 not upgraded.
    Need to get 205 MB of archives.
    After this operation, 448 MB of additional disk space will be used.
    Do you want to continue [Y/n]?

### 47. lsof -iTCP:80 -sTCP:LISTEN ###

该命令会输出所用正在使用 **80** 端口的 **进程/服务** 的名称。在 **80** 端口运行下列命令会更好理解这个命令，它会列出所用运行在该端口的 **进程/服务** 。

    root@localhost:/home/avi# lsof -iTCP:80 -sTCP:LISTEN
    COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
    apache2 1566 root 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1664 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1665 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1666 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1667 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)
    apache2 1668 www-data 5u IPv6 5805 0t0 TCP *:www (LISTEN)

同样，你可以检查运行在端口 **22** 的进程/服务。

    root@localhost:/home/avi# lsof -iTCP:22 -sTCP:LISTEN
    COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
    sshd 2261 root 3u IPv4 8366 0t0 TCP *:ssh (LISTEN)
    sshd 2261 root 4u IPv6 8369 0t0 TCP *:ssh (LISTEN)

### 48. find -size +100M ###

这条find命令会在当前目录下列出所有超过指定大小的文件(这里指定为**100 MB**)，递归查询。

    # find -size +100M
    ./.local/share/Trash/files/linuxmint-15-cinnamon-dvd-32bit.iso
    ./Downloads/Fedora-Live-Desktop-i686-19-1.iso
    ./Downloads/Ant Videos/shakira 2.avi
    ./Downloads/Deewar.avi
    ./Desktop/101MSDCF/MOV02224.AVI
    ./Desktop/101MSDCF/MOV02020.AVI
    ./Desktop/101MSDCF/MOV00406.MP4
    ./Desktop/squeeze.iso

在当前目录递归的列出所用大于 **1000 MB** 的文件。

    root@localhost:/home/avi# find -size +1000M
    ./Downloads/The Dark Knight 2008 hindi BRRip 720p/The Dark Knight.mkv.part
    ./Downloads/Saudagar - (1991) - DVDRiP - x264 - AAC 5.1 - Chapters - Esubs - [DDR]/Saudagar 
    - (1991) - DVDRiP - x264 - AAC 5.1 - Chapters - Esubs - [DDR].mkv
    ./Downloads/Deewar.avi
    ./Desktop/squeeze.iso

### 49. pdftk ###

**pdftk**命令用来合并几个pdf文件。你必须安装有 **pdftk** 程序。如果还没有，请用apt或yum来获取相应的包。

    $ pdftk 1.pdf 2.pdf 3.pdf …. 10.pdf cat output merged.pdf

### 50. ps -LF -u user_name ###

该命令会输出一个用户的进程和线程。选项“**L**”（列出线程），选项“**-F**”（完整格式化）

    $ ps -LF -u avi
    avi 21645 3717 21766 0 5 66168 117164 1 18:58 ? 00:00:00 /usr/
    avi 21645 3717 21768 0 5 66168 117164 1 18:58 ? 00:00:00 /usr/
    avi 22314 3717 22314 0 2 42797 50332 0 19:00 ? 00:00:40 /usr/
    avi 22314 3717 22316 0 2 42797 50332 1 19:00 ? 00:00:00 /usr/
    avi 22678 24621 22678 0 1 969 1060 1 21:05 pts/1 00:00:00 ps -L
    avi 23051 3717 23051 0 2 37583 45444 1 19:03 ? 00:00:52 /usr/
    avi 23051 3717 23053 0 2 37583 45444 0 19:03 ? 00:00:03 /usr/
    avi 23652 1 23652 0 2 22092 12520 0 19:06 ? 00:00:22 gnome
    avi 23652 1 23655 0 2 22092 12520 0 19:06 ? 00:00:00 gnome

### 51. startx - :1 ###

分享 **X** 会话。如果你需要频繁的（以不同用户身份）登入或登出桌面时，那就需要 **startx** 来救场。这个命令建立了一个新的会话从而避免了在一个会话中反复的登入和登出。为了在X会话间进行交换，我们可以通过‘**ctrl+Alt+F7**’和‘**ctrl+Alt+F8**’的组合键来完成。

**注意**：快捷键“**ctrl+Alt+F1～F6**“是为了控制台会话准备的，而“**ctrl+Alt+F７～F12**”则为X会话服务。因此我们有**6**个控制台会话和**6**个X会话，不需要频繁的登入登出。上面的顺序适用于大多数的发行版，然而不同发行版可能会有不同的实现。我在Debian中尝试过，运行的很好。

以上就是今天的所有内容。我们如有需要会在以后的文章中继续发布“鲜为人知的命令”，不要忘记留下你对我们文章和‘ **鲜为人知的Linux命令** ’系列的宝贵意见。我会很快带来我的新文章，敬请期待，记得常回来看看哦。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-useful-linux-commands-part-v/ 

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2258-1.html
[2]:http://linux.cn/article-2265-1.html
[3]:http://linux.cn/article-2284-1.html
[4]:http://linux.cn/article-2404-1.html
