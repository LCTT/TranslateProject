apt-get 和 apt-cache 命令实例展示
================================================================================
apt-get和apt-cache是**Ubuntu Linux**中的命令行下的**包管理**工具。 apt-get的GUI版本是Synaptic包管理器。本篇中我们会展示apt-get和apt-cache命令的15个不同例子。

### 示例：1 列出所有可用包 ###

    linuxtechi@localhost:~$ apt-cache pkgnames
    account-plugin-yahoojp
    ceph-fuse
    dvd+rw-tools
    e3
    gnome-commander-data
    grub-gfxpayload-lists
    gweled
    .......................................

### 示例：2 用关键字搜索包 ###

这个命令在你不确定包名时很有用，只要在apt-cache（LCTT 译注：这里原文是apt-get，应为笔误）后面输入与包相关的关键字即可。

    linuxtechi@localhost:~$ apt-cache search "web server"
    apache2 - Apache HTTP Server
    apache2-bin - Apache HTTP Server (binary files and modules)
    apache2-data - Apache HTTP Server (common files)
    apache2-dbg - Apache debugging symbols
    apache2-dev - Apache HTTP Server (development headers)
    apache2-doc - Apache HTTP Server (on-site documentation)
    apache2-utils - Apache HTTP Server (utility programs for web servers)
    ......................................................................

**注意**： 如果你安装了“**apt-file**”包，我们就可以像下面那样用配置文件搜索包。

    linuxtechi@localhost:~$ apt-file search nagios.cfg
    ganglia-nagios-bridge: /usr/share/doc/ganglia-nagios-bridge/nagios.cfg
    nagios3-common: /etc/nagios3/nagios.cfg
    nagios3-common: /usr/share/doc/nagios3-common/examples/nagios.cfg.gz
    pnp4nagios-bin: /etc/pnp4nagios/nagios.cfg
    pnp4nagios-bin: /usr/share/doc/pnp4nagios/examples/nagios.cfg

### 示例：3 显示特定包的基本信息 ###

    linuxtechi@localhost:~$ apt-cache show postfix
    Package: postfix
    Priority: optional
    Section: mail
    Installed-Size: 3524
    Maintainer: LaMont Jones <lamont@debian.org>
    Architecture: amd64
    Version: 2.11.1-1
    Replaces: mail-transport-agent
    Provides: default-mta, mail-transport-agent
    .....................................................

### 示例：4 列出包的依赖 ###

    linuxtechi@localhost:~$ apt-cache depends postfix
    postfix
     Depends: libc6
     Depends: libdb5.3
     Depends: libsasl2-2
     Depends: libsqlite3-0
     Depends: libssl1.0.0
     |Depends: debconf
     Depends: <debconf-2.0>
     cdebconf
     debconf
     Depends: netbase
     Depends: adduser
     Depends: dpkg
    ............................................

### 示例：5 使用apt-cache显示缓存统计 ###

    linuxtechi@localhost:~$ apt-cache stats 
    Total package names: 60877 (1,218 k)
    Total package structures: 102824 (5,758 k)
     Normal packages: 71285
     Pure virtual packages: 1102
     Single virtual packages: 9151
     Mixed virtual packages: 1827
     Missing: 19459
    Total distinct versions: 74913 (5,394 k)
    Total distinct descriptions: 93792 (2,251 k)
    Total dependencies: 573443 (16.1 M)
    Total ver/file relations: 78007 (1,872 k)
    Total Desc/File relations: 93792 (2,251 k)
    Total Provides mappings: 16583 (332 k)
    Total globbed strings: 171 (2,263 )
    Total dependency version space: 2,665 k
    Total slack space: 37.3 k
    Total space accounted for: 29.5 M

### 示例：6 使用 “apt-get update” 更新仓库 ###

使用命令“apt-get update”, 我们可以重新从源仓库中同步文件索引。包的索引从“/etc/apt/sources.list”中检索。

    linuxtechi@localhost:~$ sudo apt-get update
     Ign http://extras.ubuntu.com utopic InRelease
     Hit http://extras.ubuntu.com utopic Release.gpg
     Hit http://extras.ubuntu.com utopic Release
     Hit http://extras.ubuntu.com utopic/main Sources
     Hit http://extras.ubuntu.com utopic/main amd64 Packages
     Hit http://extras.ubuntu.com utopic/main i386 Packages
     Ign http://in.archive.ubuntu.com utopic InRelease
     Ign http://in.archive.ubuntu.com utopic-updates InRelease
     Ign http://in.archive.ubuntu.com utopic-backports InRelease
     ................................................................

### 示例：7 使用apt-get安装包 ###

    linuxtechi@localhost:~$ sudo apt-get install icinga

上面的命令会安装叫“icinga”的包。

### 示例：8 升级所有已安装的包 ###

    linuxtechi@localhost:~$ sudo apt-get upgrade

### 示例：9 更新特定的包 ###

在apt-get命令中的“install”选项后面接上“-only-upgrade”用来更新一个特定的包，如下所示：

    linuxtechi@localhost:~$ sudo apt-get install filezilla --only-upgrade

### 示例：10 使用apt-get卸载包 ###

    linuxtechi@localhost:~$ sudo apt-get remove skype

上面的命令只会删除skype包，如果你想要删除它的配置文件，在apt-get命令中使用“purge”选项。如下所示：

    linuxtechi@localhost:~$ sudo apt-get purge skype

我们可以结合使用上面的两个命令：

    linuxtechi@localhost:~$ sudo apt-get remove --purge skype

### 示例：11 在当前的目录中下载包 ###

    linuxtechi@localhost:~$ sudo apt-get download icinga
    Get:1 http://in.archive.ubuntu.com/ubuntu/ utopic/universe icinga amd64 1.11.6-1build1 [1,474 B]
    Fetched 1,474 B in 1s (1,363 B/s)

上面的目录会把icinga包下载到你的当前工作目录。

### 示例：12 清理本地包占用的磁盘空间 ###

    linuxtechi@localhost:~$ sudo apt-get clean

上面的命令会清空apt-get所下载的包占用的磁盘空间。

我们也可以使用“**autoclean**”选项来代替“**clean**”，两者之间主要的区别是autoclean清理不再使用且没用的下载。

    linuxtechi@localhost:~$ sudo apt-get autoclean
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done

### 示例：13 使用“autoremove”删除包 ###

当在apt-get命令中使用“autoremove”时，它会删除为了满足依赖而安装且现在没用的包。

    linuxtechi@localhost:~$ sudo apt-get autoremove icinga

### 示例：14 显示包的更新日志 ###

    linuxtechi@localhost:~$ sudo apt-get changelog apache2
    Get:1 Changelog for apache2 (http://changelogs.ubuntu.com/changelogs/pool/main/a/apache2/apache2_2.4.10-1ubuntu1/changelog) [195 kB]
    Fetched 195 kB in 3s (60.9 kB/s)

上面的命令会下载apache2的更新日志，并在你屏幕上分页显示。

### 示例：15 使用 “check” 选项显示损坏的依赖关系 ###

    linuxtechi@localhost:~$ sudo apt-get check
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/ubuntu-apt-get-apt-cache-commands-examples/

作者：[Pradeep Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
