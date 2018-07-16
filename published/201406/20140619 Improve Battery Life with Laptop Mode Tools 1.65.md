用笔记本模式工具1.65来延长电池续航能力
================================================================================

![](http://i1-news.softpedia-static.com/images/news2/Improve-Battery-Life-with-Laptop-Mode-Tools-1-65-447397-2.jpg)

笔记本模式工具是一个Liunx电源管理工具包，它可以让用户以多种方式延长笔记本电池续航能力，现在它已经升级到1.65。

笔记本模式工具的发布的版本曾经很少而且间隔很长，但开发者在最新的版本中做了一些很有意思的改变，虽然此次更新与以前不同。

根据更新日志，grep找不到$device/uevent的错误已得到修复、 sysfs/enabled已被"ip link down"所取代、 添加了对iwlwifi的支持，运行时电源管理框架现在更健壮，并且usb-autosuspend模块已被去除。

此外，当笔记本电脑恢复时，笔记本模式工具将强制以初始化模式运行，最新版本已添加英特尔 PState 驱动程序的模块，并已实现挂起/休眠接口。

用户不须更改自动设置。更改自动设置可能会导致更多的问题，但通常看来他们总是会去动它。此外，要注意到每个功能究竟是做什么的，否则你可能会搞出更多问题。

看官方[公告][1]来了解更多细节。 

现在就下载用笔记本模式工具1.65:

- [http://samwel.tk/laptop_mode/packages][2]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Improve-Battery-Life-with-Laptop-Mode-Tools-1-65-447397.shtml

译者：[2q1w2007](https://github.com/2q1w2007) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://launchpad.net/laptop-mode-tools/+announcement/12779
[2]:http://samwel.tk/laptop_mode/packages
