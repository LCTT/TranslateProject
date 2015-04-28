如何在 systemd 下管理Linux系统的时间和日期
===

**timedatectl**是用来查询和修改系统时间和配置的Linux应用程序。它是[systemd 系统服务管理][1]的一部分，并且允许你检查和修改系统时钟的配置。

在这篇文章中，我们将涉及该小巧但十分重要应用程序的所有方面

### 系统当前的时间状态 ###

想要查看系统当前日期/时间，以及可使用不带任何参数的命令查看当前系统时间配置，可以这样：

	# timedatectl

输入的结果就像这样：

![](http://blog.linoxide.com/wp-content/uploads/2014/10/timedatectl.jpg)

### 修改日期 ###

想要修改系统日期，你可以简单地使用timedatectl设置时间命令，紧随命令的是YYYY-MM-DD格式的日期，YYYY代表年，MM代表2位数字的月份，DD代表2位数字的天。举个例子，如果你想把日期改为2015年2月4号,你应该使用下面的命令：

	# timedatectl 2015-02-04

### 修改时间 ###

想要修改时间，你可以以相同的方式使用该工具，但是使用的格式为HH:MM:SS，HH代表24小时制的时钟，MM代表分钟，SS代表秒钟。想将当前时间设为22:04:43，使用下面的命令：

	# timedatectl 22:04:43

### 修改时区 ###

设置正确的时区是保持时间同步的关键，特别是在你使用NTP协议同步的时候。首先，你应该使用list-timezones选项列出你所在区域的可用时区，你也可以使用grep和more来让格式方便阅读：

	# timedatectl list-timezones | grep America | more

这将显示一个简单的滚动列表格式。

之后，你就会知道你想设置的时区是如何命名的，然后使用下面的命令修改它：

	# timedatectl set-timezone America/Los_Angeles

### 设置本地时钟 ###

**实时时钟（RTC）**，通常被称为硬件时钟，完全独立于操作系统当前状态，甚至可以在计算机关闭的时候工作。你可以配置系统使用国际时间（UTC）或当地时间来校正RTC。注意，使用当地时区校正RTC并没有完美支持，而且还有可能因为时区变化和夏令时调整引起许多问题。如果有可能，在UTC模式下校正RTC。这一做法的唯一问题是，其他操作系统可能不完全支持它（如果你在同一台机器上运行2个操作系统的话）。

使用UTC模式校正RTC，使用下面的命令：

	# timedatectl set-local-rtc 0

使用当地时间校正，使用：

	# timedatectl set-local-rtc 1

### 设置NTP同步 ###

**网络时间协议（NTP）**是在分组交换、可变数据延迟的计算机系统间进行时钟同步的网络协议。NTP被设计使用[几毫秒的协调通用时间（UTC）][2]来同步所有参与的计算机。如果你希望设置NTP同步，你可以使用set-ntp选项设置。使用“no”关闭NTP同步，使用“yes”开启。

	# timedatectl set-ntp yes

---

via: http://linoxide.com/linux-command/timedatectl-change-time-date-systemd/

作者：[Adrian Dinu][a]
译者：[su-kaiyao](https://github.com/su-kaiyao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://www.freedesktop.org/wiki/Software/systemd/
[2]:https://en.wikipedia.org/wiki/Coordinated_Universal_Time
