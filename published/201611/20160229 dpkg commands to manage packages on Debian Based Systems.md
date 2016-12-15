用 dpkg 命令在 Debian 系的 Linux 系统中管理软件包
==================

[dpkg][7] 意即 Debian 包管理器（Debian PacKaGe manager）。dpkg 是一个可以安装、构建、删除及管理 Debian 软件包的命令行工具。dpkg 将 Aptitude（首选而更用户友好）作为执行所有操作的前端界面。

其它的一些工具如 dpkg-deb 和 dpkg-query 等也使用 dpkg 作为执行某些操作的前端。

现在大多数系统管理员使用 Apt、[Apt-Get][6] 及 Aptitude 等工具，不用费心就可以轻松地管理软件。

尽管如此，必要的时候还是需要用 dpkg 来安装某些软件。其它的一些在 Linux 系统上广泛使用的包管理工具还有 [yum][5]、[dnf][4]、[apt-get][3]、dpkg、[rpm][2]、[Zypper][1]、pacman、urpmi 等等。

现在，我要在装有 Ubuntu 15.10 的机器上用一些实例讲解最常用的 dpkg 命令。

### 1) dpkg 常见命令的语法及 dpkg 文件位置

下面是 dpkg 常见命令的语法及 dpkg 相关文件的位置，如果想深入了解，这些对你肯定大有益处。

```
### dpkg 命令的语法
$ dpkg -[command] [.deb package name]

$ dpkg -[command] [package name]

### dpkg 相关文件的位置
$ /var/lib/dpkg

### 这个文件包含了被 dpkg 命令（install、remove 等）所修改的包的信息
$ /var/lib/dpkg/status

### 这个文件包含了可用包的列表
$ /var/lib/dpkg/status

```

### 2) 安装/升级软件

在基于 Debian 的系统里，比如 Debian、Mint、Ubuntu 和 elementryOS，用以下命令来安装/升级 .deb 软件包。这里我要用 `atom-amd64.deb` 文件安装 Atom。要是已经安装了 Atom，就会升级它。要么就会安装一个新的 Atom。

```
### 安装或升级 dpkg 软件包
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

### 3) 从文件夹里安装软件

在基于 Debian 的系统里，用下列命令从目录中逐个安装软件。这会安装 `/opt/software` 目录下的所有以 .deb 为后缀的软件。

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

### 4) 显示已安装软件列表

以下命令可以列出 Debian 系的系统中所有已安装的软件，同时会显示软件版本和描述信息。

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

### 5) 查看指定的已安装软件

用以下命令列出指定的一个已安装软件，同时会显示软件版本和描述信息。

```
$ dpkg -l atom
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name       Version   Architecture        Description
+++-==========-=========-===================-============================================
ii  atom       1.5.3     amd64               A hackable text editor for the 21st Century.

```

### 6) 查看软件安装目录

以下命令可以在基于 Debian 的系统上查看软件的安装路径。

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

### 7) 查看 deb 包内容

下列命令可以查看 deb 包内容。它会显示 .deb 包中的一系列文件。

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

### 8) 显示软件的详细信息

以下命令可以显示软件的详细信息，如软件名、软件类别、版本、维护者、软件架构、依赖的软件、软件描述等等。

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

### 9) 查看文件属于哪个软件

用以下命令来查看文件属于哪个软件。

```
$ dpkg -S /usr/bin/atom
atom: /usr/bin/atom

```

### 10) 移除/删除软件

以下命令可以用来移除/删除一个已经安装的软件，但不删除配置文件。


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

### 11) 清除软件

以下命令可以用来移除/删除包括配置文件在内的所有文件。

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

### 12) 了解更多

用以下命令来查看更多关于 dpkg 的信息。

```
$ dpkg -help
或
$ man dpkg

```

开始体验 dpkg 吧。

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/dpkg-command-examples/

作者：[MAGESH MARUTHAMUTHU][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[wxy](https://github.com/wxy)

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
