Installing XScreenSaver In Ubuntu
================================================================================
This tutorial intention is to show you how to add screen savers in Ubuntu 12.04 (although in other Ubuntu versions) which does not with any screen savers. But, many people new to computers and Linux, don’t know about the screensaver, what is a screensaver?

A screensaver is a computer program used primarily for security. This program blanks the screen or fills it with moving images or patterns when the computer is not in use. A screensaver can also be used for entertainment or to display system status information. It is a very good solution while you plan to leave your office and don’t want anybody to see what you working on.

**How does a screensaver makes my computer secure?**

A screensaver can be configured to ask users for a password before permitting the user to resume work, but be careful because if you have set set your account to automatically log in upon startup the attacker will be able to access your account simply by restarting the machine.

**How to install a screensaver?**

Fire up a new terminal like shown in Figure 1.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen1.png)

Figure 1

Before installing a new screensaver we have to remove the default one. Run the ‘**sudo apt-get remove gnome-screensaver**’ command shown in Figure 2 to uninstall gnome-screensaver.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen4.png)

Figure 2

Install XScreenSaver and some additional screensaver packages with the following command:

    sudo apt-get install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen6.png)

Figure 3

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen7.png)

Figure 4

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/screen9.png)

Figure 5

XScreenSaver will choose a random screensaver each time it starts. You can learn how to configure it [here][1].

--------------------------------------------------------------------------------

via: http://www.unixmen.com/installing-xscreensaver-ubuntu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.jwz.org/xscreensaver/faq.html