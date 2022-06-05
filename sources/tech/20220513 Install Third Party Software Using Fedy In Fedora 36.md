[#]: subject: "Install Third Party Software Using Fedy In Fedora 36"
[#]: via: "https://ostechnix.com/install-third-party-software-fedy-fedora/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install Third Party Software Using Fedy In Fedora 36
======
Install third-party software and multimedia codecs with Fedy in Fedora

The Fedora project will not include any package that doesn't comply with [Fedora licensing policies][1] in the official repositories. So, the Fedora users rely on third-party repositories like **RPM Fusion** to install propriety drivers, software and codecs that Fedora doesn't want to ship due to legal and licensing reasons. In this guide, we will see what is **Fedy** and how to install third-party software and multimedia codecs with Fedy in Fedora Linux operating systems.

### What is Fedy?

Fedy is a simple graphical application that allows you to install several third-party applications, development tools, drivers, themes, and utilities in Fedora.

You can install everything with a single mouse click! No need to use DNF/YUM or any other CLI/GUI package managers! Fedy will automatically add the respective repositories and install the selected applications.

Fedy is a perfect post-installer application for Fedora that allows you to quickly install frequently used essential applications after a fresh Fedora installation.

Whether you want to install a new software or a codec or apply a tweak, Fedy lets you do it without much hassle.

Please note that Fedy doesn't have its own repository. It will simply search and add the repository(s) which has the required software and automatically install them. It is just like a GUI front-end to the DNF/YUM package manager.

Fedy is free, open source application released under GPLv3. The source code of Fedy is hosted in GitHub.

### Install Fedy in Fedora Linux

First, you need to add and **enable RPM Fusion repository** in your Fedora system:

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Next, add fedy copr repository using command:

```
$ sudo dnf copr enable kwizart/fedy
```

After enabling RPM Fusion and Fedy copr repositories, run the following command to install fedy in Fedora:

```
$ sudo dnf install fedy -y
```

Now let us see how to use Fedy to install/remove third-party applications in Fedora.

### Install essential third-party applications in Fedora using Fedy

Launch Fedy either from the Terminal by using command:

```
$ fedy
```

You can also open Fedy from the Application launcher or Dash or Menu.

![Launch Fedy][2]

The default interface of fedy will look like below:

![Fedy main interface][3]

As you can see, Fedy interface is very simple!

As stated already, Fedy includes a lot of open and closed source applications, drivers and tools. All packages are categorized under six distinct sections as listed below:

1. Apps
2. Development tools
3. Drivers
4. Themes
5. Tweaks
6. Utilities

Just navigate to any section and install the available application(s). There is a search box on the top right-corner, which helps you to easily find a application to install or a tweak to apply.

#### Install and remove applications

The **Apps** section includes popular applications such as 1password, Anydesk, Insync, Microsoft teams, OneDrive, Spotify, Steam, WPS office, Zoom and many.

To install any application, just click on the **Install** button next to the application's name. You will be prompted to enter the `sudo` password. Once the password is entered, Fedy will add the appropriate repository for the application and install it. It's that simple!

![Install applications using Fedy in Fedora][4]

You can also remove the installed applications from the Fedy interface as well. No need to use GNOME software or DNF package manager.

#### Install development tools

From Development tools section, you can install various development tools like Android studio, CUDA toolkit, Eclipse IDE, Google Cloud SDK, JetBrains, MongoDB, Oracle JDK, Pycharm, Rstudio, Sublime text, Visual studio code and more.

#### Install drivers

The Drivers section in Fedy contains drivers and firmware for audio, video, Bluetooth, GPU, and filesystem etc. In this section, you can also install LTS Kernel as well.

Some of the notable drivers included in Fedy are: Broadcom 802.11 STA driver, Fuse exFAT driver, Intel legacy VAAPI driver, Nvidia GPU driver, and a few more.

#### Install themes

Fedy also allows you to change the look and feel of your Fedora desktop. You can make your desktop beautiful by installing popular themes like Flat-remix, Numix, and Papirus themes.

#### Tweak your Fedora system

This is my favorite section in Fedy. From Tweaks section in Fedora, you can tweak various settings, including the following:

* Clean junk files,
* Disable Wayland,
* Disable mouse acceleration,
* Add colors to bash prompt and make it fancy,
* Configure GRUB2,
* Set SELinux to permissive mode,
* Enable system-wide touchpad tap-to-click,
* Fix Intel throttling issues with Lenova notebooks.

![Tweak Fedora system using Fedy][5]

As stated already, all settings can be configured with a single mouse click! No need to edit configuration files and do changes manually. Fedy will set the optimal settings automatically!

#### Fedy utilities section

This is yet another important section in Fedy.

We can do the following from utilities section:

* Adobe flash browser plug-in and player
* Archive utilities to compress and extract different file formats
* Necessary multimedia codecs to encode or decode audio/video streams
* Enable encrypted DVD playback
* Microsoft TrueType fonts such as Arial, Times New Roman, and other core Microsoft fonts
* Oracle JRE to run JAVA applications
* and theme engines used by GTK themes to draw widgets

### Conclusion

As far as I tested, Fedy seems quite useful for Fedora users, especially for the newbies. Using Fedy, you can quickly setup a full-fledged Fedora desktop with all necessary applications for personal as well as professional usage.

**Resource:**

* [Fedy GitHub Repository][6]

--------------------------------------------------------------------------------

via: https://ostechnix.com/install-third-party-software-fedy-fedora/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://docs.fedoraproject.org/en-US/packaging-guidelines/LicensingGuidelines/
[2]: https://ostechnix.com/wp-content/uploads/2022/05/Launch-Fedy.png
[3]: https://ostechnix.com/wp-content/uploads/2021/09/Fedy-main-interface.png
[4]: https://ostechnix.com/wp-content/uploads/2021/09/Install-applications-using-Fedy-in-Fedora.png
[5]: https://ostechnix.com/wp-content/uploads/2021/09/Tweak-Fedora-system-using-Fedy.png
[6]: https://github.com/rpmfusion-infra/fedy
