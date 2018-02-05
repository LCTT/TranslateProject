Two Easy Ways To Install Bing Desktop Wallpaper Changer On Linux
======
Are you bored with Linux desktop background and wants to set good looking wallpapers but don't know where to find? Don't worry we are here to help you.

We all knows about bing search engine but most of us don't use that for some reasons and every one like Bing website background wallpapers which is very beautiful and stunning high-resolution images.

If you would like to have these images as your desktop wallpapers you can do it manually but it's very difficult to download a new image daily and then set it as wallpaper. That's where automatic wallpaper changers comes into picture.

[Bing Desktop Wallpaper Changer][1] will automatically downloads and changes desktop wallpaper to Bing Photo of the Day. All the wallpapers are stored in `/home/[user]/Pictures/BingWallpapers/`.

### Method-1 : Using Utkarsh Gupta Shell Script

This small python script, automatically downloading and changing the desktop wallpaper to Bing Photo of the day. The script runs automatically at the startup and works on GNU/Linux with Gnome or Cinnamon and there is no manual work and installer does everything for you.

From version 2.0+, the Installer works like a normal Linux binary commands and It requests sudo permissions for some of the task.

Just clone the repository and navigate to project's directory then run the shell script to install Bing Desktop Wallpaper Changer.
```
$ https://github.com/UtkarshGpta/bing-desktop-wallpaper-changer/archive/master.zip
$ unzip master
$ cd bing-desktop-wallpaper-changer-master

```

Run the `installer.sh` file with `--install` option to install Bing Desktop Wallpaper Changer. This will download and set Bing Photo of the Day for your Linux desktop.
```
$ ./installer.sh --install

Bing-Desktop-Wallpaper-Changer
BDWC Installer v3_beta2

GitHub:
Contributors:
.
.
[sudo] password for daygeek: **

******

**
.
Where do you want to install Bing-Desktop-Wallpaper-Changer?
 Entering 'opt' or leaving input blank will install in /opt/bing-desktop-wallpaper-changer
 Entering 'home' will install in /home/daygeek/bing-desktop-wallpaper-changer
 Install Bing-Desktop-Wallpaper-Changer in (opt/home)? : **

Press Enter

**

Should we create bing-desktop-wallpaper-changer symlink to /usr/bin/bingwallpaper so you could easily execute it?
 Create symlink for easy execution, e.g. in Terminal (y/n)? : **

y

**

Should bing-desktop-wallpaper-changer needs to autostart when you log in? (Add in Startup Application)
 Add in Startup Application (y/n)? : **

y

**
.
.
Executing bing-desktop-wallpaper-changer...


Finished!!

```

[![][2]![][2]][3]

To uninstall the script.
```
$ ./installer.sh --uninstall

```

Navigate to help page to know more options about this script.
```
$ ./installer.sh --help

```

### Method-2 : Using GNOME Shell extension

Lightweight [GNOME shell extension][4] to change your wallpaper every day to Microsoft Bing's wallpaper. It will also show a notification containing the title and the explanation of the image.

This extension is based extensively on the NASA APOD extension by Elinvention and inspired by Bing Desktop WallpaperChanger by Utkarsh Gupta.

### Features

  * Fetches the Bing wallpaper of the day and sets as both lock screen and desktop wallpaper (these are both user selectable)
  * Optionally force a specific region (i.e. locale)
  * Automatically selects the highest resolution (and most appropriate wallpaper) in multiple monitor setups
  * Optionally clean up Wallpaper directory after between 1 and 7 days (delete oldest first)
  * Only attempts to download wallpapers when they have been updated
  * Doesn't poll continuously - only once per day and on startup (a refresh is scheduled when Bing is due to update)



### How to install

Visit [extenisons.gnome.org][5] website and drag the toggle button to `ON` then hit `Install` button to install bing wallpaper GNOME extension.
[![][2]![][2]][6]

After install the bing wallpaper GNOME extension, it will automatically download and set bing Photo of the Day for your Linux desktop, also it shows the notification about the wallpaper.
[![][2]![][2]][7]

Tray indicator, will help you to perform few operations also open settings.
[![][2]![][2]][8]

Customize the settings based on your requirement.
[![][2]![][2]][9]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bing-desktop-wallpaper-changer-linux-bing-photo-of-the-day/

作者：[2daygeek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://github.com/UtkarshGpta/bing-desktop-wallpaper-changer
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-linux-5.png
[4]:https://github.com/neffo/bing-wallpaper-gnome-extension
[5]:https://extensions.gnome.org/extension/1262/bing-wallpaper-changer/
[6]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-1.png
[7]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-2.png
[8]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-3.png
[9]:https://www.2daygeek.com/wp-content/uploads/2017/09/bing-wallpaper-changer-for-linux-4.png
