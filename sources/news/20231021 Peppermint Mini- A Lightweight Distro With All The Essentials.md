[#]: subject: "Peppermint Mini: A Lightweight Distro With All The Essentials"
[#]: via: "https://news.itsfoss.com/peppermint-mini/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Peppermint Mini: A Lightweight Distro With All The Essentials
======
A mini edition of Peppermint OS.
As one of the [most lightweight and flexible Linux distros][1] around, Peppermint OS has been a good choice for those who want a Linux distro that takes up less space, with the freedom to tweak their experience as they like.

The recent release of [Peppermint OS][2] features [Debian 12][3] release at its core. It included important improvements that resulted in better performance.

However, it seems that was not the end of it. The developers have introduced a new variant of Peppermint OS “ **Peppermint Mini** ” that allows for more control over the distro with **a tiny ISO size**.

Allow me to show you around.

### Peppermint Mini: What to Expect?

![][4]

Peppermint Mini is **an alternative to the fully-fledged Peppermint OS ISOs** that comes in at a very compact **100-180 MB** size. These “Mini” builds use the Debian installer for performing a [net installation][5].

According to the developer:

> These builds are intended for that user who really wants to control how their installs are conducted.

> If you are familiar with the Debian installer you will be right at home here, but with a Peppermint take…

They have made **32-bit/64-bit builds** in two distinct flavors, **Debian** and **Devuan**.

The installer follows a familiar approach to what you find on the main Peppermint OS builds, but with **the difference being in the ability to choose things** such as the **desktop environment** , **the init system** , **zonedstorage server** , and more.

**Interested in a sneak peek?**

Well, I took the Devuan flavored mini ISO for **a test run** , and I was impressed. Allow me to show you what Peppermint Mini has to offer.

When I started the installation, the usual Language/Region options showed up, after setting that up, the installer started to configure the network automatically.

![][6]

It then presented me with mirrors from around the world to download the Devuan archive.

![][7]

I picked the recommended one – 'deb.devuan.org' mirror, so I went with it.

![][8]

The installer began to install the key installer components, it was slightly slow for me. You can try a different mirror of your country to get faster speeds.

But, that could depend on the routing of your ISP, so I can't blame the servers.

![][9]

Post that, I was able to set up the root password, user, and the user password. This was the same as on the conventional build of Peppermint OS.

After all that, the Partition disks step showed up, I chose the 'Guided' mode, and it took me through allocating spaces without any issues. Again, this was the same as on the usual installer.

![][10]

The base system started installing, and it took its time, but it was done. Though, the 'Debian' variant was faster on this stage when I had tried that out.

![][11]

Thereafter, I got the **options to select the software** I wanted on the system. I went with the pre-selected options, as you can see below.

There were also options for **other desktop environments** such as **Xfce** , **Budgie** , **GNOME** , **MATE** , **LXDE** and **LXQt**.

I could also opt for **zonedstorage server** , **web server** , and **SSH server** , but I skipped over those.

![][12]

As I was installing the Devuan flavor of Peppermint Mini, I got options to choose from three different init systems, **sysvinit** , **openrc** , and **runit**. Whereas, **for Debian** , there was **only systemd**.

Of course, if you do not want systemd, there are other [systemd-free distros][13] as well.

**Suggested Read** 📖

![][14]

![][15]

The installation got completed quite smoothly thereafter, and I was able to boot into Peppermint OS without any hiccups.

![][16]

**So, wrapping up.**

Peppermint Mini can be **a viable option if you want more control over your Peppermint OS installation**. Just ensure that your internet connection is up to the job.

You can go through the [official announcement][17] to know more about it.

### 📥 Get Peppermint Mini

You can get **32-bit** and **64-bit** versions of Peppermint Mini in either **Debian** or **Devuan** flavors. I highly suggest you head over to the [official website][18] and grab the image of your choice.

Remember to scroll down to the “MINI – BUILDS” section to get these.

[Peppermint Mini][18]

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/peppermint-mini/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/lightweight-linux-beginners/
[2]: https://news.itsfoss.com/peppermint-os-debian-12/
[3]: https://news.itsfoss.com/debian-12-release/
[4]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1.jpg
[5]: https://www.debian.org/distrib/netinst
[6]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1b.jpg
[7]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1c.jpg
[8]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1d.jpg
[9]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1e.jpg
[10]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1f.jpg
[11]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_1g.jpg
[12]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_2.jpg
[13]: https://itsfoss.com/systemd-free-distros/
[14]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[15]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_3.jpg
[16]: https://news.itsfoss.com/content/images/2023/10/Peppermint-Mini_4.jpg
[17]: https://peppermintos.com/2023/10/peppermint-mini-released/
[18]: https://peppermintos.com/guide/downloading/
