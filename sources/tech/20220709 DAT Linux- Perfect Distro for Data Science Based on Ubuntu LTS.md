[#]: subject: "DAT Linux: Perfect Distro for Data Science Based on Ubuntu LTS"
[#]: via: "https://www.debugpoint.com/dat-linux-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DAT Linux: Perfect Distro for Data Science Based on Ubuntu LTS
======
We review the first beta version of DAT Linux, curated only for data scientists.

Data science is in massive demand today, including job prospects, learning, university courses, etc. It’s a stream which deals with extracting meaningful inferences by applying algorithms and AI models.

Most of today’s commercial data science products are available from the major tech players. And those products target large enterprises with critical businesses. But hundreds of free and open-source tools, packages, and programs are available for data science work that many are unaware of.

Hence, setting up a working Linux system with those tools for data science work takes significant time because it requires little research, download & installation and so on.

Keeping that in mind, DAT Linux brings a vast, pre-installed, pre-configured set of tools and programs with its native tools to assist data scientists, students, teachers and hobbyists.

In this article, we review DAT Linux and its Beta release.

![DAT Linux 1.0b Desktop][1]

### DAT Linux Review

#### Base and Installation

The name “DAT” is a stripped-down version of the word “DATA”. As its target is Data Science, it became “DAT Linux” as a short.

At its core, DAT Linux is based on Ubuntu LTS, i.e. [Lubuntu 22.04 LTS][2] as of its 1.0b (Beta) release, which is the target version of this review.

The choice of Lubuntu with LXQt desktop is interesting, considering KDE Plasma or Xfce for a traditional desktop look. Perhaps, the performance is the aim of a data science work which may take considerable system resources. And LXQt desktop is probably the most lightweight desktop environment today.

The installer size is 3.3 GB, almost identical to the [Ubuntu 22.04 LTS][3]. However, there is a slight difference in the installer.

DAT Linux uses a customised Calamares Installer in place of the Ubiquity installer from Ubuntu. However, an installer doesn’t mean much, but Calamares is by far the best installer available today in terms of usability & stability.

During the test, the installation went smooth and no major problems and errors for this beta version of DAT Linux.

#### First Look and Desktop

Lubuntu is [super-lightweight distribution][4] thanks to the LXQt desktop and its components. The LXQt brings several native apps such as QTerminal, and PCManFM-QT file manager.

The beauty of a traditional icon and menu-based desktop environment is its usability and time-tested approach. Moreover, you care less about desktop themes and looks when working on serious data science projects.

The LXQt desktop in DAT Linux is a stock experience with a bottom main panel. It has the application menu at the left, a list of open applications and windows in the middle and the system tray at the right. By default, LXQt offers four workspaces which I believe are more than sufficient to logically diving your data science apps for work.

Overall, it’s a fast, clean desktop perfect for work or projects.

#### The difference with the stock-Lubuntu

The default applications for various tasks are slightly different from a stock Lubuntu version. Firstly, the default web browser is LibreWolf (and not Firefox), a free and open-source privacy-focused browser.

Secondly, for installing additional apps and packages, it brings KDE’s Discover, which is a central tool to install, remove and manage software and packages. In addition, DAT Linux also brings Muon package manager by KDE (which we featured in [Best KDE Apps Part 2][5]). The Muon package manager is also a powerful package manager for searching and installing packages. In addition, you can easily manage software sources and PPAs using Muon.

![Muon Package Manager][6]

Other extra software includes Vim editor, [nobleNote notebook manager][7], VLC Media Player, Xscreensaver and Picom. Also, LibreOffice is pre-installed in DAT Linux.

However, Flatpak and Snap (daemons) are not pre-installed – which is suitable for a lightweight system.

#### Data Science Applications & Native Tools

The primary focus of this distro is Data science, which is loaded with all the necessary apps for this stream.

The application list is spread across dynamic programming languages, Python libraries, Business Intelligence reporting tools, scientific graph plotters and many more.

Here’s the sample list of data science applications (You can read the detailed list [here][8]):

| App Name | Description | 
| :- | :- |
| BiRT | Eclipse BIRT™ is an open source reporting system for producing compelling BI reports | 
| Julia | Julia is a high-level, high-performance, dynamic programming language | 
| Jupyter Notebook | The Jupyter Notebook is a web-based interactive, scientific computing platform | 
| Jupyter Lab | JupyterLab is the latest web-based interactive development environment for notebooks, code, and data | 
| MOA | MOA is an open source framework for Big Data stream mining. It includes a collection of machine learning algorithms | 
| OpenRefine | OpenRefine is an open-source desktop application for data cleanup and transformation to other formats | 
| PSPP | GNU PSPP is a program for statistical analysis of sampled data. It is a free as in freedom replacement for the proprietary program SPSS | 
| R | R is a free software environment for statistical computing and graphics | 
| R-Studio | RStudio is an Integrated Development Environment (IDE) for R | 
| Spyder | Spyder is a free and open source scientific environment written in Python, for Python, and designed by and for scientists, engineers and data analysts |

As you can see, the above list should be sufficient for any data science use cases, whether you are a student, teacher, freelancer or professional.

#### DAT Linux Control Panel

DAT Linux folks also thought of a proper way of finding and launching these extra apps.

To do that, it brings DAT Linux Control Panel, a grid-based app launcher for the data science apps classified by functionalities in separate tabs.

It also gives you several additional options for native DAT Linux apps such as software updater, programming language cheat sheets & references, etc.

![DAT Linux Control Panel][9]

Finally, this release brings [Linux Kernel 5.15 LTS][10] with [Python 3.10][11] & [LXQt 0.17][12] – which is the base for Ubuntu 22.04 LTS.

#### Performance

The performance metric is impressive. At its idle state, DAT Linux uses 500 MB to 700 MB of RAM, and the CPU is, on average, 4%. Most of the system resources are consumed by Systemd services.

The metric obviously goes up when you run many data science applications and browsers. Since the idle state performance is good, I believe the heavy workload state should also be well-optimised.

Also, it’s essential to remember that most data science work requires heavy computing power. Hence, it’s always better to use this distribution in modern hardware with the latest CPU families.

![DAT Linux Performance at Idle State with 3 hours uptime][13]

In addition to the above, DAT Linux takes around 10 GB of disk space for default installation and all the packages.

### Wrapping Up

Despite thousands of distros and variants, DAT Linux is unique because it is a blend of Lubuntu LTS with only Data Science packages. As per my little knowledge, only Fedora has a spin called “[Fedora Scientific][14]“, which mainly deals with scientific software.

However, DAT Linux did well by packaging all the necessary apps with a front-end to manage them. One of the main aspects is that this distro will save time from installing and configuring all these apps by a general user.

Also, the Ubuntu LTS base with LXQt desktop is a suitable choice. Although, I believe a better File manager (such as Dolphin or Nemo) would have been better than PCManFM-Qt.

Other than that, it’s a complete distro and performs well. I hope it goes out of Beta soon and gets a first stable release.

You can download DAT Linux from the [official website][15].

So, what do you think about this distro? Would it be successful in its target niche community? Let me know in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/dat-linux-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/07/DAT-Linux-1.0b-Desktop.jpg
[2]: https://www.debugpoint.com/lubuntu-22-04-lts/
[3]: https://www.debugpoint.com/web-stories/ubuntu-22-04-review/
[4]: https://www.debugpoint.com/lightweight-linux-distributions-2022/
[5]: https://www.debugpoint.com/great-kde-apps-part-2/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/07/Muon-Package-Manager2.jpg
[7]: https://github.com/hakaishi/nobleNote
[8]: https://datlinux.com/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/07/DAT-Linux-Control-Panel.jpg
[10]: https://www.debugpoint.com/linux-kernel-5-15/
[11]: https://www.debugpoint.com/install-python-3-10-ubuntu/
[12]: https://www.debugpoint.com/lxqt-0-17-release/
[13]: https://www.debugpoint.com/wp-content/uploads/2022/07/DAT-Linux-Performance-at-Idle-State-with-3-hours-uptime.jpg
[14]: https://labs.fedoraproject.org/en/scientific/
[15]: https://datlinux.com/download/
