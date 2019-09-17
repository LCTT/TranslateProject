[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get a Preconfigured Tiling Window Manager on Ubuntu With Regolith)
[#]: via: (https://itsfoss.com/regolith-linux-desktop/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Get a Preconfigured Tiling Window Manager on Ubuntu With Regolith
======

_**Brief: Using tiling window manager in Linux can be tricky with all those configuration. Regolith gives you an out of box i3wm experience within Ubuntu.**_

Perhaps you have come across desktop screenshot like the one below in some forums. If you haven’t, try checking this [subreddit][1]. You might have wondered how could people make their Linux desktop look so beautiful.

![Linux Ricing Example | Image Source][2]

Of course, you can make your own desktop look good by changing the icon, theme and wallpaper but you might still not achieve the same result.

In majority of cases, a tiling window manager is used instead of the regular floating window manager. Ahmm! what’s a tiling window manager? Let me quickly explain it to you.

### Tiling window manager

The concept of tiling window manager is simple. Instead of stacking new program window over the other programs, it tiles the programs side by side. So the first program takes up the entire screen. The next one is tiled to its side either horizontally or vertically and so on.

![AwesomeWM Tiling Window Manager][3]

Sounds good but what happens when you have tens of programs open? It will be unusable won’t it? This is where the workspaces save your day. You can switch to new workspace and open new programs here. Switching between workspaces is just one or two keystroke away.

Tiling window manager can be overwhelming for you if you have never used it. It requires you to remember keyboard shortcuts to use it efficiently. But that’s not the end of trouble. Even if you install a tiling window manager like [i3wm][4] or [awesome][5], you won’t get a beautiful desktop out of the box. In fact, it could even look uglier than before.

You see, all those mesmerizing desktops are result of personal customization. The [tiling window managers are highly configurable but you need to learn to customize them][6]. That’s not very comforting specially for someone who has never used a tiling window manager.

If you are one of those people who wanted to have a good looking desktop with tiling window manager but could never configured them properly, the Linux ricing gods have heard your prayers.

### Regolith is dream come true for tiling window noobs

![Regolith Linux Desktop][7]

[Regolith][8] is a Linux distribution that brings Ubuntu’s simplicity, GNOME’s configuration and i3wm’s tiling interface together.

Wait! Don’t we already have enough of Ubuntu-based distributions that change nothing more than the theme and wallpaper? Regolith doesn’t want to be that kind of distribution. In fact, Regolith doesn’t pretend to be a standalone distribution.

Its [developer experimented with i3wm][9], tweaked it to his liking but soon realized that he had to do it all over again on all the systems he used. That’s when he decided to package it so that he could use it easily on new system. And hence Regolith Linux was born as a customized version of Ubuntu.

The developer totally understands that not everyone would be willing to replace their existing Ubuntu system just to get a tiling window manager and this is why he has made it available as a desktop as well. This means if you are already running Ubuntu, you can install Regolith desktop and use it beside your regular desktop environment.

### Install Regolith desktop on Ubuntu

Regolith desktop is available through [PPA in Ubuntu][10] 18.04 and higher versions. You can install it using the following commands:

```
sudo add-apt-repository -y ppa:kgilmer/regolith-stable
sudo apt install regolith-desktop
```

Once you have installed it, reboot your system. At the user login screen, click the username and you should see a gear symbol, Click on it and it would give you the option to change the desktop environment.

![Switch to Regolith Desktop][11]

### Using tiling window manager with Regolith

When you log in to the Regolith desktop, you’ll see a plain simple screen with some keyboard shortcuts displayed on the right side, a thin bottom panel with only a few system information. You can find the keyboard shortcut information on [this page][12] as well.

The keyboard shortcut will help you get started. You can search for an application or settings by pressing Super (Windows) and space key.

![Regolith App Launcher][13]

By default, the new program windows are tiled vertically. You can toggle that with Super+Backspace key. Do note that the tiling and toggling is related to the program window in focus. If you have three program windows and you are using the first program window, the next program will be tiled (vertically or horizontally) after it, not after the third program window. It takes some time in getting used to this concept.

![Multiple Program Windows in Regolith Desktop][14]

If you don’t like the layout of the windows, you can move them around using the Super+Shift+Arrow keys. You can move between the application windows using Super and Arrow keys.

If your screen is filled with applications and you want to breath fresh, press Super key and 2 (or 3 or 4, depending upon number of workspaces in use) and start afresh with a new workspace. The new workspace has the keyboard shortcut on the display. You can toggle it with Super+Shift+? key combination.

Regolith uses GNOME underneath so you can still use GNOME tools to change the system settings.

Regolith comes with four different color themes with solarized dark being the default. It uses Arc icon themes. Changing the icon theme is same as Ubuntu but if you want to change the color, you need to do some minor tweaking in the configuration file. You can find the configuration information on [this page][15].

![Regolith Desktop With Nord Color Scheme][16]

You can log out of Regolith using the Super+Shift+E key combination. The keyboard shortcuts displayed on the desktop is not correct for logging out.

Since I have never used i3wm or any other tiling window manager, I find it weird that there is no shutdown option here. You’ll have to use [command line to shutdown Ubuntu here][17].

You can find some [useful information to get started with Regolith desktop here][18].

### Getting rid of Regolith desktop

I can understand if you didn’t like Regolith enough to use it as your main desktop. Tiling window manager is not everyone’s cup of tea (or coffee). The good thing is that you can go back to your regular desktop environment the same way you switch to Regolith.

Log out of your account. Click on the username and you’ll see the gear icon. Click on it and select the desktop environment you want to use.

Once you are back to the other desktop environment, you may even choose to remove Regolith completely. Note that you MUST be using some other desktop environment while removing Regolith.

Open a terminal and use the following commands:

```
sudo apt remove regolith-desktop
```

You can [remove the PPA][19] as well:

```
sudo add-apt-repository --remove ppa:kgilmer/regolith-stable
```

### To tile, or not to tile, that is the question

![Regolith Desktop on my Ubuntu 18.04 LTS][20]

Personally, I am happy to have discovered Regolith desktop. I have been fascinated by the tiling window managers but I didn’t want to spend time on figuring out the configuration. Regolith gives me the comfort of using i3wm out of the box with my main distribution, Ubuntu.

I like it more as a desktop than a distribution. It gives the opportunity to try out tiling window manager without a lot of hassle.

Do you like the concept of Regolith desktop? Are you willing to give it a try? How’s your experience with tiling window manager (if any)? Do share your views in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/regolith-linux-desktop/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.reddit.com/r/unixporn/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-ricing-example.jpg?ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/awesome-window-anager.jpg?resize=800%2C450&ssl=1
[4]: https://i3wm.org/
[5]: https://awesomewm.org/
[6]: https://fedoramagazine.org/getting-started-i3-window-manager/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/regolith-linux-desktop-screenshot-apps.jpg?ssl=1
[8]: https://regolith-linux.org/
[9]: https://regolith-linux.org/motivations.html
[10]: https://itsfoss.com/ppa-guide/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/change-to-regolith-desktop.jpg?resize=800%2C400&ssl=1
[12]: https://regolith-linux.org/keybindings.html
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/regolith-app-launcher.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/regolith-desktop-tiled-windows.jpg?ssl=1
[15]: https://regolith-linux.org/configuring.html
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/regolith-desktop-with-nord-color-scheme.jpg?ssl=1
[17]: https://itsfoss.com/schedule-shutdown-ubuntu/
[18]: https://regolith-linux.org/getting_started.html
[19]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/regolith-desktop-screenshot.jpg?ssl=1
