Linux Kernel 4.1 Released, This Is What’s New
================================================================================
**TuxlogoA brand new version of the Linux Kernel — the heartbeat of the modern world (if we you want us to be poetic about it) — has been released.**

![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

The arrival [has been announced][1] by Linus Torvalds (who else?) on the Linux Kernel Mailing List (where else?) and comes almost two months after the [first entry in the new 4.x series][2].

Levity aside, and like every release before it, Linux Kernel 4.1 features a big set of changes. These touch everything from hardware compatibility to power management to file-system performance and technical fixes for obscure processors you’ve never heard of.

Linux 4.1 is already being tracked in Ubuntu 15.10, due for release in October.

### What’s New In Linux 4.1? ###

![Tux got mail](http://www.omgubuntu.co.uk/wp-content/uploads/2015/06/linux-kernel-4-11-350x200.jpg)
Tux got mail

The sub-heading is on your lips and we’re not here simply to serve up an announcement of an announcement.

We’ve gone through the (vast, long, lengthy and at times technically unintelligible) change-log to pick out some highlights that may not feed hyperbole but may impact on you, a desktop users.

#### Power Improvements ####

The big headline user-facing feature you’ll find in Linux 4.1 are the wealth of performance and power efficiency improvements committed for Intel’s Cherry Trail and Bay Trail chips. SoCs and devices, such as the Intel Compute Stick.

Anecdotal suggestions are that Linux Kernel 4.1 gives select combinations of newer Intel hardware as much as an extra hour of battery life. Such high gains are not likely to apply to anything but a very specific sub-set of chips and systems (and high-end ones at that) but it’s still exciting to hear of.

**Highlights of Linux 4.1 include:**

- EXT4 gains file-system level encryption (thanks to Google)
- Logitech lg4ff driver improves ‘force feedback’ for gaming wheels
- Toshiba laptop driver gains USB sleep charging and backlight improvements
- Rumble support for Xbox One controller
- Better battery reporting in Wacom tablet driver
- Various misc. power improvements for both ARM and x86 devices
- Samsung Exynos 3250 power management improvements
- Support for the Bamboo Pad
- Lenovo OneLink Pro Dock gains USB support
- Support for Realtek 8723A, 8723B, 8761A, 8821 Wi-Fi cards

### Install Linux Kernel 4.1 on Ubuntu ###

Although this release of the kernel is classed as stable there is no pressing need for Ubuntu desktop users to go out of their way to install it.

Not that you can’t; if you’re impatient and skilled enough to do so you can take a crack at installing Linux 4.1 on Ubuntu by grabbing the appropriate set of packages from [Canonical’s mainline kernel archive][3] (or by risking a third-party PPA).

Ubuntu 15.10 Wily Werewolf, due for release in October, is to be based on the Ubuntu Kernel 4.1.x (the Ubuntu kernel is the Linux Kernel plus Ubuntu-specific patches that have not been accepted upstream).

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/06/linux-4-1-kernel-new-features

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://lkml.org/lkml/2015/6/22/8
[2]:http://www.omgubuntu.co.uk/2015/04/linux-kernel-4-0-new-features
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D