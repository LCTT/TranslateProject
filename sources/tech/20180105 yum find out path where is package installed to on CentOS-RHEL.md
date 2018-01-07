yum find out path where is package installed to on CentOS/RHEL
======

I have [install htop package on a CentOS/RHEL][1] . I wanted find out where and at what path htop package installed all files. Is there an easy way to tell yum where is package installed on a CentOS/RHEL? 

[yum command][2] is an interactive, open source, rpm based, package manager for a CentOS/RHEL and clones. It can automatically perform the following operations for you:

  1. Core system file updates
  2. Package updates
  3. Install a new packages
  4. Delete of old packages
  5. Perform queries on the installed and/or available packages

yum is similar to other high level package managers like [apt-get command][3]/[apt command][4].

### yum where is package installed

The syntax is as follows to install htop package for a demo purpose:
`# yum install htop`
To list the files installed by a yum package called htop, run the following rpm command:
```
# rpm -q {packageNameHere}
# rpm -ql htop
```
Sample outputs:
```
/usr/bin/htop
/usr/share/doc/htop-2.0.2
/usr/share/doc/htop-2.0.2/AUTHORS
/usr/share/doc/htop-2.0.2/COPYING
/usr/share/doc/htop-2.0.2/ChangeLog
/usr/share/doc/htop-2.0.2/README
/usr/share/man/man1/htop.1.gz
/usr/share/pixmaps/htop.png

```

### How to see the files installed by a yum package using repoquery command

First install yum-utils package using [yum command][2]:
```
# yum install yum-utils
```
Sample outputs:

```
Resolving Dependencies
--> Running transaction check
---> Package yum-utils.noarch 0:1.1.31-42.el7 will be installed
--> Processing Dependency: python-kitchen for package: yum-utils-1.1.31-42.el7.noarch
--> Processing Dependency: libxml2-python for package: yum-utils-1.1.31-42.el7.noarch
--> Running transaction check
---> Package libxml2-python.x86_64 0:2.9.1-6.el7_2.3 will be installed
---> Package python-kitchen.noarch 0:1.1.1-5.el7 will be installed
--> Finished Dependency Resolution
 
Dependencies Resolved
 
=======================================================================================
 Package           Arch      Version             Repository                       Size
=======================================================================================
Installing:
 yum-utils         noarch    1.1.31-42.el7       rhui-rhel-7-server-rhui-rpms    117 k
Installing for dependencies:
 libxml2-python    x86_64    2.9.1-6.el7_2.3     rhui-rhel-7-server-rhui-rpms    247 k
 python-kitchen    noarch    1.1.1-5.el7         rhui-rhel-7-server-rhui-rpms    266 k
 
Transaction Summary
=======================================================================================
Install  1 Package (+2 Dependent packages)
 
Total download size: 630 k
Installed size: 3.1 M
Is this ok [y/d/N]: y
Downloading packages:
(1/3): python-kitchen-1.1.1-5.el7.noarch.rpm                    | 266 kB  00:00:00     
(2/3): libxml2-python-2.9.1-6.el7_2.3.x86_64.rpm                | 247 kB  00:00:00     
(3/3): yum-utils-1.1.31-42.el7.noarch.rpm                       | 117 kB  00:00:00     
---------------------------------------------------------------------------------------
Total                                                     1.0 MB/s | 630 kB  00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : python-kitchen-1.1.1-5.el7.noarch                                   1/3 
  Installing : libxml2-python-2.9.1-6.el7_2.3.x86_64                               2/3 
  Installing : yum-utils-1.1.31-42.el7.noarch                                      3/3 
  Verifying  : libxml2-python-2.9.1-6.el7_2.3.x86_64                               1/3 
  Verifying  : yum-utils-1.1.31-42.el7.noarch                                      2/3 
  Verifying  : python-kitchen-1.1.1-5.el7.noarch                                   3/3 
 
Installed:
  yum-utils.noarch 0:1.1.31-42.el7                                                     
 
Dependency Installed:
  libxml2-python.x86_64 0:2.9.1-6.el7_2.3      python-kitchen.noarch 0:1.1.1-5.el7     
 
Complete!
```


### How do I list the contents of a installed package using YUM?

Now run repoquery command as follows:
`# repoquery --list htop`
OR
`# repoquery -l htop`
Sample outputs:
[![yum where is package installed][5]][5]
You can also use the type command or command command to just find location of given binary file such as httpd or htop:
`$ type -a httpd
$ type -a htop
$ command -V htop`

### about the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][6], [Facebook][7], [Google+][8].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/yum-determining-finding-path-that-yum-package-installed-to/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/centos-redhat-linux-install-htop-command-using-yum/
[2]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[3]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[4]:https://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/yum-where-is-package-installed.jpg
[6]:https://twitter.com/nixcraft
[7]:https://facebook.com/nixcraft
[8]:https://plus.google.com/+CybercitiBiz
