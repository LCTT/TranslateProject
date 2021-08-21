[#]: subject: "10 Things to Do After Installing elementary OS 6 “Odin”"
[#]: via: "https://www.debugpoint.com/2021/08/10-things-to-do-after-install-elementary-os-6/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Things to Do After Installing elementary OS 6 “Odin”
======
A curated list of things to do after installing the latest elementary OS
6 code-named “Odin”._Pre-step_Applications > System Settings > Desktop
The [elementary OS 6 “Odin” released][1] a while back after more than two years in development. It brings a huge set of new features across its core modules, Pantheon desktop, native applications. This release is based on the Ubuntu 20.04 LTS.

That said, if you already completed the installation, there are certain customization that you might want to try out to personalize your system. The options those described here are generic and may not be useful for you at certain cases, but we feel it’s worth to list down some basics and give you a path to explore more of this beautiful elementary OS.

### Things to Do After Installing elementary OS 6 “Odin”

Make sure you connect to the internet first. You can get the list of networks available in the notification area at the top.

#### 1\. Change hostname

This might not be the first thing you would like to do. However, I am not sure why an option not given changing the hostname during installation itself. For example, see below terminal prompt, the hostname is the default hardware configuration set by elementary OS. Which is not looking good at all in my opinion.

![hostname change before][2]

To change the hostname, open a terminal and run the below command.

```
hostnamectl set-hostname your-new-hostname
```

example:

![changing hostname][3]

![changed hostname][4]

#### 2\. Update your system

The very first thing you should do after installing any Linux distribution is to make sure the system is up-to-date with packages and security updates.

To do that here, you can open App Center and check/install for updates.

Or, open the Terminal and run the below commands.

```
sudo apt update
sudo apt upgrade
```

#### 3\. Install Pantheon Tweaks

Pantheon Tweaks is a must-have application in elementary OS. It provides additional settings and configuration options that is not available via standard system settings app. To install Pantheon Tweaks, open a terminal and run the below commands. Note: The earlier tweak tool was elementary Tweaks, which is renamed with Pantheon Tweaks from Odin onwards.

```
sudo apt install software-properties-common
sudo add-apt-repository -y ppa:philip.scott/pantheon-tweaks
sudo apt install -y pantheon-tweaks
```

After installation, open System Settings and you can find Tweaks option there.

A detailed installation guide is [available here][5] (if you need more information).

#### 4\. Configure Dock

Dock is the center of the desktop. And honestly, the default apps that is included in the dock are not that popular. So, you can always configure the dock items using the below steps.

  * To remove: Right click and uncheck the **Keep in Dock** option.
  * To add new items: Click on Application at the top. Then right-click on the application icon which you want in dock. Select **Add to Dock**.



In my opinion, you should add at least – File manager, screenshot tool, Firefox, Calculator – among other things. And remove the ones you don’t need.

#### 5\. Change the look and feel

The elementary OS 6 Odin revamped the overall look of the desktop with pre-loaded accent color, native dark mode for entire desktop and applications. Also, pre-loads nice wallpapers. You can customize all these via . There you will have options for Wallpaper, Appearance, Panels and Multitasking.

![elementary OS 6 Odin settings window – Desktop][6]

Configure the look as you wish.

[][7]

SEE ALSO:   elementary OS 6 Odin: New Features and Release Date

Oh, you can also schedule the Dark and Light mode based on Sunset and Sunrise!

#### 6\. Install Additional Applications

The native AppCenter is great for this OS. I find it one of the best curated app store available in Linux desktop. However, sometimes It’s also better to install necessary applications (mostly the known ones) those are not pre-loaded. Here’s a quick list of applications which you can install in a fresh system. _(Seriously, why LibreOffice is not preloaded?)_

  * firefox
  * gimp
  * gedit
  * inkscape
  * obs-studio
  * libreoffice



#### 7\. Some Battery Saver Tips (Laptop)

There are many ways which you can configure your elementary OS (or Linux desktop in general) to save battery life. Remember that battery life depends on your Laptop hardware, how old the battery/Laptop is among other things. So, following some of the below tips to get the maximum out of your Laptop battery.

  * Install [tlp][8]. The tlp is a simple to use, terminal based utility to help you to save Battery Life in Linux. You need to just install it, and it will take care of the other settings by default. Installation commands:



```
sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt-get install tlp
sudo tlp start
```

  * Turn off Bluetooth, which is turned on by default. Enable it when required.


  * Install thermald via below command. This utility (actually a daemon) controls the P-States, T-States of your CPU for temperature and controls the heating.



```
sudo apt install thermald
```

  * Control brightness to minimum as per your need.



#### 8\. Install a Disk Utility

More often, you can find that you need to format a USB or write something to USB. By default, there are no application installed. The best applications with easy usage are the below ones. You can install them.

```
gnome-disk-utility
gparted
```

#### 9\. Enable Minimize and Maximize Option

Many users prefer to have the Maximize, Minimize window buttons at the left or right of the window title bar. The elementary OS only gives you close and restore options by default. Which is completely fine because of the way it’s designed. However, you can use Pantheon Tweaks to enable it via Tweaks &gt; Appearance &gt; Window Controls.

![enable minimize maximize buttons elementary OS][9]

#### 10\. Learn the new multi-touch gestures in Odin

If you are a Laptop user, and using elementary OS Odin, then you definitely check out the super cool new gestures. A three-finger swipe up smoothly opens the Multitasking View, exposing open apps and workspaces. A three-finger swipe left or right smoothly switches between the dynamic workspaces, making it even faster to jump between tasks.

And with two fingers you can achieve similar feature inside native applications as well.

### Closing Notes

I hope these 10 things to do after installing elementary OS 6 helps you and get you started with elementary OS 6 Odin. Although, these are completely user preference; hence these may or may not apply to you. But in general, these are expected tweaks that the average user prefers.

Let me know in the comments below if there are some more tweaks you feel that should be added in the list.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/10-things-to-do-after-install-elementary-os-6/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/08/elementary-os-6/
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/hostname-change-before.jpeg
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/changing-hostname.jpeg
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/changed-hostname.jpeg
[5]: https://www.debugpoint.com/2021/07/elementary-tweaks-install/
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/elementary-OS-6-Odin-settings-window-Desktop.jpeg
[7]: https://www.debugpoint.com/2020/09/elementary-os-6-odin-new-features-release-date/
[8]: https://linrunner.de/tlp/
[9]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/enable-minimize-maximize-buttons-elementary-OS-1024x501.png
