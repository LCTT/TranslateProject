How to Install the iOS 7 Icons in Ubuntu 13.04 and Ubuntu 13.10
================================================================================
**This is a small and simple tutorial that will help you install all the Icons from the new iOS 7 operating system from Apple into your Ubuntu 12.04, 13.04, and 13.10.**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-the-iOS-7-Icons-in-Ubuntu-13-04-and-Ubuntu-13-10-387709-2.jpg)

The installation of icons might not seem like much, but it’s actually a very important part of the ecosystem. You wouldn't recognize Ubuntu so easily if Canonical didn’t use the same type of icons in every release, with only small differences.

It used to be difficult to install themes, icons, and mouse cursors, but things got a lot easier over the years. To get a new set of icons installed, you only need to run a few commands from a terminal.

Before we begin, you need to heed a small word of caution. The PPA presented in this article will only work for Ubuntu 12.04. This is because this icon set, the only one which correctly replicates the models from iOS 7, is made for elementary OS, which in turn is based on Ubuntu 12.04.

This being said, the icons can also be installed for Ubuntu 13.04 and Ubuntu 13.10, with a slightly different approach.

You will also need another piece of software that must be used to enable the icons. We recommend GNOME Tweak Tool, but there are a few others available if you really wish it.

To install GNOME Tweak Tool just run the following command in a terminal:

    sudo apt-get install gnome-tweak-tool

You will find the application in Ubuntu under the name of Tweak Tool.

In order to get the PPA and icon in your Ubuntu 12.04 operating system, you only need to run a few commands in a terminal near you:

    sudo add-apt-repository ppa:elementary-br/projects
    sudo apt-get update
    sudo apt-get install ieos7-icons

For Ubuntu 13.04 and Ubuntu 13.10, you will have to manually download the files and also install it from a terminal:

    wget -c https://launchpad.net/~elementary-br/+archive/projects/+files/ieos7-icons_0.1-0~13~ubuntu12.04.1_all.deb
    sudo dpkg -i ieos7-icons_0.1-0~13~ubuntu12.04.1_all.deb

If by any chance you will find that the deb installation stops for whatever reason, just run `sudo apt-get install -f` find any dependency issues and finish the job.

This pack only holds about 300 icons, so you might find that a few of the applications on your operating systems still retain the old look.

Enjoy your iOS 7 icons!

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-the-iOS-7-Icons-in-Ubuntu-13-04-and-Ubuntu-13-10-387709.shtml

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

