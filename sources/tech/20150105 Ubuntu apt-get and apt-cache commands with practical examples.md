Translating------geekpi

Ubuntu apt-get & apt-cache commands with practical examples
================================================================================
Apt-get & apt-cache are the command line **package management** utility in **Ubuntu Linux**. GUI version of apt-get command is the Synaptic Package Manager, in this post we are going to discuss 15 different examples of apt-get & apt-cache commands.

### Example:1 List of all the available packages ###

    linuxtechi@localhost:~$ apt-cache pkgnames
    account-plugin-yahoojp
    ceph-fuse
    dvd+rw-tools
    e3
    gnome-commander-data
    grub-gfxpayload-lists
    gweled
    .......................................

### Example:2 Search Packages using keywords ###

This command is very helpful when you are not sure about package name , just enter the keyword and apt-get command will list packages related to the keyword.

    linuxtechi@localhost:~$ apt-cache search "web server"
    apache2 - Apache HTTP Server
    apache2-bin - Apache HTTP Server (binary files and modules)
    apache2-data - Apache HTTP Server (common files)
    apache2-dbg - Apache debugging symbols
    apache2-dev - Apache HTTP Server (development headers)
    apache2-doc - Apache HTTP Server (on-site documentation)
    apache2-utils - Apache HTTP Server (utility programs for web servers)
    ......................................................................

**Note**: If you have installed “**apt-file**” package then we can also search the package using config files as shown below :

    linuxtechi@localhost:~$ apt-file search nagios.cfg
    ganglia-nagios-bridge: /usr/share/doc/ganglia-nagios-bridge/nagios.cfg
    nagios3-common: /etc/nagios3/nagios.cfg
    nagios3-common: /usr/share/doc/nagios3-common/examples/nagios.cfg.gz
    pnp4nagios-bin: /etc/pnp4nagios/nagios.cfg
    pnp4nagios-bin: /usr/share/doc/pnp4nagios/examples/nagios.cfg

### Example:3 Display the basic information of Specific package. ###

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

### Example:4 List the dependency of Package. ###

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

### Example:5 Display the Cache Statistics using apt-cache. ###

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

### Example:6 Update the package repository using “apt-get update” ###

Using the command “apt-get update” , we can resynchronize the package index files from their sources repository. Package index are retrieved from the file located at “/etc/apt/sources.list”

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

### Example:7 Install a package using apt-get command. ###

    linuxtechi@localhost:~$ sudo apt-get install icinga

In the above example we are installing a package named “icinga”

### Example:8 Upgrade all the Installed Packages ###

    linuxtechi@localhost:~$ sudo apt-get upgrade

### Example:9 Upgrade a Particular Package. ###

“install” option along with “–only-upgrade” in apt-get command is used to upgrade a particular package , example is shown below :

    linuxtechi@localhost:~$ sudo apt-get install filezilla --only-upgrade

### Example:10 Removing a package using apt-get command. ###

    linuxtechi@localhost:~$ sudo apt-get remove skype

Above command will remove or delete the skype package only , if you want to delete its config files then use the “purge” option in the apt-get command. Example is shown below :

    linuxtechi@localhost:~$ sudo apt-get purge skype

We can also use the combination of above commands :

    linuxtechi@localhost:~$ sudo apt-get remove --purge skype

### Example:11 Download the package in the Current Working Directory ###

    linuxtechi@localhost:~$ sudo apt-get download icinga
    Get:1 http://in.archive.ubuntu.com/ubuntu/ utopic/universe icinga amd64 1.11.6-1build1 [1,474 B]
    Fetched 1,474 B in 1s (1,363 B/s)

Above command will download icinga package in your current working directory.

### Example:12 Clear disk Space used by retrieved package files. ###

    linuxtechi@localhost:~$ sudo apt-get clean

Above Command will clear the disk space used by apt-get command while retrieving(download) packages.

We can also use “**autoclean**” option in place of “**clean**“, the main difference between them is that autoclean removes package files that can no longer be downloaded, and are largely useless.

    linuxtechi@localhost:~$ sudo apt-get autoclean
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done

### Example:13 Remove Packages using “autoremove” option. ###

When we use “autoremove” option with apt-get command , then it will remove the packages that were installed to satisfy the dependency of other packages and are now no longer needed or used.

    linuxtechi@localhost:~$ sudo apt-get autoremove icinga

### Example:14 Display Changelog of a Package. ###

    linuxtechi@localhost:~$ sudo apt-get changelog apache2
    Get:1 Changelog for apache2 (http://changelogs.ubuntu.com/changelogs/pool/main/a/apache2/apache2_2.4.10-1ubuntu1/changelog) [195 kB]
    Fetched 195 kB in 3s (60.9 kB/s)

Above Command will download the changelog of apache2 package and will display through sensible-pager on your screen.

### Example:15 List broken dependencies using “check” option ###

    linuxtechi@localhost:~$ sudo apt-get check
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/ubuntu-apt-get-apt-cache-commands-examples/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
