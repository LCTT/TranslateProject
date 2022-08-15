[#]: subject: "Create Your Own Custom Light and Dark Wallpaper for GNOME"
[#]: via: "https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create Your Own Custom Light and Dark Wallpaper for GNOME
======
An easy guide on creating your custom light and dark wallpaper for the GNOME desktop.

[GNOME 42][1]introduces the much-awaited light and dark theme to GNOME Desktop. It also brings the light and dark version of wallpaper, which automatically changes when you switch between light and dark themes.

So, by default, GNOME gives you a few sets of pre-configured light and dark wallpapers.

But what if you want a different wallpaper that changes automatically when the theme changes?

Here’s how to configure and create your custom wallpaper for light and dark themes in GNOME.

### How to create custom light and dark wallpaper for GNOME

Firstly, make sure you have two versions of wallpaper handy with you. In general, they should be standard PNG or JPG images. For example, we used below two wallpapers for this demo.

![Sample light and dark wallpaper for demo][2]

But if you do not have proper light and dark wallpaper and looking for more, I will let you know how to get them or prepare your own at the end of this guide.

Stay with me.

Second, we need to create a schema file for our own. The automatic changing of wallpaper is handled by an XML file called adwaita.xml, which defines specific light and dark background tags. So, we will create our XML file for the wallpapers.

To do that, copy the contents of adwaita.xml from GitLab and create a new XML file (the link is down below). You should see two tags inside this file – “filename” and “filename-dark”. These two XML tags contain the fully qualified path of both wallpapers. Add the path to your images under these two tags, as shown below.

[Download the XML file from here (adwaita.xml.in)][3]

![Change the XML file][4]

Third, save this file to **/home/your_name/.local/share/gnome-background-properties** with any name you want. If the “gnome-background-properties” are not there, create them. For this example, I used my_cool_backgrounds.xml.

![Save the file][5]

And you are all set. Finally, open the settings and go to the Appearance tab, and you should see the new wallpapers visible as an option.

Select your custom light and dark wallpaper and enjoy.

![The appearance tab now has your custom light and dark wallpaper][6]

### How to download or make your dynamic wallpaper

You must think, “who has the time to find and create both day and night versions of wallpaper”? Several websites give you dynamic wallpapers ready-made that you can easily download and install.

One website I would recommend is [dynamicwallpaper.club][7] which has some excellent high-quality wallpapers up to 6K for macOS. And you can easily download them.

Additionally, if you plan to download from the above website, remember that the site’s images are in [heic format][8]because the website is for macOS. The High-Efficiency Video Coding (HEIC) is Apple’s proprietary version of the HEIF or High-Efficiency Image File format.

You need a driver to view and convert the dynamic heic images in Ubuntu or Fedora Linux. So, how do you convert them to Linux systems? Open a terminal and run the below commands to install the driver.

**Ubuntu** **users** –

```
sudo apt install heif-gdk-pixbuf
```

Fedora users –

```
sudo dnf install libheif
```

**For Fedora/Ubuntu with KDE Plasma Only** (without this plugin, Plasma apps can’t open heic images)

```
sudo apt install qt-heif-image-pluginsudo dnf install qt-heif-image-plugin
```

Finally, open the heic image with your favourite image viewer and save it as JPG/PNG.

![Custom Light and Dark wallpaper in GNOME – transition][9]

Lastly, don’t forget to let me know below in the comment section whether you can create your own custom dark and light wallpaper for GNOME.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2022/03/gnome-42-release/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Sample-light-and-dark-wallpaper-for-demo.jpg
[3]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/tree/main/backgrounds
[4]: https://www.debugpoint.com/?attachment_id=9376
[5]: https://www.debugpoint.com/?attachment_id=9375
[6]: https://www.debugpoint.com/?attachment_id=9374
[7]: https://dynamicwallpaper.club
[8]: https://en.wikipedia.org/wiki/High_Efficiency_Image_File_Format
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Custom-Light-and-Dark-wallpaper-in-GNOME-transition.gif
