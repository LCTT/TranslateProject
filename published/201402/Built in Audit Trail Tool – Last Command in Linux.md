Linux内置的审计跟踪工具 -  last命令
================================================================================

![](http://linoxide.com/wp-content/uploads/2013/12/linux-last-command.jpg)

如果你是一个服务器管理员，你或许知道你要保护你的服务器的话，不仅是从外部，还要从内部保护。linux有一个内置工具来看到最后登陆服务器的用户，可以帮助你保护服务器。

这个命令是**last**。它**对于追踪非常有用**。让我们来看一下last可以为你做些什么。

### last命令的功能是什么 ###

**last**显示的是自**/var/log/wtmp**文件创建起所有登录(和登出)的用户。这个文件是二进制文件，它不能被文本编辑器浏览，比如vi、Joe或者其他软件。这是非常有用的，因为用户(或者root)不能像他们希望的那样修改这个文件。

last会给出所有已登录用户的用户名、tty、IP地址(如果用户是远程连接的话)、日期-时间和用户已经登录的时间。

### 如何运行last ###

你只要在控制台中输入**last**即可。这是个例子：

    $ last

    leni pts/0 10.0.76.162 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki tty1 Mon Dec 2 09:31 still logged in
    reboot system boot 2.6.32-358.23.2 Mon Dec 2 09:20 - 13:25 (04:05) 

这里是如何阅读last信息：

- 第一列告诉谁是用户
- 第二列给出了用户如何连接的信息

  - pts/0 (伪终端) 意味着从诸如SSH或telnet的远程连接的用户
 
  - tty (teletypewriter) 意味着直接连接到计算机或者本地连接的用户
   
  - 除了重启活动,所有状态会在启动时显示

- 第三列**显示用户来自哪里**。如果用户来自于远程计算机，你会看到一个主机名或者IP地址。如果你看见:0.0 或者什么都没有，这意味着用户通过本地终端连接。除了重启活动，内核版本会显示在状态中。
- 剩下的列显示**日志活动发生在何时**。括号中的数字告诉我们连接持续了多少小时和分钟。

### 日常操作中last的一些示例 ###

#### 限制显示行的数目 ####

当你有很多行要显示时,你可以限制你想看到的行的数目.使用 **-n 参数**来这么做。

    $ last -n 3

    leni pts/0 10.0.76.162 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki tty1 Mon Dec 2 09:31 still logged in
    reboot system boot 2.6.32-358.23.2 Mon Dec 2 09:20 - 13:25 (04:05)

**-n** 参数会使last显示从当前时间到以后的3条记录。

#### 不显示主机名 ####

使用 **-R** 参数来这么做。这里是例子 :

    $ last -R

    leni pts/0 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki tty1 Mon Dec 2 09:31 still logged in
    reboot system boot Mon Dec 2 09:20 - 13:25 (04:05)

如你所见,现在在也没有关于主机或者IP地址的信息了。

#### 最后一列显示主机名 ####

要这么做,我们使用 **-a**参数

    $ last -a

    leni pts/0 Mon Dec 2 12:32 - 13:25 (00:53) 10.0.76.162
    pungki tty1 Mon Dec 2 09:31 still logged in :0.0
    reboot system boot Mon Dec 2 09:20 - 13:25 (04:05) 2.6.32-358.23.2.el6.i686

现在主机信息诸如10.0.76.162 会放在最后一列。

#### 显示完整登入登出时间日期 ####

对于此,你可以使用 **-F** 参数。这个是个示例:

    $ last -F

    leni pts/0 10.0.76.162 Mon Dec 2 12:32:24 2013 – Mon Dec 2013 13:25:24 2013 (00:53)

#### 打印特定的用户名 ####

如果你想要追踪特定的用户,你可以特别打印它。在last命令后面输入用户名。

    $ last leni

    leni tty1 Mon Dec 2 18-42 still logged in
    leni pts/0 Mon Dec 2 12:32 - 13:25 (00:53) 10.0.76.162

或者你想要知道**reboot**何时完成，你也可以这样显示它：

    $ last reboot

    reboot system boot Mon Dec 2 09:20 - 16:55 (07:34)
    reboot system boot Sun Dec 1 04:26 - 04:27 (00:01)
    reboot system boot Wed Nov 27 20:27 - 01:24 (04:57)
    reboot system boot Tue Nov 26 21:06 - 06:13 (09:06)

#### 打印特定 / pts ####

last同样可以打印特定tty/pts的信息. 只要在last命令后面输入tty名字或者pty名字。

这里有一些例子:

    $ last tty1

    pungki tty1 Mon Dec 2 09:31 still logged in
    pungki tty1 Mon Dec 2 04:26 – down (00:00)
    pungki tty1 Mon Dec 2 04:07 – down (00:00)
    pungki tty1 Sun Dec 1 18:55 – 04:07 (09:12)

    $ last pts/0

    leni pts/0 10.0.76.162 Mon Dec 2 12:32 - 13:25 (00:53)
    pungki pts/0 :0.0 Wed Nov 27 20:28 – down (04:56)

当你看到 **down 的值** - 比如上面的第二行,它意味着用户从某个时间登录直到系统重启或关机。

#### 使用另一个文件而不是 /var/log/wtmp ####

默认上，last命令会从**/var/log/wtmp**中解析信息。如果你想要**last命令**从另外一个文件解析，你可以使用**-f** 参数。比如，当日志切割后，让我们假设切割后，之前的文件名变为**/var/log/wtmp.1**。那么last命令会像这样。

    $ last -f /var/log/wtmp.1

#### 显示运行级别改变 ####

这里有个**-x**参数来显示运行级别。这里示例输出:

    pungki tty1 Mon Dec 2 19:21 still logged in
    runlevel (to lvl 3) 2.6.32-358.23.2 Mon Dec 2 19:20 – 19:29 (00:08)
    reboot system boot 2.6.32-358.23.2 Mon Dec 2 19:20 – 19:29 (00:08)
    shutdown system down 2.6.32-358.23.2 Mon Dec 2 18:56 – 19:20 (00:23)
    runlevel (to lvl 0) 2.6.32-358.23.2 Mon Dec 2 18:56 – 18:56 (00:00)
    leni tty1 Mon Dec 2 18:42 – down (00:00) 

你可以看到这里有两个运行级别。运行级别**to lvl 3**的条目意味着系统运行在完整的控制台模式，而没在X window或者GUI中。同时,当系统**关机**时，实际上是切换为**运行级别0**，这就是为什么last会显示**to lvl 0**。

#### 查看失败登录 ####

**last**命令用了记录成功登录，而 **lastb** 命令**记录失败的登录尝试**。你**必须拥有root**权限才能运行lastb命令。这里有一个lastb命令的示例输出。lastb会解析/var/log/btmp的信息。

    # lastb

    leni tty1 Mon Dec 2 22:12 – 22:12 (00:00)
    rahma tty1 Mon Dec 2 22:11 – 22:11 (00:00) 

#### 切割日志 ####

因为*/var/log/wtmp**记录每次的登录活动，文件的大小可能会快速地增长。默认上，Linux会每月**切割 /var/log/wtmp/**。切割的策略放在/etc/logrotate.conf 文件中。这里是我**/etc/logrotate.conf**文件的内容。

    /var/log/wtmp {
    　　monthly
    　　create 0664 root umtp
    　　minsize 1M
    　　rotate 1
    }

对于 **/var/log/btmp**, 这里是默认的倒换活动配置

    /var/log/btmp {
    　　missingok
    　　monthly
    　　create 0600 root umtp
    　　minsize 1M
    　　rotate 1
    }

你可以根据需要自己修改。

### 总结 ###

你可以结合这些参数来自定义last和lastb的输出。所有可以**运行于last命令**的参数都**可运行在**lastb命令上。更多细节,请通过在控制台输入**man last**来访问。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-last-command/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
