translating---geekpi

4 cool new projects to try in COPR for January
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR is a [collection][1] of personal repositories for software that isn't carried in Fedora. Some software doesn't conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn't supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here's a set of new and interesting projects in COPR.

### Elisa

[Elisa][2] is a minimal music player. It lets you browse music by albums, artists or tracks. It automatically detects all playable music in your ~/Music directory, thus it requires no set up at all - neither does it offer any. Currently, Elisa focuses on being a simple music player, so it offers no tools for managing your music collection.

![][3]

#### Installation instructions

The repo currently provides Elisa for Fedora 26, 27 and Rawhide. To install Elisa, use these commands:
```
sudo dnf copr enable eclipseo/elisa
sudo dnf install elisa
```

### Bing Wallpapers

[Bing Wallpapers][4] is a simple program that downloads Bing's wallpaper of the day and sets it as a desktop wallpaper or a lock screen image. The program can rotate over pictures in its directory in set intervals as well as delete old pictures after a set amount of time.

#### Installation instructions

The repo currently provides Bing Wallpapers for Fedora 25, 26, 27 and Rawhide. To install Bing Wallpapers, use these commands:
```
sudo dnf copr enable julekgwa/Bingwallpapers
sudo dnf install bingwallpapers
```

### Polybar

[Polybar][5] is a tool for creating status bars. It has a lot of customization options as well as built-in functionality to display information about commonly used services, such as systray icons, window title, workspace and desktop panel for [bspwm][6], [i3][7], and more. You can also configure your own modules for your status bar. See [Polybar's wiki][8] for more information about usage and configuration.

#### Installation instructions

The repo currently provides Polybar for Fedora 27. To install Polybar, use these commands:
```
sudo dnf copr enable tomwishaupt/polybar
sudo dnf install polybar
```

### Netdata

[Netdata][9] is a distributed monitoring system. It can run on all your systems including PCs, servers, containers and IoT devices, from which it collects metrics in real time. All the information then can be accessed using netdata's web dashboard. Additionally, Netdata provides pre-configured alarms and notifications for detecting performance issue, as well as templates for creating your own alarms.

![][10]

#### Installation instructions

The repo currently provides netdata for EPEL 7, Fedora 27 and Rawhide. To install netdata, use these commands:
```
sudo dnf copr enable recteurlp/netdata
sudo dnf install netdata
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-january/

作者：[Dominik Turecek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org
[1]:https://copr.fedorainfracloud.org/
[2]:https://community.kde.org/Elisa
[3]:https://fedoramagazine.org/wp-content/uploads/2018/01/elisa.png
[4]:http://bingwallpapers.lekgoara.com/
[5]:https://github.com/jaagr/polybar
[6]:https://github.com/baskerville/bspwm
[7]:https://i3wm.org/
[8]:https://github.com/jaagr/polybar/wiki
[9]:http://my-netdata.io/
[10]:https://fedoramagazine.org/wp-content/uploads/2018/01/netdata.png
