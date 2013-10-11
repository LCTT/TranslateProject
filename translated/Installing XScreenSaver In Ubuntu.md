
在Ubuntu中安装XscreenSaver--屏幕保护
================================================================================


这个教程将会给你展示如何在Ubuntu 12.04加入屏幕保护(也包含其他Ubuntu版本)原本不包含任何屏幕保护.但是,一些非技术党,并不了解屏幕保护.到底屏幕保护能做什么?

屏幕保护是一个主要为了安全的的计算机程序.当计算机空闲时,这个程序会关闭屏幕或者显示移动的图片或字符.当然屏幕保护也可以被用于娱乐或显示系统信息.当你打算离开办公室又不想让任何人看你电脑上的信息,那么这个程序将是绝佳的解决方案.


**屏幕保护怎么让我的电脑变得更安全?**


屏幕保护能配置成在允许用户继续工作之前要求用户输入密码.但是请留意,当你已经设置你的帐号在启动后自动登入,那么攻击者可以轻易的重启机器来登入你的帐号.


**怎么安装屏幕保护?**


打开一个新的终端(ctrl+alt+T)像图一的显示

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen1.png)


图一


在安装一个新的屏幕保护之前我们必须卸载默认屏幕保护,运行 'sudo apt-get remove gnome-screensaver' 图二

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen4.png)


图二



用下列命令安装XScreenSaver和一些附加的扩展包
	sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra


![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen6.png)


图三

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen7.png)


图四

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen9.png)


图五


XScreenSaver 每次启动后会随机选择一个屏幕保护.详细配置XScreenSaver[here][1].
--------------------------------------------------------------------------------

via: http://www.unixmen.com/installing-xscreensaver-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：星誓云梦 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.jwz.org/xscreensaver/faq.html
