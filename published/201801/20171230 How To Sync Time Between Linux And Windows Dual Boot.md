解决 Linux 和 Windows 双启动带来的时间同步问题
======

![](http://www.theitstuff.com/wp-content/uploads/2017/12/How-To-Sync-Time-Between-Linux-And-Windows-Dual-Boot.jpg)

想在保留 Windows 系统的前提下尝试其他 Linux 发行版，双启动是个常用的做法。这种方法如此风行是因为实现双启动是一件很容易的事情。然而这也带来了一个大问题，那就是 **时间**。

是的，你没有看错。若你只是用一个操作系统，时间同步不会有什么问题。但若有 Windows 和 Linux 两个系统，则可能出现时间同步上的问题。Linux 使用的是格林威治时间而 Windows 使用的是本地时间。当你从 Linux 切换到 Windows 或者从 Windows 切换到 Linux 时，就可能显示错误的时间了。

不过不要担心，这个问题很好解决。

点击 Windows 系统中的开始菜单，然后搜索 regedit。

[![open regedit in windows 10][1]][1]

点击打开，然后你会看到类型下面的内容。这就是注册表编辑器。

[![windows 10 registry editor][2]][2]

在左边的导航菜单，导航到 `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation`。

在右边窗口，右键点击空白位置，然后选择 `New >> DWORD(32 bit) Value`。

[![change time format utc from windows registry][3]][3]

之后，你会新生成一个条目，而且这个条目默认是高亮的。将这个条目重命名为 `RealTimeIsUniversal` 并设置值为 `1`。

[![set universal time utc in windows][4]][4]

所有的配置就完成了，下次重启，就不会再有时间同步问题了。

--------------------------------------------------------------------------------

via: http://www.theitstuff.com/how-to-sync-time-between-linux-and-windows-dual-boot-2

作者：[Rishabh Kandari][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.theitstuff.com
[1]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime1-e1512732558530.jpg
[2]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime2.jpg
[3]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime3.jpg
[4]:http://www.theitstuff.com/wp-content/uploads/2017/12/syncdualbootime4.jpg
