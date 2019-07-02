[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ubuntu or Fedora: Which One Should You Use and Why)
[#]: via: (https://itsfoss.com/ubuntu-vs-fedora/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Ubuntu or Fedora: Which One Should You Use and Why
======

_**Brief: Ubuntu or Fedora? What’s the difference? Which is better? Which one should you use? Read this comparison of Ubuntu and Fedora.**_

[Ubuntu][1] and [Fedora][2] are one of the most popular Linux distributions out there. Making a decision to choose between using Ubuntu and Fedora is not an easy one. I’ll try to help you in making your decision by comparing various features of Ubuntu and Fedora.

Do note that this comparison is primarily from the desktop point of view. I am not going to focus on the container specific versions of Fedora or Ubuntu.

### Ubuntu vs Fedora: Which one is better?

![Ubuntu Vs Fedora][3]

Almost all Linux distributions differ from one another primarily on these points:

  * Base distribution (Debian, Red Hat, Arch or from scratch)
  * Installation
  * Supported desktop environments
  * Package management, software support and updates
  * Hardware support
  * Development team (backed by corporate or created by hobbyists)
  * Release cycle
  * Community and support



Let’s see how similar or how different are Ubuntu and Fedora from each other. Once you know that, it should be perhaps easier for you to make a choice.

#### Installation

Ubuntu’s Ubiquity installer is one of easiest installers out there. I believe that it played an important role in Ubuntu’s popularity because when Ubuntu was just created in 2004, installing Linux itself was considered a huge task.

The Ubuntu installer allows you to install Ubuntu in around 10 minutes. In most cases, it can identify Windows installed on your system and allows you to dual boot Ubuntu and Windows in a matter of clicks.

You can also install updates and third-party codecs while installing Ubuntu. That’s an added advantage.

![Ubuntu Installer][4]

Fedora uses Anaconda installer. This too simplifies the installation process with the easy to use interface.

![Fedora Installer | Image Credit Fedora Magazine][5]

Fedora also provides a media writer tool for downloading and creating the live USB of Fedora on Windows operating system. When I last tried to use it around two years ago, it didn’t work and I had to use the regular live USB creating software.

In my experience, installing Ubuntu is easier than installing Fedora. That doesn’t mean installing Fedora is a complex process. Just that Ubuntu is simpler.

#### Desktop environments

Both Ubuntu and Fedora use GNOME desktop environment by default.

![GNOME Desktop in Fedora][6]

While Fedora uses the stock GNOME desktop, Ubuntu has customized it to look and behave like its previous Unity desktop.

![GNOME desktop customized by Ubuntu][7]

Apart from GNOME, both Ubuntu and Fedora offer several other desktop variants.

Ubuntu has Kubuntu, Xubuntu, Lubuntu etc., offering various desktop flavors. While they are the official flavor of Ubuntu, they are not directly developed by Ubuntu team from Canonical. The teams are separate.

Fedora offers various desktop choices in the form of [Fedora Spins][8]. Unlike Kubuntu, Lubuntu etc,. they are not created and maintained by separate team. They are from core Fedora team.

#### Package management and software availability

Ubuntu uses APT package manager to provide and manage software (applications, libraries and other required codes) while Fedora uses DNF package manager.

[][9]

Suggested read  System76 Galago Pro: Specs, Price And Release Date

[Ubuntu has vast software repositories][10] allowing you to easily install thousands of programs, both FOSS and non-FOSS, easily. Fedora on the other hand focuses on providing only open source software. This is changing in the new versions but Fedora’s repositories are still not as big as that of Ubuntu.

Some third party software developer also provide click-to-install, .exe like packages for Linux. In Ubuntu, these packages are in .deb format and while Fedora supports .rpm packages.

Most software vendors provide both DEB and RPM files for Linux users but I have experienced that sometimes software vendor only provide DEB file. For example, SEO tool [Screaming Frog][11] has only DEB packages. It’s extremely rare that a software is available in RPM but not in DEB format.

#### Hardware support

Linux in general has its fair share of trouble with some WiFi adapters and graphics cards. Both Ubuntu and Fedora are impacted from that. Take the example of Nvidia. It’s [open source Nouveau driver often results in troubles like system hanging at boot][12].

Ubuntu provides an easy way of installing additional proprietary drivers. This results in better hardware support in many cases.

![Installing proprietary driver is easier in Ubuntu][13]

Fedora, on the other hand, sticks to open source software and thus installing proprietary drivers on Fedora becomes a difficult task.

#### Support and userbase

Both Ubuntu and Fedora provide support through community forums. Ubuntu has two main forums: [UbuntuForums][14] and [Ask Ubuntu][15]. Fedora has one main forum [Ask Fedora][16].

In terms of userbase, Fedora has a large following. However, Ubuntu is more popular and has a larger following than Fedora.

The popularity of Ubuntu has prompted a number of websites and blogs focused primarily on Ubuntu. This way, you get more troubleshooting tips and learning material on Ubuntu than Fedora.

#### Release cycle

A new Fedora version is released every six months and each Fedora release is supported for nine months only. Which means that between six to nine months, you must perform an upgrade. Upgrading Fedora version is simple but it does require a good internet connection. Not everyone can be happy with 1.5 GB of version upgrades every nine months.

Ubuntu has two versions: regular release and the long term support (LTS) release. Regular release is similar to Fedora. It’s released at the interval of six months and is supported for nine months.

The LTS release comes at an interval of two years and is supported for five years. Regular releases bring new features, new software versions while the LTS release holds on to the older versions. This makes it a great choice for people who don’t like frequent changes and prefer stability.

#### Solid base distributions

Ubuntu is based on [Debian][17]. Debian is one of the biggest community project and one of the most respected project in the [free software][18] world.

Fedora is a community project from Red Hat. Red Hat is an enterprise focused Linux distribution. Fedora works as a ‘testing ground’ ([upstream][19] in technical term) for new features before those features are included in Red Hat Enterprise Linux.

[][20]

Suggested read  How To Manage StartUp Applications In Ubuntu

#### Backed by enterprises

Both Ubuntu and Fedora are backed by their parent corporations. Ubuntu is from [Canonical][21] while Fedora is from [Red Hat][22] (now [part of IBM][23]). Enterprise backing is important because it ensures that the Linux distribution is well-maintained.

Hobbyists distributions created by a group of individuals often crumble under workload. You might have seen reasonably popular distribution projects being shutdown for this sole reason. [Antergos][24], Korora are just some of the many such examples where distributions were discontinued because the developers couldn’t get enough free time to work on the project.

The fact that both Ubuntu and Fedora are supported by a two Linux-based enterprises makes them a viable choice over other independent distributions.

#### Ubuntu vs Fedora as server

The comparison between Ubuntu and Fedora was primarily aimed at desktop users so far. But a discussion about Linux is not complete until you include servers.

![Ubuntu Server][25]

Ubuntu is not only popular on desktop, it also has a good presence on the server side. If you are familiar with Ubuntu as desktop, you might not feel uncomfortable with Ubuntu server edition. I started with Ubuntu desktop and now my websites are hosted on Linux servers running Ubuntu.

Fedora too has server edition and some people use it as well. But most sysadmins won’t prefer a server that has to be upgraded and rebooted every nine months.

Knowing Fedora helps you in using Red Hat Enterprise Linux (RHEL). RHEL is a paid product and you’ll have to purchase a subscription. If you want an operating system for running server that is close to Fedora/Red Hat, I advise using CentOS. [CentOS][26] is also a community project affiliated with Red Hat but this one is focused on servers.

#### Conclusion

As you can see, both Ubuntu and Fedora are similar to each other on several points. Ubuntu does take lead when it comes to software availability, driver installation and online support. And _**these are the points that make Ubuntu a better choice, specially for inexperienced Linux users.**_

If you want to get familiar with Red Hat, Fedora is a good starting point. If you have some experience with Linux or if you want to use only open source software, Fedora is an excellent choice.

In the end, it is really up to you to decide if you want to use Fedora or Ubuntu. I would suggest creating live USB of both distributions or try them out in virtual machine.

What’s your opinion on Ubuntu vs Fedora? Which distribution do you prefer and why? Do share your views in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-vs-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://getfedora.org/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/ubuntu-vs-fedora.png?resize=800%2C450&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/03/install-linux-inside-windows-10.jpg?resize=800%2C479&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/fedora-installer.png?resize=800%2C598&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/gnome-desktop-fedora.png?resize=800%2C450&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/applications_menu.jpg?resize=800%2C450&ssl=1
[8]: https://spins.fedoraproject.org/
[9]: https://itsfoss.com/system-76-galago-pro/
[10]: https://itsfoss.com/ubuntu-repositories/
[11]: https://www.screamingfrog.co.uk/seo-spider/#download
[12]: https://itsfoss.com/fix-ubuntu-freezing/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/software_updates_additional_drivers_nvidia.png?resize=800%2C523&ssl=1
[14]: https://ubuntuforums.org/
[15]: https://askubuntu.com/
[16]: https://ask.fedoraproject.org/
[17]: https://www.debian.org/
[18]: https://www.fsf.org/
[19]: https://en.wikipedia.org/wiki/Upstream_(software_development)
[20]: https://itsfoss.com/manage-startup-applications-ubuntu/
[21]: https://canonical.com/
[22]: https://www.redhat.com/en
[23]: https://itsfoss.com/ibm-red-hat-acquisition/
[24]: https://itsfoss.com/antergos-linux-discontinued/
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/ubuntu-server.png?resize=800%2C232&ssl=1
[26]: https://centos.org/
