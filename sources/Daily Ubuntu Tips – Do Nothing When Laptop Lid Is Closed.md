Daily Ubuntu Tips – Do Nothing When Laptop Lid Is Closed
================================================================================
Ubuntu, a powerful and modern operation system is being used by millions of individual users and businesses around the world. From basic workstation to advanced engineering machines, Ubuntu is powering them all.

If you’re just started out with Ubuntu and need help working with it, keeping coming to this blog for help. We’ve written hundreds of posts on Ubuntu that will get you started.

From learning how install Ubuntu to configuring basic settings, we’ve have covered all.

This brief tutorial is going to show you how to configure Ubuntu on a laptop computer so that when the lid is closed, it doesn’t put the computer to sleep or shut it down.

Most modern operating systems, including Windows is designed to put the laptop to sleep when the lid is closed. Ubuntu also does this. If you only want to close the lid and not put your laptop to sleep, continue below to learn how to do it in Ubuntu.

There are two ways to go about making this work in Ubuntu. One way is to open **System Settings –> Power** and setting the options there. Some users have had issues where doing it from System Settings didn’t work.

Another option is go change the settings from the configuration file of the Login Manager (**logind.conf**). Using this method has worked for many and you should try it as well.

To get started, press **Ctrl – Alt – T** on your keyboard to open the terminal. When it opens, run the commands below to open logind.conf file. There this file is where you’ll make this change.

    sudo gedit /etc/systemd/logind.conf

When the file opens, modify or change line line from this:

    #HandleLidSwitch=suspend

To this:

    HandleLidSwitch=ignore

And save the file. After saving the file, run the commands below to reset the Login Manager.

    sudo restart systemd-logind

That’s it!

The ignore value tell Ubuntu not to sleep or hibernate when the laptop lid is closed. Leave the rest of the line intact and save the file.

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/photo.jpg)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/daily-ubuntu-tips-do-nothing-when-laptop-lid-is-closed/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出