How to Set Different Wallpaper for Each Monitor in Linux
======
**Brief: If you want to display different wallpapers on multiple monitors on Ubuntu 18.04 or any other Linux distribution with GNOME, MATE or Budgie desktop environment, this nifty tool will help you achieve this.**

Multi-monitor setup often leads to multiple issues on Linux but I am not going to discuss those issues in this article. I have rather a positive article on multiple monitor support on Linux.

If you are using multiple monitor, perhaps you would like to setup a different wallpaper for each monitor. I am not sure about other Linux distributions and desktop environments, but Ubuntu with [GNOME desktop][1] doesn’t provide this functionality on its own.

Fret not! In this quick tutorial, I’ll show you how to set a different wallpaper for each monitor on Linux distributions with GNOME desktop environment.

### Setting up different wallpaper for each monitor on Ubuntu 18.04 and other Linux distributions

![Different wallaper on each monitor in Ubuntu][2]

I am going to use a nifty tool called [HydraPaper][3] for setting different backgrounds on different monitors. HydraPaper is a [GTK][4] based application to set different backgrounds for each monitor in [GNOME desktop environment][5].

It also supports on [MATE][6] and [Budgie][7] desktop environments. Which means Ubuntu MATE and [Ubuntu Budgie][8] users can also benefit from this application.

#### Install HydraPaper on Linux using FlatPak

HydraPaper can be installed easily using [FlatPak][9]. Ubuntu 18.04 already provides support for FlatPaks so all you need to do is to download the application file and double click on it to open it with the GNOME Software Center.

You can refer to this article to learn [how to enable FlatPak support][10] on your distribution. Once you have the FlatPak support enabled, just download it from [FlatHub][11] and install it.

[Download HydraPaper][12]

#### Using HydraPaper for setting different background on different monitors

Once installed, just look for HydraPaper in application menu and start the application. You’ll see images from your Pictures folder here because by default the application takes images from the Pictures folder of the user.

You can add your own folder(s) where you keep your wallpapers. Do note that it doesn’t find images recursively. If you have nested folders, it will only show images from the top folder.

![Setting up different wallpaper for each monitor on Linux][13]

Using HydraPaper is absolutely simple. Just select the wallpapers for each monitor and click on the apply button at the top. You can easily identify external monitor(s) termed with HDMI.

![Setting up different wallpaper for each monitor on Linux][14]

You can also add selected wallpapers to ‘Favorites’ for quick access. Doing this will move the ‘favorite wallpapers’ from Wallpapers tab to Favorites tab.

![Setting up different wallpaper for each monitor on Linux][15]

You don’t need to start HydraPaper at each boot. Once you set different wallpaper for different monitor, the settings are saved and you’ll see your chosen wallpapers even after restart. This would be expected behavior of course but I thought I would mention the obvious.

One big downside of HydraPaper is in the way it is designed to work. You see, HydraPaper combines your selected wallpapers into one single image and stretches it across the screens giving an impression of having different background on each display. And this becomes an issue when you remove the external display.

For example, when I tried using my laptop without the external display, it showed me an background image like this.

![Dual Monitor wallpaper HydraPaper][16]

Quite obviously, this is not what I would expect.

#### Did you like it?

HydraPaper makes setting up different backgrounds on different monitors a painless task. It supports more than two monitors and monitors with different orientation. Simple interface with only the required features makes it an ideal application for those who always use dual monitors.

How do you set different wallpaper for different monitor on Linux? Do you think HydraPaper is an application worth installing?

Do share your views and if you find this article, please share it on various social media channels such as Twitter and [Reddit][17].

--------------------------------------------------------------------------------

via: https://itsfoss.com/wallpaper-multi-monitor/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://www.gnome.org/
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/multi-monitor-wallpaper-setup-800x450.jpeg
[3]:https://github.com/GabMus/HydraPaper
[4]:https://www.gtk.org/
[5]:https://itsfoss.com/gnome-tricks-ubuntu/
[6]:https://mate-desktop.org/
[7]:https://budgie-desktop.org/home/
[8]:https://itsfoss.com/ubuntu-budgie-18-review/
[9]:https://flatpak.org
[10]:https://flatpak.org/setup/
[11]:https://flathub.org
[12]:https://flathub.org/apps/details/org.gabmus.hydrapaper
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-2-800x631.jpeg
[14]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-1.jpeg
[15]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/different-wallpaper-each-monitor-hydrapaper-3.jpeg
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/05/hydra-paper-dual-monitor-800x450.jpeg
[17]:https://www.reddit.com/r/LinuxUsersGroup/
