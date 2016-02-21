mudongliang

Linux Mint 18 Will Get Its Own Set Of Apps
=============================================

![](http://itsfoss.com/wp-content/uploads/2016/01/Linux-Mint-apps.jpg)

It’s common for distro developers to create and release a series of apps that are designed specifically for their distros. A big example of this is [elementary OS](https://elementary.io/). Nine years in, Linux Mint is finally taking the plunge and doing the same.

>#LinuxMint to finally get its own apps in Mint 18.

[Linux Mint](http://www.linuxmint.com/) is one of the best known Linux distros available. Based on Ubuntu and Debian, Linux Mint strives to create a “modern, elegant and comfortable operating system which is both powerful and easy to use”. The team behind Linux Mint is also very involved with the [MATE](http://itsfoss.com/install-mate-desktop-ubuntu-14-04/) and [Cinnamon](http://itsfoss.com/install-cinnamon-ubuntu-14-04/) desktop environments.

## First X-Men, now X-Apps

Thursday, Linux Mint project lead Clement Lefebvre [announced](http://blog.linuxmint.com/?p=2985) the creation of the X-Apps. The X-Apps are designed to be desktop-agnostic so that developers can update them without having to tweak them for each desktop environment. Lefebvre stated that these X-Apps would be used as default applications for Cinnamon, MATE and Xfce.

## Does Linux Need Even More Apps?

According to Lefebvre, the creation of the X-Apps was necessitated by the release of GNOME 3.18. He said that with the release of GNOME 3.18:

> “GTK itself and many of the GNOME applications now integrate better with GNOME Shell and look more native in that environment. The bad news, is that they now look completely out of place everywhere else. To make matters worse, Unity, the flagship product of Ubuntu, relies heavily on GTK, GNOME applications and the GNOME environment itself, so we’re not dealing with the upstream version of 3.18 here, but with a collection of patches which bring their own issues (one example is that Ubuntu reintroduces menubars and titlebars in applications but without rewriting their headerbar.. so you sometimes see all three of them).”

In the past, the Linux Mint team dealt with the problem by “downgrading apps (Linux Mint 17 uses gedit 2.30 for instance), patching GNOME (GTK and various GNOME apps) and using alternatives (mostly in MATE and Xfce)”.

Lefebvre also said that it didn’t make sense to build specific applications for Cinnamon and MATE this is why they opted to work on apps which would be generic, perfectly suited to run in Cinnamon, MATE and Xfce (and possibly other desktop environments).

He further added:

>"X-Apps will be a collection of generic GTK3 applications using traditional interfaces which can be used as default desktop components in Cinnamon, MATE and Xfce. In Mint 18, the “X apps” will allow us to maintain a native look and a good level of integration because they will be used in replacement of GNOME applications which now look foreign (using headerbars and a distinctive layout). Long-term, the X-App project will allow us to innovate and to develop new features and improvements in the applications themselves (this is something we couldn’t do via patches, temporary forks or DE-specific forks like the MATE apps because it was too costly)."

## What Kind of Apps Will Be Available?

![](http://itsfoss.com/wp-content/uploads/2016/01/xedit.png)

Lefebvre only revealed one of the upcoming X-Apps: a text editor named xedit. Here are some of the feature that it will provide:

- Based on Pluma to lower learning curve
- Makes use of GTK3
- Doesn’t depend on GNOME or MATE

## When

The X-Apps will be coming together with [Linux Mint 18 release](http://itsfoss.com/linux-mint-18-codenamed-sarah/), which will follow the release of Ubuntu 16.04 LTS by several months. [Ubuntu 16.04 is scheduled to release in April](http://itsfoss.com/ubuntu-1604-release-schedule/).

## Final Thoughts

Personally, whenever I hear about someone releasing new distro specific apps, I cringe. The Linux universe is already incredibly fragmented. Do we really need more duplicate projects to take time and energy to create? Don’t get me wrong, I like the idea of desktop-agnostic apps. It would fix a lot of problems with how apps look from distro to distro.

The problem that worries me is “Will they be able to pull it off?” As I stated before, the Linux Mint guys also work on two desktop environments. Now add application development to the mix. I’ve never written a piece of software myself (other than one that said “Hello, World”), but I do know that when you try and complicate a project bad things happen. Many projects have fallen to the dragon of feature creep I hope that doesn’t happen here.

Do you have a different take? Let me know in the comments below.

------------------------------------------------------------------------------

via: http://itsfoss.com/linux-mint-own-apps/

作者：[JOHN PAUL][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/john/
