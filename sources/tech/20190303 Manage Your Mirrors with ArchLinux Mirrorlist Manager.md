[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manage Your Mirrors with ArchLinux Mirrorlist Manager)
[#]: via: (https://itsfoss.com/archlinux-mirrorlist-manager)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Manage Your Mirrors with ArchLinux Mirrorlist Manager
======

**ArchLinux Mirrorlist Manager is a simple GUI program that allows you to easily manage mirrors in your Arch Linux system.**

For Linux users, it is important to make sure that you keep your mirror list in good shape. Today we will take a quick look at an application designed to help manage your Arch mirror list.

![ArchLinux Mirrorlist Manager][1]ArchLinux Mirrorlist Manager

### What is a Mirror?

For those new to the world of Linux, Linux operating systems depend on a series of servers placed around the world. These servers contain identical copies of all of the packages and software available for a particular distro. This is why they are called “mirrors”.

The ultimate goal is to have multiple mirrors in each country. This allows local users to quickly update their systems. However, this is not always true. Sometimes mirrors from another country can be faster.

### ArchLinux Mirrorlist Manager makes managing mirrors simpler in Arch Linux

![ArchLinux Mirrorlist Manager][2]Main Screen

[Managing and sorting][3] the available mirrors in Arch is not easy. It involves fairly lengthy commands. Thankfully, someone came up with a solution.

Last year, [Rizwan Hasan][4] created a little Python and Qt application entitled [ArchLinux Mirrorlist Manager][5]. You might recognize Rizwan’s name because it is not the first time that we featured something he created on this site. Over a year ago, I wrote about a new Arch-based distro that Rizwan created named [MagpieOS][6]. I imagine that Rizwan’s experience with MagpieOS inspired him to create this application.

There really isn’t much to ArchLinux Mirrorlist Manager. It allows you to rank mirrors by response speed and limit the results by number and country of origin.

In other words, if you are located in Germany, you can restrict your mirrors to the 3 fastest in Germany.

### Install ArchLinux Mirrorlist Manager

```
It is only for Arch Linux users

Pay attention! ArchLinux Mirrorlist Manager is for Arch Linux distribution only. Don’t try to use it on other Arch-based distributions unless you make sure that the distro uses Arch mirrors. Otherwise, you might face issues that I encountered with Manjaro (explained in the section below).
```

```
Mirrorlist Manager alternative for Manjaro

When it comes to using something Archy, my go-to system is Manjaro. In preparation for this article, I decided to install ArchLinux Mirrorlist Manager on my Manjaro machine. It quickly sorted the available mirror and saved them to my mirror list.

I then proceeded to try to update my system and immediately ran into problems. When ArchLinux Mirrorlist Manager sorted the mirrors my system was using, it replaced all of my Manjaro mirrors with vanilla Arch mirrors. (Manjaro is based on Arch, but has its own mirrors because the dev team tests all package updates before pushing them to the users to ensure there are no system-breaking bugs.) Thankfully, the Manjaro forum helped me fix my mistake.

If you are a Manjaro user, please do not make the same mistake that I did. ArchLinux Mirrorlist Manager is only for Arch and Arch-based distros that use Arch’s mirrors.

Luckily, there is an easy to use terminal application that Manjaro users can use to manage their mirror lists. It is called [Pacman-mirrors][7]. Just like ArchLinux Mirrorlist Manager, you can sort by response speed. Just type `sudo pacman-mirrors --fasttrack`. If you want to limit the results to the five fastest mirrors, you can type `sudo pacman-mirrors --fasttrack 5`. To restrict the results to one or more countries, type `sudo pacman-mirrors --country Germany,Spain,Austria`. You can limit the results to your country by typing `sudo pacman-mirrors --geoip`. You can visit the [Manjaro wiki][7] for more information about Pacman-mirrors.

After you run Pacman-mirrors, you have to synchronize your package database and update your system by typing `sudo pacman -Syyu`.

Note: Pacman-mirrors is for **Manjaro only**.
```

ArchLinux Mirrorlist Manager is available in the [Arch User Repository][8]. More advanced Arch users can download the PKGBUILD directly from [the GitHub page][9].

### Final Thoughts on ArchLinux Mirrorlist Manager

Even though [ArchLinux Mirrorlist Manager][5] isn’t very useful for me, I’m glad it exists. It shows that Linux users are actively trying to make Linux easier to use. As I said earlier, managing a mirror list on Arch is not easy. Rizwan’s little tool will help make Arch more usable by the beginning user.

Have you ever used ArchLinux Mirrorlist Manager? What is your method to manage your Arch mirrors? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][10].


--------------------------------------------------------------------------------

via: https://itsfoss.com/archlinux-mirrorlist-manager

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/mirrorlist-manager2.png?ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/mirrorlist-manager4.jpg?ssl=1
[3]: https://wiki.archlinux.org/index.php/Mirrors
[4]: https://github.com/Rizwan-Hasan
[5]: https://github.com/Rizwan-Hasan/ArchLinux-Mirrorlist-Manager
[6]: https://itsfoss.com/magpieos/
[7]: https://wiki.manjaro.org/index.php?title=Pacman-mirrors
[8]: https://aur.archlinux.org/packages/mirrorlist-manager
[9]: https://github.com/Rizwan-Hasan/MagpieOS-Packages/tree/master/ArchLinux-Mirrorlist-Manager
[10]: http://reddit.com/r/linuxusersgroup
