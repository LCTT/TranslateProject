Linux有问必答：如何检查Linux系统的最后重启时间
================================================================================

> **问题**: 是否有一个命令可以快速地检查系统已经运行了多久? 也就是我怎么知道Linux系统最后的重启时间? 

有许多方法来查询系统最后的重启时间。

### 方法一 ###

第一种方法是使用last命令

    $ last reboot 

![](https://farm4.staticflickr.com/3925/14881994335_041e9c2f86_z.jpg)

这条命令实际上显示的是最近几天的系统运行时间。last原本被设计来显示某个特定用户的登录历史。在Linux中，有一个特别的“伪用户”称为reboot会在系统重启的时候立即自动登录。这样通过检查reboot用户的登录历史，你就可以检查最后的重启时间。

### 方法二 ###

另外一个检测系统最后启动时间的方法是使用who命令带上‘-b’选项。

    $ who -b 

### 方法三 ###

你同样可以使用uptime命令来推断系统最后的启动时间。uptime命令会显示当前的时间，同样也会显示系统已经运行的时间。从这些信息中，你就可以计算系统最后启动的时间了 

    $ uptime 

![](https://farm4.staticflickr.com/3915/14881660192_58f2843969_o.png) 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-last-time-system-rebooted-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
