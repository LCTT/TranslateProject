# 如何在 Linux/Unix/Windows 中发现隐藏的进程和端口


unhide 是一个小巧的网络取证工具，能够发现那些借助 rootkits,LKM 等其他技术隐藏的进程和 TCP/UDP 端口。这个工具在 Linux,unix-like,Windows 等操作系统下都可以工作。根据其 man 页面的说明：

> Unhide 通过下述三项技术来发现隐藏的进程。
> 	1. 进程相关的技术，包括将 /proc 目录与 /bin/ps  命令的输出进行比较。
> 	2. 系统相关的技术，包括将 ps 命令的输出结果同从系统调用方面得到的信息进行比较。
> 	3. 穷举法相关的技术，包括对所有的进程 ID 进行暴力求解，该技术仅限于在基于 Linux2.6 内核的系统中使用。

绝大多数的 Rootkits 工具或者恶意软件借助内核来实现进程隐藏，这些进程只在内核内部可见。你可以使用 unhide 或者诸如 rkhunter 等工具，扫描 rootkit 程序，后门程序以及一些可能存在的本地漏洞。

![本文讲解如何在多个操作系统下安装和使用unhide][1]
如何安装 unhide
-----------

这里首先建议你在只读介质上运行这个工具。如果使用的是 Ubuntu 或者 Debian 发行版，输入下述的 apt-get/apt 命令以安装 Unhide：`$ sudo apt-get install unhide` 一切顺利的话你的命令行会输出以下内容：

    [sudo] password for vivek: 
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    Suggested packages:
      rkhunter
    The following NEW packages will be installed:
      unhide
    0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    Need to get 46.6 kB of archives.
    After this operation, 136 kB of additional disk space will be used.
    Get:1 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 unhide amd64 20130526-1 [46.6 kB]
    Fetched 46.6 kB in 0s (49.0 kB/s)
    Selecting previously unselected package unhide.
    (Reading database ... 205367 files and directories currently installed.)
    Preparing to unpack .../unhide_20130526-1_amd64.deb ...
    Unpacking unhide (20130526-1) ...
    Setting up unhide (20130526-1) ...
    Processing triggers for man-db (2.7.6.1-2) ...

如何在RHEL/CentOS/Oracle/Scientific/Fedora上安装 unhide
------------------------------------------------------------------

你可以使用以下的 yum 命令：

    `Sudo yum install unhide` 

在 Fedora 上则使用以下 dnf 命令：

    Sudo dnf install unhide.

如何在 Arch 上安装 unhide
-------------------

    键入以下 pacman 命令安装 $ sudo pacman -S unhide

如何在 FreeBSD 上安装 unhide
----------------------

可以通过以下的命令使用 port 来安装 unhide

    # cd /usr/ports/security/unhide/
    # make install clean

或者可以通过二进制文件安装hide，使用 pkg 命令安装

    # pkg install unhide 

Unhide-tcp 取证工具通过对所有可用的 TCP/IP 端口进行暴力求解的方式，辨别所有正在监听，却没有列入 /bin/netstat  或者  /bin/ss command  目录的 TCP/IP 端口身份。

如何使用 unhide 工具？
---------------

Unhide 的语法是 `unhide [options] test_list` test_list 参数可以是以下测试列表中的一个或者多个标准测试：
	

        1. Brute 
        2. proc
        3. procall
        4. procfs
        5. quick
        6. reverse
        7. sys

基本测试：

        1. checkbrute
        2. checkchdir
        3. checkgetaffinity
        4. checkgetparam
        5. checkgetpgid
        6. checkgetprio
        7. checkRRgetinterval
        8. checkgetsched
        9. checkgetsid
        10. checkkill
        11. checknoprocps
        12. checkopendir
        13. checkproc
        14. checkquick
        15. checkreaddir
        16. checkreverse
        17. checksysinfo
        18. checksysinfo2
        19. checksysinfo3

你可以通过以下示例命令使用 unhide：

    # unhide proc
    # unhide sys
    # unhide quick

示例输出：

    Unhide 20130526
    Copyright © 2013 Yago Jesus & Patrick Gouin
    License GPLv3+ : GNU GPL version 3 or later
    http://www.unhide-forensics.info
     
    NOTE : This version of unhide is for systems using Linux >= 2.6 
     
    Used options: 
    [*]Searching for Hidden processes through  comparison of results of system calls, proc, dir and ps

如何使用 unhide-tcp 工具辨明 TCP/UDP 端口的身份
----------------------------------

以下是来自 man 页面的介绍

> unhide-tcp is a forensic tool that identifies TCP/UDP ports that are
> listening but are not listed by /sbin/ss (or alternatively by
> /bin/netstat) through brute forcing of all TCP/UDP ports available.
> Note1 : On FreeBSD ans OpenBSD, netstat is allways used as iproute2
> doesn't exist on these OS. In addition, on FreeBSD, sockstat is used
> instead of fuser. Note2 : If iproute2 is not available on the system,
> option -n or -s SHOULD be given on the command line.

Unhide-tcp 取证工具,通过对所有可用的 TCP/IP 端口进行暴力求解的方式，辨别所有正在监听，却没有列入 /bin/netstat  或者  /bin/ss command  目录的 TCP/IP 端口身份。请注意：对于 FreeBSD，OpenBSD系统，一般使用 iproute2,fuser 命令取代在这些操作系统上不存在的 netstat,sockstat 命令。请注意 2：如果操作系统不支持 iproute2 命令，在使用 unhide 时需要在命令上加上 -n 或者 -s 选项。

    # `unhide-tcp`

示例输出:

    Unhide 20100201
    http://www.security-projects.com/?Unhide
    Starting TCP checking
    Starting UDP checking

上述操作中，没有发现隐藏的端口。但在下述示例中，我展示了一些有趣的事。

    # `unhide-tcp` 

示例输出:

    Unhide 20100201
    http://www.security-projects.com/?Unhide
    Starting TCP checking
    Found Hidden port that not appears in netstat: 1048
    Found Hidden port that not appears in netstat: 1049
    Found Hidden port that not appears in netstat: 1050
    Starting UDP checking

可以看到 netstat -tulpn 和 ss commands 命令确实没有反映出这三个隐藏的端口

    # netstat -tulpn | grep 1048
    # ss -lp
    # ss -l | grep 1048

通过下述的 man 命令可以更多地了解unhide

    $ man unhide
    $ man unhide-tcp

Windows 用户如何安装使用 unhide
---------------------
你可以通过这个[页面][2]获取 Windows 版本的 unhide

via: https://www.cyberciti.biz/tips/linux-unix-windows-find-hidden-processes-tcp-udp-ports.html
作者：Vivek Gite 译者：[ljgibbs][3] 校对：校对者ID
本文由 LCTT 原创编译，Linux中国 荣誉推出!


  [1]: https://camo.githubusercontent.com/51ee31c20a799512dcd09d88cacbe8dd04731529/68747470733a2f2f7777772e6379626572636974692e62697a2f746970732f77702d636f6e74656e742f75706c6f6164732f323031312f31312f4c696e75782d467265654253442d556e69782d57696e646f77732d46696e642d48696464656e2d50726f636573732d506f7274732e6a7067
  [2]: http://www.unhide-forensics.info/?Windows:Download
  [3]: https://github.com/ljgibbslf
