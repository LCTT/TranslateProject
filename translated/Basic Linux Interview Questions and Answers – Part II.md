基本的 Linux 面试问题和答案 - 第二部分
================================================================================
继续我们这面试系列，在这篇文章里我们给出了10个问题。这些问题或者是在以后的文章中出现的问题不一定在面试中会被问到。然而通过这些文章我们呈现出的是一个交互的学习平台，这必将会对你有很大的帮助。

![](http://www.tecmint.com/wp-content/uploads/2013/11/Basic-Interview-Questions-2.png)

自本系列的上一篇文章[11个基本的 Linux 面试问题][1]，我们分析了不同论坛对此作出的评论，我们不得不提的是我们很有必要提供优质的文章给我们的读者。我们付出了时间和金钱，那我们又渴望从你们身上得到什么回报呢？答案是没有的。如果你不能赞扬我们的工作，但恳请不要在评论中败坏我们的工作。

如果你在文章中没有找到什么新的东西，但也请不要忘记它对某些人却是非常有用的，并且他或她会非常感激我们的工作。我们不能够让每一篇文章都使大家高兴。但我希望读者们能够尽量理解。

### 问题1：哪一条命令把用户登录会话记录在文件中？ ###

- macro
- read
- script
- record
- sessionrecord

> **答案**：‘script’ 命令是用来把用户登录的会话信息记录在文件里。这条命令能够用在 shell 脚本里面有或者直接在终端中使用。下面是一个例子，它记录了开始用 script 到输入 exit 结束之间的所有东西。

Let’s record the user’s login session with script command as shown.

    [root@tecmint ~]# script my-session-record.txt
    
    Script started, file is my-session-record.txt

The content of log file ‘my-session-record.txt’ can be views as:

    [root@tecmint ~]# nano my-session-record.txt
    
    script started on Friday 22 November 2013 08:19:01 PM IST
    [root@tecmint ~]# ls
    ^[[0m^[[01;34mBinary^[[0m ^[[01;34mDocuments^[[0m ^[[01;34mMusic^[[0m $
    ^[[01;34mDesktop^[[0m ^[[01;34mDownloads^[[0m my-session-record.txt ^[[01;34$

### 问题2：以下那一条命令可以用来查看内核日志信息 ###

- dmesg
- kernel
- ls -i
- uname
- None of the above

> **答案**：执行 'dmesg' 命令可以查看内核的日志信息。在上面的命令中，kernel 不是一个有效的命令，'ls -i' 是用来列出工作目录中文件的索引节点，而 'uname' 是用来显示操作系统。

    [root@tecmint ~]# dmesg
    
    Initializing cgroup subsys cpuset
    Initializing cgroup subsys cpu
    Linux version 2.6.32-279.el6.i686 (mockbuild@c6b9.bsys.dev.centos.org) (gcc version 4.4.6 20120305 (Red Hat 4.4.6-4) (GCC) ) #1 SMP Fri Jun 22 10:59:55 UTC 2012
    KERNEL supported cpus:
      Intel GenuineIntel
      AMD AuthenticAMD
      NSC Geode by NSC
      Cyrix CyrixInstead
      Centaur CentaurHauls
      Transmeta GenuineTMx86
      Transmeta TransmetaCPU
      UMC UMC UMC UMC
    Disabled fast string operations
    BIOS-provided physical RAM map:
    ...

### 问题3：哪一条命令是用来显示 Linux 内核发行信息的？ ###

- uname -v
- uname -r
- uname -m
- uname -n
- uname -o

> **答案**：‘uname -r’是用来显示内核的发行信息。其它参数‘-v’、‘-m’、‘-n’、‘o’分别显示内核版本、机器硬件名称、网络节点、主机名和操作系统。

    [root@tecmint ~]# uname -r
    
    2.6.32-279.el6.i686

### 问题4：那一条命令是被用来识别文件类型的？ ###

- type
- info
- file
- which
- ls

> **答案**：‘file’命令是用来识别文件类型的。其语法是‘file [选项] 文件名’。

    [root@tecmint ~]# file wtop
    
    wtop: POSIX shell script text executable

### 问题5：哪一条命令是被用来找一条命令的二进制文件、源和手册的所在的路径？ ###

> **答案**：‘whereis’驾到！‘whereis’命令是用来找一条命令的二进制文件、源和手册的所在的路径。

    [root@tecmint ~]# whereis /usr/bin/ftp
    
    ftp: /usr/bin/ftp /usr/share/man/man1/ftp.1.gz

### 问题6：当用户登录时，默认情况下哪些文件会被调用作为用户资料？ ###

> **答案**：在用户的目录下‘.profile’和‘.bashrc’会默认地被调用作为用户资料。

    [root@tecmint ~]# ls -al
    -rw-r--r--.  1 tecmint     tecmint            176 May 11  2012 .bash_profile
    -rw-r--r--.  1 tecmint     tecmint            124 May 11  2012 .bashrc

### 问题7：‘resolve.conf’文件是什么的配置文件？ ###

> **答案**：‘/etc/resolve.conf’ 是 DNS 客户端的配置文件。

    [root@tecmint ~]# cat /etc/resolv.conf
    
    nameserver 172.16.16.94

### 问题8：哪一条命令是用来创建一个文件的软链接的？ ###

- ln
- ln -s
- link
- link -soft
- None of the above

> **答案**：在 Linux 环境下，‘ls -s’是被用来创建一个文件的软链接的。

    [root@tecmint ~]# ln -s /etc/httpd/conf/httpd.conf httpd.original.conf

### 问题9：‘pwd’命令是‘passwd’命令的别名吗？ ###

> **答案**：不是！默认情况下‘pwd’命令不是‘passwd’命令的别名。‘pwd’是‘print working directory’的缩写，也就是输出当前的工作目录，而‘passwd’在 Linux 中是被用来更改用户的帐号密码。

    [root@tecmint ~]# pwd
    
    /home/tecmint

    [root@tecmint ~]# passwd
    Changing password for user root.
    New password:
    Retype new password:

### 问题10：在 Linux 中，你会怎样检测 pci 设备的厂商和版本。 ###

> **答案**：我们用的 Linux 命令是‘lspci’。

    [root@tecmint ~]# lspci
    
    00:00.0 Host bridge: Intel Corporation 5000P Chipset Memory Controller Hub (rev b1)
    00:02.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 2-3 (rev b1)
    00:04.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 4-5 (rev b1)
    00:06.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 6-7 (rev b1)
    00:08.0 System peripheral: Intel Corporation 5000 Series Chipset DMA Engine (rev b1)
    ...

现在到此为止。我希望以上的问题对你会有很大的帮助。在下星期我会再想出一些新的问题。到时请保持好的健康，继续关注我们并且与 Tecmint 保持联系喔！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/basic-linux-interview-questions-and-answers-part-ii/

译者：[hyaocuk](https://github.com/hyaocuk) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-linux-interview-questions-and-answers/
