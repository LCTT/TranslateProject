Linux who 命令 – 显示系统登录者
================================================================================
作为一名系统管理员，我们需要弄清楚在一个特定的时间点都有谁活跃在系统上。必须严密监视我们的服务器。但是，我们当然不可能一天24小时都盯着系统。在linux系统中，我们可以使用who命令查看登录者信息。

### 什么是 who 命令 ###
**who**命令能够打印 **当前都有谁登录到系统中** 的相关信息 。who命令只会显示真正登录到系统中的用户。它不会显示那些通过**su**命令切换用户的登录者。

### 如何使用who命令 ###
在大多数linux发行版中，who命令都是默认安装上的。想使用该命令，只需在控制台敲命令就行了。不带选项的话，运行该命令产生默认输出。

    $ who

![](http://linoxide.com/wp-content/uploads/2013/12/who_default.png)

#### 如何理解输出: ####

- 第一列显示用户名称
- 第二列显示用户连接方式。Tty意味着用户直接连接到电脑上，而pts意味着远程登录。
- 第三、四列分别显示日期和时间
- 第五列显示用户登录IP地址。

### 使用带参数的who命令 ###
Who命令有一些参数用于调整输出。以下是常用的例子。

#### 显示上一次重新启动的时间和日期 ####
使用 **-b** 选项

    $ who -b

![](http://linoxide.com/wp-content/uploads/2013/12/who_b.png)

可以看到系统启动是在2013年12月21日，下午3:52。

#### 显示初始化进程的当前运行级别 ####

使用 -r 选项，who命令会打印出初始化进程的当前运行级别

    $ who -r

![](http://linoxide.com/wp-content/uploads/2013/12/who_r.png)

输出显示2013年12月21日，下午3:52系统以 级别2 开始运行。
#### 为每一列添加标题 ####

使用 -H 选项为每一列添加标题

    $ who -H

![](http://linoxide.com/wp-content/uploads/2013/12/who_H.png)

#### 只打印当前运行终端的相关信息 ####
可以使用**-m**选项。

    $ who -m

![](http://linoxide.com/wp-content/uploads/2013/12/who_m.png)

#### 对当前登录用户数量计数 ####
如果系统同时有多人登录在线，-q 选项协助你完成计数功能。

    $ who -q

![](http://linoxide.com/wp-content/uploads/2013/12/who_q.png)

#### 附加空闲时间和PID信息 ####
默认情况下，who命令不会打印空闲时间和PID信息。如果打算显示这些信息，使用-u选项。不要忘记使用 -H选项让显示的信息更加简单易读。

    $ who -u -H

![](http://linoxide.com/wp-content/uploads/2013/12/who_u.png)

**空闲时间** 包含了最近最后一次活动以来消逝的时间. 所以，00:13 意思是 用户leni已经13分钟没执行过命令了. **(.)符号**  是指该终端过去的一分钟有过活动。在那期间，我们称之为 “current” 。**PID** 是用户shell程序的进程ID号。

#### 显示登录进程####
使用**-l**选项

    $ who -l

![](http://linoxide.com/wp-content/uploads/2013/12/who_l.png)
	
第一列只显示系统登录守护进程的名字。上面截图中的数字 967, 971等是进程ID。

#### 显示所有信息 ####
使用**-a**选项会显示所有信息。例如：

    $ who -a

![](http://linoxide.com/wp-content/uploads/2013/12/who_a.png)

####总结####
你会发现 who 命令跟 w 命令在某些方面有些相像。不要为此感到疑惑，为什么linux要实现这些在功能上相近的命令。你可以使用你觉得最适合你的或者适用于某种场合的命令。请查阅who命令手册了解更多详细信息。

- See more at: http://linoxide.com/linux-command/linux-who-command/#sthash.CU0bq3e4.dpuf

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-who-command/

译者：[l3b2w1](https://github.com/l3b2w1) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-w-command/
