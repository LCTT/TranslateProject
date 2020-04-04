[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bodhi Linux 5.1 Review: Slightly Different Lightweight Linux)
[#]: via: (https://itsfoss.com/bodhi-linux-review/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Bodhi Linux 5.1 Review: Slightly Different Lightweight Linux
======

Bodhi Linux is a [lightweight Linux distribution][1] based on Ubuntu. Unlike most other distributions, Bodhi uses its own Moksha desktop and focuses on providing you a minimal setup to run on older computers.

### What is Bodhi Linux?

![Bodhi Start Page][2]

[Bodhi Linux][3] was first introduced in 2011. It is designed with “[minimalism, resource efficiency, and user choice][4]” in mind. The devs strove to provide a “[system that is functional but not bloated][5]“. As such, it uses the lightweight Moksha Desktop and has only the basic applications preinstalled. The idea is to give the user a stable platform to build the system that they want. It is based on the latest Ubuntu LTS.

### Moksha Desktop

![Bodhi Desktop][6]

Originally Bodhi shipped with the [Enlightenment desktop environment][7]. Bodhi Linux has long been known as the “Enlightened” Linux distro. In fact, the word ‘bodhi’ is based on the Sanskrit word for “enlightenment”.

However, that changed when Enlightenment 18 was released. The release was in such bad shape that it was not included in Bodhi. Enlightenment 19 was released and fixed some of the problems, but still had issues.

After trying to work with the Enlightenment dev team and getting nowhere, the Bodhi devs [forked][8] Enlightenment 17 in 2015. The new desktop environment would be named [Moksha][9], which is based on the Sanskrit word for “emancipation, liberation, or release”. You can find the code for it on [GitHub][10].

### What is new in 5.1.0?

[Subscribe to our YouTube channel for more Linux videos][11]

[Bodhi 5.1.0][12] is the first release in two years and the second release to be based on Ubuntu 18.04. Besides updating packages, it also has new default icons and theme. This release makes several changes to the default applications. Leafpad comes preinstalled instead of epad and [GNOME Web][13] (also known as Epiphany) replaces [Midori][14]). The eepDater system updater was removed.

There are currently [four different versions][15] of Bodhi 5.1.0 available to [download][16]: Standard, Hwe, Legacy, and AppPack.

  * Standard will work for systems made in the last decade. It does not push kernel updates.
  * Hwe (Hardware Enablement) edition is new to the Bodhi family and is designed to include support for newer hardware and will received kernel updates. The 5.1 release features the 5.3.0-42 kernel.
  * Legacy is the only edition that is 32-bit. It uses the “older 4.9.0-6-686 Linux kernel that is optimized for old (15+ years old) hardware. This kernel also does not include the PAE extension which is not supported on many older systems.”
  * The AppPack edition is for those who want a fully-loaded system out of the box and comes with many applications preinstalled.



### System Requirements for Bodhi Linux

Minimum system requirement

  * 500 MHz processor
  * 256 MB of RAM
  * 5 GB of drive space



Recommended system requirement

  * 1.0 GHz processor
  * 512 MB of RAM
  * 10 GB of drive space



### Experiencing Bodhi Linux

![Old Bodhi Linux][17]

Since it is based on Ubuntu, installing Bodhi was very simple. After I signed into Bodhi, I was surprised by the new theme and icon set. The last time I installed Bodhi (including 5.0 a couple of months ago) I thought that it needed a new look. There was nothing really wrong with the previous theme, but it looked like something from the early 2000. The new theme gives it a more modern look.

![Bodhi Linux 5.1][18]

I was also glad to see that Midori had been replaced by GNOME Web. I’m not a fan of [Midori browser][19]. It always seemed too minimal for me. (However, that might change in the future with [Midori Next][20].) Web felt more like the web browser I need. Most importantly it comes with Firefox Sync, so I can keep all of my bookmarks and passwords synced.

Unlike many Linux distros, Bodhi doesn’t really come with a stand-alone software center. Instead, if you click the AppCenter icon it opens the browser and navigates to the [AppCenter p][21][a][21][ge][21] of the Bodhi website. Here apps are sorted by category. Most of them are [lightweight applications][22].

![Bodhi Linux Appcenter][23]

If you click on one of the pages and click “Install”, Bodhi will install it (after to type in your passwords). This is achieved using a neat little program named [apturl][24] that “is a very simple way to install a software package from a web browser”. It’s pretty slick and I wish more Ubuntu-based distros would use it.

Overall, I like the Moksha desktop. It adheres to the desktop metaphor we have seen for decades (and which I am most comfortable with). It stays out of your way but is very easy to change and modify. The only thing I miss is that the application menu doesn’t open when I hit the super key. But I guess you can’t have everything in life.

### Final Thoughts

I was pleasantly surprised by this recent release of Bodhi Linux. In the past, I’ve played with it from time to time. I always liked it, but this last release has been the best so far. In a way, they have broken free of the idea that Bodhi is only for older system by adding support for newer kernels.

If you are looking for a change of scenery while staying close to the world of Ubuntu give [Bodhi Linux][3] a try.

Have you ever used Bodhi Linux? What is your favorite Ubuntu-based distro? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][25].

--------------------------------------------------------------------------------

via: https://itsfoss.com/bodhi-linux-review/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/lightweight-linux-beginners/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/bodhi-start-page.png?resize=800%2C500&ssl=1
[3]: https://www.bodhilinux.com/
[4]: https://www.bodhilinux.com/w/wiki/
[5]: https://www.bodhilinux.com/w/what-is-bodhi-linux/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/bodhi-desktop.jpg?resize=800%2C500&ssl=1
[7]: https://www.enlightenment.org/start
[8]: https://www.bodhilinux.com/2015/04/28/introducing-the-moksha-desktop/
[9]: https://www.bodhilinux.com/moksha-desktop/
[10]: https://github.com/JeffHoogland/moksha
[11]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[12]: https://www.bodhilinux.com/2020/03/25/bodhi-linux-5-1-0-released/
[13]: https://wiki.gnome.org/Apps/Web/
[14]: https://en.wikipedia.org/wiki/Midori_(web_browser
[15]: https://www.bodhilinux.com/w/selecting-the-correct-iso-image/
[16]: https://www.bodhilinux.com/download/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/bodhi.png?resize=800%2C400&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/bodhi-Linux-5-1-screenshot.jpg?ssl=1
[19]: https://itsfoss.com/midori-browser/
[20]: https://www.midori-browser.org/2020/01/15/midori-next-come-on-yarovi-we-can/
[21]: https://www.bodhilinux.com/a/
[22]: https://itsfoss.com/lightweight-alternative-applications-ubuntu/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Bodhi-Linux-AppCenter.png?resize=800%2C500&ssl=1
[24]: https://wiki.ubuntu.com/AptUrl
[25]: https://reddit.com/r/linuxusersgroup
