Linux 有问必答：在 Linux 上如何通过命令行来更改日期和时间
================================================================================
> **问题**: 在 Linux 上, 我怎样通过命令行来改变日期和时间?

在 Linux 系统中保持日期和时间的同步是每一个 Linux 用户和系统管理员的重要责任. 很多程序都依靠精确的时间信息得以正常工作. 另外, 不精确的日期和时间会使得日志文件中的时间戳变得毫无意义, 减弱了它们在系统检查和检修中的作用. 对于生产系统来说, 精确的日期和时间甚至更为重要. 例如, 在零售公司中, 所有产品必须时刻准确地计数(并储存在数据库服务器中)以便于财政部门计算每天及每周,每月,每年的支出和收入.

我们必须注意, 在 Linux 机器上有两种时钟: 由内核维持的软件时钟(又称系统时钟)和在机器关机后记录时间的(电池供电的)硬件时钟. 启动的时候, 内核会把系统时钟与硬件时钟同步. 之后, 两个时钟各自独立运行.

### 方法一: Date 命令 ###

在 Linux 中, 你可以通过 date 命令来更改系统的日期和时间:

    # date --set='NEW_DATE' 

其中 NEW_DATE 是诸如 "Sun, 28 Sep 2014 16:21:42" 或者 "2014-09-29 16:21:42" 的可读格式的日期字符串.

日期格式也可以手动指定以获得更精确的结果:

    # date +FORMAT --set='NEW_DATE' 

例如:

    # date +’%Y%m%d %H%m’ --set='20140928 1518' 

![](https://farm3.staticflickr.com/2944/15220890657_858528a186_o.png)

你也可以用相对的方式地增加或减少一定的天数,周数,月数和秒数,分钟数,小时数。 你也可以把日期和时间的参数放到一个命令中。

    # date --set='+5 minutes'
    # date --set='-2 weeks'
    # date --set='+3 months'
    # date --set='-3 months +2 weeks -5 minutes' 

![](https://farm3.staticflickr.com/2943/15220655239_deba528dce_o.png)

最后, 把硬件时钟设置为当前系统时钟:

    # hwclock --systohc 

运行 **hwclock --systohc** 的目的是将硬件时钟同软件时钟同步, 这可以更正硬件时钟的系统漂移(即时钟按照一定的速度走快或走慢).

另一方面, 如果硬件时钟是正确的, 但系统时钟有误, 可以用下面的命令更正:

     # hwclock --hctosys

在两种情况下, hwclock 命令都是将两个时钟同步. 否则, 重启后时间会是错误的, 因为当电源关闭时硬件时钟会记忆时间. 然而, 这对于虚拟机器并不适用, 因为虚拟机器并不能访问硬件时钟.

如果你的 Linux 系统上的默认时区是错误的, 你可以按照[这个指导][1]进行更正.

### 方法二: NTP ###

另一种使系统日期和时间保持精确的方法是使用 NTP (网络时间协议). 在 Linux 上, ntpdate 命令通过 NTP 将系统时钟和[公共 NTP 服务器][2]同步.

你可以使用如下命令来安装 **ntpdate**:

在 Debian 及基于 Debian 的发行版上:

    # aptitude install ntpdate

在基于 Ret Hat 的发行版上:

    # yum install ntpdate

使用 NTP 同步系统时钟:

    # ntpdate -u <NTP 服务器名或IP>
    # hwclock --systohc 

![](https://farm4.staticflickr.com/3930/15404223021_8da3b44a62_z.jpg)

除了一次性使用 ntpdate 来同步时钟, 你也可以使用 NTP 守护进程(ntpd), 它会始终在后台运行, 不断地通过 NTP 来调整系统时钟. 关于 NTP 的设置, 请参考[这个指导][3].

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-date-time-command-line-linux.html

译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/change-timezone-linux.html
[2]:http://www.pool.ntp.org/
[3]:http://xmodulo.com/how-to-synchronize-time-with-ntp.html
