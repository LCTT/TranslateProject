Linux date命令 - 显示和设置系统日期与时间
================================================================================
![](http://linoxide.com/wp-content/uploads/2013/12/date-linux-command.jpg)

操作系统上的时间也许只是当做一个时钟。特别在控制台下, 我们通常并不认为时间有什么重要的。但是对于管理员，这种认识是错误的。你知道错误的日期和时间会导致你不能编译程序么?

因为日期和时间很重要，这或许就是开发网络时间协议(NTP:Network Time Protocol)的原因。让我们了解下date命令是如何工作的。

### 显示系统日期 ###

要显示系统日期,只要输入:

    $ date
    Thu Dec 5 22:55:41 WIB 2013

### 格式化显示日期 ###

日期有很多格式。如果你不喜欢默认的格式，你可以换一种格式。你可能会想"为什么我需要改变格式? 默认的输出对我足够了。" 

是的，你说的对，但是当你在编程时，默认输出或许无法满足你的需求，因此需要一些自定义输出。

### RFC 2822 的日期与时间输出格式 ###

    $ date -R
    Thu, 05 Dec 2013 23:40:53 +0700

**RFC 2822** 的格式像这样 : **星期, 日-月-年, 小时:分钟:秒 时区**

时区 +0700 等同于 GMT +7。

默认上**date**使用的是定义在**/etc/localtime**的时区。有效时区数据定义在**/usr/share/timezones**。

### 显示或者设置协调世界时 ###

在 [Wikipedia][1]上, UTC 意思是

> 世界上主要的时钟和时间的标准。这是格林位置标准时间几个非常相近的替代者之一。

以UTC形式显示日期和时间, 使用 -u 参数

    $ date -u
    Thu Dec 5 16:45:58:UTC 2013

### 使用格式化选项 ###

要自定义你的日期格式, **使用加号 (+)**

    $ date +”Day : %d Month : %m Year : %Y”
    Day: 05 Month: 12 Year: 2013
-
    $ date +%D
    12/05/13

**%D** 格式是 **年/月/日 的格式**.

如果你想的话，你可以输出日期的名字。下面是一些例子:

    $ date +”%a %b %d %y”
    Fri 06 Dec 2013

    $ date +”%A %B %d %Y”
    Friday December 06 2013

    $ date +”%A %B %d %Y %T”
    Friday December 06 2013 00:30:37 

    $ date +”%A %B-%d-%Y %c”
    Friday December-06-2013 12:30:37 AM WIB

还有很多的日期格式。只要输入:

    $ date –help

或者

    $ man date

来显示date命令的语法和参数。

基本上，date命令会翻译所有所有的百分号(%)开头的格式和输出在引号("")内所有的内容。

### 设置系统日期和时间 ###

通常地，你希望你的系统日期和时间是自动设置的。如果由于一些原因，你想要手动修改它，我们可以使用这个命令。

    # date –set=”20140125 09:17:00”

这会**设置**你当前的系统日期和时间到**一月 25, 2014 and 09:17:00 AM。请注意**,你**必须**拥有root特权来这么做。不然你会得到这样一个错误。

    date: cannot set date: Operation not permitted
    Sat Jan 25 09:17:00 WIB 2014

### 重置你的时间 ###

如果你希望重置你的系统日期和时间到原始值，你可以用这个技巧。

    # hwclock
    Fri 06 Dec 2013 03:44:10 AM WIB -0.314082 seconds

这回设置你的系统日期和时间到hwclock命令的输出的样子。

### 在脚本中使用date命令 ###

还记得我之前说为什么你需要改变date的输出么?一个答案是你或许需要编程。让我们看下bash脚本下的一个例子。

    $ vi display.date

    #! /bin/bash
    DATETIME=$(date +”DATE: %a %b-%d-%Y TIME: %T WEEK NUMBER: %W”)
    echo $DATETIME

保存并运行它:

    $ ./display.date
    DATE : Fri Dec-06-2013 TIME: 03:08:19 WEEK Number :40

如果你发现权限拒绝错误信息,输入:

    $ chmod 755 display.date

### 在备份流程中使用date ###

另外一个例子是子你备份流程中使用date。

    $ date +%F
    2013-12-06

    $ tar zcfv /daily_backup/backup-`date +%F`.tar.gz /home/pungki/Documents

它会压缩文件夹**/home/pungki/Documents**到一个位于**/daily_backup folder**的文件**backup-2013-12-06.tar.gz**中。（译注：通过“\` 命令 \`”来在命令行内嵌其它命令，这个字符不是单引号，而是和波浪号~同一个键位的那个符号。）

### 总结 ###

date可能被认为在某些方面不重要。但是date扮演了一个重要的角色。要想知道关于date命令更多的细节，在你的控制台下输入man date访问man页面。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/date-command-linux/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/Coordinated_Universal_Time
