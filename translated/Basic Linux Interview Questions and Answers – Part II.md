Basic Linux Interview Questions and Answers – Part II
================================================================================
基础的Linux面试问题与答案-第二部分

Continuing the Interview Series, we are giving 10 Questions here, in this article. These questions and the questions in the future articles doesn’t necessarily means they were asked in any interview. We are presenting you an interactive learning platform through these kind of posts, which surely will be helpful.
继续面试续剧，在此篇文章中我们给出了10个问题。这些问题以及在将来文章中讨论的问题并不保证他们会在任何面试中被问到。我们通过这种类型的帖子给您展示一个交互学习的平台，对于将来肯定是有帮助的。
![](http://www.tecmint.com/wp-content/uploads/2013/11/Basic-Interview-Questions-2.png)

Upon the analysis of comments in different forums on last article [11 Basic Linux Interview Questions][1] of this series, it is important to mention here that to bring up a quality article to our readers. We give our time and money, and in return what we expect from you? Nothing. If you can’t praise our work, please don’t demoralize us from your negative comments.

在面试系列中的上篇文章中提到了分析不同论坛的评论时，有一点值得注意的地方就是为你的读者提供有质量的文章。我们付出了我们的时间和金钱，但是我们期望从你们那里得到什么回报呢？什么也没有。如果你不能满意我们的工作，也请不要让你的负面评论来打击我们的积极性。
If you find nothing new in a post, don’t forget that for someone it was helpful, and for that he/she was thankful. We can’t make everyone happy in each of our article. Hope you readers would take pain to understand this.
假如你没有在帖子中找到任何的新东西，不要忘了这也许对于某些人很有帮助，这会使得他(她)会很感谢。我们不能让每篇文章能够取悦所有人。希望你们读者朋友们能够在痛苦中来明白这些。

### Q.1: Which command is used to record a user login session in a file? ###
问题1：那个命令是用来在文件中记录用户的登录会话的？
- macro
- read
- script
- record
- sessionrecord

> **Answer** : The ‘script’ command is used to record a user’s login session in a file. Script command can be implemented in a shell script or can directly be used in terminal. Here is an example which records everything between script and exit.
答案是：script，这个命令被用来在文件中记录一个用户的登录会话的，script命令可以在shell脚本实现或直接在终端使用。这里就是一个记录了在script和exit之间所有事物的样例。
Let’s record the user’s login session with script command as shown.
一起使用下面的提示来使用script命令记录用户的会话吧。
    [root@tecmint ~]# script my-session-record.txt
    
    Script started, file is my-session-record.txt

The content of log file ‘my-session-record.txt’ can be views as:

    [root@tecmint ~]# nano my-session-record.txt
    
    script started on Friday 22 November 2013 08:19:01 PM IST
    [root@tecmint ~]# ls
    ^[[0m^[[01;34mBinary^[[0m ^[[01;34mDocuments^[[0m ^[[01;34mMusic^[[0m $
    ^[[01;34mDesktop^[[0m ^[[01;34mDownloads^[[0m my-session-record.txt ^[[01;34$

### Q.2: The kernel log message can be viewed using which of the following command? ###
问题2：内核的日记消息可以通过以下那个命令来察看。
- dmesg
- kernel
- ls -i
- uname
- None of the above

> **Answer** : The kernel log message can be viewed by executing 'dmesg' command. In the list kernel is not a valid Linux command, 'ls -i' lists the file with inode within the working directory and 'uname' command shows os.
答案是：dmesg,内核日志文件可以通过执行'dmesg'命令来进行察看，在上面的答案列表中,kernel不是一个有效的linux命令，‘ls -i'列出工作目录下的所有文件和其索引节点，'uname'命令显示操作系统名称
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
问题3：那个命令是用来显示Linux内核的发行版本信息的？
- uname -v
- uname -r
- uname -m
- uname -n
- uname -o

> **Answer** : The command ‘uname -r’ display the kernel release information. The switch ‘-v’ , ‘-m’ , ‘-n’ , ‘o’ display kernel version, machine hardware name, network node, hostname and operating system, respectively.
答案是'uname -r'命令用来显示内核发行版本信息的。其他的选项'-v','-m','-n','-o'分别显示内核版本信息，及其硬件名称，网络节点，主机以及操作系统。
    [root@tecmint ~]# uname -r
    
    2.6.32-279.el6.i686

### Q.4: Which command is used to identify the types of file? ###
问题4：那个命令用来识别文件的类型？
- type
- info
- file
- which
- ls

> **Answer** : The ‘file’ command is used to identify the types of file. The syntax is ‘file [option] File_name’.
答案是：'file'命令使用来识别文件类型的，其语法为'file [option] 文件名'
    [root@tecmint ~]# file wtop
    
    wtop: POSIX shell script text executable

### Q.5: Which command locate the binary, source and man page of a command? ###
问题5：哪个命令查找一个命令的二进制文件，源文件和man页面的？
> **Answer** : The ‘whereis’ command comes to rescue here. The ‘whereis’ command locate the binary, source, and manual page files for a command.
答案是：'whereis'命令可以解决这个问题，’whereis‘命令查找一个命令的二进制文件，源文件和man帮助页面文件。
    [root@tecmint ~]# whereis /usr/bin/ftp
    
    ftp: /usr/bin/ftp /usr/share/man/man1/ftp.1.gz

### Q.6: When a user login, which files are called for user profile, by default?? ###
问题6：当一个用户登录时，哪个文件默认被用作为用户属性的？
> **Answer** : The ‘.profile’ and ‘.bashrc’ present under home directory are called for user profile by default.
答案是:用户home目录下的'.profile'和'.bashrc'默认作为用户的属性。
    [root@tecmint ~]# ls -al
    -rw-r--r--.  1 tecmint     tecmint            176 May 11  2012 .bash_profile
    -rw-r--r--.  1 tecmint     tecmint            124 May 11  2012 .bashrc

###  ###Q.7: The ‘resolve.conf’ file is a configuration file for?
问题7：文件'resolve.conf'是什么的配置文件？
> **Answer** : The ‘/etc/resolve.conf’ is the configuration file for DNS at client side.
答案是：文件'/etc/resolve.conf'是用来在客户端配置DNS的
    [root@tecmint ~]# cat /etc/resolv.conf
    
    nameserver 172.16.16.94

### Q.8: Which command is used to create soft link of a file? ###
问题8：哪个命令被用来创建一个文件的软链接？
- ln
- ln -s
- link
- link -soft
- None of the above

> **Answer** : The ‘ln -s’ command is used to create soft link of a file in Linux Environment.
答案是：’ln -s‘命令在linux环境下被用来创建一个文件的软链接。
    [root@tecmint ~]# ln -s /etc/httpd/conf/httpd.conf httpd.original.conf

### Q.9: The command ‘pwd’ is an alias of command ‘passwd’ in Linux? ###
问题9：Linux中的’pwd‘命令是'passwd'命令的别名吗？
> **Answer** : No! The command ‘pwd’ is not an alias of command ‘passwd’ by default. ‘pwd’ stands for ‘print working directory’, which shows current directory and ‘passwd is used to change the password of user account in Linux.
答案是：’不是的‘,'pwd'命令表示’打印工作目录‘-用来现实当前目录的，而'passwd'命令是用来修改linux用户的密码的。
    [root@tecmint ~]# pwd
    
    /home/tecmint

    [root@tecmint ~]# passwd
    Changing password for user root.
    New password:
    Retype new password:

### Q.10: How will you check pci devices vendor and version on a Linux? ###
问题10：在linux中，你会如何检查PCI设备的供应商以及版本的？
> **Answer** : The Linux command ‘lspci’ comes to rescue here.
答案是:'lspci'命令可以解决这个问题。
    [root@tecmint ~]# lspci
    
    00:00.0 Host bridge: Intel Corporation 5000P Chipset Memory Controller Hub (rev b1)
    00:02.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 2-3 (rev b1)
    00:04.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 4-5 (rev b1)
    00:06.0 PCI bridge: Intel Corporation 5000 Series Chipset PCI Express x8 Port 6-7 (rev b1)
    00:08.0 System peripheral: Intel Corporation 5000 Series Chipset DMA Engine (rev b1)
    ...

That’s all for now. I hope these above questions might be very helpful to you. In our next weekend we again come-up with some new set of questions. Till then stay healthy, tuned and connected to Tecmint.
先说到这里，我希望上面的这些问题会为你提供很好的帮助。我们在下周会提出一些新的问题集合。保持健康，继续收听并保持与Tecmint的联系。
--------------------------------------------------------------------------------

via: http://www.tecmint.com/basic-linux-interview-questions-and-answers-part-ii/

译者：[theo-l](https://github.com/theo-l) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/basic-linux-interview-questions-and-answers/
