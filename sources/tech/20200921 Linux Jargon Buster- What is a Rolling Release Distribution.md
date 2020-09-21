[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is a Rolling Release Distribution?)
[#]: via: (https://itsfoss.com/rolling-release/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Jargon Buster: What is a Rolling Release Distribution?
======

After understanding [what is Linux][1], [what is a Linux distribution][2], when you start using Linux, you might come across the term ‘rolling release’ in Linux forum discussions.

In this Linux jargon buster, you’ll learn about rolling release model of Linux distributions.

### What is a rolling release distribution?

In software development, rolling release is a model where updates to a software are continuously rolled out rather than in batches of versions. This way the software always remains up-to-date. A rolling release distribution follows the same model and it provides the latest Linux kernel and the software version as they are released.

[Arch Linux][3] is the most popular example of a rolling release distribution however [Gentoo][4] is the oldest rolling release distribution still in development.

When you use a rolling release distribution, you get small but frequent updates. There are no major XYZ version release here like Ubuntu. You regularly [update Arch][5] or the other rolling release distribution and you’ll always have the latest version of your distribution.

The rolling release also comes at the cost of testing. You may have surprises when the latest update starts creating problem for your system.

### Rolling release vs point release distributions

![][6]

Many Linux distributions like Debian, Ubuntu, Linux Mint, Fedora etc follow the point release model. They will release a major XYZ version after every few months/years.

The point release consists of new versions of the Linux kernel, desktop environments and other software.

When a new major version of a point release distribution is released, you’ll have to do [special efforts to upgrade your system][7].

On the contrary, you keep on getting new features updates in a rolling release distribution as it gets released from the developers. This way, you don’t need to do a version upgrade after some months or years. You always have the latest stuff.

#### Oh.. but my Ubuntu also gets regular updates, almost on a weekly basis. Does it mean Ubuntu is also rolling release?

![][8]

No. Ubuntu is not rolling release. You see, the updates you usually get from Ubuntu are security and maintenance updates (except for some software like Mozilla Firefox), not new feature release.

For example, GNOME 3.38 has been released but Ubuntu LTS release 20.04 won’t give you GNOME 3.38. It will stick to the 3.36 version. If there are security or maintenance update to GNOME 3.36, you’ll get it with your Ubuntu updates.

Same goes for the LibreOffice release. Ubuntu 20.04 LTS sticks with LibreOffice 6.x series whereas LibreOffice 7 is already out there. Keep in mind that I am talking about software versions available in the official repositories. You are free to download a newer version of LibreOffice from their official website or use a PPA. But you won’t get it from Ubuntu’s repositories.

When Ubuntu releases the next version Ubuntu 20.10, you’ll get LibreOffice 7 and GNOME 3.38.

#### Why do some rolling release distributions have ‘version number’ and release names?

![Arch Linux ISO Refresh][9]

That’s a fair question. Arch Linux is rolling release which always keeps your system updated and yet you’ll see something like Arch Linux 2020.9.01 version number.

Now imagine you installed Arch Linux in 2018. You regularly update your Arch Linux system and so you have all the latest kernel and software in September 2020.

But what happens if you decide to Arch Linux in September 2020 on a new system? If you use the same installation media you used in 2018, you’ll have to install all the system updates released in the last two years or more. That’s inconvinient, isn’t it?

This is why Arch Linux (and other rolling release distributions) provide a new ISO (OS installer image file) with all the latest software every month or every few months. **This is called ISO refresh**. Thus, new users get a more recent copy of the Linux distribution.

If you are already using a rolling release distribution, you don’t to worry about the new refreshed ISO. Your system is already at par with it. The ISO refresh is helpful to people who are going to install it on a new system.

### Pros and cons of rolling release distributions

The benefit of the rolling release model is that you get small but more frequent updates. You always have the latest kernel and the latest software releases available from your distribution’s repositories.

However, this could also bring unforeseen problems with the new software. Point release usually test essential components for system integration to avoid inconvenient bugs. This is not the case in rolling release distribution where the software is rolled out as soon it is released by their developers.

### Should you use rolling release or point release distribution?

![][10]

That’s up to you. If you are a new Linux user or if you are not comfortable troubleshooting your Linux system, stick with a point release distribution of your choice. This is also recommended for your production and mission-critical machines. You would want a stable system here.

If you want the latest and greatest of Linux kernel and software and you are not afraid of spending some time in troubleshooting (happens from time to time) the you may choose a rolling release distribution.

At this point, I would also like to mention the hybrid rolling releasing model of Manjaro Linux. Manjaro does follow a rolling release model where you don’t have to upgrade your system to a newer version. However, Manjaro also performs testing of the essential software components instead of just blindly rolling it out to the users. This is one the [reasons why so many people use Manjrao Linux][11].

**Was it clear enough?**

I hope you have a slightly better understanding of the term ‘rolling release distribution’ now. If you still have some doubts around it please leave a comment and I’ll try to answer. I might update the article to cover your questions. Enjoy :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/rolling-release/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux/
[2]: https://itsfoss.com/what-is-linux-distribution/
[3]: https://www.archlinux.org/
[4]: https://www.gentoo.org/
[5]: https://itsfoss.com/update-arch-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/what-is-rolling-release-distribution.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/upgrade-ubuntu-version/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/updates-available-ubuntu.png?resize=800%2C433&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/arch-linux-iso-refresh.png?resize=799%2C388&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/rolling-vs-point-release-distribution.png?resize=800%2C350&ssl=1
[11]: https://itsfoss.com/why-use-manjaro-linux/
