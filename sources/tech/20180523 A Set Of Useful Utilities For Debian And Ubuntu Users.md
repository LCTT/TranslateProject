A Set Of Useful Utilities For Debian And Ubuntu Users
======

![](https://www.ostechnix.com/debian-goodies-a-set-of-useful-utilities-for-debian-and-ubuntu-users/)

Are you using a Debian-based system? Great! I am here today with a good news for you. Say hello to **“Debian-goodies”** , a collection of useful utilities for Debian-based systems, like Ubuntu, Linux Mint. These set of utilities provides some additional useful commands which are not available by default in the Debian-based systems. Using these tools, the users can find which programs are consuming more disk space, which services need to be restarted after updating the system, search for a file matching a pattern in a package, list the installed packages based on the search string and a lot more. In this brief guide, we will be discussing some useful Debian goodies.

### Debian-goodies – Useful Utilities For Debian And Ubuntu Users

The debian-goodies package is available in the official repositories of Debian and its derivative Ubuntu and other Ubuntu variants such as Linux Mint. To install debian-goodies package, simply run:
```
$ sudo apt-get install debian-goodies

```

Debian-goodies has just been installed. Let us go ahead and see some useful utilities.

#### **1. Checkrestart**

Let me start from one of my favorite, the **“checkrestart”** utility. When installing security updates, some running applications might still use the old libraries. In order to apply the security updates completely, you need to find and restart all of them. This is where Checkrestart comes in handy. This utility will find which processes are still using the old versions of libs. You can then restart the services.

To check which daemons need to be restarted after library upgrades, run:
```
$ sudo checkrestart
[sudo] password for sk:
Found 0 processes using old versions of upgraded files

```

Since I didn’t perform any security updates lately, it shows nothing.

Please note that Checkrestart utility does work well. However, there is a new similar tool named “needrestart” available latest Debian systems. The needrestart is inspired by the checkrestart utility and it does exactly the same job. Needrestart is actively maintained and supports newer technologies such as containers (LXC, Docker).

Here are the features of Needrestart:

  * supports (but does not require) systemd
  * binary blacklisting (i.e. display managers)
  * tries to detect pending kernel upgrades
  * tries to detect required restarts of interpreter based daemons (supports Perl, Python, Ruby)
  * fully integrated into apt/dpkg using hooks



It is available in the default repositories too. so, you can install it using command:
```
$ sudo apt-get install needrestart

```

Now you can check the list of daemons need to be restarted after updating your system using command:
```
$ sudo needrestart
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

Failed to check for processor microcode upgrades.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

```

The good thing is Needrestart works on other Linux distributions too. For example, you can install on Arch Linux and its variants from AUR using any AUR helper programs like below.
```
$ yaourt -S needrestart

```

On fedora:
```
$ sudo dnf install needrestart

```

#### 2. Check-enhancements

The check-enhancements utility is used to find packages which enhance the installed packages. This utility will list all packages that enhances other packages but are not strictly necessary to run it. You can find enhancements for a single package or all installed installed packages using “-ip” or “–installed-packages” flag.

For example, I am going to list the enhancements for gimp package.
```
$ check-enhancements gimp
gimp => gimp-data: Installed: (none) Candidate: 2.8.22-1
gimp => gimp-gmic: Installed: (none) Candidate: 1.7.9+zart-4build3
gimp => gimp-gutenprint: Installed: (none) Candidate: 5.2.13-2
gimp => gimp-help-ca: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-de: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-el: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-en: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-es: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-fr: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-it: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-ja: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-ko: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-nl: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-nn: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-pt: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-ru: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-sl: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-help-sv: Installed: (none) Candidate: 2.8.2-0.1
gimp => gimp-plugin-registry: Installed: (none) Candidate: 7.20140602ubuntu3
gimp => xcftools: Installed: (none) Candidate: 1.0.7-6

```

To list the enhancements for all installed packages, run:
```
$ check-enhancements -ip
autoconf => autoconf-archive: Installed: (none) Candidate: 20170928-2
btrfs-progs => snapper: Installed: (none) Candidate: 0.5.4-3
ca-certificates => ca-cacert: Installed: (none) Candidate: 2011.0523-2
cryptsetup => mandos-client: Installed: (none) Candidate: 1.7.19-1
dpkg => debsig-verify: Installed: (none) Candidate: 0.18
[...]

```

#### 3. dgrep

As the name implies, dgrep is used to search all files in specified packages based on the given regex. For instance, I am going to search for files that contains the regex “text” in Vim package.
```
$ sudo dgrep "text" vim
Binary file /usr/bin/vim.tiny matches
/usr/share/doc/vim-tiny/copyright: that they must include this license text. You can also distribute
/usr/share/doc/vim-tiny/copyright: include this license text. You are also allowed to include executables
/usr/share/doc/vim-tiny/copyright: 1) This license text must be included unmodified.
/usr/share/doc/vim-tiny/copyright: text under a) applies to those changes.
/usr/share/doc/vim-tiny/copyright: context diff. You can choose what license to use for new code you
/usr/share/doc/vim-tiny/copyright: context diff will do. The e-mail address to be used is
/usr/share/doc/vim-tiny/copyright: On Debian systems, the complete text of the GPL version 2 license can be
[...]

```

The dgrep supports most of grep’s options. Refer the following guide to learn grep commands.

#### 4 dglob

The dglob utility generates a list of package names which match a pattern. For example, find the list of packages that matches the string “vim”.
```
$ sudo dglob vim
vim-tiny:amd64
vim:amd64
vim-common:all
vim-runtime:all

```

By default, dglob will display only the installed packages. If you want to list all packages (installed and not installed), use **-a** flag.
```
$ sudo dglob vim -a

```

#### 5. debget

The **debget** utility will download a .deb for a package in APT’s database. Please note that it will only download the given package, not the dependencies.
```
$ debget nano
Get:1 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 nano amd64 2.9.3-2 [231 kB]
Fetched 231 kB in 2s (113 kB/s)

```

#### 6. dpigs

This is another useful utility in this collection. The **dpigs** utility will find and show you which installed packages occupy the most disk space.
```
$ dpigs
260644 linux-firmware
167195 linux-modules-extra-4.15.0-20-generic
75186 linux-headers-4.15.0-20
64217 linux-modules-4.15.0-20-generic
55620 snapd
31376 git
31070 libicu60
28420 vim-runtime
25971 gcc-7
24349 g++-7

```

As you can see, the linux-firmware packages occupies the most disk space. By default, it will display the **top 10** packages that occupies the most disk space. If you want to display more packages, for example 20, run the following command:
```
$ dpigs -n 20

```

#### 7. debman

The **debman** utility allows you to easily view man pages from a binary **.deb** without extracting it. You don’t even need to install the .deb package. The following command displays the man page of nano package.
```
$ debman -f nano_2.9.3-2_amd64.deb nano

```

If you don’t have a local copy of the .deb package, use **-p** flag to download and view package’s man page.
```
$ debman -p nano nano

```

**Suggested read:**

#### 8. debmany

An installed Debian package has not only a man page, but also includes other files such as acknowledgement, copy right, and read me etc. The **debmany** utility allows you to view and read those files.
```
$ debmany vim

```

![][1]

Choose the file you want to view using arrow keys and hit ENTER to view the selected file. Press **q** to go back to the main menu.

If the specified package is not installed, debmany will download it from the APT database and display the man pages. The **dialog** package should be installed to read the man pages.

#### 9. popbugs

If you’re a developer, the **popbugs** utility will be quite useful. It will display a customized release-critical bug list based on packages you use (using popularity-contest data). For those who don’t know, the popularity-contest package sets up a cron job that will periodically anonymously submit to the Debian developers statistics about the most used Debian packages on this system. This information helps Debian make decisions such as which packages should go on the first CD. It also lets Debian improve future versions of the distribution so that the most popular packages are the ones which are installed automatically for new users.

To generate a list of critical bugs and display the result in your default web browser, run:
```
$ popbugs

```

Also, you can save the result in a file as shown below.
```
$ popbugs --output=bugs.txt

```

#### 10. which-pkg-broke

This command will display all the dependencies of the given package and when each dependency was installed. By using this information, you can easily find which package might have broken another at what time after upgrading the system or a package.
```
$ which-pkg-broke vim
Package <debconf-2.0> has no install time info
debconf Wed Apr 25 08:08:40 2018
gcc-8-base:amd64 Wed Apr 25 08:08:41 2018
libacl1:amd64 Wed Apr 25 08:08:41 2018
libattr1:amd64 Wed Apr 25 08:08:41 2018
dpkg Wed Apr 25 08:08:41 2018
libbz2-1.0:amd64 Wed Apr 25 08:08:41 2018
libc6:amd64 Wed Apr 25 08:08:42 2018
libgcc1:amd64 Wed Apr 25 08:08:42 2018
liblzma5:amd64 Wed Apr 25 08:08:42 2018
libdb5.3:amd64 Wed Apr 25 08:08:42 2018
[...]

```

#### 11. dhomepage

The dhomepage utility will display the official website of the given package in your default web browser. For example, the following command will open Vim editor’s home page.
```
$ dhomepage vim

```

And, that’s all for now. Debian-goodies is a must-have tool in your arsenal. Even though, we don’t use all those utilities often, they are worth to learn and I am sure they will be really helpful at times.

I hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/debian-goodies-a-set-of-useful-utilities-for-debian-and-ubuntu-users/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.ostechnix.com/wp-content/uploads/2018/05/debmany.png
