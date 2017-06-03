在 Linux 服务器关机前向用户显示一条自定义消息
============================================================

在先前的文章中，我们解释了 Linux 中 [shutdown、poweroff、halt、reboot 命令的不同之处][3]，并揭示了在用不同的选项执行这些命令时它们实际做了什么。

本篇将会向你展示如何在系统关机时向所有的系统用户发送一条自定义的消息。

**建议阅读：**[tuptime - 显示 Linux 系统的历史和统计运行时间][4]

作为一名系统管理员，在你关闭服务器之前，你也许想要发送一条消息来警告他们系统将要关闭。默认上，`shutdown` 命令会如下所示给其他系统用户广播这条信息：

```
# shutdown 13:25
```
Linux 关机操作广播消息：
```
Shutdown scheduled for Fri 2017-05-12 13:25:00 EAT, use 'shutdown -c' to cancel.
Broadcast message for root@tecmint (Fri 2017-05-12 13:23:34 EAT):
The system is going down for power-off at Fri 2017-05-12 13:25:00 EAT!
```

要在 shutdown 那行发送一条自定义的消息给其他系统用户，运行下面的命令。在本例中，关闭会在命令执行后的两分钟之后发生。

```
# shutdown 2 The system is going down for required maintenance. Please save any important work you are doing now!
```
 [![Linux System Shutdown Message](https://www.tecmint.com/wp-content/uploads/2017/05/Linux-System-Shutdown-Message.png)][5] 

*Linux 系统关闭消息*

假设你有一些关键的系统操作，如计划系统备份或更新会在系统关闭的时候进行，如下所示，你可以使用 `-c` 选项取消关机，并在执行玩这些操作后继续执行：

```
# shutdown -c
```
Linux 关机操作取消消息：
```
Shutdown scheduled for Fri 2017-05-12 14:10:22 EAT, use 'shutdown -c' to cancel.
Broadcast message for root@tecmint (Fri 2017-05-14 :10:27 EAT):
The system shutdown has been cancelled at Fri 2017-05-12 14:11:27 EAT!
```

另外，学习如何在 Linux 中使用简单和传统的方法[在重启或者开机时自动执行命令/脚本][6]。

不要错过：

1.  [管理系统启动进程和服务（SysVinit、Systemd 和 Upstart）][1]
2.  [11 个 Linux 中 cron 计划任务示例][2]

现在你知道了如何在系统关闭前向其他系统用户发送自定义消息了。你有其他关于这个主题想要分享的想法么？何不使用下面的评论栏？

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 爱好者、Linux 系统管理员、网络开发人员，现在也是 TecMint 的内容创作者，他喜欢和电脑一起工作，坚信共享知识。

------------------

via: https://www.tecmint.com/show-linux-server-shutdown-message/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/linux-boot-process-and-manage-services/
[2]:https://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[3]:https://www.tecmint.com/shutdown-poweroff-halt-and-reboot-commands-in-linux/
[4]:https://www.tecmint.com/find-linux-uptime-shutdown-and-reboot-time-with-tuptime/
[5]:https://www.tecmint.com/wp-content/uploads/2017/05/Linux-System-Shutdown-Message.png
[6]:https://www.tecmint.com/auto-execute-linux-scripts-during-reboot-or-startup/
[7]:https://www.tecmint.com/author/aaronkili/
[8]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[9]:https://www.tecmint.com/free-linux-shell-scripting-books/
