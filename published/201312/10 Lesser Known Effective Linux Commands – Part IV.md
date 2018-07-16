十个鲜为人知的 Linux 命令 - Part 4
================================================================================

继续我们的"鲜为人知"系列，本系列的第四篇会让你了解一些**有趣** 又 **动态**的命令。这里我们进入实际的教程，没有很多理论。

![](http://www.tecmint.com/wp-content/uploads/2013/11/10-Lesser-Known-Effective-Commands-.png)

- [十一个鲜为人知的 Linux 命令 - Part 1][1]
- [十个鲜为人知的 Linux 命令 - Part 2][2]
- [十个鲜为人知的 Linux 命令 - Part 3][3]

本系列的第四篇包含了另外的鲜为人知的Linux命令，这些值得去了解。也许你已经知道了这些命令，毫无疑问你是一个勇于探索的资深Linux用户。

### 32. strace Command ###

**strace**是一个调试工具并被主要用于Linux的故障排除。它可能在你的系统内没有默认安装，你可能需要**apt** 或者 **yum** 安装所需要的包。

使用strace命令追踪一个命令的执行。

    root@tecmint [~]# strace pwd

#### 示例输出 ####

    execve("/bin/pwd", ["pwd"], [/* 29 vars */]) = 0
    brk(0)                                  = 0x728000
    mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f29b0df2000
    access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
    open("/etc/ld.so.cache", O_RDONLY)      = 3
    fstat(3, {st_mode=S_IFREG|0644, st_size=38427, ...}) = 0
    mmap(NULL, 38427, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f29b0de8000
    close(3)                                = 0
    open("/lib64/libc.so.6", O_RDONLY)      = 3
    read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360\355\1I;\0\0\0"..., 832) = 832
    fstat(3, {st_mode=S_IFREG|0755, st_size=1922152, ...}) = 0
    mmap(0x3b49000000, 3745960, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x3b49000000
    mprotect(0x3b4918a000, 2093056, PROT_NONE) = 0
    mmap(0x3b49389000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x189000) = 0x3b49389000
    mmap(0x3b4938e000, 18600, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x3b4938e000
    close(3)                                = 0
    mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f29b0de7000
    mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f29b0de6000
    mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f29b0de5000
    ....
**strace**命令有大量的参数和选项，请参考man页来获取详细信息。

### 33. disown -a && exit 命令 ###

大多数系统管理员使用[screen 命令][4]来控制运行在终端后台的作业。让我们假设一下如果你有一个长期运行的作业并想要将它从终端中**脱离**，你可以用screen命令来这么做。但是如果你不知道如何使用screen，那么disown可以用来救急。

disown命令可以在后台持续运行任务，即使你关闭了终端会话。disown命令的语法是:

    root@tecmint [~]# Command; disown -a && exit

为了在终端中再次脱离一个已经长期运行的任务（译注：可能已经bg运行了，但是并没有脱离终端），使用**jobs**命令来找出任务号，接着使用disown **%n**，这里的**%n**是作业号。为了验证作业确实在运行，使用**ps** 或者 [top 命令][5]。**nohup**命令也是一个disown命令的替代品。

### 34. getconf LONG_BIT 命令 ###

上面的命令能显示你的机器架构是**32** bit 或者 **64** 位?

    root@tecmint [~]# getconf LONG_BIT

    32

### 35. 终端上显示日期 ###

下面的命令是几个命令的集合，确切地说是一个脚本。对于在shell或者终端下工作的人来说，没有GUI界面看到当前系统日期是一个乏味的工作。你可以用‘**date**‘命令查看今天的日期。

只要在提示符后输入如下的命令你就会在终端的右上角看到**日期**和**时间**。

    root@tecmint [~]# while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &

![在终端下显示日期](http://www.tecmint.com/wp-content/uploads/2013/11/Date.jpg)

### 36. convert 命令 ###

在写教程的时候，我经常需要生成输出，很多时候是图片格式的输出。上面的命令集合并不适合我。假设我需要tree命令的图片格式的输出(对 **/etc/x11** 目录 )。

    root@tecmint:/etc/X11# tree | convert label:@- /home/avi/tree.png

上面命令的输出可以在一个特定的位置(这里是我的主目录)下看到，文件名是**tree.png**。

### 37. watch -t -n1 “date +%T|figlet” ###

记住“**figlet**”命令在我们早期的文章“[20 Funny Commands of Linux][7]”中的描述。这个命令非常酷，这次我们会通过管道输出到‘**figlet**‘而在终端上显示一个动画电子钟。

你自己检查一下，记住你必须已经在系统上安装了**figlet**，用**apt** 或者 **yum**安装所需要的包。

    root@tecmint [~]# watch -t -n1 "date +%T|figlet"

#### 示例输出 ####

     _  ___    ____   ___    _____ _  _                                                                                             Fri Nov 29 10:29:34 GMT 
    / |/ _ \ _|___ \ / _ \ _|___ /| || |
    | | | | (_) __) | (_) (_) |_ \| || |_
    | | |_| |_ / __/ \__, |_ ___) |__   _|
    |_|\___/(_)_____|  /_/(_)____/   |_|

### 38. host 和 dig 命令 ###

虽然“**host**” 和 “**dig**”命令不那么鲜为人知，仍然很少使用。host命令是一个**DNS**查询工具。

    root@tecmint [~]# host www.google.com

    www.google.com has address 173.194.66.147
    www.google.com has address 173.194.66.105
    www.google.com has address 173.194.66.99
    www.google.com has address 173.194.66.104
    www.google.com has address 173.194.66.106
    www.google.com has address 173.194.66.103
    www.google.com has IPv6 address 2a00:1450:400c:c03::68

（译注：事实上，我觉得dig命令是最强大的，自从有了dig，我就再也不用 nslookup 了。）

    root@tecmint [~]# dig www.google.com

    ; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.17.rc1.el6_4.6 <<>> www.google.com
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<

### 39. dstat 命令 ###

**dstat**是一个多用途的工具，它会依据系统资源生成统计。默认情况下你的系统可能没有安装‘**dstat**‘。在使用这个彩色的描述系统信息的生成器前使用**apt** 或者 **yum**来安装。

    root@tecmint [~]# dstat

![dstat 命令](http://www.tecmint.com/wp-content/uploads/2013/11/dstat.jpeg)

### 40. bind -p 命令 ###

‘**bind -p**‘会显示所有的**BASH** shell可用的快捷方式。

    root@tecmint [~]# bind -p

    "\C-g": abort 
    "\C-x\C-g": abort 
    "\e\C-g": abort 
    "\C-j": accept-line
    "\C-m": accept-line 
    # alias-expand-line (not bound) 
    # arrow-key-prefix (not bound) 
    # backward-byte (not bound) 
    "\C-b": backward-char 
    "\eOD": backward-char 
    "\e[D": backward-char 
    "\e!": complete-command 
    "\e/": complete-filename 
    "\e@": complete-hostname 
    "\e{": complete-into-braces 
    "\e~": complete-username 
    "\e$": complete-variable 
    # copy-backward-word (not bound)
    # copy-forward-word (not bound) 
    # copy-region-as-kill (not bound)
    ....
    ....

### 41. touch /forcefsck ###

下面的命令会在root目录下创建一个空的文件夹'**forcefsck**'。这会强制Linux系统在下次启动时检查文件系统。

    root@tecmint [~]# touch /forcefsck

今天这些就是全部。因为你们爱‘**鲜为人知的命令**‘ ，因此我们将继续这个系列，本系列的下一篇文章将很快发布。

不要走开继续关注**Tecmint**。不要忘记在评论栏里留下你们有价值的反馈。帮我们一个忙，喜爱、分享我们的文章，并帮我们传播。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-effective-linux-commands-part-iv/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2258-1.html
[2]:http://linux.cn/article-2265-1.html
[3]:http://linux.cn/article-2284-1.html
[4]:http://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/
[5]:http://www.tecmint.com/12-top-command-examples-in-linux/
[6]:http://tecmint.tradepub.com/free/w_makb09/prgm.cgi
[7]:http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/