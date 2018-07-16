Linux 基础命令 – watch
================================================================================
linux系统里有一些日志文件。观察这些日志文件是系统管理员的一个重要任务。你可以很方便地[使用tail命令][1]观察它们。但是如果你想要长时间监视这些文件，每几分钟使用tail检查那些日志文件是一件很乏味的事情。你可以写一个短小的[无限循环的脚本][2]来周期性地检查文件，但其实已经有一个程序可以为你处理这种重复的任务。

### Linux watch 命令 ###

Linux中的**watch** 命令提供了一种方式处理重复的任务。默认**watch**会每2秒重复执行命令。你一定也想到了,watch是一个很好的观察log文件的工具。下面是一个例子。

    watch tail /var/log/syslog

想要停止命令的执行,只要使用标准的kill流程, **[Ctrl]+C**。

![使用Linux watch命令监测syslog](http://tuxtweaks.com/wp-content/uploads/2013/12/Watch_01_wm.png)
*使用Linux watch命令监测syslog*

你可以使用**-n**开关改变并指定时间间隔。要想每10秒检测日志文件,试试这个。

    watch -n 10 tail /var/log/syslog

### 带有管道的watch命令 ###

**watch**并不仅限于浏览日志文件。它可以用来重复你给它的任何命令。如果你要[监测CPU的温度][3],你可以使用**watch**后跟上**sensord**命令来查看。

    watch -n 1 sensors

我电脑上的输出看上去就像这样:

    acpitz-virtual-0
    Adapter: Virtual device
    temp1:        +45.0°C  (crit = +100.0°C)

我想过滤一下这个输出来只显示温度而不显示其他的。

我可以使用这个命令来查看

    sensors | grep temp | awk '{ print $2 }'

记住,watch命令会重复它后面的第一个命令。必须要注意命令后面跟上管道的情况。你可以将你的命令放在引号里面来管理。

    watch -n1 "sensors | grep temp | awk '{ print $2 }'"

![带管道的watch命令](http://tuxtweaks.com/wp-content/uploads/2013/12/Watch_02_wm.png)
*带管道的watch命令*

### 将watch作为时钟 ###

就像你现在已经注意到的,**watch**执行后会在你的终端的右上角显示时间。我们可以通过传给watch一个空的命令参数来把它作为一个简单的时钟。 我们可以将一个空格包含在引号中来作为一个空的参数。

    watch -n 1 " "

如你所见,这给予这个命令另外一个意义,**手表(watch)**。你可以把它作为你的腕表。

现在你知道如何使用Linux的watch命令。你要用它处理什么重复任务?

--------------------------------------------------------------------------------

via: http://tuxtweaks.com/2013/12/linux-watch-command/

译者：[geekpi](https://github.com/geekpi) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://tuxtweaks.com/2011/02/command-line-basics-head-and-tail/
[2]:http://tuxtweaks.com/2012/01/creating-a-terminal-window-clock/
[3]:http://tuxtweaks.com/2008/08/how-to-control-fan-speeds-in-ubuntu/
