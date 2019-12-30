[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Chill out with the Linux Equinox Desktop Environment)
[#]: via: (https://opensource.com/article/19/12/ede-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Chill out with the Linux Equinox Desktop Environment
======
This article is part of a special series of 24 days of Linux desktops.
EDE is not the most glamorous, minimal, nor efficient desktop. But its
soft, muted tones are calming, its familiarity soothing, and its icon
theme fun.
![Linux penguin at the north pole beside an igloo][1]

I haven't used the Fast Light Toolkit ([FLTK][2]) for anything serious yet, but I'm a fan of the C++ GUI toolkit that's pretty simple to learn and (in my experience) reliable even across updates. When I found out that there was a desktop environment built with FLTK, I was eager to try it—and I was quickly glad I did. The [Equinox Desktop Environment (EDE)][3] is a fast and simple desktop written in C++ and FLTK for Unix desktops. It uses common desktop conventions, so it looks and feels familiar right away, and after only a few days of using it, I found its simplicity provides a minimal elegance that I enjoy.

![EDE desktop][4]

### Installing EDE

You are likely to find EDE included in your distribution's software repository, but you can also find it in its [SourceForge repository][5]. If you're already running a different desktop, it's safe to install EDE on the same system because it brings along just a few extra applications, which are specific to EDE so they won't get in your way on other desktops.

EDE is only the desktop, and it uses the [Pekwm][6] window manager to handle layout.

After installing EDE, log out of your current desktop session so you can log into your new one. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![][7]

With SDDM:

![][8]

When EDE first boots, you might be prompted to confirm some startup tasks. On my Slackware workstation, KDE had marked some services as startup tasks (such as the HPLIP print monitor and a Bluetooth daemon), and EDE imported them with just one confirmation box.

![Importing desktop services in EDE][9]

After setting it up once, you won't need to do it again.

### EDE desktop tour

EDE's layout is exactly what most people expect from a desktop: application menu on the left, taskbar in the middle, system tray on the right. It's the standard off-the-shelf layout that confuses nobody; this is a desktop that's safe to install on a Linux computer and hand over, with confidence, to someone who's never used Linux in their life. They'll fall right into this desktop with a soft and gentle landing.

You can bring up a small desktop menu with a right-click. This allows you to make an application launcher on the desktop, create a folder, and set some theme options.

The panel at the bottom of the screen is retractable, so you can work full-screen if you prefer. Click the clock in the bottom-right of the screen to bring up a calendar and time-zone settings.

EDE has a small Configuration Place application that provides access to a few simple preferences:

  * Background and icon settings
  * Screensaver settings
  * Time and clock
  * System bell
  * Keyboard
  * Preferred applications



![EDE Configuration Place][10]

There's not much more to EDE. There's no file manager, no text editor, or paint program, or game of solitaire. You must bring anything you want to run on your desktop. That means you get to pick and choose from the wide array of Linux applications and use whatever you love the most.

### EDE as a statement

I found the simplicity of EDE oddly comforting, at least as a kind of "holiday" desktop; it's a nice place to visit. It's not the most glamorous desktop available, nor the most minimal, nor the most efficient. But its soft, muted tones are calming, its familiarity soothing, and its icon theme fun and exuberant. EDE is a desktop that's proud of its slow and steady pace.

If you're in the mood to put your feet up and enjoy a clean and pleasant interface, try EDE.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/ede-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/penguin.igloo_.png?itok=K92O7H6b (Linux penguin at the north pole beside an igloo)
[2]: https://www.fltk.org/
[3]: https://sourceforge.net/projects/ede/
[4]: https://opensource.com/sites/default/files/uploads/advent-ede.jpg (EDE desktop)
[5]: http://ede.sf.net
[6]: https://opensource.com/article/19/12/pekwm-linux-desktop
[7]: https://opensource.com/sites/default/files/advent-gdm_2.jpg
[8]: https://opensource.com/sites/default/files/advent-kdm_1.jpg
[9]: https://opensource.com/sites/default/files/uploads/advent-ede-init.jpg (Importing desktop services in EDE)
[10]: https://opensource.com/sites/default/files/uploads/advent-ede-conf.jpg (EDE Configuration Place)
