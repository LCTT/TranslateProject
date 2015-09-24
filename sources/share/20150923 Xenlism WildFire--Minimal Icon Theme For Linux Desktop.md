Xenlism WildFire: Minimal Icon Theme For Linux Desktop
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icon-theme-linux-3.png)

It’s been some time that I covered an icon theme on It’s FOSS. Perhaps because no theme caught my eyes in recent times. There are a few which I consider the [best icon themes for Ubuntu][1] but these are mostly the known ones like Numix and Moka and I am pretty content using Numix.

But a few days back I came across this [Xenslim WildFire][2] and I must say, it looks damn good. Minimalism is the current popular trend in the design world and Xenlism perfects it. Smooth and tranquil, Xenlism is inspired by Nokia’s meego and Apple iOS icon.

Have a look at some of its icons for various applications:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons.png)

Folder icons look like:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons-1.png)

Theme developer, [Nattapong Pullkhow][3], claims that the icon theme is best suited for GNOME but it should work fine with Unity, KDE and Mate as well.

### Install Xenlism Wildfire icon theme ###

Xenlism Theme is around 230 MB in download size which is slightly heavy for an icon theme but considering that it has support for a huge number of applications, the size should not be surprising.

#### Installing in Ubuntu/Debian based Linux distributions ####

To install it in Ubuntu variants, use the command below in a terminal to add the GPG key:

    sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 90127F5B

After adding the key, use the following commands:

    echo "deb http://downloads.sourceforge.net/project/xenlism-wildfire/repo deb/" | sudo tee -a /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get install xenlism-wildfire-icon-theme

In addition to the icon theme, you can download a matching minimal wallpaper as well:

    sudo apt-get install xenlism-artwork-wallpapers

#### Installing in Arch based Linux distributions ####

You’ll have to edit the Pacman repository. In a terminal, use the following command:

    sudo nano /etc/pacman.conf

Add the following section to this configuration file:

    [xenlism-arch]
    SigLevel = Never
    Server = http://downloads.sourceforge.net/project/xenlism-wildfire/repo/arch

Update the system and install icon theme and wallpapers as following:

    sudo pacman -Syyu
    sudo pacman -S xenlism-wildfire

#### Using Xenlism icon theme ####

In Ubuntu Unity, [use Unity Tweak Tool to change the icon theme][4]. In GNOME, [use Gnome Tweak Tool to change the theme][5]. I presume that you know how to do this part, but if you are stuck let me know and I’ll add some screenshots.

Below is a screenshot of Xenlism icon theme in use in Ubuntu 15.04 Unity. Xenlism desktop wallpaper is in the background.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons-2.png)

It looks good, isn’t it? If you try it and like it, feel free to thank the developer:

> [Xenlism is a stunning minimal icon theme for Linux. Thanks @xenatt for this beautiful theme.][6]

I hope you like it. Do share your views on this icon theme or your preferred icon theme. Is Xenlism good enough to change your favorite icon theme?

--------------------------------------------------------------------------------

via: http://itsfoss.com/xenlism-wildfire-theme/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[2]:http://xenlism.github.io/wildfire/
[3]:https://plus.google.com/+NattapongPullkhow
[4]:http://itsfoss.com/install-numix-ubuntu/
[5]:http://itsfoss.com/install-switch-themes-gnome-shell/
[6]:https://twitter.com/share?text=Xenlism+is+a+stunning+minimal+icon+theme+for+Linux.+Thanks+%40xenatt+for+this+beautiful+theme.&via=itsfoss&related=itsfoss&url=http://itsfoss.com/xenlism-wildfire-theme/