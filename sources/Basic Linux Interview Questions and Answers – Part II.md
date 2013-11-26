[doing] stduolc
Linux面试基础问题及答案 - 第二节
================================================================================
继续面试系列！在这个章节，我们接下来将给出10个问题。这些问题，以及未来文章里的问题并一定是真正的面试题。通过这样文章，我们为您提供了一个交互式的学习平台。这必定对您的学习过程有所帮助。

![](http://www.tecmint.com/wp-content/uploads/2013/11/Basic-Interview-Questions-2.png)

关于系列上一篇文章【11 Basic Linux Interview Questions】，分析了不同论坛的大量评论，这里需要说明的是为我们的读者提供高质量的文章十分重要。我们付出了我们的时间和金钱，我们希望从读者获得什么呢？什么也没有。如果你不赞赏我们的工作，请不要用你的负面言论来伤害我们的热情。

如果你在帖子中没有发现什么新的东西，请别忘了对于某些人来说这些内容还是很有帮助的，他/她将对这些内容表示感谢。在每一篇文章中，我们不可能让每个人满意。希望你的读者能够感受到其中的痛苦，理解几分无奈。

### Q.1：下面哪一个命令是用来将用户登录的session记录在一个文件里的？ ###
- macro
- read
- script
- record
- sessionrecord

>**答案** :　命令‘script’是用来将用户登录session记录在一个文件里的。Script命令可以在shell脚本中执行，也可直接在终端中执行。以下是一个例子，记录了script输入以后到退出的所有的内容。

如同下面的示例，我们通过script命令来记录用户登录的session。

    [root@tecmint ~]# script my-session-record.txt
    
    Script started, file is my-session-record.txt

日志文件'my-session-record.txt'可以用如下方式查看：

    [root@tecmint ~]# nano my-session-record.txt
    
    script started on Friday 22 November 2013 08:19:01 PM IST
    [root@tecmint ~]# ls
    ^[[0m^[[01;34mBinary^[[0m ^[[01;34mDocuments^[[0m ^[[01;34mMusic^[[0m $
    ^[[01;34mDesktop^[[0m ^[[01;34mDownloads^[[0m my-session-record.txt ^[[01;34$

###  Q.2: 内核的日志消息可以通过下面的那个命令查看？ ###

- dmesg
- kernel
- ls -i
- uname
- None of the above

> **答案** : 内核日志消息可以通过执行'dmesg'命令来查看。选项中的'kernel'并不是一个linux的命令。'ls -i'命令列出了工作目录下的文件以及文件的inode信息，'uname'命令显示了操作系统的信息。

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

###  Q.3 : 下面的哪个命令被用来展示用户的linux内核发行版本号？ ###

- uname -v
- uname -r
- uname -m
- uname -n
- uname -o

> **答案** ： 命令'uname -r'显示了内核的发行版本。选项'-v', '-m', '-n', 'o'分别显示了内核的版本，机器硬件架构， 网络节点， 域名和操作系统。

    [root@tecmint ~]# uname -r
    
    2.6.32-279.el6.i686

###  Q.4: 下面那个命令被用来识别文件的类型？ ###

- type
- info
- file
- which
- ls

> **答案** : 命令'file'是用来识别文件的类型的。语法是‘file [option] File_name’。

    [root@tecmint ~]# file wtop
    
    wtop: POSIX shell script text executable

	
### Q.5：哪一个命令可以定位二进制文件，源码和手册页？ ###

> **答案** : 命令'whereis'可以解决这个问题。'whereis'命令可以定位二进制文件，源码和手册页。

    [root@tecmint ~]# whereis /usr/bin/ftp
    
    ftp: /usr/bin/ftp /usr/share/man/man1/ftp.1.gz

### Q.6: 当用户登录时，默认情况下哪一些文件被当作用户资料被调用？ ###

> **答案** ：在当前用户目录下的‘.profile’和‘.bashrc’文件，默认被当作用户资料被调用。

    [root@tecmint ~]# ls -al
    -rw-r--r--.  1 tecmint     tecmint            176 May 11  2012 .bash_profile
    -rw-r--r--.  1 tecmint     tecmint            124 May 11  2012 .bashrc

### Q.7: 文件‘resolve.conf’是什么配置文件？ ###

> **答案** : 文件‘/etc/resolve.conf’默认是客户端的DNS服务器配置文件。

    [root@tecmint ~]# cat /etc/resolv.conf
    
    nameserver 172.16.16.94

### Q.8: 哪一个命令被用作建立文件的软链接？###

- ln
- ln -s
- link
- link -soft
- None of the above

> **答案** : 在linux环境中，‘ln -s’命令被用作建立文件的软链接。

    [root@tecmint ~]# ln -s /etc/httpd/conf/httpd.conf httpd.original.conf

### Q.9: 命令'pwd'是'passwd'的别名么？ ###

> **答案** : 不！命令'pwd'不是'passwd'的默认别名。'pwd'代表‘print working directory’, 用来显示当前的工作目录。'passwd'是用来更改linux用户密码的命令。

    [root@tecmint ~]# pwd
    
    /home/tecmint

    [root@tecmint ~]# passwd
    Changing password for user root.
    New password:
    Retype new password:

### Q.10：你如何在linux系统上查看一个pci硬件的供应商和版本？ ###

> **答案** ： linux命令'lspci'能达到这个作用。

    [root@tecmint ~]# lspci
    
    00:00.0 Host bridge: Intel Corporation 5000P Chipset Memory Controller Hub (rev b1)
    00:02.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 2-3 (rev b1)
    00:04.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 4-5 (rev b1)
    00:06.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 6-7 (rev b1)
    00:08.0 System peripheral: Intel Corporation 5000 Series Chipset DMA Engine (rev b1)
    ...

这就是今天的全部内容了。我希望上面的问题能对您有所帮助。在下一周，我们将进一步学习新的问题。???Till then stay healthy, tuned and connected to Tecmint.???

--------------------------------------------------------------------------------

via: http://www.tecmint.com/basic-linux-interview-questions-and-answers-part-ii/

译者：[stduolc](https://github.com/stduolc) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-linux-interview-questions-and-answers/