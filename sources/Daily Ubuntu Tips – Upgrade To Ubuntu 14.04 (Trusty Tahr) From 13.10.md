Daily Ubuntu Tips – Upgrade To Ubuntu 14.04 (Trusty Tahr) From 13.10
================================================================================
Although Ubuntu 14.04 isn’t scheduled to be released anytime soon, those that like to try bleeding edge software and OS can now do an in-place upgrade to Ubuntu 14.04 from 13.10.

Ubuntu 14.04 is scheduled to be released tentatively on April 17th 2014 but you don’t have to wait that long to upgrade and try it. This brief tutorial is going to show you how to do an in-place upgrade to Ubuntu 14.04 from 13.10.

In place upgrade is when you run the update-manager command from an existing Ubuntu installation to upgrade to the next. It allows you to retain most of your documents, settings and some applications.

Most in-place upgrades rely on a reliable Internet connection. Without a good and stable internet connections, it might be impossible to upgrade Ubuntu using this method.

If you can’t upgrade using the internet, you can also perform an in-place upgrade from a CD/DVD disc. This method allows you to upgrade Ubuntu offline without internet connection.

### Upgrading to Ubuntu 14.04 ###

To upgrade to Ubuntu 14.04, you must first prepare your existing computer. To do that, run the commands below to update all existing packages and kernels.

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

After updating your machine, you may want to restart so new packages and kernel can apply before upgrading.

Next, press the **Alt + F2** keys on your keyboard to open Ubuntu run command box.  When the box opens, type the commands below and press **Enter**.

    update-manager –d

Ubuntu should then open update-manager with an upgrade option. Press **Upgrade** to begin upgrading your machine.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/ubuntu1404upgrade.png)

That’s it!

Wait for Ubuntu to finish downloading and installing all the upgraded packages. When that’s done, you’ll be prompted to restart your computer.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-upgrade-to-ubuntu-14-04-trusty-tahr-from-13-10/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出