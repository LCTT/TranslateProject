每日Ubuntu小技巧-改变登陆窗口背景
================================================================================

本文为你提供了一个简单的小技巧，告诉你如何用你自己图片来替换登陆窗口的背景。Ubuntu的登陆窗口挺不错的，可能比大多数发行版的都要好，但是如果你想要使用一张你自己的图片，比如一张可以让你回忆起某个特定的地方或事情的图片，你就可以按照下面的步骤来更换上它。

有许多方法可以做到这一点，这篇博文介绍的只是其中一种。下面介绍的方法可以使用dconf-editor和lightdm用户身份来完成这样的效果。简单来说就是，切换到root用户，给予lightdm用户访问x-server的权限。然后使用lightdm用户身份，运行dconf-editor，然后做出修改。

在设置完自定义图片并且重启后，每次启动电脑时你就应该能看到你设置的图片。若设置的图片是一张你非常喜欢的并且能给你带给你很多回忆的图片，那么你每次启动电脑登陆到Ubuntu时一定非常开心。

这个手册假设你已经在你的电脑上安装了dconf-editor。若没有，你可以运行以下命令来安装dconf-editor

    sudo apt-get install dconf-editor

下一步，选择你要作为登陆背景的图片。然后，记下图片的位置以及图片的名字，运行以下命令切换到root用户。

    sudo –i

下一步，运行以下命令给予lightdm用户访问X-server的权限。Lightdm是一个管理登陆窗口背景的服务程序，因此假如你要更换登陆窗口的背景图片，你就要修改lightdm用户。

    xhost +SI:localuser:lightdm

下一步，运行以下命令切换到lightdm用户

    su lightdm -s /bin/bash

然后，运行以下命令开启dconf-editor

    dconf-editor

当工具打开后，浏览到 **com->canonical->unity-greeter**。然后改变背景值为自定义的图盘。你可能需要勾掉draw-grid。

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/logon-screen-background.png)


重启电脑，尽情享受~

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/logon-screen-background-1.png)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tipschange-logon-screen-background/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Linux-pdz](https://github.com/Linux-pdz) 校对：[Caroline](https://github.com/carolinewuyan) 
