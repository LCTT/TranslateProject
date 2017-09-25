A Window Into the Linux Desktop
============================================================

![linux-desktop](http://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2016-linux-1.jpg)

![](http://www.linuxinsider.com/images/2015/image-credit-adobe-stock_130x15.gif)

"What can it do that Windows can't?"

That is the first question many people ask when considering Linux for their desktop. While the open source philosophy that underpins Linux is a good enough draw for some, others want to know just how different its look, feel and functionality can get. To a degree, that depends on whether you choose a desktop environment or a window manager.

If you want a desktop experience that is lightning fast and uncompromisingly efficient, foregoing the classic desktop environment for a window manager might be for you.

### What's What

"Desktop environment" is the technical term for a typical, full-featured desktop -- that is, the complete graphical layout of your system. Besides displaying your programs, the desktop environment includes accoutrements such as app launchers, menu panels and widgets.

In Microsoft Windows, the desktop environment consists of, among other things, the Start menu, the taskbar of open applications and notification center, all the Windows programs that come bundled with the OS, and the frames enclosing open applications (with a dash, square and X in the upper right corner).

There are many similarities in Linux.

The Linux [Gnome][3] desktop environment, for instance, has a slightly different design, but it shares all of the Microsoft Windows basics -- from an app menu to a panel showing open applications, to a notification bar, to the windows framing programs.

Window program frames rely on a component for drawing them and letting you move and resize them: It's called the "window manager." So, as they all have windows, every desktop environment includes a window manager.

However, not every window manager is part of a desktop environment. You can run window managers by themselves, and there are reasons to consider doing just that.

### Out of Your Environment

For the purpose of this column, references to "window manager" refer to those that can stand alone. If you install a window manager on an existing Linux system, you can log out without shutting down, choose the new window manager on your login screen, and log back in.

You might not want to do this without researching your window manager first, though, because you will be greeted by a blank screen and sparse status bar that may or may not be clickable.

There typically is a straightforward way to bring up a terminal in a window manager, because that's how you edit its configuration file. There you will find key- and mouse-bindings to launch programs, at which point you actually can use your new setup.

In the popular i3 window manager, for instance, you can launch a terminal by hitting the Super (i.e., Windows) key plus Enter -- or press Super plus D to bring up the app launcher. There you can type an app name and hit Enter to open it. All the existing apps can be found that way, and they will open to full screen once selected.

 [![i3 window manager](http://www.linuxinsider.com/article_images/2017/84473_620x388-small.jpg)][4] (Click Image to Enlarge)

i3 is also a tiling window manager, meaning it ensures that all windows expand to evenly fit the screen, neither overlapping nor wasting space. When a new window pops up, it reduces the existing windows, nudging them aside to make room. Users can toggle to open the next window either vertically or horizontally adjacent.

### Features Can Be Friends or Foes

Desktop environments have their advantages, of course. First and foremost, they provide a feature-rich, recognizable interface. Each has its signature style, but overall they provide unobtrusive default settings out of the box, which makes desktop environments ready to use right from the start.

Another strong point is that desktop environments come with a constellation of programs and media codecs, allowing users to accomplish simple tasks immediately. Further, they include handy features like battery monitors, wireless widgets and system notifications.

As comprehensive as desktop environments are, the large software base and user experience philosophy unique to each means there are limits on how far they can go. That means they are not always very configurable. With desktop environments that emphasize flashy looks, oftentimes what you see is what you get.

Many desktop environments are notoriously heavy on system resources, so they're not friendly to lower-end hardware. Because of the visual effects running on them, there are more things that can go wrong, too. I once tried tweaking networking settings that were unrelated to the desktop environment I was running, and the whole thing crashed. When I started a window manager, I was able to change the settings.

Those prioritizing security may want to avoid desktop environments, since more programs means greater attack surface -- that is, entry points where malicious actors can break in.

However, if you want to give a desktop environment a try, XFCE is a good place to start, as its smaller software base trims some bloat, leaving less clutter behind if you don't stick with it.

It's not the prettiest at first sight, but after downloading some GTK theme packs (every desktop environment serves up either these or Qt themes, and XFCE is in the GTK camp) and enabling them in the Appearance section of settings, you easily can touch it up. You can even shop around at this [centralized gallery][5] to find the theme you like best.

### You Can Save a Lot of Time... if You Take the Time First

If you'd like to see what you can do outside of a desktop environment, you'll find a window manager allows plenty of room to maneuver.

More than anything, window managers are about customization. In fact, their customizability has spawned numerous galleries hosting a vibrant community of users whose palette of choice is a window manager.

The modest resource needs of window managers make them ideal for lower specs, and since most window managers don't come with any programs, they allow users who appreciate modularity to add only those they want.

Perhaps the most noticeable distinction from desktop environments is that window managers generally focus on efficiency by emphasizing mouse movements and keyboard hotkeys to open programs or launchers.

Keyboard-driven window managers are especially streamlined, since you can bring up new windows, enter text or more keyboard commands, move them around, and close them again -- all without moving your hands from the home row. Once you acculturate to the design logic, you will be amazed at how quickly you can blaze through your tasks.

In spite of the freedom they provide, window managers have their drawbacks. Most significantly, they are extremely bare-bones out of the box. Before you can make much use of one, you'll have to spend time reading your window manager's documentation for configuration syntax, and probably some more time getting the hang of said syntax.

Although you will have some user programs if you switched from a desktop environment (the likeliest scenario), you also will start out missing familiar things like battery indicators and network widgets, and it will take some time to set up new ones.

If you want to dive into window managers, i3 has [thorough documentation][6] and straightforward configuration syntax. The configuration file doesn't use any programming language -- it simply defines a variable-value pair on each line. Creating a hotkey is as easy as writing "bindsym", the key combination, and the action for that combination to launch.

While window managers aren't for everyone, they offer a distinctive computing experience, and Linux is one of the few OSes that allows them. No matter which paradigm you ultimately go with, I hope this overview gives you enough information to feel confident about the choice you've made -- or confident enough to venture out of your familiar zone and see what else is available. 

--------------------------------------------------------------------------------

作者简介：

**Jonathan Terrasi** has been an ECT News Network columnist since 2017\. His main interests are computer security (particularly with the Linux desktop), encryption, and analysis of politics and current affairs. He is a full-time freelance writer and musician. His background includes providing technical commentaries and analyses in articles published by the Chicago Committee to Defend the Bill of Rights.


-----------

via: http://www.linuxinsider.com/story/84473.html?rss=1

作者：[ ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:http://www.linuxinsider.com/story/84473.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84473
[3]:http://en.wikipedia.org/wiki/GNOME
[4]:http://www.linuxinsider.com/article_images/2017/84473_1200x750.jpg
[5]:http://www.xfce-look.org/
[6]:https://i3wm.org/docs/
