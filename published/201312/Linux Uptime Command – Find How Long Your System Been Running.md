Linux Uptime 命令，让你知道你的系统运行了多久
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/11/linux-uptime-command.png)

对于一些人来说系统运行了多久是无关紧要的，但是对于服务器管理员来说，这是相当重要的信息。服务器在运行重要应用的时候，必须尽量保证长时间的稳定运行，有时候甚至要求零宕机。那么我们怎么才能知道服务器运行了多久呢？

在Linux 下，我们可以使用uptime 命令，而且此命令不必使用root 权限。uptime 命令在系统中已经默认安装了。

语法如下：

    $ uptime

你会在屏幕上看到如下显示：

![](http://linoxide.com/wp-content/uploads/2013/11/uptime.png)

这些信息保存在/proc/uptime 文件中，虽然是以文本方式保存，但是这些数据却不能直接显示，这就需要我们使用uptime 命令来翻译它。

以下是如何解读uptime 提供的信息：

### 系统时间 ###

在图1中，左起第一条信息是14:04:39，这就是当前系统时间，以24小时格式输出。

### 系统运行时间 ###

第二条信息**Up 1004 days, 12:20**，这是显示你的系统运行时间。图1 显示你的系统已经运行了1004天12小时20分钟，如果你的系统没有运行超过24小时，这里将只会显示小时分钟或者只显示分钟。注意图2、图3的信息，当系统重启后将会清零。

![](http://linoxide.com/wp-content/uploads/2013/11/uptime_minutes.png)

![](http://linoxide.com/wp-content/uploads/2013/11/uptime_hours1.png)

### 已登录用户的数量 ###

第三部分的信息是显示已登陆用户的数量。在图1中，显示的是**1 user** ，即当前登录用户数量。当多个用户在同时登陆系统时，uptime 命令将告诉你用户的数量。

### 平均负载量 ###

最后一个信息是系统的平均负载量。回到图1，你看到这样带两位小数的数字**0.25, 0.25, 0.19**可以换算成百分比，即0.25和0.19分别代表着25%和19%。0.25, 0.25, 0.19分别代表着过去1分钟、5分钟、15分钟系统的平均负载量。负载量越低意味着你的系统性能越好。

这就是**uptime** 命令的日常使用指导，如果想获取更详细的信息，请通过输入**man uptime** 进入uptime 命令的manual 页面来查看。

你的机器已经运行多久了？贴出你的uptime给大家看看吧。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-uptime-command/

译者：[NearTan](https://github.com/NearTan) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
