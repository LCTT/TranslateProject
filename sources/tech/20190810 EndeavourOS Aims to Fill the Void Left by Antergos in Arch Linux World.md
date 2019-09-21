[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (EndeavourOS Aims to Fill the Void Left by Antergos in Arch Linux World)
[#]: via: (https://itsfoss.com/endeavouros/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

EndeavourOS Aims to Fill the Void Left by Antergos in Arch Linux World
======

![][1]

I’m sure that most of our readers are aware of the [end of the Antergos project][2]. In the wake of the announcement, the members of the Antergos community created several successors. Today, we will be looking at one of the ‘spiritual successors’ of Antergos: [EndeavourOS][3].

### EndeavourOS is not a fork of Antergos

Before we start, I would like to make it very clear that EndeavourOS is not a fork of Antergos. The developers used Antergos as their inspiration to create a light Arch-based distro.

![Endeavouros First Boot][4]

According to the [project’s site][5], EndeavourOS came into existence because people in the Antergos community wanted to keep the spirit of Antergos alive. Their goal was simply to “have Arch installed with an easy to use installer and a friendly, helpful community to fall back on during the journey to master the system”.

Unlike many Arch-based distros, EndeavourOS is intending to work [like vanilla Arch][5], “so no one-click solutions to install your favorite app or a bunch of preinstalled apps you’ll eventually don’t need”. For most people, especially those new to Linux and Arch, there will be a learning curve, but EndeavourOS aims to have a large friendly community where people are encouraged to ask questions and learn about their systems.

![Endeavouros Installing][6]

### A Work in Progress

EndeavourOS was [first released on July 15th][7] of this year after the project was first announced on [May 23rd][8]. Unfortunately, this means that the developers were unable to incorporate all of the features that they have planned.

For example, they want to have an online install similar to the one used by Antergos but ran into [issues with the current options][9]. “Cnchi has caused serious problems to be working outside the Antergos eco system and it needs a complete rewrite to work. The Fenix installer by RebornOS is getting more into shape, but needs more time to properly function.” For now, EndeavourOS will ship with the [Calamares installer][10].

[][11]

Suggested read  Velt/OS: A Material Design-Themed Desktop Environment

EndeavourOS will also offer [less stuff than Antergos][9]: It’s repo is smaller than Antergos though they ship with some AUR packages. Their goal is to deliver a system that’s close to Arch an not vanilla Arch.

![Endeavouros Updating With Kalu][12]

The developers [stated further][13]:

> “Linux and specifically Arch are all about freedom of choice, we provide a basic install that lets you explore those choices with a small layer of convenience. We will never judge you by installing GUI apps like Pamac or even work with sandbox solutions like Flatpak or Snaps. It’s up to you what you are installing to make EndeavourOS work in your circumstances, that’s the main difference we have with Antergos or Manjaro, but like Antergos we will try to help you if you run into a problem with one of your installed packages.”

### Experiencing EndeavourOS

I installed EndeavourOS in [VirtualBox][14] and took a look around. When I first booted from the image, I was greeted by a little box with links to the EndeavourOS site about installing. It also has a button to install and one to manually partition the drive. The Calamares installer worked very smoothly for me.

After I rebooted into a fresh install of EndeavourOS, I was greeted by a colorful themed XFCE desktop. I was also treated to a bunch of notification balloons. Most Arch-based distros I’ve used come with a GUI tool like [pamac][15] or [octopi][16] to keep the system up-to-date. EndeavourOS comes with [kalu][17]. (kalu stands for “Keeping Arch Linux Up-to-date”.) It checks for updated packages, Arch Linux News, updated AUR packages and more. Once it sees an update for any of those areas, it will create a notification balloon.

I took a look through the menu to see what was installed by default. The answer is not much, not even an office suite. If they intend for EndeavourOS to be a blank canvas for anyone to create the system they want. they are headed in the right direction.

![Endeavouros Desktop][18]

### Final Thoughts

EndeavourOS is still very young. The first stable release was issued only 3 weeks ago. It is missing some stuff, most importantly an online installer. That being said, it is possible to gauge where EndeavourOS will be heading.

[][19]

Suggested read  An Overview of Intel's Clear Linux, its Features and Installation Procedure

While it is not an exact clone of Antergos, EndeavourOS wants to replicate the most important part of Antergos the welcoming, friendly community. All to often, the Linux community can seem to be unwelcoming and downright hostile to the beginner. I’ve seen more and more people trying to combat that negativity and bring more people into Linux. With the EndeavourOS team making that their main focus, a great distro can be the only result.

If you are currently using Antergos, there is a way for you to [switch to EndeavourOS without performing a clean install.][20]

If you want an exact clone of Antergos, I would recommend checking out [RebornOS][21]. They are currently working on a replacement of the Cnchi installer named Fenix.

Have you tried EndeavourOS already? How’s your experience with it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/endeavouros/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-logo.png?ssl=1
[2]: https://itsfoss.com/antergos-linux-discontinued/
[3]: https://endeavouros.com/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-first-boot.png?resize=800%2C600&ssl=1
[5]: https://endeavouros.com/info-2/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-installing.png?resize=800%2C600&ssl=1
[7]: https://endeavouros.com/endeavouros-first-stable-release-has-arrived/
[8]: https://forum.antergos.com/topic/11780/endeavour-antergos-community-s-next-stage
[9]: https://endeavouros.com/what-to-expect-on-the-first-release/
[10]: https://calamares.io/
[11]: https://itsfoss.com/veltos-linux/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-updating-with-kalu.png?resize=800%2C600&ssl=1
[13]: https://endeavouros.com/second-week-after-the-stable-release/
[14]: https://itsfoss.com/install-virtualbox-ubuntu/
[15]: https://aur.archlinux.org/packages/pamac-aur/
[16]: https://octopiproject.wordpress.com/
[17]: https://github.com/jjk-jacky/kalu
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/endeavouros-desktop.png?resize=800%2C600&ssl=1
[19]: https://itsfoss.com/clear-linux/
[20]: https://forum.endeavouros.com/t/how-to-switch-from-antergos-to-endevouros/105/2
[21]: https://rebornos.org/
