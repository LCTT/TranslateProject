[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is a Display Server in Linux? What is it Used for?)
[#]: via: (https://itsfoss.com/display-server/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Linux Jargon Buster: What is a Display Server in Linux? What is it Used for?
======

In Linux related articles, news and discussions, you’ll often come across the term display server, Xorg, Wayland etc.

In this explainer article, I’ll discuss display servers in Linux.

### What is display server in Linux?

A display server is a program which is responsible for the input and output coordination of its clients, to and from the rest of the operating system, and among the hardware and the operating system. Basically, thanks to a display server, you can use your computer graphically (GUI). Without the display server, you would only be restricted to a command line interface (TTY).

The display server provides the framework for a graphical environment so that you can use mouse and keyboard to interact with applications.

The display server communicates with its clients over the [display server protocol][1], like X11. The display server is a key component in any graphical user interface, specifically the windowing system.

Don’t confuse display server with [desktop environment][2]. The desktop environment uses display server underneath it.

Sounds familiar but it is not fully clear? Let me explain.

### Display server communications protocols in Linux

![][3]

There are three display protocols available in Linux, the X11, Wayland and Mir. I’ll give you a brief introduction for these display servers.

#### X11

The X11 (also refer as X) is the legacy display server that has been existed for years. It is the most common display server used in Linux distributions.

![X Architecture][4]

The X11 communication protocol, uses the [X.org Server][5] display server. It receives input events from [device drivers][6] and makes them available to one of its clients.

The display server also receives data from its clients, it processes the data and does the compositing and on Linux it passes the data to one of three kernel components – the [DRM][7], [gem][8] or [KMS driver][9].

The X.Org Server is a display server that relies on a second program, the [compositing window manager][10], to do the compositing. Examples are [Mutter][11] or [KWin][12]. GNOME uses Mutter.

#### Wayland

As per its website, Wayland is “intended as a simpler replacement for X, easier to develop and maintain”.

And indeed [Wayland][13] is the modern display server that is supposed to replace the legacy X display server.

Its adoption is still a work in progress. Ubuntu tried to switch to Wayland as the default display server with version 17.10 but the experiment met with negative feedback.

A lot of GUI applications and their frameworks depend on the X server. These applications didn’t work as intended on Wayland.

This forced Ubuntu to stay on X as default display server. It still provides the option to use Wayland but it is not default anymore.

An overwhelming majority of distributions use X display server by default even today.

![Wayland Architecture][14]

Display servers that put into effect the Wayland display server protocol, are called [Wayland compositors][15]. Like any X11, a Wayland compositor is responsible for handling input and output for its clients but also does the [compositing][16] – in contrast to X11.

A few Wayland compositors are [Weston][17], [Mutter][18], [KWin][12] or [Enlightenment][19].

#### Mir

The [Mir display server][20] comes with its own Mir display server protocol which differs to those used by X11 and Wayland. It was developed by [Canonical][21], as part of the development of Unity, and was intended to be the display server of choice for [Ubuntu][22].

As of 2017, it has been replaced with the Wayland display server for desktop editions of Ubuntu, although Mir’s development continued for Internet of Things (IoT) applications.

#### Why are we still using Xorg?

Wayland as it is relatively new, is not very stable yet, compared to Xorg. The programs, which act as clients, in order to communicate with a display server, must know how to do it.

For this reason, many programs might not run when using Wayland. Ubuntu’s experiment to switch to Wayland by default confirmed this.

#### Conclusion

I hope you have a bit better understanding of display server concept in Linux. I have tried to not go into too much technical details but I could not avoid them altogether.

Your feedback and suggestion is welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/display-server/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/X_Window_System_core_protocol
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/display-server-linux.png?resize=800%2C450&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/x-architecture-1.png?resize=800%2C507&ssl=1
[5]: https://en.wikipedia.org/wiki/X.Org_Server
[6]: https://en.wikipedia.org/wiki/Device_driver
[7]: https://en.wikipedia.org/wiki/Direct_Rendering_Manager
[8]: https://en.wikipedia.org/wiki/Graphics_Execution_Manager
[9]: https://en.wikipedia.org/wiki/KMS_driver
[10]: https://en.wikipedia.org/wiki/Compositing_window_manager
[11]: https://en.wikipedia.org/wiki/Mutter_(window_manager)
[12]: https://en.wikipedia.org/wiki/KWin
[13]: https://wayland.freedesktop.org/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/wayland-architecture-1.png?resize=800%2C500&ssl=1
[15]: https://en.wikipedia.org/wiki/Wayland_compositor
[16]: https://en.wikipedia.org/wiki/Compositing
[17]: https://en.wikipedia.org/wiki/Weston_(software)
[18]: https://en.wikipedia.org/wiki/Mutter_(software)
[19]: https://en.wikipedia.org/wiki/Enlightenment_(software)
[20]: https://mir-server.io/
[21]: https://canonical.com/
[22]: https://itsfoss.com/install-ubuntu/
