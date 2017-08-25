Linux Installation Types: Server Vs. Desktop
============================================================

The kernel is the heart of any Linux installation


I have previously covered obtaining and installing Ubuntu Linux, and this time I will touch on desktop and server installations. Both types of installation address certain needs. The different installs are downloaded separately from Ubuntu. You can choose which one you need from  _[Ubuntu.com/downloads][1]_ .

Regardless of the installation type, there are some similarities.


![](http://www.radiomagonline.com/Portals/0/radio-managing-tech-Ubuntu_1.jpg)

**Packages can be added from the desktop system graphical user interface or from the server system command line.** 

Both utilize the same kernel and package manager system. The package manager system is a repository of programs that are precompiled to run on almost any Ubuntu system. Programs are grouped into packages and then packages are installed. Packages can be added from the desktop system graphical user interface or from the server system command line.

Programs are installed with a program called apt-get. This is a package manager system or program manager system. The end user simply types at the command line “apt-get install (package-name)” and Ubuntu will automatically get the software package and install it.

Packages usually install commands that have documentation that is accessed via the man pages (which is a topic unto itself). They are accessed by typing “man (command).” This will bring up a page that describes the command with details on usage. An end-user can also Google any Linux command or package and find a wealth of information about it, as well.

As an example, after installing the Network Attached Storage suite of packages, one would administer it via the command line, with the GUI, or with a program called Webmin. Webmin installs a web-based administrative interface for configuring most Linux packages, and it’s popular with the server-only install crowd because it installs as a webpage and does not require a GUI. It also allows for administering the server remotely.

Most, if not all, of these Linux-based package installs have videos and web pages dedicated to helping you run whatever package you install. Just search YouTube for “Linux Ubuntu NAS,” and you will find a video instructing you on how to setup and configure this service. There are also videos dedicated to the setup and operation of Webmin.

The kernel is the heart of any Linux installation. Since the kernel is modular, it is incredibly small (as the name suggests). I have run a Linux server installation from a small 32 MB compact flash. That is not a typo — 32 MB of space! Most of the space utilized by a Linux system is used by the packages installed.


![](http://www.radiomagonline.com/Portals/0/radio-managing-tech-Ubuntu_2.jpg)

**The desktop install ISO is fairly large and has a number of optional install packages not found on the server install ISO. This installation is designed for workstation or daily desktop use.** 

**SERVER**

The server install ISO is the smallest download from Ubuntu. It is a stripped down version of the operating system optimized for server operations. This version does not have a GUI. By default, it is completely run from the command line.

Removing the GUI and other components streamlines the system and maximizes performance. Any necessary packages that are not initially installed can be added later via the command line package manager. Since there is no GUI, all configuration, troubleshooting and package management must be done from a command line. A lot of administrators will use the server installation to get a clean or minimal system and then add only the certain packages that they require. This includes the ability to add a desktop GUI system and make a streamlined desktop system.

A Linux server could be used at the radio station as an Apache web server or a database server. Those are the real apps that require the horsepower, and that’s why they are usually run with a server install and no GUI. SNORT and Cacti are other applications that could be run on your Linux server (both covered in a previous article, found here:  [_http://tinyurl.com/yd8dyegu_][2] ).


![](http://www.radiomagonline.com/Portals/0/radio-managing-tech-Ubuntu_3.jpg)

**Packages are installed via the apt-get package manager system, just like the server install. The difference between the two is that on a desktop install, the apt-get package manager has a nice GUI front end.**

**DESKTOP**

The desktop install ISO is fairly large and has a number of optional install packages not found on the server install ISO. This installation is designed for workstation or daily desktop use. This installation type allows for the customization of packages (programs) or a default desktop configuration can be selected.

Packages are installed via the apt-get package manager system, just like the server install. The difference between the two is that on a desktop install, the apt-get package manager has a nice GUI front end. This allows for packages to be installed or removed easily from the system with the click of a mouse! The desktop install will setup a GUI and a lot of packages related to a desktop operating system.

This system is ready to go after being installed and can be a nice replacement to your windows or Mac desktop computer. It has a lot of packages including an Office suite and web browser.

Linux is a mature and powerful operating system. Regardless of the installation type, it can be configured to fit almost any need. From a powerful database server to a basic desktop operating system used for web browsing and writing letters to grandma, the sky is the limit and the packages available are almost inexhaustible. If you can think of a problem that requires a computerized solution, Linux probably has software for free or low cost to address that problem.

By offering two installation starting points, Ubuntu has done a great job of getting people started in the right direction.

 _Cottingham is a former radio chief engineer, now working in streaming media._ 



--------------------------------------------------------------------------------

via: http://www.radiomagonline.com/deep-dig/0005/linux-installation-types-server-vs-desktop/39123

作者：[Chris Cottingham ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://www.ubuntu.com/download
[2]:http://tinyurl.com/yd8dyegu
[3]:http://www.radiomagonline.com/author/chris-cottingham
