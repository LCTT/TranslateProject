Linux / Unix：chroot 命令实例讲解
================================================================================
> 我是一个刚接触 Linux 和 Unix 的新手。我该如何改变一个命令的根目录？我要怎样改变一个进程的根目录呢，比如用 chroot 命令将web服务与文件系统隔离？我要如何使用 chroot 恢复密码或修复基于 Linux/Unix的受损坏的环境？

![](http://s0.cyberciti.org/uploads/faq/2014/02/chroot-command.jpg)

在 Linux和类 Unix 系统下每一个进程/命令的当前工作目录称之为进程/命令的根目录（译注：译者以为此处有误，实际上没有进行过chroot的进程，其根目录是系统的根目录，而不是其工作目录）。你可以使用 chroot 命令改变一个命令的根目录，这最终将会改变当前运行的进程及其子进程的根目录。

如果一个进程/命令运行在一个不能访问外部根目录文件的已修改环境中。这种修改环境通常被称为"监禁目录"（jail）或是"chroot 监禁"。只有特权进程和根用户才能使用 chroot 命令。然而这通常是很有用的：

1. 将特权分配给无特权的进程，例如 Web 服务或 DNS 服务。
1. 建立测试环境。
1. 不使程序或系统崩溃下，运行旧程序或 ABI 兼容的程序。
1. 系统恢复。
1. 重新安装引导装载程序，例如 Grub 或 Lilo。
1. 密码找回，重置一个已丢失的密码等。

### 用途 ###

> chroot 命令 **改变其当前目录，并将根目录变为指定目录,然后如果提供了命令则运行命令**，也可以运行一个用户的交互式shell的副本（译注：即bash等。）。请注意并不是每一个程序都可以使用 chroot 命令。

### 语法 ###

基本语法如下：

    chroot /path/to/new/root command

或者

    chroot /path/to/new/root /path/to/server

或者

    chroot [options] /path/to/new/root /path/to/server

#### chroot 命令实例 ####

在这个例子中，建立了一个"迷你监狱"用来测试一个只有 ls 命令的 Bash shell。首先用 mkdir 命令设定好 jail "监狱" 路径。 

    $ J=$HOME/jail

在 $J 内创建目录：

    $ mkdir -p $J
    $ mkdir -p $J/{bin,lib64,lib}
    $ cd $J

用[cp 命令][1]将/bin/bash 和 /bin/ls 复制到 $J/bin/ 路径下：

    $ cp -v /bin/{bash,ls} $J/bin

将所需库文件拷贝到$J。可以用 ldd 命令找到 bash 所依赖的共享库。

    $ ldd /bin/bash

输出样例：

    linux-vdso.so.1 =>  (0x00007fff8d987000)
    libtinfo.so.5 => /lib64/libtinfo.so.5 (0x00000032f7a00000)
    libdl.so.2 => /lib64/libdl.so.2 (0x00000032f6e00000)
    libc.so.6 => /lib64/libc.so.6 (0x00000032f7200000)
    /lib64/ld-linux-x86-64.so.2 (0x00000032f6a00000)

直接拷贝上面输出中的库文件到 $J 目录：

    $ cp -v /lib64/libtinfo.so.5 /lib64/libdl.so.2 /lib64/libc.so.6 /lib64/ld-linux-x86-64.so.2 $J/lib64/

输出样例：

    `/lib64/libtinfo.so.5' -> `/home/vivek/jail/lib64/libtinfo.so.5'
    `/lib64/libdl.so.2' -> `/home/vivek/jail/lib64/libdl.so.2'
    `/lib64/libc.so.6' -> `/home/vivek/jail/lib64/libc.so.6'
    `/lib64/ld-linux-x86-64.so.2' -> `/home/vivek/jail/lib64/ld-linux-x86-64.so.2'

复制 ls 命令所需的库文件到 $J 目录下。用 ldd 命令打印出 ls 命令依赖的共享库：

    $ ldd /bin/ls

输出样例：

    linux-vdso.so.1 =>  (0x00007fff68dff000)
    libselinux.so.1 => /lib64/libselinux.so.1 (0x00000032f8a00000)
    librt.so.1 => /lib64/librt.so.1 (0x00000032f7a00000)
    libcap.so.2 => /lib64/libcap.so.2 (0x00000032fda00000)
    libacl.so.1 => /lib64/libacl.so.1 (0x00000032fbe00000)
    libc.so.6 => /lib64/libc.so.6 (0x00000032f7200000)
    libdl.so.2 => /lib64/libdl.so.2 (0x00000032f6e00000)
    /lib64/ld-linux-x86-64.so.2 (0x00000032f6a00000)
    libpthread.so.0 => /lib64/libpthread.so.0 (0x00000032f7600000)
    libattr.so.1 => /lib64/libattr.so.1 (0x00000032f9600000)

你可以一个个的复制库文件，为了更高效的作业，我们也可以使用[bash shell 的循环指令][2]实现：

    list="$(ldd /bin/ls | egrep -o '/lib.*\.[0-9]')"
    for i in $list; do cp  -v "$i" "${J}${i}"; done

输出样例：

    `/lib64/libselinux.so.1' -> `/home/vivek/jail/lib64/libselinux.so.1'
    `/lib64/librt.so.1' -> `/home/vivek/jail/lib64/librt.so.1'
    `/lib64/libcap.so.2' -> `/home/vivek/jail/lib64/libcap.so.2'
    `/lib64/libacl.so.1' -> `/home/vivek/jail/lib64/libacl.so.1'
    `/lib64/libc.so.6' -> `/home/vivek/jail/lib64/libc.so.6'
    `/lib64/libdl.so.2' -> `/home/vivek/jail/lib64/libdl.so.2'
    `/lib64/ld-linux-x86-64.so.2' -> `/home/vivek/jail/lib64/ld-linux-x86-64.so.2'
    `/lib64/libpthread.so.0' -> `/home/vivek/jail/lib64/libpthread.so.0'
    `/lib64/libattr.so.1' -> `/home/vivek/jail/lib64/libattr.so.1'

最后，chroot 到你的新jail：

    $ sudo chroot $J /bin/bash

尝试浏览一下 /etc 或 /var：

    # ls /
    # ls /etc/
    # ls /var/

改变了根目录的 bash 和 ls 程序现在被监禁在$HOME/$J这个特殊目录中，而且不能再访问外部的目录树，这个目录可以看做是它们的"/"(root)目录。如果配置正确的话,这会极大增强安全性。我通常用这种技术锁定以下的应用程序。

1. [Apache - Red Hat / CentOS: Chroot Apache 2 Web Server][3]
1. [Nginx - Linux nginx: Chroot (Jail) Setup][4]
1. [Chroot Lighttpd web server on a Linux based system][5]
1. Chroot mail server.
1. Chroot Bind DNS server 等等

### 如何退出 chroot 监禁呢？ ###

键入 exit 即可

    $ exit

上述会话样例如下：

[![Animated gif 01: Linux / Unix: Bash Chroot ls Command Demo](http://s0.cyberciti.org/uploads/faq/2013/01/bash-chroot-ls-demo.gif)][6]

Gif 动画01: Linux / Unix: Bash Chroot ls 命令演示 

### 查找服务是否存在于 chrooted 监禁内###

你可以用下面两个命令[轻松的找出 Postfix 邮件服务是否已经 chrooted]：

    pid=$(pidof -s master)
    ls -ld /proc/$pid/root

从基本Linux服务中输出样例：

    lrwxrwxrwx. 1 root root 0 Mar  9 11:16 /proc/8613/root -> /

PID 8613 指向了 / (root) 也就是说这个程序的根目录并没有被改变或是被 chroot。这个方法非常的快速而又直接，不需要打开配置文件。下面是从已经 chroot 的 ngnix 服务中得到的另一个例子：

    pid=$(pidof -s master)
    ls -ld /proc/$pid/root

输出样例：

    lrwxrwxrwx 1 nginx nginx 0 Mar  9 11:17 /proc/4233/root -> /nginxjail

程序的根目录已经改为 /nginxjail。

### 用 chroot 救援和修复软件RAID(磁盘阵列)系统 ###

我先假设基于软RAID的 Linux 系统无法正常启动。所以你[需要用Live CD或用基于网络的内核应急模式][8]来修复系统。在这个例子中，我用了 Live Linux DVD/CD 启动一个基于 RHEL 的系统，然后再 chroot 到 /dev/sda1 和 /或 /dev/md0 修复问题：

    ## 在 Live CD 的提示符下，键入以下命令来恢复数据。##
    ## /dev/sda1 系统主分区##
    # 建立 jail 目录
    d=/chroot
    mkdir $d
 
    # 挂载 sda1 和其他所需目录
    mount /dev/sda1 $d
    mount -o bind /dev $d/dev
    mount -o bind /sys $d/sys
    mount -o bind /dev/shm $d/dev/shm
    mount -o bind /proc $d/proc
 
    # 挂载软件RAID /dev/md0
    mount /dev/md0 $d/data
 
    # Chroot 到我们新建的 jail 中。这将允许我们修复引导装载系统(bootloader)，或者在所有文件被/dev/null吞噬之前抓取数据。
    chroot $d
 
    #你能看见吗？
    ls
    df
 
    # 将文件置入安全路径
    rsync -avr /path/to/my_precious_data_dir user@safe.location.cyberciti.biz:/path/to/dest
	
    # 退出 jail ,然后重启或者根据个人所需格式化服务 ;)
    exit
    umount {dev,sys,[...],}
    reboot

**别急，还有更精彩的内容！**

查看nixCraft下所有其他有关 chroot 命令的文章：

1. [Ubuntu: Mount Encrypted Home Directory (~/.private) From an Ubuntu Live CD][9]
1. [Linux Configure rssh Chroot Jail To Lock Users To Their Home Directories Only][10]
1. [Fix a dual boot MS-Windows XP/Vista/7/Server and Linux problem][11]
1. [Restore Debian Linux Grub boot loader][12]

### 在 Linux 和 类Unix 系统下 chroot 应用程序的注意事项 ###

你应该在各种情况下都用 chroot 特性吗？从上面的例子看出，这个程序是相当简单的，但是最终可能出现几种不同的问题而结束，例如：

1.在 jail 中缺失库文件可能直接导致 jail 崩溃。 
1.一些复杂的程序不好被 chroot。所以我建议你要么尝试[真正的jail，例如FreeBSD提供的][13]，要么用虚拟化解决，比如[Linux 下的 KVM][14]。
1.正在运行某一程序的 jail 不能再运行其他程序，不能更改任何文件，也不能"假设"另一个用户的身份。放宽这些限制，会降低你的安全性，请根据具体情况 chroot。

还要注意：

1. 当你升级本地程序时，不要忘记升级已 chroot 的程序。
1. 并非所有程序能够或者应该被 chroot。
1. 任何需要 root 权限操作的程序，对其 chroot 是没意义的。因为通常 root 用户都能脱离 chroot。 
1. Chroot 并不一个高招。更多的可以学习[如何保护和加强系统的各个部分][15]

### choort 部分命令选项 ###

取自 man 帮助页面[chroot(8)][16]:

      --userspec=USER:GROUP  使用指定的 用户 和 组 (ID 或 名称)
      --groups=G_LIST        指定补充组 g1,g2,..,gN 
          --help     显示帮助并退出
          --version  显示版本信息并退出

### 参见 ###

- [chroot(8) Linux/Unix 命令 man 页面][17]
- [Man页面  chroot(2)][18]
- [OpenBSD文档参见Apache chrooting FAQ 提取更多信息][19]

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/unix-linux-chroot-command-examples-usage-syntax/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/cp-copy-command-in-unix-examples/
[2]:http://www.cyberciti.biz/faq/bash-for-loop/
[3]:http://www.cyberciti.biz/tips/chroot-apache-under-rhel-fedora-centos-linux.html
[4]:http://www.cyberciti.biz/faq/howto-run-nginx-in-a-chroot-jail/
[5]:http://www.cyberciti.biz/tips/howto-setup-lighttpd-php-mysql-chrooted-jail.html
[6]:http://www.cyberciti.biz/faq/?attachment_id=28148
[7]:http://www.cyberciti.biz/tips/linux-chroot-service.html
[8]:http://www.cyberciti.biz/faq/centos-rhel-linux-mount-raid-hard-disk-from-livecd/
[9]:http://www.cyberciti.biz/faq/ubuntu-mounting-your-encrypted-home-from-livecd/
[10]:http://www.cyberciti.biz/tips/howto-linux-unix-rssh-chroot-jail-setup.html
[11]:http://www.cyberciti.biz/tips/howto-fix-dual-boot-windows-vista-linux.html
[12]:http://www.cyberciti.biz/tips/restore-debian-linux-grub-boot-loader.html
[13]:http://www.cyberciti.biz/faq/how-to-upgrade-freebsd-jail-vps/
[14]:http://www.cyberciti.biz/faq/kvm-virtualization-in-redhat-centos-scientific-linux-6/
[15]:http://www.cyberciti.biz/tips/linux-security.html
[16]:http://www.manpager.com/linux/man8/chroot.8.html
[17]:http://www.manpager.com/linux/man8/chroot.8.html
[18]:http://www.manpager.com/linux/man2/chroot.2.html
[19]:http://www.openbsd.org/faq/
