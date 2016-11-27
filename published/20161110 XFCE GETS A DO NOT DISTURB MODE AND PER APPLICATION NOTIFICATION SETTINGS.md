Xfce 桌面新增‘免打扰’模式以及单一应用通知设置的新特性
============================================================

Xfce　的开发者们正忙于把 Xfce 的应用和部件[转移][3]到 GTK3 上，在这个过程中，他们也增加了一些新的特性。

**“免打扰”**，一个常被要求增加的特性，[最近][4]已登陆到了 xfce-notifyd 0.3.4 (Xfce 通知进程)上。

更近一步地，**最新的 xfce-notifyd 包括了一个可以在单一应用基础上开启或关闭通知的选项。

当一个应用发出一个通知以后，这个应用就被加入到到了通知设置的列表里。从通知列表里，你可以控制哪些应用能够显示通知。

”免打扰“模式和应用特定的通知设置均可在“设置” > “通知” 中找到：

 ![](https://1.bp.blogspot.com/-fvSesp1ukaQ/WCR8JQVgfiI/AAAAAAAAYl8/IJ1CshVQizs9aG2ClfraVaNjKP3OyxvAgCLcB/s400/xfce-do-not-disturb.png) 

现在为止，还没有方法可以访问由于启用”免打扰“模式而错过的消息。然而，可以预期将来会发布**通知记录/维持的特性。**

最后， xfce-notifyd 0.3.4 的**另一个特性**是**选择在主监视器显示通知**（直到现在，通知都是显示在当前监视器）。这个特性目前在图形设置界面里是没有的，必须使用 `Xfconf`（设置编辑）在 xfce-notifyd 下增添一个叫做 `/primary-monitor`（没有引号）的布尔属性，并设置为 `True` 来启用该特性:

 ![](https://2.bp.blogspot.com/-M8xZpEHMrq8/WCR9EufvsnI/AAAAAAAAYmA/nLI5JQUtmE0J9TgvNM9ZKGHBdwwBhRH3QCLcB/s400/xfce-xfconf.png) 

**xfce4-notifyd 0.3.4 目前在 PPA 上还没有，但是不久它可能被增添到 [Xfce GTK3 PPA][1]中。**

**如果你想直接从源代码编译，从[这儿][2]下载。**

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/11/xfce-gets-do-not-disturb-mode-and-per.html

作者：[Andrew][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.webupd8.org/p/about.html
[1]:https://launchpad.net/~xubuntu-dev/+archive/ubuntu/xfce4-gtk3
[2]:http://archive.xfce.org/src/apps/xfce4-notifyd/0.3/
[3]:https://wiki.xfce.org/releng/4.14/roadmap
[4]:http://simon.shimmerproject.org/2016/11/09/xfce4-notifyd-0-3-4-released-do-not-disturb-and-per-application-settings/
[5]:https://1.bp.blogspot.com/-fvSesp1ukaQ/WCR8JQVgfiI/AAAAAAAAYl8/IJ1CshVQizs9aG2ClfraVaNjKP3OyxvAgCLcB/s1600/xfce-do-not-disturb.png
[6]:https://2.bp.blogspot.com/-M8xZpEHMrq8/WCR9EufvsnI/AAAAAAAAYmA/nLI5JQUtmE0J9TgvNM9ZKGHBdwwBhRH3QCLcB/s1600/xfce-xfconf.png
[7]:http://www.webupd8.org/2016/11/xfce-gets-do-not-disturb-mode-and-per.html
