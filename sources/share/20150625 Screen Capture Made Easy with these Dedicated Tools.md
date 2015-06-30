用这些专用工具让你截图更简单
================================================================================
"一图胜过千万句"，这句二十世纪早期在美国应运而生的名言，说的是一张单一的静止图片所蕴含的信息足以匹敌大量的描述性文字。本质上说，图片所传递的信息量比文字更有效更高效。

截图(或抓帧)是一种捕捉自计算机所录制可视化设备输出的快照或图片，屏幕捕捉软件能让计算机获取到截图。This type of software has lots of uses. As an image can illustrate the operation of computer software well, screenshots play an important role in software development and documentation. Alternatively, if you have a technical problem with your computer, a screenshot allows a technical support department to understand the problems you are facing. Writing computer-related articles, documentation and tutorials is nigh on impossible without a good tool for creating screenshots. Screenshots are also useful to save snippets of anything you have on your screen, particularly when it can not be easily printed.

Linux has a good selection of open source dedicated screenshot programs, both graphical and console based. For a feature-rich dedicated screenshot utility, look no further than Shutter. This tool is a superb example of a small open source tool. But there are some great alternatives too.

Screen capture functionality is not only provided by dedicated applications. GIMP and ImageMagick, two programs which are primarily image manipulation tools, also offer competent screen capturing functionality.

----------

### Shutter ###

![Shutter in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-Shutter1.png)

Shutter is a feature-rich screenshot application. You can take a screenshot of a specific area, window, your whole screen, or even of a website - apply different effects to it, draw on it to highlight points, and then upload to an image hosting site, all within one window.

Features include: 


- Take a screenshot of:
    - a specific area
    - window
    - the complete desktop
    - web pages from a script
- Apply different effects to the screenshot
- Hotkeys
- Print
- Take screenshot directly or with a specified delay time
- Save the screenshots to a specified directory and name them in a convenient way (using special wild-cards)
- Fully integrated into the GNOME Desktop (TrayIcon etc)
- Generate thumbnails directly when you are taking a screenshot and set a size level in %
- Shutter session collection:
    - Keep track of all screenshots during session
    - Copy screeners to clipboard
    - Print screenshots
    - Delete screenshots
    - Rename your file
- Upload your files directly to Image-Hosters (e.g. http://ubuntu-pics.de), retrieve all the needed links and share them with others
- Edit screenshots directly using the embedded drawing tool

- Website: [shutter-project.org][1]
- Developer: Mario Kemper and Shutter Team
- License: GNU GPL v3
- Version Number: 0.93.1

----------

### HotShots ###

![HotShots in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-HotShots.png)

HotShots is an application for capturing screens and saving them in a variety of image formats as well as adding annotations and graphical data (arrows, lines, texts, ...).

You can also upload your creations to the web (FTP/some web services). HotShots is written with Qt.

HotShots is not available in Ubuntu's Software Center. But it's easy to install by typing at the command line:

    sudo add-apt-repository ppa:ubuntuhandbook1/apps 
    
    sudo apt-get update
    
    sudo apt-get install hotshots

Features include:

- Simple to use
- Full featured
- Built-in editor
- Hotkeys
- Built-in magnification
- Freehand and multi-screen capture
- Supported Output Formats: Black & Whte (bw), Encapsulated PostScript (eps, epsf), Encapsulated PostScript Interchange (epsi), OpenEXR (exr), PC Paintbrush Exchange (pcx), Photoshop Document (psd), ras, rgb, rgba, Irix RGB (sgi), Truevision Targa (tga), eXperimental Computing Facility (xcf), Windows Bitmap (bmp), DirectDraw Surface (dds), Graphic Interchange Format (gif), Icon Image (ico), Joint Photographic Experts Group 2000 (jp2), Joint Photographic Experts Group (jpeg, jpg), Multiple-image Network Graphics (mng), Portable Pixmap (ppm), Scalable Vector Graphics (svg), svgz, Tagged Image File Format (tif, tiff), webp, X11 Bitmap (xbm), X11 Pixmap (xpm), and Khoros Visualization (xv)
- Internationalization support: Basque, Chinese, Czech, French, Galician, German, Greek, Italian, Japanese, Lithuanian, Polish, Portuguese, Romanian, Russian, Serbian, Singhalese, Slovak, Spanish, Turkish, Ukrainian, and Vietnamese

- Website: [thehive.xbee.net][2]
- Developer: xbee
- License: GNU GPL v2
- Version Number: 2.2.0

----------

### ScreenCloud ###

![ScreenCloud in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-ScreenCloud.png)

ScreenCloud is an easy to use open source screenshot tool.

With this software, users can take a screenshot using one of the 3 hotkeys or simply click the ScreenCloud tray icon. Users can choose where you want to save the screenshot.

If you choose to upload your screenshot to the screencloud website, a link will automatically be copied to your clipboard. This can be shared with friends or colleagues via email or in an IM conversation. All they have to do is click the link and look at your screenshot.

Features include:

- Capture full screen, window or selection
- Fast and easy: Snap a photo, paste the link, done
- Free hosting of your screenshots
- Hotkeys
- Set timer delay
- Enable 'Capture window borders'
- Enable/Disable Notifications
- Set app to run on start up
- Adjust account/upload/filename/shortcut settings
- Cross platform tool
- Plugin support, save to Dropbox, Imgur, and more
- Supports uploading to FTP and SFTP servers

- Website: [screencloud.net][3]
- Developer: Olav S Thoresen
- License: GNU GPL v2
- Version Number: 1.2.1

----------

### KSnapshot ###

![KSnapShot in action](http://www.linuxlinks.com/portal/content/reviews/Graphics/Screenshot-KSnapshot.png)

KSnapshot is a simple utility for taking screenshots. It can capture images of the whole desktop, a single window, a section of a window or a selected region. Images can then be saved in a variety of different formats.

KSnapshot also allows users to use hotkeys to take a screenshot. Besides saving the screenshot, it can be copied to the clipboard or opened with any program that is associated with image files.

KSnapshot is part of the KDE 4 graphics module.

Features include:

- Save snapshot in multiple formats
- Snapshot delay
- Exclude window decorations
- Copy the snapshot to the clipboard
- Hotkeys
- Can be scripted using its D-Bus interface

- Website: [www.kde.org][4]
- Developer: KDE, Richard J. Moore, Aaron J. Seigo, Matthias Ettrich
- License: GNU GPL v2
- Version Number: 0.8.2

--------------------------------------------------------------------------------

via: http://www.linuxlinks.com/article/2015062316235249/ScreenCapture.html

译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://shutter-project.org/
[2]:http://thehive.xbee.net/
[3]:https://screencloud.net/
[4]:https://www.kde.org/applications/graphics/ksnapshot/
