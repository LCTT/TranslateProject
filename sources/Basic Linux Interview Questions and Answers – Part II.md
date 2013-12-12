Basic Linux Interview Questions and Answers – Part II
================================================================================
Continuing the Interview Series, we are giving 10 Questions here, in this article. These questions and the questions in the future articles doesn’t necessarily means they were asked in any interview. We are presenting you an interactive learning platform through these kind of posts, which surely will be helpful.

![](http://www.tecmint.com/wp-content/uploads/2013/11/Basic-Interview-Questions-2.png)

Upon the analysis of comments in different forums on last article [11 Basic Linux Interview Questions][1] of this series, it is important to mention here that to bring up a quality article to our readers. We give our time and money, and in return what we expect from you? Nothing. If you can’t praise our work, please don’t demoralize us from your negative comments.

If you find nothing new in a post, don’t forget that for someone it was helpful, and for that he/she was thankful. We can’t make everyone happy in each of our article. Hope you readers would take pain to understand this.

### Q.1: Which command is used to record a user login session in a file? ###

- macro
- read
- script
- record
- sessionrecord

> **Answer** : The ‘script’ command is used to record a user’s login session in a file. Script command can be implemented in a shell script or can directly be used in terminal. Here is an example which records everything between script and exit.

Let’s record the user’s login session with script command as shown.

    [root@tecmint ~]# script my-session-record.txt
    
    Script started, file is my-session-record.txt

The content of log file ‘my-session-record.txt’ can be views as:

    [root@tecmint ~]# nano my-session-record.txt
    
    script started on Friday 22 November 2013 08:19:01 PM IST
    [root@tecmint ~]# ls
    ^[[0m^[[01;34mBinary^[[0m ^[[01;34mDocuments^[[0m ^[[01;34mMusic^[[0m $
    ^[[01;34mDesktop^[[0m ^[[01;34mDownloads^[[0m my-session-record.txt ^[[01;34$

### Q.2: The kernel log message can be viewed using which of the following command? ###

- dmesg
- kernel
- ls -i
- uname
- None of the above

> **Answer** : The kernel log message can be viewed by executing 'dmesg' command. In the list kernel is not a valid Linux command, 'ls -i' lists the file with inode within the working directory and 'uname' command shows os.

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

### Q.3: Which command is used to display the release of Linux Kernel? ###

- uname -v
- uname -r
- uname -m
- uname -n
- uname -o

> **Answer** : The command ‘uname -r’ display the kernel release information. The switch ‘-v’ , ‘-m’ , ‘-n’ , ‘o’ display kernel version, machine hardware name, network node, hostname and operating system, respectively.

    [root@tecmint ~]# uname -r
    
    2.6.32-279.el6.i686

### Q.4: Which command is used to identify the types of file? ###

- type
- info
- file
- which
- ls

> **Answer** : The ‘file’ command is used to identify the types of file. The syntax is ‘file [option] File_name’.

    [root@tecmint ~]# file wtop
    
    wtop: POSIX shell script text executable

### Q.5: Which command locate the binary, source and man page of a command? ###

> **Answer** : The ‘whereis’ command comes to rescue here. The ‘whereis’ command locate the binary, source, and manual page files for a command.

    [root@tecmint ~]# whereis /usr/bin/ftp
    
    ftp: /usr/bin/ftp /usr/share/man/man1/ftp.1.gz

### Q.6: When a user login, which files are called for user profile, by default?? ###

> **Answer** : The ‘.profile’ and ‘.bashrc’ present under home directory are called for user profile by default.

    [root@tecmint ~]# ls -al
    -rw-r--r--.  1 tecmint     tecmint            176 May 11  2012 .bash_profile
    -rw-r--r--.  1 tecmint     tecmint            124 May 11  2012 .bashrc

###  ###Q.7: The ‘resolve.conf’ file is a configuration file for?

> **Answer** : The ‘/etc/resolve.conf’ is the configuration file for DNS at client side.

    [root@tecmint ~]# cat /etc/resolv.conf
    
    nameserver 172.16.16.94

### Q.8: Which command is used to create soft link of a file? ###

- ln
- ln -s
- link
- link -soft
- None of the above

> **Answer** : The ‘ln -s’ command is used to create soft link of a file in Linux Environment.

    [root@tecmint ~]# ln -s /etc/httpd/conf/httpd.conf httpd.original.conf

### Q.9: The command ‘pwd’ is an alias of command ‘passwd’ in Linux? ###

> **Answer** : No! The command ‘pwd’ is not an alias of command ‘passwd’ by default. ‘pwd’ stands for ‘print working directory’, which shows current directory and ‘passwd is used to change the password of user account in Linux.

    [root@tecmint ~]# pwd
    
    /home/tecmint

    [root@tecmint ~]# passwd
    Changing password for user root.
    New password:
    Retype new password:

### Q.10: How will you check pci devices vendor and version on a Linux? ###

> **Answer** : The Linux command ‘lspci’ comes to rescue here.

    [root@tecmint ~]# lspci
    
    00:00.0 Host bridge: Intel Corporation 5000P Chipset Memory Controller Hub (rev b1)
    00:02.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 2-3 (rev b1)
    00:04.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 4-5 (rev b1)
    00:06.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 6-7 (rev b1)
    00:08.0 System peripheral: Intel Corporation 5000 Series Chipset DMA Engine (rev b1)
    ...

That’s all for now. I hope these above questions might be very helpful to you. In our next weekend we again come-up with some new set of questions. Till then stay healthy, tuned and connected to Tecmint.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/basic-linux-interview-questions-and-answers-part-ii/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-linux-interview-questions-and-answers/