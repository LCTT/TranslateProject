Six Steps You Need to Take to Make Ubuntu 14.04 LTS Better
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-2.jpg)

**Ubuntu 14.04 LTS (Trusty Tahr) is a very good operating system but, like most Linux distributions out there, it's far from what users might call an optimal setup. There are numerous reasons for this fact, but we can detail a few steps that will make your Ubuntu experience increase a great deal.**

Even though Ubuntu is a good operating system and the latest incarnation of it, 14.04, is one of the best made so far by Canonical, most users will find that some aspects of the OS can be improved. A number of actions are actually necessary if you want a complete experience.

For example, right after you first start the OS, you will have to open Software & Updates and make sure that all the options in the first Ubuntu Software tab are checked. You will need these repositories activated if you want to have access to the all the important packages.

![Software & Updates repositories](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-3.jpg)
Software & Updates repositories

The second thing you must do is to install the Ubuntu Restricted Extras. This features a number of important packages that can't be bundled with the operating system due to legal reasons, like Adobe's Flash and Microsoft fonts. It’s safe to download them, but the developers can't include them by default. Open a terminal and enter the following command:

    sudo apt-get update
    sudo apt-get install ubuntu-restricted-extras

After the installation has been completed, you will also need to get rid of Empathy, the default messenger on the system. It's part of GNOME and it's actually a very limited and buggy solution. You should install Pidgin instead. Here is a list of commands that will do all this:

    sudo apt-get remove empathy
    sudo apt-get install pidgin
    sudo apt-get install pidgin-plugin-pack

Now, if you are done with the messenger, you will need to install the drivers for the video card. If you have an Intel GPU, you don't have to do anything, but if you have an NVIDIA or AMD solution, you might want to get the proprietary drivers, which offer much better performance in games. Open Software & Updates again, click on the last tab called Additional Drivers, and select the driver you want. It will take some time, but you must be patient. Reboot.

![Software & Updates drivers](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-4.jpg)
Software & Updates drivers

You might also want to stop the online search that’s being performed through Unity's Dash. Open System Settings and click on Security and Privacy. In the third tab, which is called Search, you will find a button that can turn the online search off.

![Stop online search in Ubuntu 14.04 LTS](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-5.jpg)
Stop online search in Ubuntu 14.04 LTS

Also, you might want to customize the desktop a little. Right click on the desktop and select Change Desktop Background. You will notice a slide that is called Launcher icon size, which can be activated and the result can be seen in real time. Under the Behavior tab you will also find an option to display the menu inside the window of the application and not in the top bar of Unity.

![Change the way menus are displayed](http://i1-news.softpedia-static.com/images/news2/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341-6.jpg)
Change the way menus are displayed

That's about it. Anything you do beyond this point will turn Ubuntu 14.04 LTS into your own version and it's just about cosmetics and less about features and performance.

Enjoy!

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Six-Step-You-Need-to-Take-to-Make-Ubuntu-14-04-LTS-Better-439341.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出