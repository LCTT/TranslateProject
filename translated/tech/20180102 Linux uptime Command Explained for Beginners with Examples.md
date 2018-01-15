菜鸟们，通过这几个例子，包你学会 uptime 命令的用法
======

Linux 小白，若对系统管理有兴趣，或想成为资深用户，就需要对命令行有扎实的功底。你需要知道很多命令，其中一个就是 **uptime**。文本我们会通过一些容易理解的案例来讲解一下这个命令的基本用法。

再开始前有必要说一下，文中的所有案例都在 Ubuntu 16.04 上测试过了。

## Linux uptime 命令

望名生义，uptime 命令告诉你系统启动了(运行了)多长时间。这是语法：

```
uptime [options]
```

这个工具的 man 页是这么说的：
```
uptime 会在一行中显示下列信息. 当前时间,系统运行了多久时间,当前登陆的用户有多少,以及前1,5和15分钟系统的平均负载.
```

下面这些问答形式的案例应该会让你对 uptime 命令有更好的了解。

### Q1。如何使用 uptime 命令

Uptime 的基础用法很简单 - 只需要输入命令名称然后按下回车就行。

```
uptime
```

这是输出：

[![How to use the uptime command][1]][2]

这里，第一项是当前时间，'up' 表示系统正在运行，5：53 是系统启动的总时间，最后是系统的负载信息。若你想深入了解，这里是 uptime man 页中关于最后信息的说明：
```
系统负载是处于可运行或不可中断状态的进程的平均数. 可运行状态的进程要么正在使用CPU要么在等待使用CPU. 不可中断状态的进程则正在等待某些I/O访问，例如等待磁盘IO.

有三个时间间隔的平均值. 负载均值的意义根据系统中CPU的数量不同而不同, 负载为1对于一个只有单CPU的系统来说意味着负载满了，而对于一个拥有4CPU的系统来说则意味着75%的时间里都是空闲的.
```

### Q2。如何以更人性化的格式现实时间

若你只想知道系统运行了多长时间，而且希望以更人性化的格式来显示，那么可以使用 **-p** 项。

```
uptime -p
```

这是输出：

[![make the tool show up time in pretty format][3]][4]
### Q3。如何让 uptime 显示系统启动的日期/时间

你也可以指定 uptme 显示系统运行时的时间和日期。方法是使用 **-s** 命令项。

```
uptime -s
```

这是输出：

[![make uptime display date/time since when system is up][5]][6]

### Q4。如何获取版本信息和帮助信息

`-V` 获取版本信息，`-h` 获取帮助信息。

```
uptime -V

uptime -h
```

[![How to get version information and help][7]][8]

## 结论

你可以看到，uptime 命令很容易理解也很容易使用。它没有提供很多的功能(命令选项也很少)。这里已经覆盖了它的所有功能了。因此只需要练习一下这些选项你就能在日常工作中使用它了。如果需要的话，你也可以查看它的 [man 页 ][9]。


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-uptime-command/

作者：[Himanshu Arora][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-basic-usage1.png
[2]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-basic-usage1.png
[3]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-p-option.png
[4]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-p-option.png
[5]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-s.png
[6]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-s.png
[7]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-v-h.png
[8]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-v-h.png
[9]:https://linux.die.net/man/1/uptime
