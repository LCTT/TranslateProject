[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Go mouseless with the Linux Ratpoison window manager)
[#]: via: (https://opensource.com/article/19/12/ratpoison-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Go mouseless with the Linux Ratpoison window manager
======
This article is part of a special series of 24 days of Linux desktops.
If you'd rather live in a terminal all day and avoid mousing around, the
Ratpoison window manager is the solution for you.
![Buildings with different color windows][1]

Maybe you don't like desktops. Maybe even a lightweight window manager seems excessive to you. Maybe all you really use is a graphical user interface (GUI) application or two, and you're otherwise perfectly happy living in a terminal all day. If one or more of these sentiments sound familiar, then [Ratpoison][2] is the solution.

![Ratpoison][3]

The Ratpoison window manager models itself after [GNU Screen][4]. All window controls are performed with keyboard shortcuts, so you don't have to grab the mouse just to move a window out of your way. The trade-off is that it's impossibly minimalistic, which is, conveniently, also its greatest strength.

### Installing Ratpoison

Install Ratpoison from your distribution's software repository. After installing it, log out of your current desktop session so you can log into your new one. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your previous desktop, so you must override that before logging in.

With GDM:

![][5]

With SDDM:

![][6]

### Ratpoison desktop tour

The first time you log into Ratpoison, you are greeted by a black screen with some text in the upper-right corner telling you that you can press **Ctrl+t** for help.

That's all there is to the Ratpoison desktop.

### Interacting with Ratpoison

Ratpoison documentation uses Emacs-style notation for keyboard controls, so I'll use the same notation in this article. If you're unfamiliar with Emacs or GNU Screen, it can look confusing at first, so here's explicit instruction on how to "decode" this style of notation. The Control key on your keyboard is written as **C-**. To trigger Ratpoison's command mode, you press **C-t**, which means that you press **Ctrl+t**.

Since the **C-t** shortcut puts you into command mode, it's expected that some other key sequence will follow. For instance, to launch an xterm window, press **Ctrl+t**, just as you would when opening a new tab in a web browser, then press **c**. This may feel a little unnatural at first, because most of the keyboard shortcuts you're used to probably involve only one action. Ratpoison (and GNU Screen and Emacs) more often involve two.

The first application you probably should launch is either Emacs or a terminal.

In Ratpoison, your terminal is your exclusive gateway to the rest of the computer because there's no application menu or icons to click. The default terminal is the humble xterm, and it's available with the **C-t c** shortcut (I remember the **c** as being short for "console").

#### Launching applications

I usually start with Emacs instead, because it has most of the features I use anyway, including the **shell** terminal and the **dired** file manager. To start an arbitrary application in Ratpoison, press **C-t** and then the **!** (exclamation point) symbol. This provides a prompt in the upper-right corner of the screen. Type the command for the application you want to start and press **Return** or **Enter** to launch it.

#### Switching windows

Each application you launch takes over the entire screen by default. That means if [urxvt][7] is running, and then you launch Emacs, you can no longer interact with urxvt. Because switching back and forth between two application windows is a pretty common task, Ratpoison assigns it to the same keystroke as your usual Ratpoison command: **C-t C-t**. That means you press **Ctrl+t** once, and then **Ctrl+t** a second time. This is a toggle, like the default (at least in KDE and GNOME) behavior of a quick **Alt+Tab**.

To cycle through all open windows, use **C-t n** for _next_ and **C-t p** for _previous_.

#### Tiling window manager

You're free to use Ratpoison as a full-screen viewscreen, but most of us are used to seeing more than one window at a time. To allow that, Ratpoison lets you split your screen into frames or tiles and launch an application within each space.

![Ratpoison in split-screen mode][8]

With at least one application open, you can split the screen horizontally with **C-t s** (that's a lowercase "s") or vertically with **C-t S** (that's a capital "S").

To switch to another frame, use **C-t Tab**.

To remove another frame, press **C-t R**.

#### Moving windows in split-screen mode

Rearranging frames when Ratpoison has been split into several parts is done with the **Ctrl** key and a corresponding **Arrow** key. For instance, suppose you have a vertical split in the top half of your screen and a single frame in the bottom half. If an application is in the top-left frame, and you want to move it to the lower half of the screen, then—with that application active (use **C-t Tab** to get there)—press **C-t** to enter command mode and then **C-Down** (that's **Ctrl** with the **Down arrow** key). The application moves to the bottom half of the screen, with the application that took up the bottom half moving into the top-left.

To move that application to the top-right frame instead, press **C-t Right** (**Ctrl** with the **Right arrow** key).

To remove the top-left frame entirely, use **C-t R**. This doesn't kill the application in the frame, it only removes the frame from your viewport. The application that once occupied the frame is sent to the background and can be reached by cycling through the windows as usual (**C-t n**, for instance).

### Why you need to try Ratpoison

Ratpoison is a great example of an early (but current) tiling window manager. Other window managers like it exist, and some desktops even borrow concepts from this tradition by offering tiling features (KWin in KDE, for example, has an option to spawn new windows in tiles across the desktop).

If you've never used a tiling window manager, you owe it to yourself to try at least once. First, make it a goal to use Ratpoison. Then make it a goal to get through a whole afternoon without your mouse. Once you get the hang of it, you might be surprised at how quickly you can work.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/ratpoison-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colors-colorful-box-rectangle.png?itok=doWmqCdf (Buildings with different color windows)
[2]: https://www.nongnu.org/ratpoison/
[3]: https://opensource.com/sites/default/files/uploads/advent-ratpoison.png (Ratpoison)
[4]: https://opensource.com/article/17/3/introduction-gnu-screen
[5]: https://opensource.com/sites/default/files/advent-gdm_1.jpg
[6]: https://opensource.com/sites/default/files/advent-kdm_0.jpg
[7]: https://opensource.com/article/19/10/why-use-rxvt-terminal
[8]: https://opensource.com/sites/default/files/uploads/advent-ratpoison-split.jpg (Ratpoison in split-screen mode)
