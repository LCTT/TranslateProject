Translating  By GitFuture

# dpkg commands to manage packages on Debian Based Systems

[dpkg][7] stands for Debian package manager (dpkg). dpkg is a command-line tool to install, build, remove and manage Debian packages. dpkg uses Aptitude (primary and more user-friendly) as a front-end to perform all the actions.

Other utility such as dpkg-deb and dpkg-query uses dpkg as a front-end to perform some action.

Now a days most of the administrator using Apt, [Apt-Get][6] & Aptitude to manage packages easily without headache and its robust management too.

Even though still we need to use dpkg to perform some software installation where it’s necessary. Some other package manger utilities which are being used widely in Linux are [yum][5], [dnf][4], [apt-get][3], dpkg, [rpm][2], [Zypper][1], pacman, urpmi, etc.,

Now, i’m going to play on our Ubuntu 15.10 box to explain and cover mostly used dpkg commands with examples.

#### 1) Common syntax/file location for dpkg

See below for common syntax/ file location of dpkg which will help you if you want to check more about it.

<iframe marginwidth="0" marginheight="0" scrolling="no" frameborder="0" height="90" width="728" id="_mN_gpt_827143833" style="border-width: 0px; border-style: initial; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;"></iframe>
```
[General syntax for dpkg]
$ dpkg -[command] [.deb package name]

$ dpkg -[command] [package name]

[dpkg releated files location]
$ /var/lib/dpkg

[This file contain modified package info by dpkg command like (install, remove, etc..,)]
$ /var/lib/dpkg/status

[This file contain available package list]
$ /var/lib/dpkg/status

```

#### 2) Install/Upgrade the package

Use the below command to install/upgrade .deb packge on Debian based systems such as Debian, Mint, Ubuntu & elementryOS, etc..,. Here i’m going to install Atom through atom-amd64.deb file. It will upgrade if it’s installed other wise install a fresh one.

```
[Install/Upgrade dpkg packages]
$ sudo dpkg -i atom-amd64.deb
Selecting previously unselected package atom.
(Reading database ... 426102 files and directories currently installed.)
Preparing to unpack atom-amd64.deb ...
Unpacking atom (1.5.3) over (1.5.3) ...
Setting up atom (1.5.3) ...
Processing triggers for gnome-menus (3.13.3-6ubuntu1) ...
Processing triggers for bamfdaemon (0.5.2~bzr0+15.10.20150627.1-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for desktop-file-utils (0.22-1ubuntu3) ...
Processing triggers for mime-support (3.58ubuntu1) ...

```

#### 3) Install a package from folder

Use the below command to install the packages recursively from directory on Debian based systems such as Debian, Mint, Ubuntu & elementryOS, etc,. This will install all the *.deb packages under the /opt/software directory.

```
$ sudo dpkg -iR /opt/software
Selecting previously unselected package atom.
(Reading database ... 423303 files and directories currently installed.)
Preparing to unpack /opt/software/atom-amd64.deb ...
Unpacking atom (1.5.3) ...
Setting up atom (1.5.3) ...
Processing triggers for gnome-menus (3.13.3-6ubuntu1) ...
Processing triggers for bamfdaemon (0.5.2~bzr0+15.10.20150627.1-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for desktop-file-utils (0.22-1ubuntu3) ...
Processing triggers for mime-support (3.58ubuntu1) ...
```

#### 4) Print the Installed packages list

Use the below command to List all installed packages, along with package version and description on Debian based systems such as Debian, Mint, Ubuntu & elementryOS, etc..,.

```
$ dpkg -l
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name                        Version                            Architecture Description
+++-===========================-==================================-============-================================================================
ii  account-plugin-aim          3.12.10-0ubuntu2                   amd64        Messaging account plugin for AIM
ii  account-plugin-facebook     0.12+15.10.20150723-0ubuntu1       all          GNOME Control Center account plugin for single signon - facebook
ii  account-plugin-flickr       0.12+15.10.20150723-0ubuntu1       all          GNOME Control Center account plugin for single signon - flickr
ii  account-plugin-google       0.12+15.10.20150723-0ubuntu1       all          GNOME Control Center account plugin for single signon
ii  account-plugin-jabber       3.12.10-0ubuntu2                   amd64        Messaging account plugin for Jabber/XMPP
ii  account-plugin-salut        3.12.10-0ubuntu2                   amd64        Messaging account plugin for Local XMPP (Salut)
.
.

```

#### 5) Check particular Installed package

Use the below command to List individual installed package, along with package version and description on Debian based systems such as Debian, Mint, Ubuntu & elementryOS, etc..,.

<iframe marginwidth="0" marginheight="0" scrolling="no" frameborder="0" height="90" width="728" id="_mN_gpt_827143833" style="border-width: 0px; border-style: initial; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;"></iframe>
```
$ dpkg -l atom
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name       Version   Architecture        Description
+++-==========-=========-===================-============================================
ii  atom       1.5.3     amd64               A hackable text editor for the 21st Century.

```

#### 6) Check package Installed Location

Use the below command to Check package Installed Location on Debian based systems such as Debian, Mint, Ubuntu & elementryOS, etc..,.

```
$ dpkg -L atom
/.
/usr
/usr/bin
/usr/bin/atom
/usr/share
/usr/share/lintian
/usr/share/lintian/overrides
/usr/share/lintian/overrides/atom
/usr/share/pixmaps
/usr/share/pixmaps/atom.png
/usr/share/doc

```

#### 7) View deb package content

Use the below command to View deb package content, It will show list of files on inside .deb package.

```
$ dpkg -c atom-amd64.deb
drwxr-xr-x root/root         0 2016-02-13 02:13 ./
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/bin/
-rwxr-xr-x root/root      3067 2016-02-13 02:13 ./usr/bin/atom
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/share/
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/share/lintian/
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/share/lintian/overrides/
-rw-r--r-- root/root       299 2016-02-13 02:13 ./usr/share/lintian/overrides/atom
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/share/pixmaps/
-rw-r--r-- root/root    643183 2016-02-13 02:13 ./usr/share/pixmaps/atom.png
drwxr-xr-x root/root         0 2016-02-13 02:13 ./usr/share/doc/
.
.
```

#### 8) Display details about package

Use the below command to Display detailed information about package, package group, version, maintainer, Architecture, display depends packages, description, etc.,.

```
$ dpkg -s atom
Package: atom
Status: install ok installed
Priority: optional
Section: devel
Installed-Size: 213496
Maintainer: GitHub <atom@github.com>Architecture: amd64
Version: 1.5.3
Depends: git, gconf2, gconf-service, libgtk2.0-0, libudev0 | libudev1, libgcrypt11 | libgcrypt20, libnotify4, libxtst6, libnss3, python, gvfs-bin, xdg-utils, libcap2
Recommends: lsb-release
Suggests: libgnome-keyring0, gir1.2-gnomekeyring-1.0
Description: A hackable text editor for the 21st Century.
 Atom is a free and open source text editor that is modern, approachable, and hackable to the core.</atom@github.com> 
```

#### 9) Find what package owns the file

Use the below command to find out what package does file belong.

```
$ dpkg -S /usr/bin/atom
atom: /usr/bin/atom

```

#### 10) Remove/Delete package

Use the below command to Remove/Delete an installed package except configuration files.

<iframe marginwidth="0" marginheight="0" scrolling="no" frameborder="0" height="90" width="728" id="_mN_gpt_827143833" style="border-width: 0px; border-style: initial; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;"></iframe>
```
$ sudo dpkg -r atom
(Reading database ... 426404 files and directories currently installed.)
Removing atom (1.5.3) ...
Processing triggers for gnome-menus (3.13.3-6ubuntu1) ...
Processing triggers for bamfdaemon (0.5.2~bzr0+15.10.20150627.1-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for desktop-file-utils (0.22-1ubuntu3) ...
Processing triggers for mime-support (3.58ubuntu1) ...

```

#### 11) Purge package

Use the below command to Remove/Delete everything including configuration files.

```
$ sudo dpkg -P atom
(Reading database ... 426404 files and directories currently installed.)
Removing atom (1.5.3) ...
Processing triggers for gnome-menus (3.13.3-6ubuntu1) ...
Processing triggers for bamfdaemon (0.5.2~bzr0+15.10.20150627.1-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for desktop-file-utils (0.22-1ubuntu3) ...
Processing triggers for mime-support (3.58ubuntu1) ...

```

#### 12) Read more about dpkg

Use the below commands to read more about dpkg command information.

```
$ dpkg -help
or
$ man dpkg

```

Enjoy….)

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/dpkg-command-examples/

作者：[MAGESH MARUTHAMUTHU ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/zypper-command-examples/
[2]:http://www.2daygeek.com/rpm-command-examples/
[3]:http://www.2daygeek.com/apt-get-apt-cache-command-examples/
[4]:http://www.2daygeek.com/dnf-command-examples/
[5]:http://www.2daygeek.com/yum-command-examples/
[6]:http://www.2daygeek.com/apt-get-apt-cache-command-examples/
[7]:https://wiki.debian.org/Teams/Dpkg
[8]:http://www.2daygeek.com/author/magesh/
