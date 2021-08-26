[#]: subject: "Debian vs Ubuntu: What’s the Difference? Which One Should You Use?"
[#]: via: "https://itsfoss.com/debian-vs-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Debian vs Ubuntu: What’s the Difference? Which One Should You Use?
======

You can [use apt-get commands][1] for managing applications in both Debian and Ubuntu. You can install DEB packages in both distributions as well. Many times, you’ll find common package installation instructions for both distributions.

So, what’s the difference between the two, if they are so similar?

Debian and Ubuntu belong to the same side of the distribution spectrum. Debian is the original distribution created by Ian Murdock in 1993. Ubuntu was created in 2004 by Mark Shuttleworth and it is based on Debian.

### Ubuntu is based on Debian: What does it mean?

While there are hundreds of Linux distributions, only a handful of them are independent ones, created from scratch. [Debian][2], Arch, Red Hat are some of the biggest distributions that do not derive from any other distribution.

Ubuntu is derived from Debian. It means that Ubuntu uses the same APT packaging system as Debian and shares a huge number of packages and libraries from Debian repositories. It utilizes the Debian infrastructure as base.

![Ubuntu uses Debian as base][3]

That’s what most ‘derived’ distributions do. They use the same package management system and share packages as the base distribution. But they also add some packages and changes of their own. And that is how Ubuntu is different from Debian despite being derived from it.

### Difference between Ubuntu and Debian

So, Ubuntu is built on Debian architecture and infrastructure and uses .DEB packages same as Debian.

Does it mean using Ubuntu is the same as using Debian? Not quite so. There are many more factors involved that distinguish one distribution from the other.

Let me discuss these factors one by one to compare Ubuntu and Debian. Please keep in mind that some comparisons are applicable to desktop editions while some apply to the server editions.

![][4]

#### 1\. Release cycle

Ubuntu has two kinds of releases: LTS and regular. [Ubuntu LTS (long term support) release][5] comes out every two years and they get support for five years. You have the option to upgrade to the next available LTS release. The LTS releases are considered more stable.

There are also non-LTS releases, every six months. These releases are supported for nine months only, but they have newer software versions and features. You have to upgrade to the next Ubuntu versions when the current on reaches end of life.

So basically, you have the option to choose between stability and new features based on these releases.

On the other hand, Debian has three different releases: Stable, Testing and Unstable. Unstable is for actual testing and should be avoided.

The testing branch is not that unstable. It is used for preparing the next stable branch. Some Debian users prefer the testing branch to get newer features.

And then comes the stable branch. This is the main Debian release. It may not have the latest software and feature but when it comes to stability, Debian Stable is rock solid.

There is a new stable release every two years and it is supported for a total of three years. After that, you have to upgrade to the next available stable release.

#### 2\. Software freshness

![][6]

Debian’s focus on stability means that it does not always aim for the latest versions of the software. For example, the latest Debian 11 features GNOME 3.38, not the latest GNOME 3.40.

The same goes for other software like GIMP, LibreOffice, etc. This is a compromise you have to make with Debian. This is why “Debian stable = Debian stale” joke is popular in the Linux community.

Ubuntu LTS releases also focus on stability. But they usually have more recent versions of the popular software.

You should note that for _some software_, installing from developer’s repository is also an option. For example, if you want the latest Docker version, you can add Docker repository in both Debian and Ubuntu.

Overall, software in Debian Stable often have older versions when compared to Ubuntu.

#### 3\. Software availability

Both Debian and Ubuntu has a huge repository of software. However, [Ubuntu also has PPA][7] (Personal Package Archive). With PPA, installing newer software or getting the latest software version becomes a bit more easy.

![][8]

You may try using PPA in Debian but it won’t be a smooth experience. You’ll encounter issues most of the time.

#### 4\. Supported platforms

Ubuntu is available on 64-bit x86 and ARM platforms. It does not provide 32-bit ISO anymore.

Debian, on the other hand, supports both 32 bit and 64 bit architecture. Apart from that Debian also supports 64-bit ARM (arm64), ARM EABI (armel), ARMv7 (EABI hard-float ABI, armhf), little-endian MIPS (mipsel), 64-bit little-endian MIPS (mips64el), 64-bit little-endian PowerPC (ppc64el) and IBM System z (s390x).

No wonder it is called the ‘universal operating system’.

#### 5\. Installation

[Installing Ubuntu][9] is a lot easier than installing Debian. I am not kidding. Debian could be confusing even for intermediate Linux user.

When you download Debian, it provides a minimal ISO by default. This ISO has no non-free (not open source) firmware. You go on to install it and realize that your network adapters and other hardware won’t be recognized.

There is a separate non-free ISO that contains firmware but it is hidden and if you do not know that, you are in for a bad surprise.

![Getting non-free firmware is a pain in Debian][10]

Ubuntu is a lot more forgiving when it comes to including proprietary drivers and firmware in the default ISO.

Also, the Debian installer looks old whereas Ubuntu installer is modern looking. Ubuntu installer also recognizes other installed operating systems on the disk and gives you the option to install Ubuntu alongside the existing ones (dual boot). I have not noticed it with Debian installer in my testing.

![Installing Ubuntu is smoother][11]

#### 6\. Out of the box hardware support

As mentioned earlier, Debian focuses primarily on [FOSS][12] (free and open source software). This means that the kernel provided by Debian does not include proprietary drivers and firmware.

It’s not that you cannot make it work but you’ll have to do add/enable additional repositories and install it manually. This could be discouraging, specially for the beginners.

Ubuntu is not perfect but it is a lot better than Debian for providing drivers and firmware out of the box. This means less hassle and a more complete out-of-the-box experience.

#### 7\. Desktop environment choices

Ubuntu uses a customized GNOME desktop environment by default. You may install [other desktop environments][13] on top of it or opt for [various desktop based Ubuntu flavors][14] like Kubuntu (for KDE), Xubuntu (for Xfce) etc.

Debian also installs GNOME by default. But its installer gives you choice to install desktop environment of your choice during the installation process.

![][15]

You may also get [DE specific ISO images from its website][16].

#### 8\. Gaming

Gaming on Linux has improved in general thanks to Steam and its Proton project. Still, gaming depends a lot on hardware.

And when it comes to hardware compatibility, Ubuntu is better than Debian for supporting proprietary drivers.

Not that it cannot be done in Debian but it will require some time and effort to achieve that.

#### 9\. Performance

There is no clear ‘winner’ in the performance section, whether it is on the server or on the desktop. Both Debian and Ubuntu are popular as desktop as well as server operating systems.

The performance depends on your system’s hardware and the software component you use. You can tweak and control your system in both operating systems.

#### 10\. Community and support

Debian is a true community project. Everything about this project is governed by its community members.

Ubuntu is backed by [Canonical][17]. However, it is not entirely a corporate project. It does have a community but the final decision on any matter is in Canonical’s hands.

As far the support goes, both Ubuntu and Debian have dedicated forums where users can seek help and advice.

Canonical also offers professional support for a fee to its enterprise clients. Debian has no such features.

### Conclusion

Both Debian and Ubuntu are solid choices for desktop or server operating systems. The apt package manager and DEB packaging is common to both and thus giving a somewhat similar experience.

However, Debian still needs a certain level of expertise, specially on the desktop front. If you are new to Linux, sticking with Ubuntu will be a better choice for you. In my opinion, you should gain some experience, get familiar with Linux in general and then try your hands on Debian.

It’s not that you cannot jump onto the Debian wagon from the start, but it is more likely to be an overwhelming experience for Linux beginners.

**Your opinion on this Debian vs Ubuntu debate is welcome.**

--------------------------------------------------------------------------------

via: https://itsfoss.com/debian-vs-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/apt-get-linux-guide/
[2]: https://www.debian.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Debian-ubuntu-upstream.png?resize=800%2C400&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-vs-ubuntu.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/long-term-support-lts/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-policy.png?resize=795%2C456&ssl=1
[7]: https://itsfoss.com/ppa-guide/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/ffmpeg_add_ppa.jpg?resize=800%2C222&ssl=1
[9]: https://itsfoss.com/install-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Debian-firmware.png?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/choose-something-else-installing-ubuntu.png?resize=800%2C491&ssl=1
[12]: https://itsfoss.com/what-is-foss/
[13]: https://itsfoss.com/best-linux-desktop-environments/
[14]: https://itsfoss.com/which-ubuntu-install/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-install-desktop-environment.png?resize=640%2C479&ssl=1
[16]: https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/
[17]: https://canonical.com/
