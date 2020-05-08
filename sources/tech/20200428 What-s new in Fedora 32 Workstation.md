[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What’s new in Fedora 32 Workstation)
[#]: via: (https://fedoramagazine.org/whats-new-fedora-32-workstation/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/author/ryanlerch/)

What’s new in Fedora 32 Workstation
======

![][1]

Fedora 32 Workstation is the [latest release][2] of our free, leading-edge operating system. You can download it from [the official website here][3] right now. There are several new and noteworthy changes in Fedora 32 Workstation. Read more details below.

### GNOME 3.36

Fedora 32 Workstation includes the latest release of GNOME Desktop Environment for users of all types. GNOME 3.36 in Fedora 32 Workstation includes many updates and improvements, including:

#### Redesigned Lock Screen

The lock screen in Fedora 32 is a totally new experience. The new design removes the “window shade” metaphor used in previous releases, and focuses on ease and speed of use.

![Unlock screen in Fedora 32][4]

#### New Extensions Application

Fedora 32 features the new Extensions application, to easily manage your GNOME Extensions. In the past, extensions were installed, configured, and enabled using either the Software application and / or the Tweak Tool.

![The new Extensions application in Fedora 32][5]

Note that the Extensions application is not installed by default on Fedora 32. To either use the Software application to search and install, or use the following command in the terminal:

```
sudo dnf install gnome-extensions-app
```

#### Reorganized Settings

Eagle-eyed Fedora users will notice that the Settings application has been re-organized. The structure of the settings categories is a lot flatter, resulting in more settings being visible at a glance.

Additionally, the **About** category now has a more information about your system, including which windowing system you are running (e.g. Wayland)

![The reorganized settings application in Fedora 32][6]

#### Redesigned Notifications / Calendar popover

The Notifications / Calendar popover — toggled by clicking on the Date and Time at the top of your desktop — has had numerous small style tweaks. Additionally, the popover now has a **Do Not Disturb** switch to quickly disable all notifications. This quick access is useful when presenting your screen, and not wanting your personal notifications appearing.

![The new Notification / Calendar popover in Fedora 32 ][7]

#### Redesigned Clocks Application

The Clocks application is totally redesigned in Fedora 32. It features a design that works better on smaller windows.

![The Clocks application in Fedora 32][8]

GNOME 3.36 also provides many additional features and enhancements. Check out the [GNOME 3.36 Release Notes][9] for further information

* * *

### Improved Out of Memory handling

Previously, if a system encountered a low-memory situation, it may have encountered heavy swap usage (aka [swap thrashing][10])– sometimes resulting in the Workstation UI slowing down, or becoming unresponsive for periods of time. Fedora 32 Workstation now ships and enables EarlyOOM by default. EarlyOOM enables users to more quickly recover and regain control over their system in low-memory situations with heavy swap usage.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-32-workstation/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ryanlerch/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/fedora32workstation-816x345.jpg
[2]: https://fedoramagazine.org/announcing-fedora-32/
[3]: https://getfedora.org/workstation
[4]: https://fedoramagazine.org/wp-content/uploads/2020/04/unlock.gif
[5]: https://fedoramagazine.org/wp-content/uploads/2020/04/extensions.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/04/settings.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/04/donotdisturb.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/04/clocks.png
[9]: https://help.gnome.org/misc/release-notes/3.36/
[10]: https://en.wikipedia.org/wiki/Thrashing_(computer_science)
