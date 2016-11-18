ｕｃａｓFL translating
[XFCE GETS A `DO NOT DISTURB` MODE AND PER APPLICATION NOTIFICATION SETTINGS][7]
============================================================

The Xfce developers are busy [porting][3] Xfce applications and components to GTK3, and in the process, they are also adding new features.

**"Do not disturb"**, a much requested feature, landed in _xfce4-notifyd_ 0.3.4 (the Xfce notification daemon) [recently][4]. Using this, you can suppress notification bubbles for a limited time-frame.

Furthermore, **the latest _xfce4-notifyd_ includes an option to enable or disable notifications on a per-application basis**.

After an application sends a notification, the app is added to a list in the notification settings. From here, you can control which applications can show notifications.

Both the "Do not disturb" mode and the application-specific notification settings can be found in _Settings > Notifications_:

[
 ![](https://1.bp.blogspot.com/-fvSesp1ukaQ/WCR8JQVgfiI/AAAAAAAAYl8/IJ1CshVQizs9aG2ClfraVaNjKP3OyxvAgCLcB/s400/xfce-do-not-disturb.png) 
][5]

Right now there's no way of accessing notifications missed due to the "Do not disturb" mode being enabled. However, **a notification logging / persistence feature is expected in a future release.**

And finally, yet** another feature** in _xfce4-notifyd_ 0.3.4 is an **option display notifications on the primary monitor** (until now, notifications were displayed on the active monitor).This option is not available in the GUI for now, and it must be enabled using Xfconf (Settings Editor), by adding a Boolean property, called "/primary-monitor" (without the quotes), to _xfce4-notifyd_ and set it to "True":

[
 ![](https://2.bp.blogspot.com/-M8xZpEHMrq8/WCR9EufvsnI/AAAAAAAAYmA/nLI5JQUtmE0J9TgvNM9ZKGHBdwwBhRH3QCLcB/s400/xfce-xfconf.png) 
][6]

**_xfce4-notifyd_ 0.3.4 is not available in a PPA right now, but it will probably be added to the [Xfce GTK3 PPA][1] soon.**

**If you want to build it from source, download it from [HERE][2].**

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2016/11/xfce-gets-do-not-disturb-mode-and-per.html

作者：[Andrew ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.webupd8.org/p/about.html
[1]:https://launchpad.net/~xubuntu-dev/+archive/ubuntu/xfce4-gtk3
[2]:http://archive.xfce.org/src/apps/xfce4-notifyd/0.3/
[3]:https://wiki.xfce.org/releng/4.14/roadmap
[4]:http://simon.shimmerproject.org/2016/11/09/xfce4-notifyd-0-3-4-released-do-not-disturb-and-per-application-settings/
[5]:https://1.bp.blogspot.com/-fvSesp1ukaQ/WCR8JQVgfiI/AAAAAAAAYl8/IJ1CshVQizs9aG2ClfraVaNjKP3OyxvAgCLcB/s1600/xfce-do-not-disturb.png
[6]:https://2.bp.blogspot.com/-M8xZpEHMrq8/WCR9EufvsnI/AAAAAAAAYmA/nLI5JQUtmE0J9TgvNM9ZKGHBdwwBhRH3QCLcB/s1600/xfce-xfconf.png
[7]:http://www.webupd8.org/2016/11/xfce-gets-do-not-disturb-mode-and-per.html
