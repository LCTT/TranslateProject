[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PCLinuxOS Review: This Classic Independent Linux Distribution is Definitely Worth a Look)
[#]: via: (https://itsfoss.com/pclinuxos-review/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

PCLinuxOS Review: This Classic Independent Linux Distribution is Definitely Worth a Look
======

Most of the Linux distributions that we cover on It’s FOSS are based on either Ubuntu or Arch.

No, we don’t have any affinity for either Ubuntu or Arch though personally, [I love using Manjaro][1]. It’s just that majority of new Linux distributions are based on these two.

While discussing within the team, we thought, why fixate over new distributions. Why not go for the classic distributions? Distributions that don’t belong to DEB/Arch domain.

So, today, we are going to be looking at an independent distro that tends to go against the flow. We’ll be looking at PCLinuxOS.

### What is PCLinuxOS?

![][2]

Back in 2000, Bill Reynolds (also known as Texstar) created a series of packages to improve Mandrake Linux, which later became [Mandriva Linux][3]. [PCLinuxOS][4] first became a separate distro in 2003 when Texstar forked Mandrake. He [said][5] that he made the move because he wanted “to provide an outlet for my crazy desire to package source code without having to deal with egos, arrogance and politics”.

As I said earlier, PCLinuxOS does not follow the rest of the Linux world. PCLinuxOS does not use systemd. Instead, it uses SysV init and “[will continue to do so for the foreseeable future][6]“.

It also has one of the oddest package management systems, I have ever encountered. PCLinuxOS uses apt and [synaptic][7] to handle RPM packages. Unlike most distros that use either apt or rpm, PCLinuxOS is a rolling distro. It also supports [Flatpak][8].

The PCLinuxOS team offers [three different versions][9]: **KDE**, **MATE**, and **XFCE**. The PCLinuxOS community has also created a number of [community][10] [releases][11] with more desktop options.

![PCLinuxOS Updater][12]

### System requirements for PCLinuxOS

According to the [PCLinuxOS wiki][13], the following hardware is recommended to run PCLinuxOS:

  * Modern Intel or AMD processor.
  * 10 GB or more free space recommended.
  * Minimum 2 GB of memory. – Recommended 4 GB or more.
  * Any modern video card by Nvidia, ATI, Intel, SiS, Matrox, or VIA.
  * 3D desktop support requires a 3D instructions set compatible card.
  * Any Sound Blaster, AC97, or HDA compatible card.
  * A CD or DVD drive.
  * Flash drives can also be used to install, with PCLinuxOS-LiveUSB script just for this purpose.
  * Generally any onboard network card will suffice.
  * A high-speed internet connection is recommended for performing any updates/software installations as necessary.



### Experience with PCLinuxOS

I originally encountered PCLinuxOS when I was first entering the Linux world about 7+ years ago. Back then I was trying out distros like crazy. At the time, I didn’t quite understand it and ended up going with Lubuntu.

Recently, I was reminded of the distro when [Matt Hartley][14], community manager at [OpenShot][15] mentioned it on the [Bryan Lunduke podcast][16]. PCLinuxOS is Hartley’s daily driver and has been for a while. Based on his comments, I decided to take another look at it.

#### Smooth installation

![PCLinuxOS installer][17]

The majority of Linux distros use one of three installers, [Ubiquity][18], [Anaconda][19], or [Calamares][20]. PCLinuxOS is one of the few that has its own installer, which it inherited from Mandrake. The installation went quickly and without any issue.

After the installation, I booted into the MATE [desktop environment][21] (because I had to). A dialog box asked me if I wanted to enable the update notifier. It’s always best to be up-to-date, so I did.

#### Handy set of utilities

Besides the usual list of utilities, office programs, and web tools, PCLinuxOS has a couple of interesting additions. Both Zoom (a videoconferencing tool) and AnyDesk (a remote desktop application) come pre-installed for your remote working needs. The menu also includes an option to install VirtualBox GuestAdditions (in case you installed PCLinuxOS on VirtualBox).

![PCLinuxOS Control Center][22]

PCLinuxOS comes with a control center to handle all of your system admin needs. It covers installing software, file sharing, handles network connections, handles hardware issues, and security.

#### Create your own custom PCLinuxOS live disk

It also comes with a couple of apps that allow you to download a new PCLinuxOS ISO, write that ISO to a disc or USB, or create [your own LiveCD][23] based on your current system.

![It is easy to create your own custom PCLinuxOS ISO][24]

#### No sudo in PCLinuxOS

Interestingly, PCLinuxOS doesn’t have `sudo` installed. According to the [FAQ][6], “Some distros…leaving sudo in a default state where all administrator functions are allowed without the requirement to enter the root password. We consider this an unacceptable security risk.” Whenever you perform a task that requires admin privileges, a window appears asking for your password.

#### Strong community

One of the cool things about PCLinuxOS is its strong community. That community creates a monthly [e-magazine][25]. Each issue contains news, tutorials, puzzles, and even recipes. The only other distro (or family of distros) that has sustained a community publication for over 15 years is Ubuntu with the [Full Circle Magazine][26]. Be sure to check it out.

#### No hardware issues noticed (for my system)

This is one of the last distros I will review on my Dell Latitude D630. (I’m moving up to a newer Thinkpad.) One of the major problems I’ve had in the past was getting the Nvidia GPU to work correctly. I didn’t have any issues with PCLinuxOS. It just worked out of the box.

### Final Thoughts

![PCLinuxOS Desktop][27]

PCLinuxOS also provides an easy way to remaster the system after installation. It allows you to create a live disk of PCLinuxOS with your customization. I

PCLinuxOS feels like part of the past and part of the present. It reflects the pre-systemd days and offers a modern desktop and apps at the same time. The only thing I would complain about is that there are fewer applications available in the repos than more popular distros, but the availability of Flatpak and AppImages should fix that.

PCLinuxOS’ tag line is: “_**So cool ice cubes are jealous**_“. It might sound corny, but I think it’s true, especially if you aren’t a fan of the direction the rest of the Linux world has taken. If you find something lacking in the big Linux distros, check out this old-little distro with a great community.

Have you ever used PCLinuxOS? What is your favorite independent distro? Please let us know in the comments below. If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][28].

--------------------------------------------------------------------------------

via: https://itsfoss.com/pclinuxos-review/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-manjaro-linux/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/PCLinuxOS-review.png?resize=800%2C450&ssl=1
[3]: https://en.wikipedia.org/wiki/Mandriva_Linux
[4]: https://www.pclinuxos.com/
[5]: http://linux-blog.org/Experiment-Interview-with-Texstar-of-PCLinuxOS/
[6]: https://pclinuxoshelp.com/index.php/Frequently_Asked_Questions
[7]: https://itsfoss.com/synaptic-package-manager/
[8]: https://pclinuxoshelp.com/index.php/Installing_Software#Using_Flatpak
[9]: https://www.pclinuxos.com/?page_id=10
[10]: https://ftp.nluug.nl/pub/os/Linux/distr/pclinuxos/pclinuxos/live-cd/community/
[11]: https://pclosusers.com/communityiso/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/PCLinuxOS-updater.jpg?resize=800%2C487&ssl=1
[13]: https://pclinuxoshelp.com/index.php/Hardware_Recommendations
[14]: https://twitter.com/matthartley
[15]: https://www.openshot.org/
[16]: http://www.lunduke.com/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/PCLinuxOS-installer.jpg?resize=800%2C500&ssl=1
[18]: http://launchpad.net/ubiquity
[19]: https://fedoraproject.org/wiki/Anaconda
[20]: https://calamares.io/
[21]: https://itsfoss.com/what-is-desktop-environment/
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/PCLinuxOS-Control-Center.jpg?resize=800%2C585&ssl=1
[23]: https://pclinuxoshelp.com/index.php/LiveCD,_Create_your_own
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/PCLinuxOS-downloader.jpg?resize=800%2C608&ssl=1
[25]: https://pclosmag.com/index.html
[26]: https://fullcirclemagazine.org/
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/PCLinuxOS-desktop.jpg?resize=800%2C500&ssl=1
[28]: http://reddit.com/r/linuxusersgroup
