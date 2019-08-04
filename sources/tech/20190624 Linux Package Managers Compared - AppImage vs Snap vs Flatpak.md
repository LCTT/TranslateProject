[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Package Managers Compared – AppImage vs Snap vs Flatpak)
[#]: via: (https://www.ostechnix.com/linux-package-managers-compared-appimage-vs-snap-vs-flatpak/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Linux Package Managers Compared – AppImage vs Snap vs Flatpak
======

![3 Linux Package Managers Compared][1]

**Package managers** provide a way of packaging, distributing, installing, and maintaining apps in an operating system. With modern desktop, server and IoT applications of the Linux operating system and the hundreds of different distros that exist, it becomes necessary to move away from platform specific packaging methods to platform agnostic ones. This post explores 3 such tools, namely **AppImage** , **Snap** and **Flatpak** , that each aim to be the future of software deployment and management in Linux. At the end we summarize a few key findings.

### 1\. AppImage

**AppImage** follows a concept called **“One app = one file”**. This is to be understood as an AppImage being a regular independent “file” containing one application with everything it needs to run in the said file. Once made executable, the AppImage can be run like any application in a computer by simply double-clicking it in the users file system.[1]

It is a format for creating portable software for Linux without requiring the user to install the said application. The format allows the original developers of the software (upstream developers) to create a platform and distribution independent (also called a distribution-agnostic binary) version of their application that will basically run on any flavor of Linux.

AppImage has been around for a long time. **Klik** , a predecessor of AppImage was created by **Simon Peter** in 2004. The project was shut down in 2011 after not having passed the beta stage. A project named **PortableLinuxApps** was created by Simon around the same time and the format was picked up by a few portals offering software for Linux users. The project was renamed again in 2013 to its current name AppImage and a repository has been maintained in GitHub (project [link][2]) with all the latest changes to the same since 2018.[2][3]

Written primarily in **C** and donning the **MIT license** since 2013, AppImage is currently developed by **The AppImage project**. It is a very convenient way to use applications as demonstrated by the following features:

  1. AppImages can run on virtually any Linux system. As mentioned before applications derive a lot of functionality from the operating system and a few common libraries. This is a common practice in the software world since if something is already done, there is no point in doing it again if you can pick and choose which parts from the same to use. The problem is that many Linux distros might not have all the files a particular application requires to run since it is left to the developers of that particular distro to include the necessary packages. Hence developers need to separately include the dependencies of the application for each Linux distro they are publishing their app for. Using the AppImage format developers can choose to include all the libraries and files that they cannot possibly hope the target operating system to have as part of the AppImage file. Hence the same AppImage format file can work on different operating systems and machines without needing granular control.
  2. The one app one file philosophy means that user experience is simple and elegant in that users need only download and execute one file that will serve their needs for using the application.
  3. **No requirement of root access**. System administrators will require people to have root access to stop them from messing with computers and their default setup. This also means that people with no root access or super user privileges cannot install the apps they need as they please. The practice is common in a public setting (such as library or university computers or on enterprise systems). The AppImage file does not require users to “install” anything and hence users need only download the said file and **make it executable** to start using it. This removes the access dilemmas that system administrators have and makes their job easier without sacrificing user experience.
  4. **No effect on core operating system**. The AppImage-application format allows using applications with their full functionality without needing to change or even access most system files. Meaning whatever the applications do, the core operating system setup and files remain untouched.
  5. An AppImage can be made by a developer for a particular version of their application. Any updated version is made as a different AppImage. Hence users if need be can **test multiple versions of the same application** by running different instances using different AppImages. This is an invaluable feature when you need to test your applications from an end-user POV to notice differences.
  6. Take your applications where you go. As mentioned previously AppImages are archived files of all the files that an application requires and can be used without installing or even bothering about the distribution the system uses. Hence if you have a set of apps that you use regularly you may even mount a few AppImage files on a thumb drive and take it with you to use on multiple computers running multiple different distros without worrying whether they’ll work or not.



Furthermore, the **AppImageKit** allows users from all backgrounds to build their own AppImages from applications they already have or for applications that are not provided an AppImage by their upstream developer.

The package manager is platform independent but focuses primarily on software distribution to end users on their desktops with a dedicated daemon **AppImaged** for integrating the AppImage formats into respective desktop environments. AppImage is supported natively now by a variety of distros such as Ubuntu, Debian, openSUSE, CentOS, Fedora etc. and others may set it up as per their needs. AppImages can also be run on servers with limited functionality via the CLI tools included.

To know more about AppImages, go to the official [**AppImage documentation**][3] page.

* * *

**Suggested read:**

  * [**Search Linux Applications On AppImage, Flathub And Snapcraft Platforms**][4]



* * *

### 2\. Snappy

**Snappy** is a software deployment and package management system like AppImage or any other package manager for that instance. It is originally designed for the now defunct **Ubuntu Touch** Operating system. Snappy lets developers create software packages for use in a variety of Linux based distributions. The initial intention behind creating Snappy and deploying **“snaps”** on Ubuntu based systems is to obtain a unified single format that could be used in everything from IoT devices to full-fledged computer systems that ran some version of Ubuntu and in a larger sense Linux itself.[4]

The lead developer behind the project is **Canonical** , the same company that pilots the Ubuntu project. Ubuntu had native snap support from version 16.04 LTS with more and more distros supporting it out of the box or via a simple setup these days. If you use Arch or Debian or openSUSE you’ll find it easy to install support for the package manager using simple commands in the terminal as explained later in this section. This is also made possible by making the necessary snap platform files available on the respective repos.[5]

Snappy has the following important components that make up the entire package manager system.[6]

  * **Snap** – is the file format of the packages themselves. Individual applications that are deployed using Snappy are called “Snaps”. Any application may be packaged using the tools provided to make a snap that is intended to run on a different system running Linux. Snap, similar to AppImage is an all-inclusive file and contains all dependencies the application needs to run without assuming them to part of the target system.
  * **Snapcraft** – is the tool that lets developers make snaps of their applications. It is basically a command that is part of the snap system as well as a framework that will let you build your own snaps.
  * **Snapd** – is the background daemon that maintains all the snaps that are installed in your system. It integrates into the desktop environment and manages all the files and processes related to working with snaps. The snapd daemon also checks for updates normally **4 times a day** unless set otherwise.
  * [**Snap Store**][5] – is an online gallery of sorts that lets developers upload their snaps into the repository. Snap store is also an application discovery medium for users and will let users see and experience the application library before downloading and installing them.



The snapd component is written primarily in **C** and **Golang** whereas the Snapcraft framework is built using **Python**. Although both the modules use the GPLv3 license it is to be noted that snapd has proprietary code from Canonical for its server-side operations with just the client side being published under the GPL license. This is a major point of contention with developers since this involves developers signing a CLA form to participate in snap development.[7]

Going deeper into the finer details of the Snappy package manager the following may be noted:

  1. Snaps as noted before are all inclusive and contain all the necessary files (dependencies) that the application needs to run. Hence, developers need not to make different snaps for the different distros that they target. Being mindful of the runtimes is all that’s necessary if base runtimes are excluded from the snap.
  2. Snappy packages are meant to support transactional updates. Such a transactional update is atomic and fully reversible, meaning you can use the application while its being updated and that if an update does not behave the way its supposed to, you can reverse the same with no other effects whatsoever. The concept is also called as **delta programming** in which only changes to the application are transmitted as an update instead of the whole package. An Ubuntu derivative called **Ubuntu Core** actually promises the snappy update protocol to the OS itself.[8]
  3. A key point of difference between snaps and AppImages, is how they handle version differences. Using AppImages different versions of the application will have different AppImages allowing you to concurrently use 2 or more different versions of the same application at the same time. However, using snaps means conforming to the transactional or delta update system. While this means faster updates, it keeps you from running two instances of the same application at the same time. If you need to use the old version of an app you’ll need to reverse or uninstall the new version. Snappy does support a feature called [**“parallel install”**][6] which will let users accomplish similar goals, however, it is still in an experimental stage and cannot be considered to be a stable implementation. Snappy also makes use of channels meaning you can use the beta or the nightly build of an app and the stable version at the same time.[9]
  4. Extensive support from major Linux distros and major developers including Google, Mozilla, Microsoft, etc.[4]
  5. Snapd the desktop integration tool supports taking **“snapshots”** of the current state of all the installed snaps in the system. This will let users save the current configuration state of all the applications that are installed via the Snappy package manager and let users revert to that state whenever they desire so. The same feature can also be set to automatically take snapshots at a frequency deemed necessary by the user. Snapshots can be created using the **snap save command** in the snapd framework.[10]
  6. Snaps are designed to be sandboxed during operation. This provides a much-required layer of security and isolation to users. Users need not worry about snap-based applications messing with the rest of the software on their computer. Sandboxing is implemented using three levels of isolation viz, **classic** , **strict** and **devmode**. Each level of isolation allows the app different levels of access within the file system and computer.[11]



On the flip side of things, snaps are widely criticized for being centered around **Canonical’s modus operandi**. Most of the commits to the project are by Canonical employees or contractors and other contributors are required to sign a release form (CLA). The sandboxing feature, a very important one indeed from a security standpoint, is flawed in that the sandboxing actually requires certain other core services to run (such as Mir) while applications running the X11 desktop won’t support the said isolation, hence making the said security feature irrelevant. Questionable press releases and other marketing efforts from Canonical and the “central” and closed app repository are also widely criticized aspects of Snappy. Furthermore, the file sizes of the different snaps are also **comparatively very large** compared to the app sizes of the packages made using AppImage.[7]

For more details, check [**Snap official documentation**][7].

* * *

**Related read:**

  * [**Install Snap packages in Arch Linux, and Fedora**][8]



* * *

### 3\. Flatpak

Like the Snap/Snappy listed above, **Flatpak** is also a software deployment tool that aims to ease software distribution and use in Linux. Flatpak was previously known as **“xdg-app”** and was based on concept proposed by **Lennart Poettering** in 2004. The idea was to contain applications in a secure virtual sandbox allowing for using applications **without the need of root privileges** and without compromising on the systems security. **Alex** started tinkering with Klik (thought to be a former version of AppImage) and wanted to implement the concept better. **Alexander Larsson** who at the time was working with Red Hat wrote an implementation called xdg-app in 2015 that acted as a pre-cursor to the current Flatpak format.

Flatpak officially came out in 2016 with backing from Red Hat, Endless Computers and Collabora. **Flathub** is the official repository of all Flatpak application packages. At its surface Flatpak like the other is a framework for building and packaging distribution agnostic applications for Linux. It simply requires the developers to conform to a few desktop environment guidelines in order for the application to be successfully integrated into the Flatpak environment.

Targeted primarily at the three popular desktop implementations **FreeDesktop** , **KDE** , and **GNOME** , the Flatpak framework itself is written in **C** and works on a **LGPL** license. The maintenance repository can be accessed via the GitHub link **[here][9]**.

A few features of Flatpak that make it stand apart are mentioned below. Notice that features Flatpak shares with AppImage and Snappy are omitted here.

  * Deep integration into popular Linux desktop environments such as GNOME & KDE so that users can simply use Flatpaks using Graphical software management tools instead of resorting to the terminal. Flatpak can be installed from the default repositories of major desktop environments now and once the apps themselves are set-up they can be used and provide features similar to normal desktop applications.[12][13]
  * **Forward-compatibility** – Flatpaks are built from the ground up keeping the operating systems core kernel and runtimes in mind. Hence, even if you upgrade or update your distro the Flatpaks you have should still work unless there is a core update. This is especially crucial for people who prefer staying on rolling betas or development versions of their distros. For such people, since the kinks of the OS itself isn’t ironed out usually, the Flatpak application will run seamlessly without having to depend on the OS files or libraries for its operation.[13]
  * **Sandboxing using Bubblewrap** – snaps are also by default sandboxed in that they run in isolation from the rest of the applications running while you’re using your computer. However, Flatpaks fully seal the application from accessing OS files and user files during its operation by default. This essentially means that system administrators can be certain that Flatpaks that are installed in their systems cannot exploit the computer and the files it contains whereas for end users this will mean that in order to access a few specific functions or user data root permission is required.[14]
  * Flatpak supports decentralized distribution of application natively however the team behind Flatpak still maintains a central online repository of apps/Flatpaks called **Flathub**. Users may in fact configure Flatpak to use multiple remote repositories as they see necessary. As opposed to snap you can have multiple repositories.[13]
  * Modular access through the sandbox. Although this capability comes at a great potential cost to the integrity of the system, Flatpak framework allows for channels to be created through the sandbox for exchange of specific information from within the sandbox to the host system or vice versa. The channel is in this case referred to as a portal. A con to this feature is discussed later in the section.[14]



One of the most criticized aspects of Flatpak however is it’s the sandbox feature itself. Sandboxing is how package managers such as Snappy and Flatpak implement important security features. Sandboxing essentially isolates the application from everything else in the system only allowing for user defined exchange of information from within the sandbox to outside. The flaw with the concept being that the sandbox cannot be inherently impregnable. Data has to be eventually transferred between the two domains and simple Linux commands can simply get rid of the sandbox restriction meaning that malicious applications might potentially jump out of the said sandbox.[15]

This combined with the worse than expected commitment to rolling out security updates for Flatpak has resulted in widespread criticism of the team’s tall claim of providing a secure framework. The blog (named **flatkill** ) linked at the end of this guide in fact mentions a couple of exploits that were not addressed by the Flatpak team as soon as they should’ve been.[15]

For more details, I suggest you to read [**Flatpak official documentation**][10].

* * *

**Related read:**

  * [**A Beginners Guide To Flatpak**][11]



* * *

### AppImage vs Snap vs Flatpak

The table attached below summarizes all the above findings into a concise and technical comparison of the three frameworks.

**Feature** | **AppImage** | **Snappy** | **Flatpak**
---|---|---|---
**Unique feature** |  Not an appstore or repository, its simply put a packaging format for software distribution. | Led by Canonical (Same company as Ubuntu), features central app repository and active contribution from Canonical. | Features an app store called FlatHub, however, individuals may still host packages and distribute it.
**Target system** |  Desktops and Servers. | Desktops, Servers, IoT devices, Embedded devices etc. | Desktops and limited function on servers.
**Libraries/Dependencies** |  Base system. Runtimes optional, Libraries and other dependencies packaged. | Base system or via Plugins or can be packaged. | GNOME, KDE, Freedesktop bundled or custom bundled.
**Developers** |  Community Driven led by Simon Peter. | Corporate driven by Canonical Ltd. | Community driven by flatpak team supported by enterprise.
**Written in** |  C. | Golang, C and Python. | C.
**Initial release** |  2004. | 2014. | 2015.
**Sandboxing** |  Can be implemented. | 3 modes – strict, classic, and devmode with varying confinement capabilities. Runs in isolation. | Isolated but Uses system files to run applications by default.
**Sandboxing Platform** |  Firejail, AppArmor, Bubblewrap. | AppArmor. | Bubblewrap.
**App Installation** |  Not necessary. Will act as self mounted disc. | Installation using snapd. | Installed using flatpak client tools.
**App Execution** |  Can be run after setting executing bit. | Using desktop integrated snap tools. Runs isolated with user defined resources. | Needs to be executed using flatpak command if CLI is used.
**User Privileges** |  Can be run w/o root user access. | Can be run w/o root user access. | Selectively required.
**Hosting Applications** |  Can be hosted anywhere by anybody. | Has to be hosted with Canonical servers which are proprietary. | Can be hosted anywhere by anybody.
**Portable Execution from non system locations** |  Yes. | No. | Yes, after flatpak client is configured.
**Central Repository** |  AppImageHub. | Snap Store. | Flathub.
**Running multiple versions of the app** |  Possible, any number of versions simultaneously. | One version of the app in one channel. Has to be separately configured for more. | Yes.
**Updating applications** |  Using CLI command AppImageUpdate or via an updater tool built into the AppImage. | Requires snapd installed. Supports delta updating, will automatically update. | Required flatpak installed. Update Using flatpak update command.
**Package sizes on disk** |  Application remains archived. | Application remains archived. | Client side is uncompressed.

Here is a long tabular comparison of AppImage vs. Snap vs. Flatpak features. Please note that the comparison is made from an AppImage perspective.

  * [**https://github.com/AppImage/AppImageKit/wiki/Similar-projects#comparison**][12]



### Conclusion

While all three of these platforms have a lot in common with each other and aim to be platform agnostic in approach, they offer different levels of competencies in a few areas. While Snaps can run on a variety of devices including embedded ones, AppImages and Flatpaks are built with the desktop user in mind. AppImages of popular applications on the other had have superior packaging sizes and portability whereas Flatpak really shines with its forward compatibility when its used in a set it and forget it system.

If there are any flaws in this guide, please let us know in the comment section below. We will update the guide accordingly.

**References:**

  * **[1]** [**Concepts — AppImage documentation**][13]
  * **[2]** [**Slashdot – Point-and-klik Linux Software Installation**][14]
  * **[3]** [**History of AppImage project**][15]
  * **[4][Snapcraft – Snaps are universal Linux packages][16]**
  * **[5][Installing snapd – Snap documentation][17]**
  * **[6][Snap documentation][7]**
  * **[7][On Snappy and Flatpak: business as usual in the Canonical propaganda department][18]**
  * **[8][Snap Updates are getting smaller, here’s why][19]**
  * **[9][What Are Linux Snap Packages? Why Use Them?][20]**
  * **[10][Snapshots – Snap documentation][21]**
  * **[11][Snap confinement – Snap documentation][22]**
  * **[12][Desktop Integration – Flatpak documentation][23]**
  * **[13][Introduction to Flatpak – Flatpak documentation][24]**
  * **[14][Sandbox Permissions – Flatpak documentation][25]**
  * **[15][Flatpak – a security nightmare][26]**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/linux-package-managers-compared-appimage-vs-snap-vs-flatpak/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/Linux-Package-Managers-Compared-1-720x340.png
[2]: https://github.com/AppImage/AppImageKit/blob/master/README.md
[3]: https://docs.appimage.org/
[4]: https://www.ostechnix.com/search-linux-applications-on-appimage-flathub-and-snapcraft-platforms/
[5]: https://snapcraft.io/store
[6]: https://blog.ubuntu.com/2019/06/20/parallel-installs-test-and-run-multiple-instances-of-snaps
[7]: https://docs.snapcraft.io/
[8]: https://www.ostechnix.com/install-snap-packages-arch-linux-fedora/
[9]: https://github.com/flatpak/flatpak
[10]: http://docs.flatpak.org/en/latest/index.html
[11]: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/
[12]: https://github.com/AppImage/AppImageKit/wiki/Similar-projects#comparison
[13]: https://docs.appimage.org/introduction/concepts.html#one-app-one-file.
[14]: https://linux.slashdot.org/story/05/01/15/1815210/point-and-klik-linux-software-installation
[15]: https://github.com/AppImage/AppImageKit/wiki/History#timeline.
[16]: https://snapcraft.io/#
[17]: https://docs.snapcraft.io/installing-snapd
[18]: https://www.happyassassin.net/2016/06/16/on-snappy-and-flatpak-business-as-usual-in-the-canonical-propaganda-department/
[19]: https://blog.ubuntu.com/2017/08/01/snap-updates-are-getting-smaller-heres-why
[20]: https://www.feliciano.tech/blog/what-are-linux-snap-packages-why-use-them/
[21]: https://docs.snapcraft.io/snapshots
[22]: https://docs.snapcraft.io/snap-confinement
[23]: http://docs.flatpak.org/en/latest/desktop-integration.html?highlight=desktop%20integration
[24]: http://docs.flatpak.org/en/latest/introduction.html
[25]: http://docs.flatpak.org/en/latest/sandbox-permissions.html?highlight=sandboxing
[26]: https://flatkill.org/
