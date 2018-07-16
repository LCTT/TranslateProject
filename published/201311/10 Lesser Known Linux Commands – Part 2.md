十个鲜为人知的 Linux 命令 - Part 2
================================================================================

继续上篇文章[11个鲜为人知的实用Linux命令][1]在本文中，我们将关注其他几个不为人知的Linux命令，有些在管理桌面和服务器方面被证明是非常有用的。

![](http://www.tecmint.com/wp-content/uploads/2013/10/10-Lesser-Known-Commands.png)

###12. \<空格\> 命令###

你在终端上键入的每个命令都会记录到**history**，也能用**history**命令重新调用。

如何骗过[history 命令][2]呢？呵呵，你可以轻而易举地做到。在终端，只需要在键入命令之前输入一个或多个空格，这样你的命令就不会被记录了。

让我们体验一下吧，先在终端尝试五个常见的 Linux 命令并在命令之前留个空(例如** ls, pwd, uname, echo  “hi”** 和 **who**)，然后检查这些命令是不是记录在历史中。

    avi@localhost:~$  ls
    avi@localhost:~$  pwd
    avi@localhost:~$  uname
    avi@localhost:~$  echo “hi”
    avi@localhost:~$  who

现在运行 `history`  命令来查看上面已执行的命令是否已经被记录了.

    avi@localhost:~$ history
       40  cd /dev/ 
       41  ls 
       42  dd if=/dev/cdrom1 of=/home/avi/Desktop/squeeze.iso 
       43  ping www.google.com 
       44  su

你看到没有最后执行的命令没有被记录。我们也可以用另一个命令`cat | bash`欺骗history，结果跟上面一样。

### 13. stat 命令 ###

Linux中的**stat**命令用来显示文件或文件系统的状态信息。当用文件名作为参数时，**stat**将会展示文件的全部信息。状态信息包括文件 **大小、块、权限、访问时间、修改时间、状态改变时间**等。

    avi@localhost:~$ stat 34.odt 
      File: `34.odt'
      Size: 28822 	Blocks: 64 IO Block: 4096   regular file 
    Device: 801h/2049d	Inode: 5030293 Links: 1 
    Access: (0644/-rw-r--r--)  Uid: ( 1000/ avi)   Gid: ( 1000/ avi) 
    Access: 2013-10-14 00:17:40.000000000 +0530 
    Modify: 2013-10-01 15:20:17.000000000 +0530 
    Change: 2013-10-01 15:20:17.000000000 +0530

### 14. \<alt\> + . 和 \<esc\> + . ###

上面的组合键事实上不是一个命令，而是传递最后一个命令参数到提示符后的快捷键，以输入命令的倒序方式传递命令。按住 Alt或Esc再按一下 “.”。

### 15. pv 命令 ###

在**电影**里尤其是**好莱坞电影**你可能已经看见过模拟文本了，像是在实时输入文字，你可以用**pv**命令仿照任何类型模拟风的文本输出，包括流水线输出。**pv**可能没有在你的系统上安装，你需要用**apt**或**yum**获取安装包，然后安装**pv**到你的机器。

    root@localhost:# echo "Tecmint [dot] com is the world's best website for qualitative Linux article" | pv -qL 20

**输出样式**

    Tecmint [dot] com is the world''s best website for qualitative Linux article

### 16. mount | colum -t ###

上面的命令用一个很不错的格式与规范列出了所有挂载文件系统。

    avi@localhost:~$ mount | column -t

**输出样式**

    /dev/sda1on  / type  ext3 (rw,errors=remount-ro) 
    tmpfson  /lib/init/rw  type  tmpfs(rw,nosuid,mode=0755) 
    proc on  /proc type  proc (rw,noexec,nosuid,nodev) 
    sysfson  /sys  type  sysfs(rw,noexec,nosuid,nodev) 
    udev on  /dev  type  tmpfs(rw,mode=0755) 
    tmpfson  /dev/shm  type  tmpfs(rw,nosuid,nodev) 
    devpts   on  /dev/pts  type  devpts   (rw,noexec,nosuid,gid=5,mode=620) 
    fusectl  on  /sys/fs/fuse/connections  type  fusectl  (rw) 
    binfmt_misc  on  /proc/sys/fs/binfmt_misc  type  binfmt_misc  (rw,noexec,nosuid,nodev) 
    nfsd on  /proc/fs/nfsd type  nfsd (rw)

### 17. Ctr+l 命令 ###

在进行下一步之前，我先问一下，你是如何清理你的终端？呵呵，你会在提示符后键入 “**clear**”。好的。用上面的命令执行清理终端都将成为过去。你只需要按下**Ctr+l**，看看它如何立即清理你的终端。

### 18. curl 命令 ###

在**命令行**下如何检查你的**未读邮件**？这个命令对于工作在没有图形界面的服务器的人佷有用。它会在运行期间再次要求输入密码，你不需要在上面一行硬编码你的密码，否则会有其它安全风险。

    avi@localhost:~$ curl -u avishek1210@gmail.com --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print \t if //; print "$2\n" if /<(title|name)>(.*)<\/\1>/;'

**输出样式**

    Enter host password for user 'avishek1210@gmail.com': 
    Gmail - Inbox for avishek1210@gmail.com 
    People offering cars in Delhi - Oct 26 
    	Quikr Alerts 
    another dependency question 
    	Chris Bannister 
    	Ralf Mardorf 
    	Reco 
    	Brian 
    	François Patte 
    	Curt 
    	Siard 
    	berenger.morel 
    Hi Avishek - Download your Free MBA Brochure Now... 
    	Diya 
    ★Top Best Sellers Of The Week, Take Your Pick★ 
    	Timesdeal 
    aptitude misconfigure? 
    	Glenn English 
    Choosing Debian version or derivative to run Wine when resource poor 
    	Chris Bannister 
    	Zenaan Harkness 
    	Curt 
    	Tom H 
    	Richard Owlett 
    	Ralf Mardorf 
    	Rob Owens

### 19.screen 命令 ###

**screen**命令能断开一个会话下的一个长时间运行的进程并能再次连接，如有需要，也提供了灵活的命令选项

要运行一个长时间的进程，我们通常执行

    avi@localhost:~$ ./long-unix-script.sh

缺乏灵活性，需要用户持续当前的会话，但是如果我们执行上面的命令是：

    avi@localhost:~$ screen ./long-unix-script.sh

它能在不同会话间断开或重连。当一个命令正在执行时按“**Ctrl + A**”然后再按“**d**”来**断开**。

重新连接运行：

    avi@localhost:~$ screen -r 4980.pts-0.localhost

**注解**：在这里，这个命令的稍后的部分是**screen id**，你能用‘**screen -ls**’命令查看。欲了解更多关于**screen命令**和它们的用法，请阅读我们的一些帮助文章：[10 个screen命令的示例][4]。

### 20. file ###

No!写上面的命令不是笔误. ‘**file**’是一个能提供关于文件类型信息的命令。

    avi@localhost:~$ file 34.odt
    34.odt: OpenDocument Text

### 21. id ###

上面的命令会打印真正的和有效的**用户**和**组**的id。

    avi@localhost:~$ id

**输出样式**

    uid=1000(avi) gid=1000(avi) 
    groups=1000(avi),24(cdrom),25(floppy),29(audio),30(dip),44(video),46(plugdev),109(netdev),111(bluetooth),117(scanner)

到此为止，鉴于这个系列的最新的这篇文章的成功，我将会尽快推出另外几部分文章继续**鲜为人知的Linux命令**。到时候，敬请关注Tecmint.不要忘记给我们提供你的**反馈**和**评论**。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/10-lesser-known-linux-commands-part-2/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2258-1.html
[2]:http://www.searchsv.com.cn/showcontent_77595.htm
[3]:http://www.tecmint.com/history-command-examples/
[4]:http://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/
[5]:http://www.oschina.net/translate/11-lesser-known-useful-linux-commands
