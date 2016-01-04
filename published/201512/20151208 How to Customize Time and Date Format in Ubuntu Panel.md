如何深度定制 Ubuntu 面板的时间日期显示格式
================================================================================
![时间日期格式](http://ubuntuhandbook.org/wp-content/uploads/2015/08/ubuntu_tips1.png)

尽管设置页面里已经有一些选项可以用了，这个快速教程会向你展示如何更加深入地自定义 Ubuntu 面板上的时间和日期指示器。

![自定义世间日期](http://ubuntuhandbook.org/wp-content/uploads/2015/12/custom-timedate.jpg)

在开始之前，在 Ubuntu 软件中心搜索并安装 **dconf Editor**。然后启动该软件并按以下步骤执行：

**1、** 当 dconf Editor 启动后，导航至 **com -> canonical -> indicator -> datetime**。将 **time-format** 的值设置为 **custom**。

![自定义时间格式](http://ubuntuhandbook.org/wp-content/uploads/2015/12/time-format.jpg)

你也可以通过终端里的命令完成以上操作：

    gsettings set com.canonical.indicator.datetime time-format 'custom'

**2、** 现在你可以通过编辑 **custom-time-format** 的值来自定义时间和日期的格式。

![自定义-时间格式](http://ubuntuhandbook.org/wp-content/uploads/2015/12/customize-timeformat.jpg)

你也可以通过命令完成：(LCTT 译注：将 FORMAT_VALUE_HERE 替换为所需要的格式值)

    gsettings set com.canonical.indicator.datetime custom-time-format 'FORMAT_VALUE_HERE'

以下是参数含义：

- %a = 星期名缩写
- %A = 星期名完整拼写
- %b = 月份名缩写
- %B = 月份名完整拼写
- %d = 每月的日期
- %l = 小时 ( 1..12)， %I = 小时 (01..12)
- %k = 小时 ( 1..23)， %H = 小时 (01..23)
- %M = 分钟 (00..59)
- %p = 午别，AM 或 PM， %P = am 或 pm.
- %S = 秒 (00..59)

可以打开终端键入命令 `man date` 并执行以了解更多细节。

一些自定义时间日期显示格式值的例子：

**%a %H:%M %m/%d/%Y**

![%a %H:%M %m/%d/%Y](http://ubuntuhandbook.org/wp-content/uploads/2015/12/exam-1.jpg)

**%a %r %b %d or %a %I:%M:%S %p %b %d**

![%a %r %b %d or %a %I:%M:%S %p %b %d](http://ubuntuhandbook.org/wp-content/uploads/2015/12/exam-2.jpg)

**%a %-d %b %l:%M %P %z**

![%a %-d %b %l:%M %P %z](http://ubuntuhandbook.org/wp-content/uploads/2015/12/exam-3.jpg)

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/12/time-date-format-ubuntu-panel/

作者：[Ji m][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
