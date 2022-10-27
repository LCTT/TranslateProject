[#]: subject: "risiOS: A Friendly Fedora Spin with Distinctive Features"
[#]: via: "https://www.debugpoint.com/risios-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

risiOS: A Friendly Fedora Spin with Distinctive Features
======
risiOS is a nifty little Fedora-based distro with its unique set of features. A must-try for GNOME fans.

risiOS is a Fedora workstation-based distro that ships unique tools and features for new users in Fedora. It is designed to make your Fedora journey easier by providing options at your fingertips. It’s a must-try distro because you get the Fedora GNOME offerings while enjoying additional features.

In this article, I review risiOS 36 (based on [Fedora 36][1]), released in August 2022.

### risiOS Review

#### Installation

Before I give details about the experience, there are several essential items regarding the installation.

The installer size is reasonably small, 1.6 GB, and the installation uses Fedora’s installer.

As per the minimum system requirement, risiOS asks for only 2GB of memory which is quite impressive.

The tested version (Fedora 36 The Big Beta) did not show any surprises in installation – everything was pretty smooth.

#### The desktop

![risiOS Desktop version 36][2]

Since it’s based on the Fedora workstation, the default desktop is GNOME with all Fedora’s built-in features. But there is some unique characteristic about this OS which I will describe soon.

But first, let’s talk about the look.

The clock, calendar, and quick settings menu are identical to the default GNOME. At the top left, the only difference is the risiOS logo. This version which I am reviewing, has [GNOME 42][3]. So, you won’t have the [newly designed quick settings][4].

Besides that, the workspace, application menu and essential items are the same as the Fedora workstation.

A vibrant wallpaper featuring the risiOS logo is a distinguishing factor.

#### Selling points of risiOS

Although the look is the same, there are some unique items which risiOS brings.

First, the welcome app from risiOS has some unique features – not the usual welcome stuff you see in distros. The “first step” items are suitable for new and advanced users. The UI design is to the point. No additional talks and to-the-point items. Good.

What do you get here? You have the option to install NVIDIA drivers and [set up RPM fusion][5] and [Flatpak][6] with just one click of a button.

![risiOS Welcome screen – First steps][7]

In addition, there are Web apps and a built-in customization app launcher for additional tweaks.

Most of the new users of Fedora may not know what RPM Fusion is or if it exists. Since Fedora is still less popular than Ubuntu among the new users – it’s a great addition to risiOS to provide a direct option to install these with a description.

![Quick setup in Welcome wizard][8]

Furthermore, a set of quick setup options gives you a one-click method to set up your PC for various tasks, such as gaming, video production, audio production, etc.

But how? It uses a new method or a script called risiScript.

#### risiScript

The devs of this distro developed a new app install script called risiScript. Remember the [AUR of Arch Linux][9]?

It’s similar to that concept.

The risiScript is a simple text file with instructions for installing software. It’s the bash scripts but with a wrapper and GUI.

So, the one-click install buttons you see in the welcome app – are all executing risiScript at the backend. The GUI is written in Python (I believe), and the scripts executing are the actual bash commands.

Since it is open-source, risiScript has potential for other non-Arch distros. Distro creators can adopt this for various GUI-driven tasks, encapsulating complex bash scripts. You can find the code on [GitHub for risiScript][10].

![Sample risiScript for setting up Flathub repo][11]

#### risiTweaks

This is my favourite app in this distro. So, risiTweaks enables you to control and change different areas of the GNOME desktop. At first glance, it might feel like the GNOME Tweaks Tool from the look of it.

But the features are packed.

Firstly, you can change the accent colour in Fedora, which is yet to arrive in GNOME upstream from Ubuntu. Secondly, it has built-in GTK3 and GTK4 theme chooser with icon and cursor themes.

![risiTweaks][12]

Moreover, since this app has a built-in GNOME extension manager, you don’t need to install any other app. However, you can not search and install extensions from this app.

Other features include desktop layout options such as clocks, battery percentage, system tray, mouse and keyboard settings. Also, you can change various Window settings such as modal dialog, window title bar actions, window button layouts and more.

I wonder whether you can install this app on a normal Fedora workstation and see whether it works. It will be fun to see what happens.

#### Web apps

Another excellent item which is available is the Web app. The devs of this distro forked the Linux Mint’s Web app and created a GTK-based Web app manager and launcher.

I am saying “manage” because it gives you an excellent GTK window to manage your custom web apps, plus a good list of prebuilt web apps for popular websites. I don’t remember seeing this in Linux Mint’s web app tool.

![Web apps in risiOS][13]

#### Default apps

The default browser is Chromium instead of Firefox, and the GTK drawing app is available for quick drawings. And the rest of the apps are the same as what the Fedora workstation provides. LibreOffice is not installed; however, there is OnlyOffice repo is enabled, although it is not installed (I don’t know why).

Some of the software is distributed via the copr repo for risiOS which the developers create.

If you are wondering about performance, I would say it’s the same as the Fedora workstation edition.

Finally, the nice risiOS wallpaper alongside one or two new wallpapers gives it a nice touch.

### Summary of risiOS offerings

With that said, here’s a summary of risiOS on what you get.

* At its core, identical to Fedora Workstation
* risiTweaks is full of features, including managing the GNOME Extensions
* Create your web apps with ease and also install web apps from the store
* Powerful risiScript for better user experience
* Curated apps delivered via risiOS copr
* Small team, hence the releases is a little delayed after Fedora official launches
* One-click options to make your system for gaming, development, creative work and so on.

Overall, it’s a nice Fedora spin targeted to the new users who want to use Fedora. The built-in features to install NVIDIA, RPM Fusion and apps like Webapps, risiTweaks drawing will help new folks. Then again, to become more user-friendly, Fedora needs to change the installer – most importantly, the partition module.

Since there are few Fedora-based community spins, such as [Ultramarine Linux][14], risiOS caters to some specific users.

It’s a friendly little distro. Give it a try.

You can download risiOS from the [official website][15].

![Join our Telegram channel and stay informed on the move.][16]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/risios-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/fedora-36-features/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/08/risiOS-Desktop-version-36.jpg
[3]: https://www.debugpoint.com/gnome-42/
[4]: https://www.debugpoint.com/gnome-43-quick-settings/
[5]: https://www.debugpoint.com/enable-rpm-fusion-fedora-rhel-centos/
[6]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/08/risiOS-Welcome-screen-First-steps.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/08/Quick-setup-in-Welcome-wizard.jpg
[9]: https://www.debugpoint.com/install-yay-arch/
[10]: https://github.com/risiOS/risi-script
[11]: https://www.debugpoint.com/wp-content/uploads/2022/08/Sample-risiScript.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/08/risiTweaks.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/08/Web-apps.jpg
[14]: https://www.debugpoint.com/ultramarine-linux-36/
[15]: https://risi.io/download/
[16]: https://t.me/debugpoint
