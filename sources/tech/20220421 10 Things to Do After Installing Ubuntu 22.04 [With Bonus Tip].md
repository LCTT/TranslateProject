[#]: subject: "10 Things to Do After Installing Ubuntu 22.04 [With Bonus Tip]"
[#]: via: "https://www.debugpoint.com/2022/04/10-things-to-do-ubuntu-22-04-after-install/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Things to Do After Installing Ubuntu 22.04 [With Bonus Tip]
======
You may want to try a summary of 10 things after installing Ubuntu 22.04 LTS “Jammy Jellyfish” (GNOME Edition).

I am sure you are excited to experience the brand new Ubuntu 22.04 LTS and its shiny new features. If you have already installed or upgraded from the prior release, you may want to customise your system before you start using it. Although the customisations are subjective and vary with use cases. However, we give you 10 pointers that you can do after installing Ubuntu 22.04 LTS. I hope it helps.

### 10 Things to Do After Installing Ubuntu 22.04

#### 1. Update Your System

Firstly, you should do some housekeeping after installing Ubuntu 22.04 LTS. Before you begin using the new system and configuring it, ensure that it is up to date with the latest packages from the Ubuntu Jammy repo. So, open a terminal window and run the below commands. Or, open Software Updater from the search.

```
sudo apt update && sudo apt upgrade
```

![Update your Ubuntu 22.04 LTS System][1]

Software application takes some time to load for the first time; hence you must do it as a number one step to save time later. It is best if you wait until the update finishes. Once the update is complete, open the Software App and ensure it completes downloading the app metadata.

Finally, when everything completes, reboot your system to proceed.

#### 2. Opt-In/Opt-Out from data collection and history settings

Secondly, it’s essential to review the privacy settings before using the system. Because we are all concerned about our usage data, location tracking, etc. So, to check them, open Settings from search and go to Privacy. The items you should review are Location Services and File History usage in your system. Make sure to change them as per your need.

![Review the privacy settings][2]

#### 3. Configure KB shortcuts

To effectively use Ubuntu 22.04 system, keyboard shortcuts are essential. It helps your work faster. So, ideally, keyboard shortcuts are pre-configured, but you may want to change them based on your habits from `Settings > Keyboard > View and Customize Shortcuts`.

![Configure Keyboard shortcuts in Ubuntu 22.04][3]

#### 4. Prepare for the backup

If you plan to use the system for a longer duration, it is super important to create a system checkpoint just after installation. Because in the future, if something goes wrong, you can always revert to your system as a fresh install.

Ubuntu 22.04 comes with the built-in backup tool – Backups. You can go ahead and use it to create a system checkpoint.

However, we recommend you use the great backup and restore tool TImeshift. It has many additional options and is well documented for heavy usage. To install Timeshift, you can use software or the terminal commands mentioned below.

As of writing this post, this Timeshift PPA is yet to be updated for Jammy Jellyfish. So, I would recommend you wait for a couple of days to install it via PPA. You can also monitor PPA updates [here][4]. You can always use the built-in backup tool as mentioned above.

After installation, launch Timeshift and follow the on-screen instructions to create a system restore point.

```
sudo add-apt-repository -y ppa:teejee2008/ppasudo apt-get updatesudo apt-get install timeshift
```

#### 5. Explore the New Features

Once you complete the above set of housekeepings, it’s time for you to explore the new features of Ubuntu 22.04. We covered the unique features of Ubuntu 22.04 and its flavours in detail in dedicated posts. You may want to check them out below.

* [Ubuntu 22.04 LTS – GNOME][5]
* [Ubuntu MATE 22.04 LTS][6]
* [Kubuntu 22.04 LTS][7]
* [Xubuntu 22.04 LTS][8]
* [Ubuntu Budgie 22.04 LTS][9]
* [Lubuntu 22.04 LTS][10]
* [Ubuntu Kylin 22.04 LTS][11]
* [Ubuntu Studio 22.04 LTS][12]
* [Ubuntu 20.04 vs Ubuntu 22.04 – Differences][13]

#### 6. Experience the first-ever Accent Colour in Ubuntu

In addition to the above items, you may find the new accent colour interesting in this release. This is one of the new features which was due for a long time. So, in the Appearance settings, you can find the selected colour options.

You can choose your favourite colour and see the selection, the folder icon gradient changes with the colour. However, you can not select the custom colour at the moment. I am sure it will eventually come up in future releases.

![How Accent colour change impact looks in Ubuntu 22.04 LTS][14]

#### 7. Dark Mode and new controls

Besides that accent colour, this release, alongside GNOME 42, brings new style changes, thanks to GTK4 and libadwaita adoption. With this change, the built-in dark mode can apply across the desktop and application that supports it. Also, the controls such as buttons, notifications, rounded corners, scroll bars, etc. all are more stylish and compact in this release.

All of these together make this release a beautiful one.

#### 8. Install GNOME Extensions

Additionally, you can take advantage of hundreds of excellent GNOME Extensions available. For example, you may want to customise the default Dock, Or, like a super cool blur effect, etc. – you can quickly achieve these using the extensions.

We list here some of the exciting extensions you may want to try out after installing this release.

* [Blur My Shell][15] – get an exciting blur effect on the default shell
* [Floating Dock][16] – make your dock float wherever you want
* Dash to Dock: Enables you to control your Dash across the screen with various options.
* Caffeine: Enables you more productively.
* [Time ++][17]: Super handy extension to give you an alarm clock, stopwatch, time tracker, Pomodoro, and todo.txt manager – all together.
* [NetSpeed][18]: Show your internet download and upload speed in the system tray.

Before installing the above extensions, open a terminal prompt and install the chrome-gnome-shell using the below command to enable extensions.

```
sudo apt-get install chrome-gnome-shell
```

Then go to [https://extensions.gnome.org][19] and enable the extensions for Firefox.

If you use the Snap version of Firefox, then the extension connectivity won’t work. So, uninstall the Firefox Snap version and [use an alternate installation][20] Or use a different browser (Such as Google Chrome, Chromium) that has a .deb version. Or, install the extension using the manual steps [outlined here in this article][21].

#### 9. Configure Email Client

Moreover, a native desktop email client is always preferable over browser-based email access. Hence, I would recommend you configure Thunderbird with your email service provider. The setup is more straightforward and wizard-driven. It helps for offline and drafting work for heavy email users.

Alternatively, if you do not like Thunderbird, try to check out options – you can read our list of [top free native Linux desktop email clients list][22] and choose your favourite.

#### 10. Install some additional packages and Software

In addition to the above items, you should install some additional packages and software because Ubuntu doesn’t come with extra apps other than the native GNOME applications. We list here some of the important applications needed for basic desktop usage.

You can install them using the Software application.

* GIMP – Advanced photo editor
* VLC – Media play that plays anything without the need for additional codecs
* Google Chrome – Browser for Google users.
* Leafpad – A lightweight text editor (even lightweight from default gedit)
* Synaptic – A far better package manager

Moreover, while installing Ubuntu, if you have not selected to install the restricted software to play audio and video media files, you can do it now. Because GNOME default Video player (Totem) can not play the basic mp4, etc. files without restricted software.

So, to install them, open the terminal and run the below command to install.

```
sudo apt install ubuntu-restricted-extras
```

You can now play most video/audio files without any problem in Ubuntu.

#### Bonus Tip 💡

Finally, I recommend you set up Flatpak the first time after installing Ubuntu 22.04 LTS. Because over time, I am sure you would install many Flatpak applications.

To set up Flatpak, [visit this page][23] and follow the instructions.

Once you complete the setup, I recommend installing the below two Flatpak apps. The Extension application helps you manage the GNOME Extensions installed in your system. Other than that, the Flatseal application helps you manage Flatpak applications’ permissions in a super friendly way.

* [Flatseal][24] – Manage Flatpak permissions
* [Extensions][25] – Manage GNOME extensions

### Summary

Also, one of the crucial debatable things to do after installing Ubuntu 22.04 is to delete Snap. Deleting Snap is a bit advanced process and may lead to an unstable system because of the tight coupling of Snap in Ubuntu.

That said, I hope this list gives you and new users of Ubuntu some idea about making a productive Ubuntu 22.04 LTS desktop.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/10-things-to-do-ubuntu-22-04-after-install/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/04/Update-your-Ubuntu-22.04-LTS-System.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Review-the-privacy-settings.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/04/Configure-Keyboard-shortcuts-in-Ubuntu-22.04.jpg
[4]: https://launchpad.net/~teejee2008/+archive/ubuntu/timeshift/+packages
[5]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[6]: https://www.debugpoint.com/2022/04/ubuntu-mate-22-04-lts/
[7]: https://www.debugpoint.com/2022/04/kubuntu-22-04-lts/
[8]: https://www.debugpoint.com/2022/04/xubuntu-22-04-lts/
[9]: https://www.debugpoint.com/2022/04/ubuntu-budgie-22-04-lts/
[10]: https://www.debugpoint.com/2022/04/lubuntu-22-04-lts/
[11]: https://www.debugpoint.com/2022/04/ubuntu-kylin-22-04-lts/
[12]: https://www.debugpoint.com/2022/04/ubuntu-studio-22-04-lts/
[13]: https://www.debugpoint.com/2022/04/difference-ubuntu-22-04-20-04/
[14]: https://www.debugpoint.com/wp-content/uploads/2022/04/How-Accent-colour-change-impact-looks-in-Ubuntu-22.04-LTS.jpg
[15]: https://extensions.gnome.org/extension/3193/blur-my-shell/
[16]: https://extensions.gnome.org/extension/3730/floating-dock/
[17]: https://extensions.gnome.org/extension/1238/time/
[18]: https://extensions.gnome.org/extension/104/netspeed/
[19]: https://extensions.gnome.org/
[20]: https://www.debugpoint.com/2021/09/remove-firefox-snap-ubuntu/
[21]: https://www.debugpoint.com/2021/10/manual-installation-gnome-extension/
[22]: https://www.debugpoint.com/2019/06/best-email-client-linux-windows/
[23]: https://flatpak.org/setup/
[24]: https://flathub.org/apps/details/com.github.tchx84.Flatseal
[25]: https://flathub.org/apps/details/org.gnome.Extensions
