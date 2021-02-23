[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (topgrade – Upgrade/Update Everything In Single Command On Linux?)
[#]: via: (https://www.2daygeek.com/topgrade-upgrade-update-everything-in-single-command-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

topgrade – Upgrade/Update Everything In Single Command On Linux?
======

As a Linux administrator, you have to keep your system up-to-date to get ride out from some unexpected issues.

We have to keep the system with latest patches as part of best practices.

To do so, you need to perform the patching activity at least once in a month.

Most of the time you have to reboot the server after patching to activate the latest kernel.

It’s good to reboot the server at least 90-120 days once that will fix some outstanding issue which we already having.

If you have a single system then we can directly login to the system and do perform the patching that is not a big deal.

Even, if you have few of servers with the same flavor then you can perform the patching with help of shell script.

If you have high number of servers then i would advise you to go with any of the parallel utility, which will help us to perform the patching in parallel.

It will save a lot’s of time compared with shell script as this go with sequential order.

how to patch all togeter if you have servers with multiple flavors? What will be the solution ?

I recently came to know the utility called `topgrade` that can fulfill your requirement.

Also, your distribution package manager doesn’t upgrade the packages which was installed with other package managers such as pip, npm, snap, etc,. but topgrade can fix this issue as well.

### What Is topgrade?

[topgrade][1] is a new tool that will upgrade all the installed packages on your system to latest available version by detecting and running the appropriate package managers.

### How To Install topgrade In Linux?

There is no separate package manager for distributions wise. Hence, you need to install topgrade with help of cargo package manager.

The topgrade is available in AUR. So, use one of the **[AUR helper][2]** to install it on Arch-based systems. I prefer to go with **[Yay helper][3]** program.

```
$ yay -S topgrade
```

Once you have installed the **[cargo package manager][4]** , use the following command to install it.

```
$ cargo install topgrade
```

Once topgrade is initiated, it will perform the following tasks one by one.

  * Try to self-upgrade if any updated is available for topgrade.
  * Arch: Run yay or fall back to pacman
  * CentOS/RHEL: Run yum upgrade
  * Fedora: Run dnf upgrade
  * Debian/Ubuntu: Run apt update && apt dist-upgrade
  * openSUSE: Run zypper refresh && zypper dist-upgrade
  * Upgrade Vim/Neovim packages.
  * Run npm update -g if NPM is installed
  * Upgrade Atom packages
  * Linux: Update Flatpak packages
  * Linux: Update snap packages
  * Linux: Run fwupdmgr to show firmware upgrade.
  * Finally it will run needrestart to bounce all the services.



Now, we have successfully installed `topgrade` so, run the topgrade alone to upgrade everything on your system. I have tested the utility on Ubuntu 18.04 LTS and the results are below.

```
$ topgrade

―― System update ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
[sudo] password for daygeek:
Hit:1 http://in.archive.ubuntu.com/ubuntu bionic InRelease
Get:2 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
Get:4 http://in.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
.
Get:16 http://security.ubuntu.com/ubuntu bionic-security/universe DEP-11 64x64 Icons [45.2 kB]
Get:17 http://security.ubuntu.com/ubuntu bionic-security/multiverse amd64 DEP-11 Metadata [2,460 B]
Fetched 1,565 kB in 13s (117 kB/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done
119 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree
Reading state information... Done
Calculating upgrade... Done
The following packages were automatically installed and are no longer required:
  libopts25 linux-headers-4.15.0-45 linux-headers-4.15.0-45-generic linux-image-4.15.0-45-generic
  linux-modules-4.15.0-29-generic linux-modules-4.15.0-45-generic linux-modules-extra-4.15.0-45-generic sntp
Use 'sudo apt autoremove' to remove them.
The following packages will be upgraded:
  apport apport-gtk apt apt-utils cups cups-bsd cups-client cups-common cups-core-drivers cups-daemon cups-ipp-utils
  cups-ppdc cups-server-common distro-info-data fwupdate fwupdate-signed gir1.2-dbusmenu-glib-0.4 gir1.2-gtk-3.0
  gir1.2-packagekitglib-1.0 gir1.2-snapd-1 gnome-settings-daemon gnome-settings-daemon-schemas grub-common grub-pc
  python3-httplib2 python3-problem-report samba-libs systemd systemd-sysv ubuntu-drivers-common udev ufw
  unattended-upgrades xdg-desktop-portal xdg-desktop-portal-gtk
119 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 38.5 MB of archives.
After this operation, 475 kB of additional disk space will be used.
Do you want to continue? [Y/n]
.
.
Setting up grub-pc (2.02-2ubuntu8.13) ...
Installing for i386-pc platform.
Installation finished. No error reported.
Sourcing file `/etc/default/grub'
Generating grub configuration file ...
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
done
Setting up mesa-vdpau-drivers:amd64 (18.2.8-0ubuntu0~18.04.2) ...
Updating PPD files for cups ...
Setting up apport-gtk (2.20.9-0ubuntu7.6) ...
Setting up pulseaudio-module-bluetooth (1:11.1-1ubuntu7.2) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for initramfs-tools (0.130ubuntu3.7) ...
update-initramfs: Generating /boot/initrd.img-4.15.0-47-generic
```

It will run the self-updates once the distribution official packages update done.

```
―― rustup ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
info: checking for self-updates
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: checking for self-updates

  stable-x86_64-unknown-linux-gnu unchanged - rustc 1.33.0 (2aa4c46cf 2019-02-28)
```

Then it will try to update the packages that has installed with other package managers.

```
―― Flatpak User Packages ――――――――――――――――――――――――――――――――――――――――――――――――――――――――
Looking for updates...
Looking for updates...
Updating in system:
org.gnome.Platform/x86_64/3.30                          flathub 862e6b8ec2b5
org.gnome.Platform.Locale/x86_64/3.30                   flathub 5e66e981ae00
org.freedesktop.Platform.html5-codecs/x86_64/18.08      flathub 282fd2c4ef33
com.github.muriloventuroso.easyssh/x86_64/stable        flathub c6bc3a3e72fb
  new permissions: ssh-auth
com.github.muriloventuroso.easyssh.Locale/x86_64/stable flathub b705864b8d78
Updating: org.gnome.Platform/x86_64/3.30 from flathub
[####################] 16 delta parts, 10 loose fetched; 65539 KiB transferred in 63 seconds
Error: Failed to update org.gnome.Platform/x86_64/3.30: Flatpak system operation Deploy not allowed for user

Skipping org.gnome.Platform.Locale/x86_64/3.30 due to previous error

Skipping org.freedesktop.Platform.html5-codecs/x86_64/18.08 due to previous error
Updating: com.github.muriloventuroso.easyssh/x86_64/stable from flathub
[####################] 2 delta parts, 3 loose fetched; 1532 KiB transferred in 5 seconds
Error: Failed to update com.github.muriloventuroso.easyssh/x86_64/stable: Flatpak system operation Deploy not allowed for user

Skipping com.github.muriloventuroso.easyssh.Locale/x86_64/stable due to previous error
error: There were one or more errors

Retry? [y/N]
```

Then it will run the firmwre upgrade.

```
―― Firmware upgrades ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
Fetching metadata https://cdn.fwupd.org/downloads/firmware.xml.gz
Downloading…           [***************************************]
Fetching signature https://cdn.fwupd.org/downloads/firmware.xml.gz.asc
```

Finally, it shows the summary about the patching has done.

```
―― Summary ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
System update: OK
rustup: OK
Flatpak User Packages: FAILED
Firmware upgrade: OK
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/topgrade-upgrade-update-everything-in-single-command-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://github.com/r-darwish/topgrade
[2]: https://www.2daygeek.com/category/aur-helper/
[3]: https://www.2daygeek.com/install-yay-yet-another-yogurt-aur-helper-on-arch-linux/
[4]: https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/
