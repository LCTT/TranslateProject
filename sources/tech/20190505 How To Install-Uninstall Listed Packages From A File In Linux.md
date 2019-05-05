[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Install/Uninstall Listed Packages From A File In Linux?)
[#]: via: (https://www.2daygeek.com/how-to-install-uninstall-listed-packages-from-a-file-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Install/Uninstall Listed Packages From A File In Linux?
======

In some case you may want to install list of packages from one server to another server.

For example, You have installed 15 packages on ServerA, and those packages needs to be installed on ServerB, ServerC, etc.,

We can manually install all the packages but it’s time consuming process.

It can be done for one or two servers, think about if you have around 10 servers.

In this case it doesn’t help you then What will be the solution?

Don’t worry we are here to help you out in this situation or scenario.

We have added four methods in this article to overcome this situation.

I hope this will help you to fix your issue. I have tested these commands on CentOS7 and Ubuntu 18.04 systems.

I hope this will work with other distributions too. Just replace with distribution official package manager command instead of us.

Navigate to the following article if you want to **[check list of installed packages in Linux system][1]**.

For example, if you would like to create a package lists from RHEL based system then use the following steps. Do the same for other distributions as well.

```
# rpm -qa --last | head -15 | awk '{print $1}' > /tmp/pack1.txt

# cat /tmp/pack1.txt
mariadb-server-5.5.60-1.el7_5.x86_64
perl-DBI-1.627-4.el7.x86_64
perl-DBD-MySQL-4.023-6.el7.x86_64
perl-PlRPC-0.2020-14.el7.noarch
perl-Net-Daemon-0.48-5.el7.noarch
perl-IO-Compress-2.061-2.el7.noarch
perl-Compress-Raw-Zlib-2.061-4.el7.x86_64
mariadb-5.5.60-1.el7_5.x86_64
perl-Data-Dumper-2.145-3.el7.x86_64
perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64
httpd-2.4.6-88.el7.centos.x86_64
mailcap-2.1.41-2.el7.noarch
httpd-tools-2.4.6-88.el7.centos.x86_64
apr-util-1.5.2-6.el7.x86_64
apr-1.4.8-3.el7_4.1.x86_64
```

### Method-1 : How To Install Listed Packages From A File In Linux With Help Of cat Command?

To achieve this, i would like to go with this first method. As this very simple and straightforward.

To do so, just create a file and add the list of packages that you want to install it.

For testing purpose, we are going to add only the below three packages into the following file.

```
# cat /tmp/pack1.txt

apache2
mariadb-server
nano
```

Simply run the following **[apt command][2]** to install all the packages in a single shot from a file in Ubuntu/Debian systems.

```
# apt -y install $(cat /tmp/pack1.txt)

Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libopts25 sntp
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom spell
The following NEW packages will be installed:
  apache2 mariadb-server nano
0 upgraded, 3 newly installed, 0 to remove and 24 not upgraded.
Need to get 339 kB of archives.
After this operation, 1,377 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2 amd64 2.4.29-1ubuntu4.6 [95.1 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 nano amd64 2.9.3-2 [231 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 mariadb-server all 1:10.1.38-0ubuntu0.18.04.1 [12.9 kB]
Fetched 339 kB in 19s (18.0 kB/s)
Selecting previously unselected package apache2.
(Reading database ... 290926 files and directories currently installed.)
Preparing to unpack .../apache2_2.4.29-1ubuntu4.6_amd64.deb ...
Unpacking apache2 (2.4.29-1ubuntu4.6) ...
Selecting previously unselected package nano.
Preparing to unpack .../nano_2.9.3-2_amd64.deb ...
Unpacking nano (2.9.3-2) ...
Selecting previously unselected package mariadb-server.
Preparing to unpack .../mariadb-server_1%3a10.1.38-0ubuntu0.18.04.1_all.deb ...
Unpacking mariadb-server (1:10.1.38-0ubuntu0.18.04.1) ...
Processing triggers for ufw (0.36-0ubuntu0.18.04.1) ...
Setting up apache2 (2.4.29-1ubuntu4.6) ...
Processing triggers for ureadahead (0.100.0-20) ...
Processing triggers for install-info (6.5.0.dfsg.1-2) ...
Setting up nano (2.9.3-2) ...
update-alternatives: using /bin/nano to provide /usr/bin/editor (editor) in auto mode
update-alternatives: using /bin/nano to provide /usr/bin/pico (pico) in auto mode
Processing triggers for systemd (237-3ubuntu10.20) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Setting up mariadb-server (1:10.1.38-0ubuntu0.18.04.1) ...
```

For removal, use the same format with appropriate option.

```
# apt -y remove $(cat /tmp/pack1.txt)
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  apache2-bin apache2-data apache2-utils galera-3 libaio1 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libconfig-inifiles-perl libdbd-mysql-perl libdbi-perl libjemalloc1 liblua5.2-0
  libmysqlclient20 libopts25 libterm-readkey-perl mariadb-client-10.1 mariadb-client-core-10.1 mariadb-common mariadb-server-10.1 mariadb-server-core-10.1 mysql-common sntp socat
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  apache2 mariadb-server nano
0 upgraded, 0 newly installed, 3 to remove and 24 not upgraded.
After this operation, 1,377 kB disk space will be freed.
(Reading database ... 291046 files and directories currently installed.)
Removing apache2 (2.4.29-1ubuntu4.6) ...
Removing mariadb-server (1:10.1.38-0ubuntu0.18.04.1) ...
Removing nano (2.9.3-2) ...
update-alternatives: using /usr/bin/vim.tiny to provide /usr/bin/editor (editor) in auto mode
Processing triggers for ufw (0.36-0ubuntu0.18.04.1) ...
Processing triggers for install-info (6.5.0.dfsg.1-2) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
```

Use the following **[yum command][3]** to install listed packages from a file on RHEL based systems such as CentOS, RHEL (Redhat) and OEL (Oracle Enterprise Linux).

```
# yum -y install $(cat /tmp/pack1.txt)
```

Use the following format to uninstall listed packages from a file on RHEL based systems such as CentOS, RHEL (Redhat) and OEL (Oracle Enterprise Linux).

```
# yum -y remove $(cat /tmp/pack1.txt)
```

Use the following **[dnf command][4]** to install listed packages from a file on Fedora system.

```
# dnf -y install $(cat /tmp/pack1.txt)
```

Use the following format to uninstall listed packages from a file on Fedora system.

```
# dnf -y remove $(cat /tmp/pack1.txt)
```

Use the following **[zypper command][5]** to install listed packages from a file on openSUSE system.

```
# zypper -y install $(cat /tmp/pack1.txt)
```

Use the following format to uninstall listed packages from a file on openSUSE system.

```
# zypper -y remove $(cat /tmp/pack1.txt)
```

Use the following **[pacman command][6]** to install listed packages from a file on Arch Linux based systems such as Manjaro and Antergos system.

```
# pacman -S $(cat /tmp/pack1.txt)
```

Use the following format to uninstall listed packages from a file on Arch Linux based systems such as Manjaro and Antergos system.

```
# pacman -Rs $(cat /tmp/pack1.txt)
```

### Method-2 : How To Install Listed Packages From A File In Linux With Help Of cat And xargs Command?

Even, i prefer to go with this method because this is very simple and straightforward method.

Use the following apt command to install listed packages from a file on Debian based systems such as Debian, Ubuntu and Linux Mint.

```
# cat /tmp/pack1.txt | xargs apt -y install
```

Use the following apt command to uninstall listed packages from a file on Debian based systems such as Debian, Ubuntu and Linux Mint.

```
# cat /tmp/pack1.txt | xargs apt -y remove
```

Use the following yum command to install listed packages from a file on RHEL based systems such as CentOS, RHEL (Redhat) and OEL (Oracle Enterprise Linux).

```
# cat /tmp/pack1.txt | xargs yum -y install
```

Use the following format to uninstall listed packages from a file on RHEL based systems such as CentOS, RHEL (Redhat) and OEL (Oracle Enterprise Linux).

```
# cat /tmp/pack1.txt | xargs yum -y remove
```

Use the following dnf command to install listed packages from a file on Fedora system.

```
# cat /tmp/pack1.txt | xargs dnf -y install
```

Use the following format to uninstall listed packages from a file on Fedora system.

```
# cat /tmp/pack1.txt | xargs dnf -y remove
```

Use the following zypper command to install listed packages from a file on openSUSE system.

```
# cat /tmp/pack1.txt | xargs zypper -y install
```

Use the following format to uninstall listed packages from a file on openSUSE system.

```
# cat /tmp/pack1.txt | xargs zypper -y remove
```

Use the following pacman command to install listed packages from a file on Arch Linux based systems such as Manjaro and Antergos system.

```
# cat /tmp/pack1.txt | xargs pacman -S
```

Use the following format to uninstall listed packages from a file on Arch Linux based systems such as Manjaro and Antergos system.

```
# cat /tmp/pack1.txt | xargs pacman -Rs
```

### Method-3 : How To Install Listed Packages From A File In Linux With Help Of For Loop Command?

Alternatively we can use the “For Loop” command to achieve this.

To install bulk packages. Use the below format to run a “For Loop” with single line.

```
# for pack in `cat /tmp/pack1.txt` ; do apt -y install $i; done
```

To install bulk packages with shell script use the following “For Loop”.

```
# vi /opt/scripts/bulk-package-install.sh

#!/bin/bash
for pack in `cat /tmp/pack1.txt`
do apt -y remove $pack
done
```

Set an executable permission to `bulk-package-install.sh` file.

```
# chmod + bulk-package-install.sh
```

Finally run the script to achieve this.

```
# sh bulk-package-install.sh
```

### Method-4 : How To Install Listed Packages From A File In Linux With Help Of While Loop Command?

Alternatively we can use the “While Loop” command to achieve this.

To install bulk packages. Use the below format to run a “While Loop” with single line.

```
# file="/tmp/pack1.txt"; while read -r pack; do apt -y install $pack; done < "$file"
```

To install bulk packages with shell script use the following "While Loop".

```
# vi /opt/scripts/bulk-package-install.sh

#!/bin/bash
file="/tmp/pack1.txt"
while read -r pack
do apt -y remove $pack
done < "$file"
```

Set an executable permission to `bulk-package-install.sh` file.

```
# chmod + bulk-package-install.sh
```

Finally run the script to achieve this.

```
# sh bulk-package-install.sh
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-uninstall-listed-packages-from-a-file-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/check-installed-packages-in-rhel-centos-fedora-debian-ubuntu-opensuse-arch-linux/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
