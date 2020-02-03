[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why choose Xfce for your lightweight Linux desktop)
[#]: via: (https://opensource.com/article/19/12/xfce-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Why choose Xfce for your lightweight Linux desktop
======
This article is part of a special series of 24 days of Linux desktops.
Looking for for a lightweight Linux distribution with plenty of
features? The Xfce Linux desktop has been the standard for a long time.
![Woman sitting in front of her laptop][1]

The [Xfce desktop][2] has a specific, self-stated goal: to be fast on a system with low resources while being visually appealing and user-friendly. It's been the de facto choice for lightweight Linux distributions (or remixes) for years and is often cited by its fans as a desktop that provides just enough to be useful, but never so much as to be a burden.

You may find Xfce included in the software repository of your Linux distribution, or you can download and install a distribution that ships Xfce as an available desktop (like the Xfce [Mageia][3] or [Fedora][4] spins or [Slackware][5]). Before you install it, be aware that, while it's lightweight, it is intended to provide a full desktop experience, so many Xfce apps are installed along with the desktop. If you're already running a different desktop, you may find yourself with redundant applications (two PDF readers, two file managers, and so on). If you just want to try the Xfce desktop, you can install an Xfce-based distribution in a virtual machine, such as [GNOME Boxes][6].

### Xfce desktop tour

True to the Unix philosophy, Xfce keeps its desktop modular. Many different components, such as the xfwm4 window manager, xfce4-panel, xfdesktop, Thunar, Xfconf, and so on, are bundled together to form the Xfce desktop environment. That may seem a pedantic way of defining a bunch of components that are always bundled together as a desktop, but in the case of Xfce, it's significant because these components truly are separate. You can run the Xfce panel over your Openbox or PekWM window manager, or use Xfce applets in your Fluxbox toolbar, and run Thunar as your file manager in Cinnamon or Pantheon. The possibilities are endless, but together they form the Xfce desktop.

The design of the Xfce desktop is clean, direct, and true to its Unix origins. Xfce began as some desktop widgets written with the XForms framework, even before GNOME existed. It was based conceptually upon the CDE desktop, which was the ubiquitous desktop at the time. Neither CDE nor XForms were open source, but Xfce was distributed freely. Eventually, Xfce was rewritten using the open source GTK toolkit, was included in several distributions, became a popular CDE and GNOME alternative, and eventually became the dominant choice of "lightweight" distributions.

Here's what it looked like on [Alan Formy-Duval's][7] desktop back in 2003:

![XFCE in 2003][8]

Xfce isn't necessarily a simple desktop: its application menu is in the upper-left corner (a tradition familiar to Linux users but probably foreign to newcomers), and it has a place for pinned application launchers, a system tray, virtual desktops, and a taskbar. It's a proper control panel for the GUI side of a Linux computer, with all the essential knobs and switches exposed for easy access. And it does all of that without making much of an impact on your system resources.

![XFCE in 2019 on Mageia Linux][9]

Significantly, Xfce uses GTK libraries to accomplish a lightweight desktop, and in doing so, it looks good, it looks familiar, and it can be themed to look really beautiful. The [Xfce screenshot forum][10] affords users the opportunity to show off their themes and configurations.

### Using the Xfce desktop

Xfce is an ideal desktop for a server or when you want quick access to important settings on a desktop that you rarely _look_ at. It's also ideal for Linux power users who want to adjust common settings quickly, but otherwise rarely deals with the GUI. Then again, it's a good-looking lightweight desktop, it can be themed easily, and it's got plenty of features. It may be the perfect desktop for you, no matter how you use your Linux computer. The only way to find out is to try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/xfce-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: http://xfce.org
[3]: http://mageia.org
[4]: http://fedoraproject.org
[5]: http://slackware.com
[6]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[7]: https://opensource.com/users/alanfdoss
[8]: https://opensource.com/sites/default/files/advent-xfce-2003.jpg (XFCE in 2003)
[9]: https://opensource.com/sites/default/files/advent-xfce.jpg (XFCE on Mageia Linux in 2019)
[10]: https://forum.xfce.org/viewtopic.php?id=12676
