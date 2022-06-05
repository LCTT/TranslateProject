[#]: subject: "10 Things to Do After Installing Fedora 36 Workstation [With Bonus Tip]"
[#]: via: "https://www.debugpoint.com/2022/05/10-things-to-do-fedora-36-after-install/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

10 Things to Do After Installing Fedora 36 Workstation [With Bonus Tip]
======
I am sure you have already updated or installed Fedora 36 Workstation Edition. With that said, here’s our traditional article – “10 Things to Do After Installing Fedora 36”, to give you some post-install tweak ideas.

This guide is primarily for the Fedora 36 Workstation edition, i.e., GNOME Desktop. Because it is the default version and the most popular in terms of the user base. Hence, to make yourself more productive and tweak the entire desktop in the best possible way, here are the 10 things you can do after installing Fedora 36 Workstation Edition (GNOME).

### 10 Things to Do After Installing Fedora 36 Workstation

#### 1. Update DNF Configuration

Before you make any updates or changes in your system, it’s worth checking the dnf package manager configuration file for existing settings. The DNF is the default package manager (like apt) for Fedora Linux.

If you are a long time Fedora Linux user, you may know that dnf package downloads are sometimes slower despite having high-speed internet.

You can use the max_parallel_downloads option, among other tricks, in the /etc/dnf/dnf.conf file to make it faster.

This option takes a number (from 3 to 20) as its value which you specify in the file, and that many numbers of packages can be downloaded parallelly using dnf.

```
sudo gnome-text-editor /etc/dnf/dnf.conf
```

```
max_parallel_downloads=10
```

Open the config file using any text editor and add the below line.

After the update, your file should look like the one below. Save and close the file.

#### 2. Update your system

After you make the above changes and perform any other work, it’s always a good idea to update your system to ensure all the latest packages are downloaded and installed. You can open the Software application and go to the Updates Tab. Or, open a terminal and use the following command to update your system.

```
sudo dnf update
```

```
sudo dnf upgrade
```

![dnf update][1]

#### 3. Firmware Updates

If your hardware manufacturer supports a special firmware package for Linux, you can quickly check them and get those updates via the following sequence of commands. However, it may not always be available, but it is worth trying.

```
sudo fwupdmgr refresh --forcesudo fwupdmgr get-updatessudo fwupdmgr update
```

#### 4. Change Touchpad settings

If you are a Laptop user, check whether the “Tap to Click” option is enabled in the settings. Open the Settings application, navigate to the “Mouse and Touchpad” tab and verify.

#### 5. Enable RPM Fusion

The RPM Fusion library is a set of packages and applications provided by the community. For example, DVD or media codecs, etc. The Official Fedora repo does not offer them because of proprietary in nature. You can read our complete guide here to [enable RPM Fusion in Fedora][2]. Or, run the following commands in sequence to make it available for Fedora 36.

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

After the above commands are complete, run the following to update your system.

```
sudo dnf upgrade --refreshsudo dnf groupupdate core
```

#### 6. Install GNOME Tweaks

The GNOME Tweaks is the essential application for Fedora 36 Workstation. It helps you to manage many areas of your GNOME desktop. After installation, you can launch it via the application menu. To install, run the following commands from the terminal.

```
sudo dnf install gnome-tweak-tool
```

#### 7. Enable Flatpak and Install Extensions

The more we are moving ahead with the adaptation of sandboxing of applications, Flatpak is becoming more and more essential on the Linux desktop. Arguably, Flatpak performs better and is widely adopted compared to Snap.

Hence, you should enable Flatpak beforehand as you continue to make your system productive.

Open a terminal and run the below command to enable Flatpak.

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Then you can check out several applications available in [Flathub][3] to install.

However, one particular application that we recommend installing via Flathub is “[Extensions][4]“. This application helps you manage all the installed GNOME Extensions in your system. You can enable/disable them, launch settings of individual extensions and many such housekeeping tasks related to extensions. To install, open a terminal and run the below command. Once completed, you can launch the Extension application from the application menu.

```
flatpak install flathub org.gnome.Extensions
```

Alternatively, another application, “[Extension Manager][5]“, gives you some additional settings, and you may also try that via the below command.

```
flatpak install flathub com.mattjakeman.ExtensionManager
```

#### 8. Enable GNOME Extensions

Since we are talking about extensions, you need to set up your system before you install them. Open a terminal and run the below command to install the plugin to enable the hook to install extensions via the Firefox web browser.

```
sudo dnf install chrome-gnome-shell
```

Then open Firefox, and [visit this page][6]. And at the top, click on “install browser extension” and Continue.

![Add Browser Add-on for GNOME Shell Extension][7]

#### 9. Install these recommended GNOME Extensions

There are hundreds of GNOME Extensions available for various needs on the [official website][8]. However, here’s a curated list that we think should be installed by everyone while using Fedora 36 with the latest GNOME 42 desktop.

**Dash to Dock** (for COSMIC): Convert the bottom dock to a fully functional application dock with features such as autohide, extend to edges, move around and always show.

**GSConnet**: Install this extension if you want to get notification and SMS alerts from your Android mobile phone to the GNOME desktop. This is an alternative to KDE Connect for GNOME Desktop.

**Just Perfection**: This extension helps you make any changes to your GNOME Shell. You can change the visibility of almost all components of GNOME Shell, behaviour tweaks and customise panels, and more.

[Blur My Shell:][9]The default GNOME activities background is grey while showing the wallpaper of the workspaces. This extension makes your background wallpaper blur and gives a nice blurry drop shadow to the workspaces. And it comes with many other options as well.

[Net Speed Simplified:][10]This extension shows the data transfer speed of your active network as upload/download speed right at the top panel.

#### 10. Install Recommended Applications

The default GNOME Desktop brings very minimal required applications. They are not sufficient for a functioning and productive desktop. Hence, here’s a quick list of commands with essential applications that you can install, including a media player, torrent client, image editor, and more.

Copy and paste these into the terminal to install.

```
sudo dnf install -y vlcsudo dnf install -y steamsudo dnf install -y transmissionsudo dnf install -y gimpsudo dnf install -y gearysudo dnf install -y dropbox nautilus-dropboxsudo dnf install -y unzip p7zip p7zip-plugins unrar
```

If you prefer Flatpaks, here’s the command for that.

```
flatpak install flathub org.videolan.VLCflatpak install flathub com.valvesoftware.Steamflatpak install flathub com.transmissionbt.Transmissionflatpak install flathub org.gimp.GIMPflatpak install flathub org.gnome.Gearyflatpak install flathub com.dropbox.Client
```

### Bonus Tip(s)

And finally, here are three bonus tips exclusively for you.

#### Enable Battery percentage

If you want to view the battery percentage at the system tray, run the following command to show it via settings.

```
gsettings set org.gnome.desktop.interface show-battery-percentage true
```

#### Install nice looking fonts

GNOME desktop’s default font on Fedora 36 is perfect. But if you crave more, here are some of the cool fonts you can install. After installation, you can use GNOME Tweak Tool to change.

```
sudo dnf install -y 'google-roboto*' 'mozilla-fira*' fira-code-fonts
```

#### TLP

Last but not least, you should install TLP if you are a Laptop user. TLP is a great utility to help optimise your Laptop’s battery. This utility comes with various command-line options to tweak and view reports about power consumption. All you need to do is install and forget it. It takes care of the basic power-saving optimisations.

```
sudo dnf install tlp tlp-rdw
```

### Closing Notes

I hope you enjoyed reading these tips and applied some of them. So, what is your favourite must-do post-install tip? Let me know in the comment box down below!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/10-things-to-do-fedora-36-after-install/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2020/10/dnf-update.png
[2]: https://www.debugpoint.com/2020/07/enable-rpm-fusion-fedora-rhel-centos/
[3]: https://flathub.org/
[4]: https://flathub.org/apps/details/org.gnome.Extensions
[5]: https://flathub.org/apps/details/com.mattjakeman.ExtensionManager
[6]: https://extensions.gnome.org/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/03/Add-Browser-Add-on-for-GNOME-Shell-Extension.jpg
[8]: https://extensions.gnome.org/
[9]: https://extensions.gnome.org/extension/3193/blur-my-shell/
[10]: https://extensions.gnome.org/extension/3724/net-speed-simplified/
