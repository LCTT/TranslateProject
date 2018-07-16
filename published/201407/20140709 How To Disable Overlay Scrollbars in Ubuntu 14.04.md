[小技巧]如何在Ubuntu14.04中禁用叠加滚动条 
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Ubuntu-14.042-790x493.jpeg)

Hello 伙计们,

这是一个如何在Ubuntu中禁用叠加滚动条的小技巧。注意，在本文中讲的不是删除叠加功能，而是告诉你如何启用或禁用它。

### 禁用 ###

打开终端并执行以下命令

    gsettings set com.canonical.desktop.interface scrollbar-mode normal

更改后会立即生效：

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Unity_Overlay_off.png)

### 启用 ###

    gsettings reset com.canonical.desktop.interface scrollbar-mode

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Unity_overlay_on.png)

Enjoy!

----------

![](http://0.gravatar.com/avatar/25c00329fd45ff820497f9c8c2d79dd3?s=70&d=monsterid&r=G)

[Enock Seth Nyamador][1]

我穿着--[0-0]--（比基尼？）, 一个开源的瘾君子。一个发展中的非洲geek。我是一个菜鸟开发者和一个有追求的摄影师。想提供给我什么或者是小贴士，请随时与我联系。我随时准备开发和照片。干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/disable-overlay-scrollbars-ubuntu-14-04-quick-tip/

译者：[Vito](https://github.com/vito-L) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.unixmen.com/author/seth/

