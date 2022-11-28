[#]: subject: "How to install only security and bugfixes updates with DNF"
[#]: via: "https://fedoramagazine.org/how-to-install-only-security-and-bugfixes-updates-with-dnf/"
[#]: author: "Mateus Rodrigues Costa https://fedoramagazine.org/author/mateusrodcosta/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to install only security and bugfixes updates with DNF
======

![][1]

Photo by [Scott Webb][2] on [Unsplash][3]

This article will explore how to filter the updates available to your Fedora Linux system by type. This way you can choose to, for example, only install security or bug fixes updates. This article will demo running the _dnf_ commands inside toolbox instead of using a real Fedora Linux install.

You might also want to read [Use dnf updateinfo to read update changelogs][4] before reading this article.

### Introduction

If you have been managing system updates for Fedora Linux or any other GNU/Linux distro, you might have noticed how, when you run a system update (with _dnf update_, in the case of Fedora Workstation), you usually are not installing only security updates.

Due to how package management in a GNU/Linux distro works, generally (with the exception of software running in a container, under Flatpak, or similar technologies) you are updating every single package regardless of whether it’s a “system” software or an “app”.

DNF divides updates in three types: “security”, “bugfix” and “enhancement”. And, as you will see, DNF allows filtering which types you want to operate on.

But, why would you want to update only a subset of packages?

Well, this might depend on how you personally choose to deal with system updates. If you are not comfortable at the moment with updating everything, then restricting the current update to only security updates might be a good choice. You could also install bug fix updates as well and only install enhancements and other types of updates during a future opportunity.

### How to filter security and bug fix updates

Start by creating a Fedora Linux 34 toolbox:

```
toolbox create --distro fedora --release f34 updatefilter-demo
```

Then enter that toolbox:

```
toolbox enter updatefilter-demo
```

From now on commands can be run on a real Fedora Linux install.

First, run _dnf check-update_ to see the unfiltered list of packages:

```
$ dnf check-update
audit-libs.x86_64                        3.0.5-1.fc34                   updates
avahi.x86_64                             0.8-14.fc34                    updates
avahi-libs.x86_64                        0.8-14.fc34                    updates
...
vim-minimal.x86_64                       2:8.2.3318-1.fc34              updates
xkeyboard-config.noarch                  2.33-1.fc34                    updates
yum.noarch                               4.8.0-1.fc34                   updates
```

DNF supports passing the types of updates to operate on as parameter: _‐‐security_ for security updates, _‐‐bugfix_ for bug fix updates and _‐‐enhancement_ for enhancement updates. Those work on commands such as _dnf check-update_, _dnf update_ and _dnf updateinfo_.

For example, this is how you filter the list of available updates by security updates only:

```
$ dnf check-update --security
avahi.x86_64                               0.8-14.fc34                  updates
avahi-libs.x86_64                          0.8-14.fc34                  updates
curl.x86_64                                7.76.1-7.fc34                updates
...
libgcrypt.x86_64                           1.9.3-3.fc34                 updates
nettle.x86_64                              3.7.3-1.fc34                 updates
perl-Encode.x86_64                         4:3.12-460.fc34              updates
```

And now same thing but by bug fix updates only:

```
$ dnf check-update --bugfix
audit-libs.x86_64                      3.0.5-1.fc34                     updates
ca-certificates.noarch                 2021.2.50-1.0.fc34               updates
coreutils.x86_64                       8.32-30.fc34                     updates
...
systemd-pam.x86_64                     248.7-1.fc34                     updates
systemd-rpm-macros.noarch              248.7-1.fc34                     updates
yum.noarch                             4.8.0-1.fc34                     updates
```

They can even be combined, so you can use two or more of them at the same time. For example, you can filter the list to show both security and bug fix updates:

```
$ dnf check-update --security --bugfix
audit-libs.x86_64                      3.0.5-1.fc34                     updates
avahi.x86_64                           0.8-14.fc34                      updates
avahi-libs.x86_64                      0.8-14.fc34                      updates
...
systemd-pam.x86_64                     248.7-1.fc34                     updates
systemd-rpm-macros.noarch              248.7-1.fc34                     updates
yum.noarch                             4.8.0-1.fc34                     updates
```

As mentioned, _dnf updateinfo_ also works with this filtering, so you can filter _dnf updateinfo_, _dnf updateinfo list_ and _dnf updateinfo info_. For example, for the list of security updates and their IDs:

```
$ dnf updateinfo list --security
FEDORA-2021-74ebf2f06f Moderate/Sec.  avahi-0.8-14.fc34.x86_64
FEDORA-2021-74ebf2f06f Moderate/Sec.  avahi-libs-0.8-14.fc34.x86_64
FEDORA-2021-83fdddca0f Moderate/Sec.  curl-7.76.1-7.fc34.x86_64
FEDORA-2021-e14e86e40e Moderate/Sec.  glibc-2.33-20.fc34.x86_64
FEDORA-2021-e14e86e40e Moderate/Sec.  glibc-common-2.33-20.fc34.x86_64
FEDORA-2021-e14e86e40e Moderate/Sec.  glibc-minimal-langpack-2.33-20.fc34.x86_64
FEDORA-2021-8b25e4642f Low/Sec.       krb5-libs-1.19.1-14.fc34.x86_64
FEDORA-2021-83fdddca0f Moderate/Sec.  libcurl-7.76.1-7.fc34.x86_64
FEDORA-2021-31fdc84207 Moderate/Sec.  libgcrypt-1.9.3-3.fc34.x86_64
FEDORA-2021-d1fc0b9d32 Moderate/Sec.  nettle-3.7.3-1.fc34.x86_64
FEDORA-2021-92e07de1dd Important/Sec. perl-Encode-4:3.12-460.fc34.x86_64
```

If desired, you can install only security updates:

```
# dnf update --security
================================================================================
 Package                     Arch        Version             Repository    Size
================================================================================
Upgrading:
 avahi                       x86_64      0.8-14.fc34         updates      289 k
 avahi-libs                  x86_64      0.8-14.fc34         updates       68 k
 curl                        x86_64      7.76.1-7.fc34       updates      297 k
...
 perl-Encode                 x86_64      4:3.12-460.fc34     updates      1.7 M
Installing weak dependencies:
 glibc-langpack-en           x86_64      2.33-20.fc34        updates      563 k

Transaction Summary
================================================================================
Install   1 Package
Upgrade  11 Packages

Total download size: 9.7 M
Is this ok [y/N]:
```

Or even to install both security and bug fix updates while ignoring enhancement updates:

```
# dnf update --security --bugfix
================================================================================
 Package                      Arch     Version                  Repo       Size
================================================================================
Upgrading:
 audit-libs                   x86_64   3.0.5-1.fc34             updates   116 k
 avahi                        x86_64   0.8-14.fc34              updates   289 k
 avahi-libs                   x86_64   0.8-14.fc34              updates    68 k
...
 rpm-plugin-systemd-inhibit   x86_64   4.16.1.3-1.fc34          fedora     23 k
 shared-mime-info             x86_64   2.1-2.fc34               fedora    374 k
 sqlite                       x86_64   3.34.1-2.fc34            fedora    755 k

Transaction Summary
================================================================================
Install  11 Packages
Upgrade  45 Packages

Total download size: 32 M
Is this ok [y/N]:
```

### Install only specific updates

You may also choose to only install the updates with a specific ID, such as _FEDORA-2021-74ebf2f06f_ for avahi by using _–advisory_ and specifying the ID:

```
# dnf update --advisory=FEDORA-2021-74ebf2f06f
================================================================================
 Package             Architecture    Version             Repository        Size
================================================================================
Upgrading:
 avahi               x86_64          0.8-14.fc34         updates          289 k
 avahi-libs          x86_64          0.8-14.fc34         updates           68 k

Transaction Summary
================================================================================
Upgrade  2 Packages

Total download size: 356 k
Is this ok [y/N]:
```

Or even multiple updates, with _‐‐advisories_:

```
# dnf update --advisories=FEDORA-2021-74ebf2f06f,FEDORA-2021-83fdddca0f
================================================================================
 Package            Architecture   Version                Repository       Size
================================================================================
Upgrading:
 avahi              x86_64         0.8-14.fc34            updates         289 k
 avahi-libs         x86_64         0.8-14.fc34            updates          68 k
 curl               x86_64         7.76.1-7.fc34          updates         297 k
 libcurl            x86_64         7.76.1-7.fc34          updates         284 k

Transaction Summary
================================================================================
Upgrade  4 Packages

Total download size: 937 k
Is this ok [y/N]:
```

### Conclusion

In the end it all comes down to how you personally prefer to manage your updates. But if you need, for whichever reason, to only install security updates, then these filters will surely come in handy!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-install-only-security-and-bugfixes-updates-with-dnf/

作者：[Mateus Rodrigues Costa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mateusrodcosta/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/how-to-install-only-security-and-bugfixes-updates-with-dnf-816x345.jpg
[2]: https://unsplash.com/@scottwebb?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/security?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/use-dnf-updateinfo-to-read-update-changelogs/
