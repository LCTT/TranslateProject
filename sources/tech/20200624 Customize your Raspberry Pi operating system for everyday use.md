[#]: collector: (lujun9972)
[#]: translator: (Yufei-Yan)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customize your Raspberry Pi operating system for everyday use)
[#]: via: (https://opensource.com/article/20/6/custom-raspberry-pi)
[#]: author: (Patrick H. Mullins https://opensource.com/users/pmullins)

Customize your Raspberry Pi operating system for everyday use
======
Lighten up your Raspberry Pi even more by installing Raspberry Pi OS
Lite.
![Cartoon graphic of Raspberry Pi board][1]

If you have a Raspberry Pi running [Raspberry Pi OS][2] (previously known as Raspbian) operating system, you know it's an awesome little computer with a great operating system for beginners that includes just about everything you could possibly want. However, once you become familiar with the Pi and want to start using it for other things, you might want an operating system (OS) that doesn't include everything in the default build.

When that happens, you have two choices: You can pull your hair out trying to uninstall all the cruft you don't want, or you can use Raspberry Pi OS Lite to build your own custom, lightweight operating system tailored to your exact specs. I suggest saving yourself some time and aggravation and going with the latter option.

### Raspberry Pi OS Lite

The "Lite" version of Raspberry Pi OS is really nothing more than a minimal image based on the latest version of [Debian][3]. This image contains only the core operating system and boots to a command line instead of a desktop. Consider this the foundation of your custom Raspberry Pi OS. Everything from here on builds on this core.

Head over to the Raspberry Pi Foundation's website and [download][2] the Lite image. After that's complete, check out the detailed [installation guide][4] covering how to burn a Raspberry Pi operating system image to an SD card using Linux, Windows, or macOS.

If you plan to use your Pi for a minimalist system to run scripts and services, you're pretty much done. If you want to do more, keep reading.

### X Windows

To start, it's good to have a windowing system for the occasional time you want to connect to a Raspberry Pi with a graphical user interface (GUI).

The [X Window System][5], sometimes referred to as X11, is a basic windowing system common on Unix computer operating systems. X11 provides the basic framework for a GUI desktop environment. It is what allows you to interact with the computer using windows, a mouse, and a keyboard.

#### Install X Windows

The following line will install the minimal set of packages needed to get X11 going:


```
`sudo apt install -y --no-install-recommends xserver-xorg-core xserver-xorg xfonts-base xinit`
```

With `--no-install-recommends`, only the main dependencies (the packages in the depends field) are installed. This saves a ton of space because the other recommended—but not necessarily needed—packages are not installed.

### Go a step further with Xfce Desktop Environment

You could stop here and use X Windows as your desktop, if you want. However, I wouldn't recommend it. The windows manager that comes with X Windows is minimalist in a way that feels outdated. Instead, I recommend installing a modern desktop environment like Xfce, GNOME, or KDE. When it comes to microcomputers, I prefer [Xfce][6] over the others because it's designed to work well on systems with limited resources, and you can customize the way it looks via themes, icons, and more.

#### Install Xfce

Installing the Xfce desktop environment is super easy. Just use:


```
`sudo apt install -y --no-install-recommends xfce4 desktop-base lightdm`
```

That's it! You now have X Windows (X11) and Xfce installed. Now it's time to customize the environment and install some essential applications.

### Essential applications

So far, you've installed X Windows (X11), the Xfce Desktop Environment, and LightDM (a display manager, added with Xfce). At this point, you have a complete, lightweight system that you can boot into and use normally. However, there are a few essential applications that I always like to install to round things out.

The following command installs a terminal app, the [Audacious][7] audio player, the [Ristretto][8] image viewer, the [Mousepad][9] text editor, the [File Roller][10] archive manager, and the [Thunar][11] volume manager:


```
sudo apt install -y --no-install-recommends xfce4-terminal audacious ristretto
sudo apt install -y --no-install-recommends mousepad file-roller thunar-volman
```

#### Optional goodies

Some other goodies you might want to install are a good network manager, task manager, PDF viewer, and notification agent, as well as a wallpaper manager, screen-capture tool, some new icons, and new cursor themes. In short, these are practical additions for day-to-day usage if the Raspberry Pi will be your go-to system:


```
sudo apt install -y --no-install-recommends network-manager xfce4-taskmanager xfce4-notifyd
sudo apt install -y --no-install-recommends  xpdf gnome-icon-theme dmz-cursor-theme
```

### Where to go from here?

If everything worked correctly, you now have a Raspberry Pi running a super-lightweight operating system based on Xfce 4 and Debian Lite. I suggest heading over to the Xfce website and checking out all the other cool [goodies][12] you can install and use. Where you go from there is totally up to you!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/custom-raspberry-pi

作者：[Patrick H. Mullins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pmullins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi_cartoon.png?itok=m3TcBONJ (Cartoon graphic of Raspberry Pi board)
[2]: https://www.raspberrypi.org/downloads/raspberry-pi-os/
[3]: https://www.debian.org/
[4]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[5]: https://en.wikipedia.org/wiki/X_Window_System
[6]: http://xfce.org
[7]: https://audacious-media-player.org/
[8]: https://docs.xfce.org/apps/ristretto/start
[9]: https://github.com/codebrainz/mousepad
[10]: https://gitlab.gnome.org/GNOME/file-roller
[11]: https://docs.xfce.org/xfce/thunar/thunar-volman
[12]: https://goodies.xfce.org/
