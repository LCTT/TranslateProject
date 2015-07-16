4 CCleaner Alternatives For Ubuntu Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/ccleaner-10-700x393.jpg)

Back in my Windows days, [CCleaner][1] was my favorite tool for freeing up space, delete junk files and speed up Windows. I know I am not the only one who looked for CCleaner for Linux when switched from Windows. If you are looking for CCleaner alternative in Linux, I am going to list here four such application that you can use to clean up Ubuntu or Ubuntu based Linux distributions. But before we see the list, let’s ponder over whether Linux requires system clean up tools or not.

### Does Linux need system clean up utilities like CCleaner? ###

To get this answer, let’s first see what does CCleaner do. As per [How-To Geek][2]:

> CCleaner has two main uses. One, it scans for and deletes useless files, freeing up space. Two, it erases private data like your browsing history and list of most recently opened files in various programs.

So in short, it performs a system wide clean up of temporary file be it in your web browser or in your media player. You might know that Windows has the affection for keeping junk files in the system for like since ever but what about Linux? What does it do with the temporary files?

Unlike Windows, Linux cleans up all the temporary files (store in /tmp) automatically. You don’t have registry in Linux which further reduces the headache. At worst, you might have some broken packages, packages that are not needed anymore and internet browsing history, cookies and cache.

### Does it mean that Linux does not need system clean up utilities? ###

- Answer is no if you can run few commands for occasional package cleaning, manually deleting browser history etc.
- Answer is yes if you don’t want to run from places to places and want one tool to rule them all where you can clean up all the suggested things in one (or few) click(s).

If you have got your answer as yes, let’s move on to see some CCleaner like utilities to clean up your Ubuntu Linux.

### CCleaner alternatives for Ubuntu ###

Please note that I am using Ubuntu here because some tools discussed here are only existing for Ubuntu based Linux distributions while some are available for all Linux distributions.

#### 1. BleachBit ####

![BleachBit System Cleaning Tool for Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/BleachBit_Cleaning_Tool_Ubuntu.jpeg)

[BleachBit][3] is cross platform app available for both Windows and Linux. It has a long list of applications that it support for cleaning and thus giving you option for cleaning cache, cookies and log files. A quick look at its feature:

- Simple GUI check the boxes you want, preview it and delete it.
- Multi-platform: Linux and Windows
- Free and open source
- Shred files to hide their contents and prevent data recovery
- Overwrite free disk space to hide previously deleted files
- Command line interface also available

BleachBit is available by default in Ubuntu 14.04 and 15.04. You can install it using the command below in terminal:

    sudo apt-get install bleachbit

BleachBit has binaries available for all major Linux distributions. You can download BleachBit from the link below:

- [Download BleachBit for Linux][4]

#### 2. Sweeper ####

![Sweeper system clean up tool for Ubuntu Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/sweeper.jpeg)

Sweeper is a system clean up utility which is a part of [KDE SC utilities][5] module. It’s main features are:

- remove web-related traces: cookies, history, cache
- remove the image thumbnails cache
- clean the applications and documentes history

Sweeper is available by default in Ubuntu repository. Use the command below in a terminal to install Sweeper:

    sudo apt-get install sweeper

#### 3. Ubuntu Tweak ####

![Ubuntu Tweak Tool for cleaning up Ubuntu system](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Ubuntu_Tweak_Janitor.jpeg)

As the name suggests, [Ubuntu Tweak][6] is more of a tweaking tool than a cleaning utility. But along with tweaking things like compiz settings, panel configuration, start up program control, power management etc, Ubuntu Tweak also provides a Janitor tab that lets you:

- clean browser cache
- clean Ubuntu Software Center cache
- clean thumbnail cache
- clan apt repository cache
- clean old kernel files
- clean package configs

You can get the .deb installer for Ubuntu Tweak from the link below:

- [Download Ubuntu Tweak][7]

#### 4. GCleaner (beta) ####

![GCleaner CCleaner like tool](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/GCleaner.jpeg)

One of the third party apps for elementaryOS Freya, GCleaner aims to be CCleaner in GNU world. The interface resembles heavily to CCleaner. Some of the main features of GCleaner are:

- clean browser history
- clean app cache
- clean packages and configs
- clean recent document history
- empty recycle bin

At the time of writing this article, GCleaner is in heavy development. You can check the project website and get the source code to build and use GCleaner.

- [Know More About GCleaner][8]

### Your choice? ###

I have listed down the possibilities to you. I let you decide which tool you would use to clean Ubuntu 14.04. But I am certain that if you were looking for a CCleaner like application, one of these four end your search.

--------------------------------------------------------------------------------

via: http://itsfoss.com/ccleaner-alternatives-ubuntu-linux/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://www.piriform.com/ccleaner/download
[2]:http://www.howtogeek.com/172820/beginner-geek-what-does-ccleaner-do-and-should-you-use-it/
[3]:http://bleachbit.sourceforge.net/
[4]:http://bleachbit.sourceforge.net/download/linux
[5]:https://www.kde.org/applications/utilities/
[6]:http://ubuntu-tweak.com/
[7]:http://ubuntu-tweak.com/
[8]:https://quassy.github.io/elementary-apps/GCleaner/