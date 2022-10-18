[#]: subject: "Ubuntu Budgie 22.10 Kinetic Kudu: Top New Features"
[#]: via: "https://www.debugpoint.com/ubuntu-budgie-22-10-features/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Budgie 22.10 Kinetic Kudu: Top New Features
======
Here’s a brief overview of the Ubuntu Budgie 22.10 (upcoming) and its features.

![Ubuntu Budgie 22.10 KInetic Kudu Desktop][1]

### Ubuntu Budgie 22.10: Top New Features

The Budgie desktop has a different fan base because of its fusion of simplicity,  feature and performance. Ubuntu Budgie 22.10 is an official Budgie flavour of Ubuntu, where you get the latest Ubuntu base with a stable Budgie desktop.

Ubuntu Budgie 22.10 is a short-term release, supported for nine months until July 2023.

This release of Ubuntu Budgie features Linux Kernel 5.19, which brings run-time Average Power Limiting (RAPL) support for Intel’s Raptor and Alder Lake processor, multiple families of ARM updates in mainline kernel and usual processor/GPU and file-system updates. Learn more about Kernel 5.19 features in [this article][2].

At the heart of this version, Ubuntu Budgie is powered by Budgie Desktop version 10.6.4, which brings updated applications and additional core tweaks. If you are using the prior Ubuntu budgie version, i.e. 22.04 or 21.10, you will notice some changes. And you should be aware of those.

First of all, the Budgie Control Center gets modern protocols for screensharing (both RDP and VNC), enhanced fractional scaling and colour profile support for your monitor. In addition, the Control centre now shows the monitor refresh rate and additional support added for Wacom tablets.

Secondly, Budgie desktop settings get a global option to control applets spacing and additional refinements.

After removing the calendar launcher, the clock at the top bar now only gives the launcher for date/time settings. You can access the Calendar from the applets at the extreme right of the top bar.

Ubuntu Budgie 22.10 fundamentally changed its application stack, which ships by default. Earlier (22.04 and prior), Budgie featured the GNOME applications as default for several desktop functions. Since GNOME is already moved to libadwaita/GTK4 with its own styling and theming, those apps wouldn’t look consistent in Budgie’s styling.

That is correct. Because these rounded corners with budgie/mate apps really look off.

![Budgie desktop with GTK4-libadwaita and MATE apps][3]

So, from this release onwards, the default app sets are slowly moving away from GNOME Apps to native or MATE apps/alternatives.

For Example, GNOME Calculator and System Monitor are now replaced by Mate Calculator and Mate system monitor. Atril document viewer replaces Evince reader. In addition, font-manager replaces GNOME Font Viewer, and a list of other GNOME apps are in “wait and watch” mode. They may get replaced in upcoming Budgie desktop point releases.

However, the text editor is still Gedit in this version, which is already a [great choice][4]. And a new native screenshot application debuts with a tweak tool for Raspberry Pi devices.

If you want to learn more about this transition, read the discussion [here][5].

So, that’s about the core changes in this release and here’s a quick summary of Ubuntu Budgie alongside other applications.

### Summary of the core items of Ubuntu Budgie 22.10

#### Core and major items

* [Ubuntu 22.10][6]
* Linux Kernel 5.19
* Budgie desktop version 10.6.4
* Firefox 105.0.1 (Snap version)
* Thunderbird 102.3.2
* LibreOffice 7.4.2.3

#### Other changes

* Pipewire replacing PulseAudio. The PulseAudio package is removed from ISO.
* WebP support by default
* New Tweak Tool for ARM devices (Raspberry Pi)
* Tilix Terminal 1.9.5
* Transmission torrent client 3.0.0
* GNOME Software 43.0

Finally, you can download Ubuntu Budgie 22.10 Beta from the below link. Also you can try out the Raspberry Pi beta image as well.

* [Link to the beta build][7]
* [Link to Raspberry Pi build][8]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/ubuntu-budgie-22-10-features/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/Ubuntu-Budgie-22.10-KInetic-Kudu-Desktop-1024x578.jpg
[2]: https://www.debugpoint.com/linux-kernel-5-19/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/10/Budgie-desktop-with-GTK4-libadwaita-and-MATE-apps.jpg
[4]: https://www.debugpoint.com/gedit-features/
[5]: https://discourse.ubuntubudgie.org/t/default-applications-review-for-22-10-23-04-and-beyond/5883
[6]: https://www.debugpoint.com/ubuntu-22-10/
[7]: https://cdimage.ubuntu.com/ubuntu-budgie/releases/kinetic/beta/
[8]: https://sourceforge.net/projects/budgie-remix/files/budgie-raspi-22.10/
