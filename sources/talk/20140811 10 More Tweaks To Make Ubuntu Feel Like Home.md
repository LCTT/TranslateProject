10 More Tweaks To Make Ubuntu Feel Like Home
================================================================================
![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/08/ubuntu-home-840x420.jpg?15f1a2)

Not too long ago [we gave you 12 tips on how to tweak your Ubuntu installation][1]. However, it’s been a little while since then, and we’ve come up with another 10 things you can do to make Ubuntu feel even more like home.

These 10 tips are quick and simple to do, so let’s get started!

### Install TLP ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/01/tlp_stat.jpg?15f1a2)

[We covered TLP a while back][2], which is a piece of software that can optimize your power settings so that you can enjoy a longer battery life. We talked about TLP in depth before, and it’s a good item to mention in this list as well. To install it, run the following command in a terminal:

    sudo add-apt-repository -y ppa:linrunner/tlp && sudo apt-get update && sudo apt-get install -y tlp tlp-rdw tp-smapi-dkms acpi-call-tools && sudo tlp start

This will add the necessary repository, update the package lists so that it includes the new packages provided by the new repository, installs TLP, and starts the service.

### System Load Indicator ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_systemload.jpg?15f1a2)

Adding a system load indicator to your Ubuntu desktop can give you an idea of how much of your system’s resources are being used at a quick glance. You don’t have to add this if you’d rather not have technical graphs on your desktop, but it’s a good addition for those who are interested in something like this. You can install it by running the terminal command:

    sudo apt-get install indicator-multiload

Then, find it in the Dash and launch it.

### Weather Indicator ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_weatherind.jpg?15f1a2)

Ubuntu used to offer a built-in weather indicator, but since it switched to Gnome 3 as the backbone, this hasn’t been included by default. Instead, you’ll need to install a separate indicator. You can install it by running the command:

    sudo add-apt-repository -y ppa:atareao/atareao && sudo apt-get update && sudo apt-get install -y my-weather-indicator

This will add another repository, update the package lists, and install the indicator. Then, find it in the Dash and launch it.

### Install Dropbox or Other Cloud Storage Solution ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/05/Dropbox-2.png?15f1a2)

One of the things that I have to install on all my Linux systems is Dropbox. Without it, it just really doesn’t feel like home, mainly because all of my most-used files are stored on Dropbox. Installing Dropbox is pretty straightforward, but it takes a bit more than just a simple command. Before you even start, you need to run this command to be able to see the Dropbox icon in the icon tray:

    sudo apt-get install libappindicator1

Then you need to head to Dropbox’s download page and install the .deb file that you download. You should now have Dropbox going.

If you’re a bit tired of Dropbox, you can also try using Copy [or even OneDrive][3]. Both services offer more storage for free, which is a big reason to consider using them. I recommend Copy more than OneDrive because Copy can work on all Linux distros.

### Install Pidgin and Skype ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2013/12/skype_linux_conversation.jpg?15f1a2)

It’s great to stay connected with friends, and if you use instant messaging, you’re in luck. Pidgin and Skype are both pretty good on Linux, and they are able to connect to all the major networks. Installing Pidgin is as easy as running the command

    sudo apt-get install pidgin

Installing Skype is also easy — you just need to head to Skype’s download page and get the .deb file under Ubuntu 12.04 multiarch.

### Remove Keyboard Indicator ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_keyboard_indicator.jpg?15f1a2)

Having the keyboard indicator appear on the desktop can be annoying for some. For English speakers, it just shows “EN”, and it’s potentially annoying because a lot of people don’t have a need to change keyboard layouts or be reminded that they are speaking English. To remove the indicator, choose System Settings, then Text Entry, and then uncheck “Show current input source in the menu bar”.

### Bring Back Classic Menu ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweak_classicmenu.jpg?15f1a2)

Before Ubuntu made the switch to Unity, it had used Gnome 2 as the default desktop environment. This included a simple menu for accessing your installed applications, which had categories such as Games, Office, Internet, and more. You can get this “classic menu” back with another simple package. To install, run the command:

    sudo add-apt-repository -y ppa:diesch/testing && sudo apt-get update && sudo apt-get install -y classicmenu-indicator

### Install Flash and Java ###

While in the previous tips article I mentioned installing codecs and Silverlight, I should have probably included Flash and Java as they are also major plugins that people need, although sometimes they can be forgotten about. To install both of them, run the command:

    sudo add-apt-repository -y ppa:webupd8team/java && sudo apt-get update && sudo apt-get install oracle-java7-installer flashplugin-installer

The additional repository is needed for installing Java because Ubuntu no longer includes the proprietary version (which most people recommend for best functionality), but rather just the open source OpenJDK implementation.

### Install VLC ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweaks_vlc.jpg?15f1a2)

The default media player, Totem, is pretty good but it relies on separately-installed codecs to work properly. I’d personally recommend you install the VLC media player, as it includes all codecs and supports virtually every media format under the sun. To install it, just run the command

    sudo apt-get install vlc

### Install PuTTY (Or Not) ###

![](http://main.makeuseoflimited.netdna-cdn.com/wp-content/uploads/2014/07/ubuntu_tweaks_putty.jpg?15f1a2)

Lastly, if you’ve used PuTTY for all of your SSH needs, you have two options: install PuTTY for Linux, or just use the terminal directly. Installing PuTTY can be done with the command

    sudo apt-get install putty

if you want to install it using the terminal. However, there’s no direct need to install it, because you can connect to any remote host with the command

    ssh username@this.domain.here

where you replace “username” with the username you’d like to connect as, and replace “this.domain.here” with the host’s actual domain name or IP address — both work.

### What Are Your Recommended Tweaks? ###

With these additional 10 tweaks, you should feel right at home in your Ubuntu installation, which can easily make or break your Linux experience. There are so many different ways to customize your experience to make it suit your needs; you just have to look around for yourself to see what you want.

**What other tweaks and recommendations can you share with readers?** Let us know in the comments!

*Image Credits: Home doormat Via Shutterstock*

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/10-tweaks-make-ubuntu-feel-like-home/

作者：[Danny Stieben][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.makeuseof.com/tag/author/danny/
[1]:http://www.makeuseof.com/tag/11-tweaks-perform-ubuntu-installation/
[2]:http://www.makeuseof.com/tag/easily-increase-battery-life-tlp-linux/
[3]:http://www.makeuseof.com/tag/synchronize-files-ubuntu-onedrive/