[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install And Enable Flatpak Support On Linux?)
[#]: via: (https://www.2daygeek.com/how-to-install-and-enable-flatpak-support-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Install And Enable Flatpak Support On Linux?
======

Currently we all are using distributions official package managers to install any required packages.

in Linux, it’s doing good without any issues. (It’s doing their job nicely without any compromise)

There was some limitation on this that will think about other alternative solutions to fix it.

Yes, by default we won’t get the latest version of packages from the distributions official package managers because as these were built while building a current OS version. And they offers only security updates until the next major release comes.

So, what will be the solution for this?

Yes, we have multiple solutions for this and most of us were already started using few of those.

What it is and what is the benefit of those?

  * **For Ubuntu based systems:** PPAs
  * **For RHEL based systems:** [EPEL Repository][1], [ELRepo Repository][2], [nux-dextop Repository][3], [IUS Community Repo][4], [RPMfusion Repository][5] and [Remi Repository][6].



Using the above repos, we will be getting the latest packages for the distribution. And these are usually well maintained and suggested by most of the community. But these are advisable by the OS and may not always be safe.

In recent years, the following universal packaging formats were come out and gained a lot of popularity.

  * **`Flatpak:`**`` It’s distribution independent package format and the main contributor is Fedora project team. The Flatpak framework is adopted by most of the major Linux distributions.
  * **`Snaps:`**`` Snappy is a universal packaging formats originally designed and built by Canonical for the Ubuntu phone and it’s operating system. Later most of the distributions are adapted.
  * **`AppImage:`**`` AppImage is a portable package format and it can run without installation or the need for root rights.



We had already covered about the **[Snap package manager& packaging format][7]** in the past. Today we are going to discuss about Flatpak packing format.

### What Is Flatpak?

Flatpak (formerly know as X Desktop Group or xdg-app) is a software utility. It’s offering a universal packaging formats which can be used in any Linux distributions.

It provides a sandbox (isolated) environment to run the app and it doesn’t impact either other apps and distribution core packages. Also we can install and run the different version of same package.

There is an disadvantage on flatpak is that doesn’t support server OS unlike Snap and AppImage. It’s working only on few desktops environment.

Say for example. If you would like to run two version of php on your system then you can easily install and run as your wish.

That’s where the universal packaging formats are become very famous nowadays.

### How To Install Flatpak On Linux?

Flatpak package is available in most of the Linux distribution official repository. Hence, it can be installed using those.

For **`Fedora`** system, use **[DNF Command][8]** to install flatpak.

```
$ sudo dnf install flatpak
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][9]** or **[APT Command][10]** to install flatpak.

```
$ sudo apt install flatpak
```

For older Ubuntu versions.

```
$ sudo add-apt-repository ppa:alexlarsson/flatpak
$ sudo apt update
$ sudo apt install flatpak
```

For **`Arch Linux`** based systems, use **[Pacman Command][11]** to install flatpak.

```
$ sudo pacman -S flatpak
```

For **`RHEL/CentOS`** systems, use **[YUM Command][12]** to install flatpak.

```
$ sudo yum install flatpak
```

For **`openSUSE Leap`** system, use **[Zypper Command][13]** to install flatpak.

```
$ sudo zypper install flatpak
```

### How To Enable Flathub Support On Linux?

Flatbub website is a app store for Flatpak packages where you can find them.

It’s a central repository where all the flatpak applications are available for users.

Run the following command to enable Flathub support on Linux.

```
$ sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install the Software Flatpak plugin for GNOME Desktop Environment.

```
$ sudo apt install gnome-software-plugin-flatpak
```

Also, you can enable GNOME Repository if you are using GNOME Desktop Environment. It’s containing all GNOME core applications.

```
$ wget https://sdk.gnome.org/keys/gnome-sdk.gpg
$ sudo flatpak remote-add --gpg-import=gnome-sdk.gpg --if-not-exists gnome-apps https://sdk.gnome.org/repo-apps/
```

### How To List configured flatpak repositories?

Run the following command, if you would like to view list of the configured flatpak repositories on your system.

```
$ flatpak remotes
Name       Options
flathub    system
gnome-apps system
```

### How To List The Available Packages In The Configured Repositories?

Run the following command, if you would like to view list of the available packages (It will display all together like, applications and run times) in the configured repositories.

```
$ flatpak remote-ls | head -10

org.freedesktop.GlxInfo gnome-apps
org.gnome.Books gnome-apps
org.gnome.Builder   gnome-apps
org.gnome.Calculator    gnome-apps
org.gnome.Calendar  gnome-apps
org.gnome.Characters    gnome-apps
org.gnome.Devhelp   gnome-apps
org.gnome.Dictionary    gnome-apps
org.gnome.Documents gnome-apps
org.gnome.Epiphany  gnome-apps
```

To list only applications not runtimes.

```
$ flatpak remote-ls --app
```

To list specific repository applications.

```
$ flatpak remote-ls gnome-apps
```

### How To Install A Package From flatpak?

Run the following command to install a package from flatpak repository.

```
$ sudo flatpak install flathub com.github.muriloventuroso.easyssh

Required runtime for com.github.muriloventuroso.easyssh/x86_64/stable (runtime/org.gnome.Platform/x86_64/3.30) found in remote flathub
Do you want to install it? [y/n]: y
Installing in system:
org.gnome.Platform/x86_64/3.30                          flathub 4e93789f42ac
org.gnome.Platform.Locale/x86_64/3.30                   flathub 6abf9c0e2b72
org.freedesktop.Platform.html5-codecs/x86_64/18.08      flathub d6abde36c0be
com.github.muriloventuroso.easyssh/x86_64/stable        flathub 337db43043d2
  permissions: ipc, network, wayland, x11, dri
  file access: home, xdg-run/dconf, ~/.config/dconf:ro
  dbus access: ca.desrt.dconf
com.github.muriloventuroso.easyssh.Locale/x86_64/stable flathub af837356b222
Is this ok [y/n]: y
Installing: org.gnome.Platform/x86_64/3.30 from flathub
[####################] 1 metadata, 14908 content objects fetched; 228018 KiB transferred in 364 seconds
Now at 4e93789f42ac.
Installing: org.gnome.Platform.Locale/x86_64/3.30 from flathub
[####################] 4 metadata, 1 content objects fetched; 16 KiB transferred in 2 seconds
Now at 6abf9c0e2b72.
Installing: org.freedesktop.Platform.html5-codecs/x86_64/18.08 from flathub
[####################] 26 metadata, 131 content objects fetched; 2737 KiB transferred in 8 seconds
Now at d6abde36c0be.
Installing: com.github.muriloventuroso.easyssh/x86_64/stable from flathub
[####################] 191 metadata, 3633 content objects fetched; 24857 KiB transferred in 117 seconds
Now at 337db43043d2.
Installing: com.github.muriloventuroso.easyssh.Locale/x86_64/stable from flathub
[####################] 3 metadata, 1 content objects fetched; 14 KiB transferred in 2 seconds
Now at af837356b222.
```

All the installed application will be placed in the following location.

```
$ ls /var/lib/flatpak/app/
com.github.muriloventuroso.easyssh
```

### How To Run The Installed Application?

Run the following command to launch the required application. Make sure, you have to replace with your application name instead.

```
$ flatpak run com.github.muriloventuroso.easyssh
```

### How To View The Installed Application?

Run the following command to view the installed application.

```
$ flatpak list
Ref                                                Options
com.github.muriloventuroso.easyssh/x86_64/stable   system,current
org.freedesktop.Platform.html5-codecs/x86_64/18.08 system,runtime
org.gnome.Platform/x86_64/3.30                     system,runtime
```

### How To View The Detailed Information About The Installed Application?

Run the following command to view the detailed information about the installed application.

```
$ flatpak info com.github.muriloventuroso.easyssh

Ref: app/com.github.muriloventuroso.easyssh/x86_64/stable
ID: com.github.muriloventuroso.easyssh
Arch: x86_64
Branch: stable
Origin: flathub
Collection ID: org.flathub.Stable
Date: 2019-01-08 13:36:32 +0000
Subject: Update com.github.muriloventuroso.easyssh.json (cd35819c)
Commit: 337db43043d282c74d14a9caecdc780464b5e526b4626215d534d38b0935049f
Parent: 6e49096146f675db6ecc0ce7c5347b4b4f049b21d83a6cc4d01ff3f27c707cb6
Location: /var/lib/flatpak/app/com.github.muriloventuroso.easyssh/x86_64/stable/337db43043d282c74d14a9caecdc780464b5e526b4626215d534d38b0935049f
Installed size: 100.0 MB
Runtime: org.gnome.Platform/x86_64/3.30
Sdk: org.gnome.Sdk/x86_64/3.30
```

### How To Update The Installed Application?

Run the following command to updated the installed application to latest version.

```
$ flatpak update
```

For specific application, use the following format.

```
$ flatpak update com.github.muriloventuroso.easyssh
```

### How To Remove The Installed Application?

Run the following command to remove the installed application.

```
$ sudo flatpak uninstall com.github.muriloventuroso.easyssh
```

Go to the man page for more details and options.

```
$ flatpak --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-and-enable-flatpak-support-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]: https://www.2daygeek.com/install-enable-elrepo-on-rhel-centos-scientific-linux/
[3]: https://www.2daygeek.com/install-enable-nux-dextop-repository-on-centos-rhel-scientific-linux/
[4]: https://www.2daygeek.com/install-enable-ius-community-repository-on-rhel-centos/
[5]: https://www.2daygeek.com/install-enable-rpm-fusion-repository-on-centos-fedora-rhel/
[6]: https://www.2daygeek.com/install-enable-remi-repository-on-centos-rhel-fedora/
[7]: https://www.2daygeek.com/linux-snap-package-manager-ubuntu/
[8]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[9]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[10]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[11]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[12]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[13]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
