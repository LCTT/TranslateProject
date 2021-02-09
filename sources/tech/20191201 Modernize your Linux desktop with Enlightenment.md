[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Modernize your Linux desktop with Enlightenment)
[#]: via: (https://opensource.com/article/19/12/linux-enlightenment-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Modernize your Linux desktop with Enlightenment
======
This article is part of a special series of 24 days of Linux desktops.
Enlightenment offers a smooth, appealing, and modern Linux desktop
experience, even on older hardware.
![Light at the end of the tunnel][1]

One of Linux's many advantages is its ability to install and run on old computers. What Linux can't _technically_ do is make an old computer's hardware magically perform better. After all, the hardware is the same hardware as ever, and sometimes old hardware feels notably slow when processing modern software that tries to take advantage of new hardware features. This means that an old computer running Linux must run a rather basic desktop, because too many effects or animations might use up precious memory and graphics processing, resulting in sluggish performance.

The [Enlightenment][2] desktop wasn't designed to solve this exact problem, but in practice, that's exactly what it does. With its finely crafted foundation and custom libraries, Enlightenment provides an attractive and dynamic environment that runs smoothly on old computers and low-powered systems like the [Raspberry Pi][3]. You never have to feel like you're compromising your user experience (UX) just because you're running modest hardware. True to its name, it delivers on the promise of eco-friendly computing and is the first line of defense (or second, if Linux itself is the first) against planned obsolescence.

Of course, you don't have to run Enlightenment on an old computer. It works just as well on new computers.

Install Enlightenment from your distribution's software repository. Past versions of Enlightenment are still popular today (and some are still maintained as separate projects), and all of them are good, but the latest versions are the ones above 20. After installing it, log out of your current desktop session so you can log into your new Enlightenment desktop. By default, your session manager (KDM, GDM, LightDM, or XDM, depending on your setup) will continue to log you into your default desktop, so you must override the default when logging in.

Here's how to override the default and switch to Enlightenment on GNOME Desktop Manager:

![Selecting the Enlightenment desktop in GDM][4]

And on KDM:

![Selecting the Enlightenment desktop in KDM][5]

The first time you log into Enlightenment, it asks for some basic preferences, such as your desired language setting, size of window title bars, and so on. It's OK to accept the defaults when you're unsure, and it's safe to ignore the warning about ConnMan not being available. Most distributions use [NetworkManager][6] instead of Enlightenment's own network manager, ConnMan.

### Enlightenment desktop

By default, the Enlightenment desktop provides desktop icons for common places, such as your home directory, the root directory, and a temporary directory. There's also a "shelf," a docking area at the bottom of the screen where major applications can go when minimized, where launchers can be created for quick access to common applications, and where applets (such as volume control, a clock, keyboard layout, and so on) run.

Anything configurable in Enlightenment is configurable with a right-click.

Here's what Enlightenment looks like on Fedora:

![Enlightenment running on Fedora][7]

### Features

To access an application menu, click anywhere on the desktop. Enlightenment is a desktop environment, but it's disguised as a window manager. Its primary task is to help you arrange and manage windows, but it also ships with a file manager (called Fileman) and has options to use a network manager called ConnMan and its own terminal called Terminology. It also has a global settings panel to help manage themes, keyboard shortcuts, screen resolution, and so on.

Because Enlightenment ships with just a few applications, your default application set can stay the same as what you were using before trying Enlightenment. All of your K apps or GNOME applications and third-party applications like Firefox or Blender or LibreOffice will function as usual.

Enlightenment is a smooth, appealing, and modern desktop experience. Settle in and become enlightened!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-enlightenment-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/light_tunnel_death.jpg?itok=ERLZDTfl (Light at the end of the tunnel)
[2]: https://www.enlightenment.org/
[3]: https://opensource.com/resources/raspberry-pi
[4]: https://opensource.com/sites/default/files/uploads/advent-enlightenment-gdm.jpg (Selecting the Enlightenment desktop in GDM)
[5]: https://opensource.com/sites/default/files/uploads/advent-enlightenment-kdm.jpg (Selecting the Enlightenment desktop in KDM)
[6]: https://en.wikipedia.org/wiki/NetworkManager
[7]: https://opensource.com/sites/default/files/uploads/advent-enlightenment.jpg (Enlightenment running on Fedora)
