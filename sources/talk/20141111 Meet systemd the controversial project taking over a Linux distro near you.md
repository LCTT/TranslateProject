spccman translating 
Meet systemd, the controversial project taking over a Linux distro near you
================================================================================
![](http://core4.staticworld.net/images/article/2014/10/linux-attack-100528169-gallery.jpg)

Systemd is one of the most controversial projects in Linux-land right now. How controversial? So controversial that Lennart Poettering, one of systemd’s developers, even [claims][1] that horrible people have been pooling [Bitcoins][2] to hire a hitman on him. On a more reasonable level, there’s a [Boycott systemd website][3] that argues for a boycott of this software on various technical merits.

All this backlash is a reaction to systemd’s success. It has been—or is being—adopted by Linux distributions from Fedora and OpenSuSE to Ubuntu, Debian, and even Arch Linux. GNOME is becoming more dependent on it over time—one of Debian’s stated reasons for [switching back to GNOME][4] was because of its systemd integration. It’s everywhere.

So what’s all the hub-bub—and the fierce backlash—about? Let’s look a bit closer at this raging battle.

### Systemd is a new init system ###

At its core, [systemd][5] is a replacement for the old [SysV init][6] system. The init system is the software that initializes your system. When you boot up, init is responsible for loading the appropriate drivers, activating your network connection, launching various system services, and finally bringing up the graphical login screen where you log in. SysV init is an old system that basically just runs scripts located under **/etc/init.d**.

> Want to stay up to date on Linux, BSD, Chrome OS, and the rest of the World Beyond Windows? Bookmark the [World Beyond Windows column page][7] or follow [our RSS feed][8].

At its core, systemd is a modern replacement for the old and crufty SysV init. It can also launch services in response to events; for example, when you plug in a USB printer, it could launch the printing service in response to the device being plugged in. When it receives a connection on a specific network port, it could launch a network service configured to listen on that port and pass the connection along.

For more technical information about SysV init vs. systemd, read Jorgen Schäfer’s “[Why systemd?][9]”

### But systemd is more than that ###

Even systemd’s detractors largely agree that SysV is old and needs to be replaced. But critics correctly note that systemd is in fact more than that. It’s a large project containing many other bits of functionality. It’s a software suite, not just an init system.

![An illustration of systemd's structure.](https://cms-images.idgesg.net/images/article/2014/10/systemd-diagram-100528171-orig.png)

[Wikimedia Commons][10]

An illustration of systemd's structure.

The systemd project also contains logind, a daemon that manages user logins, and journald, an event-logging system that controversially writes to binary files and not text ones. Systemd has also absorbed [the udev project][11] and its code, which handles the management of virtual device files in the **/dev/** directory and events when devices are plugged in and unplugged. The list goes on and on: systemd also includes a [cron][12]-style task scheduler and networkd, a daemon for managing network connections.

More recently, systemd is gaining consoled, a user-mode console daemon that can be used when Linux’s virtual terminal code is stripped out of the kernel itself. The kernel developers seem happy to get this stuff out of the kernel and into user-space , but some people have to be thinking: Does systemd really have to take over this as well?

### Critics say it’s not Unix-like ###

Many of the complaints to systemd stem from a feeling that this huge project is increasing in scope and taking over too much of the Linux system. Not surprisingly, the Boycott systemd site starts with this exact complaint:

> “Systemd flies in the face of the Unix philosophy: ‘do one thing and do it well,’ representing a complex collection of dozens of tightly coupled binaries. Its responsibilities grossly exceed that of an init system, as it goes on to handle power management, device management, mount points, cron, disk encryption, socket API/inetd, syslog, network configuration, login/session management, readahead, GPT partition discovery, container registration, hostname/locale/time management, mDNS/DNS-SD, the Linux console and other things all wrapped into one.”

Ubuntu’s Mark Shuttleworth originally [called systemd][13] “hugely invasive and hardly justified” when Ubuntu was sticking with their own “upstart” init system. Ubuntu eventually gave up that fight and is switching to systemd. The change will show up [in the Ubuntu Desktop Next images][14] starting in the 15.04 update cycle.

### So, systemd: good or bad? ###

Oh boy, here we go. This is the part of the article where I have to wrap everything up with a nice bow and make a pronouncement about which side is right.

![](https://cms-images.idgesg.net/images/article/2013/09/linux-penguin-100055693-medium.png)

The original idea of systemd is definitely good. Linux needs a replacement for the old SysV init system and clunky SysV init scripts, and a sleek, modern system daemon that can respond to more types events and manage daemons more intelligently is a great idea. However, it’s true that systemd seems to be growing into a monolithic system layer that lives just above the Linux kernel.

*But*, although Linux is a community-developed project, it’s not for the peanut gallery—whether it’s a PCWorld columnist or a gaggle of Internet commenters—to decide how it evolves. It’s for the people actually getting their hands dirty with the code and involving themselves in these projects. And, interestingly enough, Linux distributions and the people involved in them seem mostly to be moving toward systemd integration.

Even Linux creator Linus Torvalds (who [isn’t afraid to say what he thinks][15]) doesn’t seem to mind systemd. As he told [ZDNet][16]:

> "I don't actually have any particularly strong opinions on systemd itself. I've had issues with some of the core developers that I think are much too cavalier about bugs and compatibility, and I think some of the design details are insane (I dislike the binary logs, for example), but those are details, not big issues."

If Linus Torvalds doesn’t have any big issues with the design of systemd, perhaps it’s not all bad. If you’d like a calm look at why a Linux distribution might want to go with systemd, [Debian’s systemd discussion document][17] is good reading.

What do you think of systemd? Sound off in the comments! Just try to keep it civil, folks—swaying opinions on contentious issues takes level-headed talk.

*This article has been updated to clarify when systemd is appearing in the Ubuntu Desktop Next images. It originally erroneously stated the change already took place. *

--------------------------------------------------------------------------------

via: http://www.pcworld.com/article/2841873/meet-systemd-the-controversial-project-taking-over-a-linux-distro-near-you.html

作者：[Chris Hoffman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.pcworld.com/article/2841873/meet-systemd-the-controversial-project-taking-over-a-linux-distro-near-you.html#chrishoffman
[1]:https://plus.google.com/app/basic/stream/z13rdjryqyn1xlt3522sxpugoz3gujbhh04
[2]:http://www.pcworld.com/article/2033715/7-things-you-need-to-know-about-bitcoin.html
[3]:http://boycottsystemd.org/
[4]:http://www.pcworld.com/article/2691192/how-gnome-3-14-is-winning-back-disillusioned-linux-users.html
[5]:http://www.freedesktop.org/wiki/Software/systemd/
[6]:http://en.wikipedia.org/wiki/Init#SysV-style
[7]:http://www.pcworld.com/column/world-beyond-windows/
[8]:http://www.pcworld.com/blog/world-beyond-windows/index.rss
[9]:http://blog.jorgenschaefer.de/2014/07/why-systemd.html
[10]:http://en.wikipedia.org/wiki/File:Systemd_components.svg
[11]:http://en.wikipedia.org/wiki/Udev
[12]:http://en.wikipedia.org/wiki/Cron
[13]:http://www.markshuttleworth.com/archives/1295
[14]:http://www.pcworld.com/article/2836984/why-ubuntu-1410-utopic-unicorns-humble-changes-are-the-calm-before-the-storm.html
[15]:http://www.maximumpc.com/article/news/linus_torvalds_tosses_f-bombs_middle_fingers_and_general_disdain_nvidia
[16]:http://www.zdnet.com/linus-torvalds-and-others-on-linuxs-systemd-7000033847/
[17]:https://wiki.debian.org/Debate/initsystem/systemd
