[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Magnify Screen Areas On Linux Desktop)
[#]: via: (https://www.ostechnix.com/how-to-magnify-screen-areas-on-linux-desktop/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Magnify Screen Areas On Linux Desktop
======

Have you ever been in a situation where you wanted to magnify a particular portion of your screen? If you’re a graphic designer, you might be definitely in this situation often. Please note that I am not talking about enlarging a text. Magnifying the screen area is different than merely enlarging the text size. Magnification is the process of enlarging something (E.g. Images) only in appearance, not in physical size. Fortunately, there are many applications available to magnify screen areas on Linux systems. The magnifiers can help the artists or graphic designers for accurate graphical design and/or detail work. This can also help to those who have poor eyesight or small screen size monitor with low resolutions in general.

### Magnify Screen Areas On Linux Desktop

There could be several ways, applications to do this. I am aware of the following two methods as of writing this guide. I will keep looking for more ways and applications which will help to magnify, try them out and update this guide in future.

##### Method 1 – Using Magnus

Magnus is a small and simple desktop magnifier application for Linux. It literally follows the mouse cursor, allowing you to move around by zooming in on parts of the screen. It shows the screen areas around the mouse pointer in a separate window magnified up to five times. Magnus is free, open source application released under MIT license.

Magnus is available as [**snap**][1] application. So we can install it on Linux distributions that supports snaps using command:

```
$ sudo snap install magnus
```

There is also a PPA for Magnus is available.

```
$ sudo add-apt-repository ppa:flexiondotorg/magnus

$ sudo apt update

$ sudo apt install magnus
```

Once Magnus is installed, launch it from menu or application launcher.

You will see a small window on the top left corner of your screen. You can move it to any side of the screen and increase its size by simply dragging the hot corners windows.

![][3]

Magnus screen magnifier Interface

Now, move the mouse pointer around the screen areas to magnify them.

![][4]

Magnify Screen Areas On Linux Desktop Using Magnus

You can increase the zooming level (by 2x, 3x, 4x and 5x) from the drop-down box in the tool bar of Magnus app. By default, Magnus will magnify the areas in 2x size.

##### Method 2 – Using Universal Access menu

If you’re a GNOME user, you need not to install any external applications. GNOME desktop comes with a built-in feature called **Universal Access** which will provide many accessibility features such as,

  * Magnifying screen areas,
  * Read screen aloud,
  * Read screen in Braille,
  * Change text size,
  * Adjust contrast,
  * Adjust speed of mouse/touchpad,
  * Use on-screen keyboard,
  * And many.



We will look into only one feature i.e magnifying screen areas.

Launch Universal Access menu. It is usually found under System Settings. Or, click on a person-like icon on the top bar.

There are many accessibility options available in Universal access menu as shown in the picture below. To enable magnification, click on **Zoom** tab.

![][5]

Universal Access menu

In the Zoom options window, simply enable Zoom option. Just click the **ON/OFF slider button** to enable/disable zoom option.

![][6]

Magnify Screen Areas On Linux Desktop Using Universal Access menu

Once you enabled the zoom option, the screen areas will simply magnify when you move the mouse pointer around them. You can increase or decrease the zooming level by simply clicking on the +/- buttons besides Magnification option.

Unlike Magnus application, Universal access menu offers a few additional functionalities as listed below.

  * Change mouse tracking. This setting can be applied in the **Magnifier tab** of Zoom options window.
  * Change position of the magnified view on the screen i.e entire screen or part of the screen like top half, bottom half, left half and right half. To adjust these settings, go to **Magnifier tab**.
  * Activate crosshairs to help you find the mouse or touchpad pointer. Also, we can adjust mouse or touchpad thickness, length and color. These settings can be changed in the **Crosshairs tab**.
  * Adjust color effects such as brightness, contrast, color. All of these settings can be adjusted in **Color effects tab**.



I tested these two methods on Ubuntu 18.04 desktop and I could easily magnify the screen areas.

To be honest, I never knew that we can magnify a screen area in Linux. Before I know about this, all I would do is just screenshot the area and zoom in/out using an image viewer application. Well, not anymore! I know now how to magnify a screen area on Linux desktop and I hope this will be useful to you too.

**Resources:**

  * [**Magnus GitHub Repository**][7]
  * [**Ubuntu documentation**][8]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-magnify-screen-areas-on-linux-desktop/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/introduction-ubuntus-snap-packages/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/07/Magnus-launch.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Magnify-Screen-Areas-On-Linux-Desktop-Using-Magnus.gif
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Universal-Access-menu.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Magnify-Screen-Areas-On-Linux-Desktop-Using-Universal-Access-menu.png
[7]: https://github.com/stuartlangridge/magnus
[8]: https://help.ubuntu.com/stable/ubuntu-help/a11y-mag.html.en
