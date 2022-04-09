[#]: subject: "Create Your Own Custom Light and Dark Wallpaper for GNOME"
[#]: via: "https://www.debugpoint.com/2022/04/custom-light-dark-wallpaper-gnome/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create Your Own Custom Light and Dark Wallpaper for GNOME
======
AN EASY GUIDE ON – HOW TO CREATE YOUR CUSTOM LIGHT AND DARK WALLPAPER
FOR the GNOME desktop.
the GNOME desktop.

[GNOME 42][1] brings the much-awaited light and dark theme to GNOME Desktop. It also brings the light and dark version of wallpaper, which automatically changes when you switch between light and dark themes.

So, by default, GNOME gives you a set of pre-configured light and dark wallpapers. But what if you want a different wallpaper that changes automatically when the theme changes?

Here’s how to configure and create your own custom wallpaper for both light and dark themes in GNOME.

### How to create custom light and dark wallpaper for GNOME

Firstly, make sure you have two versions of wallpaper handy with you. In general, they should be standard PNG or JPG images. For example, we used below two wallpapers for this demo.

![Sample light and dark wallpaper for demo][2]

But if you do not have proper light and dark wallpaper and looking for more, I will let you know how to get them or prepare for your own at the end of this guide. Stay with me.

Second, we need to create a schema file for our own. The automatic changing of wallpaper is handled by an XML file called adwaita.xml, which defines specific light and dark backgrounds tags. So, we will create our XML file for the wallpapers.

To do that, copy the contents of adwaita.xml from GitLab, and create a new XML file (the link is down below). You should see two tags inside this file – “filename” and “filename-dark”. These two XML tags contain the fully qualified path of both the wallpapers. Now, add the path to your images under these two tags, as I have shown below.

[Download the XML file from here (adwaita.xml.in)][3]

![Change the XML file][4]

Third, save this file to with any name you want. If the “gnome-background-properties” are not there, create it. For this example, I used my_cool_backgrounds.xml.

![Save the file][5]

And you are all set. Finally, open the settings and go to the Appearance tab, and you should see the new wallpapers are visible as an option.

[][6]

SEE ALSO:   New GNOME Text Editor - Everything You Need to Know

Select your own custom light and dark wallpaper and enjoy.

![Appearance tab has now your own custom light and dark wallpaper][7]

### How to download or make your own dynamic wallpaper

Definitely, you must think, who has the time to find and create both day and night versions of wallpaper? There are several websites that give you dynamic wallpapers ready-made that you can easily download and install.

One website I would recommend is [dynamicwallpaper.club][8] which has some excellent high-quality wallpapers up to 6K for macOS. And you can easily download them.

Additionally, if you plan to download from the above website, remember that the site’s images are in [heic format][9] because the website is for macOS. The High-Efficiency Video Coding (HEIC) is Apple’s proprietary version of the HEIF or High-Efficiency Image File format.

So, how to convert them in Linux systems? Well, you need a driver to view and convert the dynamic heic images in Ubuntu or Fedora Linux. Open a terminal and run the below commands to install the driver.

users –

```

    sudo apt install heif-gdk-pixbuf

```

Fedora users –

```

    sudo dnf install libheif

```

(without this plugin, Plasma apps can’t open heic images)

```

    sudo apt install qt-heif-image-plugin
    sudo dnf install qt-heif-image-plugin

```

Finally, open the heic image with your favourite image viewer and save it as JPG/PNG.

Last of all, don’t forget to let me know down below in the comment section whether you are able to create your own custom dark and light wallpaper for GNOME.

![Custom Light and Dark wallpaper in GNOME – transition][10]

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][11], [Twitter][12], [YouTube][13], and [Facebook][14] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/custom-light-dark-wallpaper-gnome/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/03/gnome-42-release/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Sample-light-and-dark-wallpaper-for-demo.jpg
[3]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/tree/main/backgrounds
[4]: https://www.debugpoint.com/wp-content/uploads/2022/04/Change-the-XML-file-1024x568.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/Save-the-file-1024x548.jpg
[6]: https://www.debugpoint.com/2021/12/gnome-text-editor/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Apperance-tab-has-now-your-own-custom-light-and-dark-wallpaper-1024x657.jpg
[8]: https://dynamicwallpaper.club
[9]: https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Custom-Light-and-Dark-wallpaper-in-GNOME-transition-1024x556.gif
[11]: https://t.me/debugpoint
[12]: https://twitter.com/DebugPoint
[13]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[14]: https://facebook.com/DebugPoint
