GNOME Control Center 3.14 RC1 Corrects Lots of Potential Crashes
================================================================================
![GNOME Control Center in Arch Linux](http://i1-news.softpedia-static.com/images/news2/GNOME-Control-Center-3-14-RC1-Correct-Lots-of-Potential-Crashes-458986-2.jpg)

GNOME Control Center in Arch Linux

**GNOME Control Center, GNOME's main interface for the configuration of various aspects of your desktop, has been updated to version 3.14 RC1, along with a lot of the packages from the GNOME stack.**

The GNOME Control Center is a piece of software that's actually very important in the GNOME ecosystem, although not all users are aware of its existence. This is the part that takes care of all the settings in an OS powered by GNOME, as you can see from the screenshot.

It's not something that's usually advertised and it's actually one of the few packages in the GNOME stack that doesn't have the same name as source and as implementation. The source package is called GNOME Control Center, but users will usually see Settings or System Settings, depending on what the developers choose.

### What's new in GNOME Control Center 3.14 RC1 ###

According to the changelog, libgd has been updated in order to fix the GdNotification theming, the background chooser dialog is no longer resizing when switching views, a stack with three views is now used for the chooser dialog, a memory leak in Flickr support has been fixed, the hard-code font size is no longer used for the Date & Time, a crash that occurred if the WM changed (or restarted) has been fixed, a possible crash that occurred when wireless-enabled was changing has been fixed, and more potential crashers for WWAN have been corrected.

Also, the hotspot is now running only if the device is active, all of the virtualization bridges are now hidden, the underlying device for VPN connections is no longer shown, the empty folder list is no longer shown by default, various UI padding issues have been fixed, the focus is now returned in the account dialog, a crash that occurred when setting year to 0 has been fixed, the "Wi-Fi hotspot" properties are now centered, a warning provided on startup with the hotspot enabled has been fixed, and an error is now provided when turning on the hotspot fails.

A complete list of changes, updates, and bug fixes can be found in the official [changelog][1].

You can download GNOME Control Center 3.14 RC1:

- [tar.xz (3.12.1 Stable)][2][sources] [6.50 MB]
- [tar.xz (3.14 RC1 Development)][3][sources] [6.60 MB]

This is just the source package and you will have to compile it yourself in order to test it. Unless you really know what you are doing, you should wait until the complete GNOME stack is made available through the repositories.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/GNOME-Control-Center-3-14-RC1-Correct-Lots-of-Potential-Crashes-458986.shtml

作者：[Silviu Stahie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/silviu-stahie
[1]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-control-center/3.13/gnome-control-center-3.13.92.news
[2]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-control-center/3.12/gnome-control-center-3.12.1.tar.xz
[3]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-control-center/3.13/gnome-control-center-3.13.92.tar.xz