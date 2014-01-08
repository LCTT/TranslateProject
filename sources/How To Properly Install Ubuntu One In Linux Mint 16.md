How To Properly Install Ubuntu One In Linux Mint 16
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Ubuntu-One-Linux-Mint.jpg)

[Linux Mint][1] is based on Ubuntu so I was thinking that Ubuntu One would be one of the pre-installed programs. I was wrong. So, I installed Ubuntu One from Software Manager and surprisingly, it did not work. In this quick tip we shall see **how to install Ubuntu One in Linux Mint 16** and how to make it work as well.

### Install Ubuntu One in Linux Mint 16: ###

You have just installed the Ubuntu One client from Software Manager and when you look for it to open and configure it, you will not even find it in the menu search. It’s as if it was never installed. But if you look in Software Manager, it will be marked as installed. So what went wrong here, then?

The problem here is that **Ubuntu One installer** has been referred by **ubuntuone-control-panel-qt** package. Since this package is not installed, your Ubuntu One installation fails to load. To fix this issue, open a terminal (Ctrl+Alt+T) and use the following command:

    sudo apt-get install ubuntuone-control-panel-qt

Now when you search in the menu, you will see Ubuntu One present there. You can configure the account and choose what to sync and what not to sync. And when you start to think that you have over come all the issues, you’ll notice that **Ubuntu One indicator is not present in the panel**.

### Install Ubuntu One indicator in Linux Mint 16: ###

You can add the following PPA to get the Ubuntu One indicator applet in Linux Mint:

    sudo add-apt-repository ppa:rye/ubuntuone-extras
    sudo apt-get update 
    sudo apt-get install indicator-ubuntuone

Log out and when you log back in, you can see the indicator in the panel. And with this, we are done with installing and setting Ubuntu One completely. I hope this post helped you to **install Ubuntu One in Linux Mint**. Questions, suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntu-one-linux-mint-16/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.linuxmint.com/