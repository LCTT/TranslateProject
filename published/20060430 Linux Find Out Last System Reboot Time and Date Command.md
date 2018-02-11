如何在 Linux 系统查询机器最近重启时间 
======

在你的 Linux 或类 UNIX 系统中，你是如何查询系统上次重新启动的日期和时间？怎样显示系统关机的日期和时间？ `last` 命令不仅可以按照时间从近到远的顺序列出该会话的特定用户、终端和主机名，而且还可以列出指定日期和时间登录的用户。输出到终端的每一行都包括用户名、会话终端、主机名、会话开始和结束的时间、会话持续的时间。要查看 Linux 或类 UNIX 系统重启和关机的时间和日期，可以使用下面的命令。

- `last` 命令
- `who` 命令


### 使用 who 命令来查看系统重新启动的时间/日期

你需要在终端使用 [who][1] 命令来打印有哪些人登录了系统，`who` 命令同时也会显示上次系统启动的时间。使用 `last` 命令来查看系统重启和关机的日期和时间，运行：

```
$ who -b
```

示例输出：

```
system boot 2017-06-20 17:41
```

使用 `last` 命令来查询最近登录到系统的用户和系统重启的时间和日期。输入：

```
$ last reboot | less
```

示例输出：

[![Fig.01: last command in action][2]][2]

或者，尝试输入：

```
$ last reboot | head -1
```

示例输出：

```
reboot system boot 4.9.0-3-amd64 Sat Jul 15 19:19 still running
```

`last` 命令通过查看文件 `/var/log/wtmp` 来显示自 wtmp 文件被创建时的所有登录（和登出）的用户。每当系统重新启动时，这个伪用户 `reboot` 就会登录。因此，`last reboot` 命令将会显示自该日志文件被创建以来的所有重启信息。

### 查看系统上次关机的时间和日期

可以使用下面的命令来显示上次关机的日期和时间：

```
$ last -x|grep shutdown | head -1
```

示例输出：

```
shutdown system down 2.6.15.4 Sun Apr 30 13:31 - 15:08 (01:37)
```

命令中，

* `-x`：显示系统关机和运行等级改变信息


这里是 `last` 命令的其它的一些选项：

```
$ last
$ last -x
$ last -x reboot
$ last -x shutdown
```

示例输出：

![Fig.01: How to view last Linux System Reboot Date/Time ][3]

### 查看系统正常的运行时间

评论区的读者建议的另一个命令如下：

```
$ uptime -s
```

示例输出：

```
2017-06-20 17:41:51
```

### OS X/Unix/FreeBSD 查看最近重启和关机时间的命令示例

在终端输入下面的命令：

```
$ last reboot
```

在 OS X 示例输出结果如下：

```
reboot ~ Fri Dec 18 23:58
reboot ~ Mon Dec 14 09:54
reboot ~ Wed Dec 9 23:21
reboot ~ Tue Nov 17 21:52
reboot ~ Tue Nov 17 06:01
reboot ~ Wed Nov 11 12:14
reboot ~ Sat Oct 31 13:40
reboot ~ Wed Oct 28 15:56
reboot ~ Wed Oct 28 11:35
reboot ~ Tue Oct 27 00:00
reboot ~ Sun Oct 18 17:28
reboot ~ Sun Oct 18 17:11
reboot ~ Mon Oct 5 09:35
reboot ~ Sat Oct 3 18:57


wtmp begins Sat Oct 3 18:57
```

查看关机日期和时间，输入：

```
$ last shutdown
```

示例输出：

```
shutdown ~ Fri Dec 18 23:57
shutdown ~ Mon Dec 14 09:53
shutdown ~ Wed Dec 9 23:20
shutdown ~ Tue Nov 17 14:24
shutdown ~ Mon Nov 16 21:15
shutdown ~ Tue Nov 10 13:15
shutdown ~ Sat Oct 31 13:40
shutdown ~ Wed Oct 28 03:10
shutdown ~ Sun Oct 18 17:27
shutdown ~ Mon Oct 5 09:23


wtmp begins Sat Oct 3 18:57
```

### 如何查看是谁重启和关闭机器？

你需要[启用 psacct 服务然后运行下面的命令][4]来查看执行过的命令（包括用户名），在终端输入 [lastcomm][5] 命令查看信息

```
# lastcomm userNameHere
# lastcomm commandNameHere
# lastcomm | more
# lastcomm reboot
# lastcomm shutdown
### 或者查看重启和关机时间
# lastcomm | egrep 'reboot|shutdown'
```

示例输出：

```
reboot S X root pts/0 0.00 secs Sun Dec 27 23:49
shutdown S root pts/1 0.00 secs Sun Dec 27 23:45
```

我们可以看到 root 用户在当地时间 12 月 27 日星期二 23:49 在 pts/0 重新启动了机器。

### 参见

* 更多信息可以查看 man 手册（`man last`）和参考文章 [如何在 Linux 服务器上使用 tuptime 命令查看历史和统计的正常的运行时间][6]。

### 关于作者

作者是 nixCraft 的创立者，同时也是一名经验丰富的系统管理员，也是 Linux，类 Unix 操作系统 shell 脚本的培训师。他曾与全球各行各业的客户工作过，包括 IT，教育，国防和空间研究以及非营利部门等等。你可以在 [Twitter][7]、[Facebook][8]、[Google+][9] 关注他。


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-last-reboot-time-and-date-find-out.html

作者：[Vivek Gite][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/faq/unix-linux-who-command-examples-syntax-usage/ "See Linux/Unix who command examples for more info"
[2]:https://www.cyberciti.biz/tips/wp-content/uploads/2006/04/last-reboot.jpg
[3]:https://www.cyberciti.biz/media/new/tips/2006/04/check-last-time-system-was-rebooted.jpg
[4]:https://www.cyberciti.biz/tips/howto-log-user-activity-using-process-accounting.html
[5]:https://www.cyberciti.biz/faq/linux-unix-lastcomm-command-examples-usage-syntax/ "See Linux/Unix lastcomm command examples for more info"
[6]:https://www.cyberciti.biz/hardware/howto-see-historical-statistical-uptime-on-linux-server/
[7]:https://twitter.com/nixcraft
[8]:https://facebook.com/nixcraft
[9]:https://plus.google.com/+CybercitiBiz
