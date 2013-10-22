                        占坑了.......Luox
Daily Ubuntu Tips – Upgrade To Ubuntu 13.10 Saucy Salamander
================================================================================
In a few weeks, Ubuntu 13.10 will be released and many folks will want to upgrade to the latest version. For new users who want to upgrade, this brief post will show you how to easily do it from Ubuntu 13.04 if you haven’t already done so.

There are many ways to upgrade to the latest version of Ubuntu. Some prefer upgrading via a DVD disc while others with stable Internet connections prefer to upgrade directly from the Internet. The Internet option is the easiest and fastest because you don’t have to wait for the DVD disc to arrive before upgrading.

If you don’t have good Internet bandwidth, please upgrade from a DVD disc. This post is going to show you how to upgrade via the Internet only.

For those with good Internet connections, please update your current version by running the commands below. The commands below install all pending updates as well as remove packages and kernel headers that are no longer needed. Leaving these may cause issues with upgrading.

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

After running the above commands and finish updating all pending packages, restart your computer. When you log back on, press the **Alt + F2** keys on your keyboard.  When the run commands box opens, type the below command and press Enter.

    update-manager -d

Ubuntu Software Updater windows show open. From there, hit the upgrade button to begin upgrading.

Before upgrading, please make sure to disable or remove all external PPA repositories from your machine. Also backup your computer before upgrading.

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/updatemanagerubuntu1310.png)

Once you’re done upgrading restart your computer and verify if everything is running ok.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-upgrade-ubuntu-13-10-saucy-salamander/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)
