Linux日历程序California 0.2 发布了
================================================================================
**随着[上月的Geary和Shotwell的更新][1]，非盈利软件套装Yobra又回来了，这次带来的是新的[California][2]日历程序的发布。**

一个合格的桌面日历是工作井井有条（和想要井井有条）的必备工具。[广受欢迎Chrome Web Store上的Sunrise应用][3]的发布意味着选择并不像以前那么少了。California又为这个撑腰了。

Yorba的Jim Nelson在Yorba博客上写道：“发生了很多变化“，接着写道：“初次发布比我想的加入了更多的特性。” 

![California 0.2 Looks Great on GNOME](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/california-point-2.jpg)

California 0.2在GNOME上看上去棒极了。

最突出的是添加了“自然语言”解析器。这使得添加事件更容易。相反，你可以直接输入“**在下午2点就Nachos会见Sam”接着California就会自动把它安排下接下来的星期一的下午两点，而不必你手动输入位的信息（日期，时间等等）。


![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/Screen-Shot-2014-05-15-at-21.26.20.png)

当我们在5月份回顾开发版本时这个特性也能工作了，甚至修复了一个问题：重复事件。

要创建一个重复时间（比如：“每个星期四搜索自己的名字”），你需要在日期前包含文字“every”（每个）。要确保地点也在内（比如：中午12点和Samba De Amigo在Boston Tea Party喝咖啡）。条目中需要有“at”或者“@”。

至于详细信息，我们可以见[GNOME Wiki上的快速添加页面][4]

其他的改变包括：

- 通过‘月’和‘周’查看事件
-添加/删除 Google，CalDAV和web（.ics）日历
- 改进数据服务器整合
-添加/编辑/啥是拿出远程事件（包括重复事件）
-自然语言计划  
-F1在线帮助快捷键
- 新的动画和弹出窗口

### 在Ubuntu 14.10上安装 California 0.2 ###

由于是GNOME 3的程序，可以说这下面程序看起来和感受上更好。

Yorba没有忽略Ubuntu用户。他们已经努力（也可以说是耐心地）地解决导致Ubuntu需要同时安装GTK+和GNOME的主题问题。结果就是在Ubuntu上程序可能看上去有点错位，但是同样工作的很好。

California 0.2在[Yorba稳定版软件PPA][5]中可以下载，且只针对Ubuntu 14.10。 

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/10/california-calendar-natural-language-parser

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2014/09/new-shotwell-geary-stable-release-available-to-downed
[2]:https://wiki.gnome.org/Apps/California
[3]:http://www.omgchrome.com/sunrise-calendar-app-for-google-chrome/
[4]:https://wiki.gnome.org/Apps/California/HowToUseQuickAdd
[5]:https://launchpad.net/~yorba/+archive/ubuntu/ppa?field.series_filter=utopic