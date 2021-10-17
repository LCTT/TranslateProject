[#]: subject: "helloSystem, the Mac-like FreeBSD OS, Takes Another Step Towards Full Release"
[#]: via: "https://news.itsfoss.com/hellosystem-towards-first-release/"
[#]: author: "John Paul Wohlscheid https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

helloSystem, the Mac-like FreeBSD OS, Takes Another Step Towards Full Release
======

Recently, the helloSystem devs released the newest version of their operating system. helloSystem is a newer project that wants to create a simple and easy to use operating system and is based on FreeBSD. Let’s take a look at what that means to you and me.

### What is helloSystem?

![helloSystem’s About screen][1]

Most of you have probably never heard of [helloSystem][2] before. The project was started by the [creator of AppImage][3], [Simon Peter][4], early last year. Simon’s goal is to create a “friendly [Libre Desktop][5] operating system with focus on simplicity, minimalist elegance, and usability”.

Simon takes inspiration from the simpler operating system of the 80s and 90s, specifically **early MacOS**, specifically [System 1][6]. If you just look at screenshots of the system in action, you may be tempted to say, “I don’t see what the fuss is all about. There are a bunch of Linux distros or themes that look just like MacOS.”

The project goes beyond merely looking like MacOS, it wants to return to a simpler, easier to use design. According to the [website][7], “helloSystem is a desktop system for creators with a focus on simplicity, elegance, and usability. Its design follows the “Less, but better” philosophy. It is intended as a system for “mere mortals”, welcoming to switchers from the Mac.” You can find out more about Simon’s thoughts on what he plans for helloSystem by watching his presentation at [FOSDEM 21][8].

Just like the [suckless project][9], Simon created a list of “[Welcome and unwelcome technologies][10]“. The approved list of technologies include:

  * Qt
  * mDNSResponder
  * Python
  * Go



![helloSystem’s Welcome screen][1]

The list of “unwelcome technologies” includes stuff that Simon considers “too complex or deemed aesthetically unpleasant”. These include:

  * Touch
  * btrfs
  * Gnome
  * GTK
  * Client-side window decorations
  * Wayland
  * Pipewire
  * XDG Desktop spec
  * Fonts that are metrically compatible to, but make no attempt at being visually similar to, original typefaces
  * Package managers for end-user applications
  * Configuration files, IP addresses
  * D-Bus
  * Security that restricts what the user or applications can do
  * polkit
  * Caps Lock key
  * URIs for local files



![Installing Inkscape on helloSystem][1]

### How helloSystem Works

I’d better explain a little about how helloSystem works. Just like MacOS, the desktop has a global menu at the top of the screen and a dock at the bottom. Also like MacOS’s Finder, helloSystem has a file manager (named Filer) that also handles window management.

In the upper left, you’ll find a “System” menu that you can use to access applications. (You can also type the name of an application in the search box in the upper left corner.) helloSystem only has a couple of basic applications installed out of the box. If you click on an application that is not installed, helloSystem will download and install an AppImage of that application.

Under the hood, helloSystem is based on FreeBSD 12.2. It has ZFS enable by default. It does not have a passwords or user account system. This doesn’t mean that they are disregarding security. According to the [site][10], “This is NOT to say that Security in general is not important. It is to say that it needs to be implemented in a way that it doesn’t restrict the legitimate user (owner) of the device from truly “owning” the device”.

### New Features in the Latest Release

![helloSystem’s Utilities window][1]

This latest release of helloSystem includes quite a few graphical and minor changes and updates, including:

  * Switched from Openbox to the KWin window manager
  * Properly centered window titles
  * Windows snap to certain sizes when dragged to the edge of the screen, similar to “Aero Snap”
  * Simplified user interface for Desktop Settings; changes are now applied immediately
  * Remove tabs in file manager to simplify user interface
  * New Battery applet for the Menu to show the battery fill level
  * The Trash icon on the Desktop no longer has a “Move to Trash” context menu item
  * Animation when minimizing and un-minimizing windows
  * Animations on window resize
  * Tuned kernel configuration for optimized sound
  * Simplified “Get Info” dialog in file manager



You can see the rest of the changes [here][11]. You can also download the latest .iso file from the same link. Give it a try and let us know what you think.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/hellosystem-towards-first-release/

作者：[John Paul Wohlscheid][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4NSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://github.com/helloSystem/hello
[3]: https://itsfoss.com/appimage-interview/
[4]: https://github.com/probonopd
[5]: https://medium.com/@probonopd/bring-back-the-ease-of-80s-and-90s-personal-computing-393738c5e2a1
[6]: https://github.com/helloSystem/hello/wiki#design-principles
[7]: https://hellosystem.github.io/docs/
[8]: https://fosdem.org/2021/schedule/event/hello_bsd/
[9]: https://suckless.org/sucks/
[10]: https://github.com/helloSystem/hello/wiki/Welcome-and-unwelcome-technologies
[11]: https://github.com/helloSystem/ISO/releases/tag/r0.6.0
