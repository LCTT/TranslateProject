How To Install Gnome 3.10 In Ubuntu 13.10
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Install_Gnome_310_Ubuntu_1310.jpeg)

Bored of Unity or simply dislike it? Why not **install Gnome 3.10 in Ubuntu 13.10**? Installing a new desktop environment is one of the first few [things to do after installing Ubuntu 13.10][1], if you like experimenting a bit. In this quick tutorial we shall see **how to install Gnome 3.10 in Ubuntu 13.10**.

### Install Gnome 3.10 in Ubuntu 13.10: ###

We shall be using several PPAs to install Gnome 3.10 and distribution upgrade will take some time to finish. I presume you have good internet speed, if not, you can use some of the [tips to improve system performance in Ubuntu 13.10][2].

#### Step 1: Install GDM [Optional] ####

First step is to install [GDM][3] along with the default [LightDM][4]. This is optional but recommended as some people mentioned issues with LightDM. Open a terminal (Ctrl+Alt+T) and use the following command:

    sudo apt-get install gdm

#### Step 2: Add PPAs and upgrade the system ####

Now is the time to add some Gnome 3.10 PPAs. Addition of PPAs will be followed by a distribution upgrade which takes time and downloads over 200 MB of data.

    sudo add-apt-repository ppa:gnome3-team/gnome3-next
    sudo add-apt-repository ppa:gnome3-team/gnome3-staging
    sudo apt-get update
    sudo apt-get dist-upgrade

#### Step 3: Install Gnome shell ####

Once the upgrade has been done, use the following command to install Gnome 3.10 in Ubuntu.

    sudo apt-get install gnome-shell

#### Step 4: Install Gnome specific apps [Optional] ####

This step too is optional. You may want to install some Gnome specific applications to get the full feel of Gnome 3.10 in Ubuntu. You may face issues with some of these apps.

    sudo apt-get install gnome-weather gnome-music gnome-maps gnome-documents gnome-boxes gnome-shell-extensions gnome-tweak-tool gnome-clocks

That would be all you need to do. Restart your computer, at login, choose Gnome by clicking on the gear symbol. Here is what my Gnome 3.10 looks like on my laptop:

![](http://itsfoss.com/wp-content/uploads/2014/01/Gnome_310_Ubuntu_1310.jpeg)

### Uninstall Gnome 3.10: ###

Did not like Gnome 3.10? No worries. Uninstall them by [deleting PPA][5]. To do that, you need to install PPA Purge (if not installed already). Use the following command:

    sudo apt-get install ppa-purge

And afterwards, install the PPAs you installed:

    sudo ppa-purge ppa:gnome3-team/gnome3-staging
    sudo ppa-purge ppa:gnome3-team/gnome3-next

This will revert Gnome 3.10 to Gnome 3.8 which is available in Ubuntu 13.10 repository. To completely remove Gnome 3, use the following command:

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

This will revert Gnome 3.10 to Gnome 3.8 which is available in Ubuntu 13.10 repository. To completely remove Gnome 3, use the following command:

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

And of course you should remove any application that you installed specifically for Gnome 3.10

I hope this tutorial helped you to install Gnome 3.10 in Ubuntu 13.10. Did you try Gnome 3.10 already? Which you like more, Gnome or Unity?

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-gnome-3-ubuntu-1310/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-13-10/
[2]:http://itsfoss.com/speed-up-ubuntu-1310/
[3]:https://wiki.gnome.org/Projects/GDM
[4]:http://en.wikipedia.org/wiki/LightDM
[5]:http://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/