[#]: subject: "How to Enable RPM Fusion Repo in Fedora, CentOS, RHEL"
[#]: via: "https://www.debugpoint.com/enable-rpm-fusion-fedora-rhel-centos/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Enable RPM Fusion Repo in Fedora, CentOS, RHEL
======
This guide explains the steps to enable third-party software repository RPM Fusion in Fedora Linux Distribution.

The [RPM Fusion][1] software repo is a community-maintained software repo that provides additional packages for Fedora Linux which is not distributed by the official Fedora team such as DVD playback, media playback, software from GNOME and KDE work, etc. This is because of licensing, other legal reasons, and country-specific software norms.

The RPM Fusion provides .rpm packages for Red Hat Enterprise Linux as well alongside Fedora.

This guide explains the steps you need to enable the RPM Fusion repo in Fedora Linux. This guide applies to all Fedora release versions.

This is tested in all the current supported Fedora versions – 35, 36 and 37.

![RPM Fusion][2]

### How to Enable RPM Fusion Repo in Fedora Linux, RHEL, CentOS

RPM Fusion has two flavours of the repo. Free and non-Free.

The Free one, as its name says, contains a free version of software packages and the non-free ones contain compiled packages of closed source and “non-commercial” open-source software.

Before you proceed, first check whether you have RPM fusion installed. Open up a terminal and run the below command.

```
dnf repolist | grep rpmfusion
```

If RPM is installed, you should see a message like the one below. Then no need to proceed at all. If it is not installed, you may proceed with the following steps.

![RPM-Fusion-Already-Installed-][3]

Open a terminal and run the below commands as per your operating system versions. Please note that the commands contain both a free and non-free version. If you want, you can omit either one from below while running.

#### Fedora

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### Silverblue with rpm-ostree

```
sudo rpm-ostree install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo rpm-ostree install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### RHEL 8

```
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

```
sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
```

```
sudo dnf install --nogpgcheckhttps://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
```

```
sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-$(uname -m)-rpms"
```

#### CentOS 8

```
sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```

```
sudo dnf install --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
```

```
sudo dnf install --nogpgcheckhttps://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
```

```
sudo dnf config-manager --enable PowerTools
```

### Additional Instructions

* RPM Fusion also provides to help users install packages from GNOME Software or KDE Discover. To enable it in Fedora, run the below command.

```
sudo dnf groupupdate core
```

* You can also enable RPM Fusion to play multimedia files that use gstreamer, and additional multimedia playback packages via the below command.

```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```

```
sudo dnf groupupdate sound-and-video
```

* Enable RPM Fusion to play a DVD that uses libdvdcss.

```
sudo dnf install rpmfusion-free-release-taintedsudo dnf install libdvdcss
```

* Enable RPM Fusion to enable non-FLOSS hardware packages via the below command.

```
sudo dnf install rpmfusion-nonfree-release-taintedsudo dnf install *-firmware
```

After running the commands, if you are using Fedora or CentOS/RHEL – run the below commands before rebooting.

```
sudo dnf check-updatesudo dnf update
```

### How to remove repo using dnf

If you want to remove the repository, follow the steps below.

First, check using the below command to view the repo list added to your Fedora system.

```
dnf repolist
```

![dnf repolist][4]

As you can see, both rpmfusion free and non-free repo is added. To remove it via dnf, you need to know precisely the repo file name using the following command.

```
rpm -qa 'rpmfusion*'
```

This would list the exact name of the repo. In the example, they are ‘rpmfusion-free-release’.

![remove rpmfusion from fedora][5]

Now you can simply run the below command to remove it.

```
sudo dnf remove rpmfusion-free-release
```

You can repeat the above example to remove rpmfusion from Fedora, also, use this to remove any other repo from your system.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/enable-rpm-fusion-fedora-rhel-centos/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://rpmfusion.org/
[2]: https://www.debugpoint.com/wp-content/uploads/2020/07/rpmfusion.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2020/07/RPM-Fusion-Already-Installed-.png
[4]: https://www.debugpoint.com/wp-content/uploads/2020/07/dnf-repolist.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2020/07/remove-rpmfusion-from-fedora.jpg
