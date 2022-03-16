[#]: subject: "Experience the Stunning Cutefish Desktop in Arch Linux"
[#]: via: "https://www.debugpoint.com/2022/02/cutefish-arch-linux-install/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Experience the Stunning Cutefish Desktop in Arch Linux
======
NOW YOU CAN EXPERIENCE THE CUTEFISH DESKTOP IN VANILLA ARCH LINUX. THIS
ARTICLE OUTLINES THE STEPS TO INSTALL THE CUTEFISH DESKTOP ENVIRONMENT
IN ARCH LINUX SYSTEMS.
![Cutefish Desktop in Arch Linux][1]

### Cutefish Desktop

A while back, [we reviewed CutefishOS][2], which features the awesome looking Cutefish desktop, which has received a positive reaction and reaches from the readers of our portal. So, we thought this was a perfect time if you want to do some experiments with this desktop in your favourite Arch Linux. Why not?

Before you jump on to the installation part, here are some nuggets about Cutefish Desktop.

Cutefish Desktop is part of [Cutefish OS][3], a new Linux distribution under development. This Debian based Linux distribution features the incredible looking, lightweight Cutefish Desktop.

The Cutefish Desktop is written on Qt Quick, QML, C++ and KDE Framework for its inner workings. This modern desktop environment uses KWin and SDDM for window and display management.

Cutefish Desktop brings a complete macOS inspired to look for your Linux desktop out-of-the-box. That means you get stunning icons, wallpapers, a global menu, a top bar with nice notification popups and a bottom dock.

You can read a detailed review in our complete [write up here][2].

### Install Cutefish Desktop in Arch Linux

#### Install base Arch System

This guide assumes that you have a base Arch Linux installed in your system before trying these steps. Or, you can try if you have any Arch-based Linux distributions installed as well. Just be careful about the display management in those cases.

You can refer to our guide for Arch Linux installation if you are new to Arch.

  * [How to install Arch Linux using archinstall (recommended)][4]
  * [How to install Arch Linux (basic guide)][5]



#### Install Cutefish Desktop

The Arch Linux community repository contains the Cutefish group, which have all the component required for this desktop to run. It includes core packages, native applications and additional tools as mentioned below.

At the terminal prompt of your Arch Linux system, run the below command to install all the Cutefish Desktop packages.

```

    pacman -S cutefish

```

![A base Arch Linux prompt][6]

![Install Cutefish in Arch Linux][7]

Next, we need to install Xorg and display manager SDDM via the below command. Be careful if you install Cutefish desktop in an Arch install with other desktop environments – such as GNOME, KDE Plasma or Xfce. Because you already have a display manager and Xorg installed. So, you can easily skip this step.

```

    pacman -S xorg sddm

```

After the above commands are complete, enable the display manager via systemctl.

```

    systemctl enable sddm

```

That’s all you need to install Cutefish desktop as bare metal level. Once done, reboot the system, and you should see Cutefish Desktop as below after logging in.

[][8]

SEE ALSO:   How to Install GNOME Desktop in Arch Linux [Complete Guide]

The base install requires additional customization because it’s not as close as Cutefish OS.

### Post Install Configuration

Although Cutefish group in Arch repo includes its native apps, such as Calculator and file manager, the desktop lacks basic applications that you need to install separately to make it a fully functional and productive desktop.

I recommend installing the following essential apps using the below command for your base installation. You can skip this step or choose any other applications/combinations of your choice.

  * Firefox web browser
  * Kwrite text editor
  * Fonts (ttf-freefont)
  * VLC media player
  * Gwenview Image viewer
  * GIMP Image Editor
  * LibreOffice
  * Transmission



```

    pacman -S firefox ttf-freefont kwrite vlc gwenview gimp libreoffice-still transmission-qt

```

After installation, open the Settings and change the font of your choice. The default font was courier, which looks terrible on the desktop itself.

Reboot the system once you complete all the customizations as per your choice. And enjoy Cutefish desktop in Arch Linux.

![The Stunning Login Lock Screen of Cutefish Desktop][9]

### Closing Notes

This desktop is under development, so you would not find many settings items as of writing this. For example, there is no way to change resolutions, hiding dock and other options. That said, you can still use this with additional applications for your use. If you want to experiment, you can go ahead and try.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][10], [Twitter][11], [YouTube][12], and [Facebook][13] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/cutefish-arch-linux-install/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/Cutefish-Desktop-in-Arch-Linux-1024x575.jpg
[2]: https://www.debugpoint.com/2021/11/cutefish-os-review-2021/
[3]: https://en.cutefishos.com/
[4]: https://www.debugpoint.com/2022/01/archinstall-guide/
[5]: https://www.debugpoint.com/2020/11/install-arch-linux/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/A-base-Arch-Linux-prompt.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Install-Cutefish-in-Arch-Linux.jpg
[8]: https://www.debugpoint.com/2020/12/gnome-arch-linux-install/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/The-Stunning-Login-Lock-Screen-of-Cutefish-Desktop-1024x576.jpg
[10]: https://t.me/debugpoint
[11]: https://twitter.com/DebugPoint
[12]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[13]: https://facebook.com/DebugPoint
