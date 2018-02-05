How to record statistics about a Linux machine’s uptime
======
Linux/Unix sysadmins have a weird obsession with server uptime. There is a xkcd comic devoted to this subject where a good sysadmin is an unstoppable force that it stands between the forces of darkness and your cat blog's servers.
[![Fig.01: Devotion to Duty https://xkcd.com/705/][1]][1]
One can tell how long the Linux system has been running using the uptime command or [w command][2] or top command. I can get [a report of the historical and statistical running time of the system][3], keeping it between restarts using tuptime tool.

Like uptime command but with the more impressive output. Recently I discovered another tool called uptimed that records statistics about a machine's uptime. Let us see how to get uptime record statistics using uptimed and uprecords on Linux operating system.

Finding uptime is pretty easy, just type the following on your Linux based system:
```
$ **uptime -p**
up 2 weeks, 4 days, 7 hours, 28 minutes
```
To keep historical stats about uptime use either [tuptime][3] or uptimed tool.

## uptimed installation

The simplest way to install uptimed locally is through your package managers such as apt/apt-get/yum and friends as per your Linux distro.

### Install uptimed on a Debian/Ubuntu Linux

Type the following [apt command][4]/[apt-get command][5]:
`$ sudo apt-get install uptimed`
Sample outputs:
```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libuptimed0
The following NEW packages will be installed:
  libuptimed0 uptimed
0 upgraded, 2 newly installed, 0 to remove and 3 not upgraded.
Need to get 40.7 kB of archives.
After this operation, 228 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://mirrors.linode.com/ubuntu xenial/universe amd64 libuptimed0 amd64 1:0.3.17-4 [9,050 B]
Get:2 http://mirrors.linode.com/ubuntu xenial/universe amd64 uptimed amd64 1:0.3.17-4 [31.6 kB]
Fetched 40.7 kB in 0s (2,738 kB/s)  
Preconfiguring packages ...
Selecting previously unselected package libuptimed0.
(Reading database ... 39163 files and directories currently installed.)
Preparing to unpack .../libuptimed0_1%3a0.3.17-4_amd64.deb ...
Unpacking libuptimed0 (1:0.3.17-4) ...
Selecting previously unselected package uptimed.
Preparing to unpack .../uptimed_1%3a0.3.17-4_amd64.deb ...
Unpacking uptimed (1:0.3.17-4) ...
Processing triggers for systemd (229-4ubuntu21) ...
Processing triggers for ureadahead (0.100.0-19) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libuptimed0 (1:0.3.17-4) ...
Setting up uptimed (1:0.3.17-4) ...
Processing triggers for libc-bin (2.23-0ubuntu9) ...
Processing triggers for systemd (229-4ubuntu21) ...
Processing triggers for ureadahead (0.100.0-19) ...
```

### Install uptimed on a CentOS/RHEL/Fedora/Oracle/Scientific Linux

First [enable EPEL repo on a CentOS/RHEL][6]:
`$ sudo yum -y install epel-release`
Next, type the following [yum command][7]:
`$ sudo yum install uptimed`
Sample outputs:
```
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: centos.excellmedia.net
 * epel: ftp.cuhk.edu.hk
 * extras: centos.excellmedia.net
 * updates: centos.excellmedia.net
Resolving Dependencies
--> Running transaction check
---> Package uptimed.x86_64 0:0.4.0-6.el7 will be installed
--> Finished Dependency Resolution
 
Dependencies Resolved
 
===============================================================================
 Package           Arch             Version               Repository      Size
===============================================================================
Installing:
 uptimed           x86_64           0.4.0-6.el7           epel            47 k
 
Transaction Summary
===============================================================================
Install  1 Package
 
Total download size: 47 k
Installed size: 98 k
Is this ok [y/d/N]: y
Downloading packages:
uptimed-0.4.0-6.el7.x86_64.rpm                            |  47 kB   00:01     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : uptimed-0.4.0-6.el7.x86_64                                  1/1 
  Verifying  : uptimed-0.4.0-6.el7.x86_64                                  1/1 
 
Installed:
  uptimed.x86_64 0:0.4.0-6.el7                                                 
 
Complete!
```

If you are using **a Fedora Linux** , run the following dnf command:
`$ sudo dnf install uptimed`

### Install uptimed on an Arch Linux

Type the following pacman command:
`$ sudo pacman -S uptimed`

### Install uptimed on a Gentoo Linux

Type the following emerge command:
`$ sudo emerge --ask uptimed`

## How to configure uptimed

Edit the file /etc/uptimed.conf using a text editor such as vim command:
`$ sudo vim /etc/uptimed.conf`
At least set an email address to mail milestones/records to. Assumes sendmail compatible MTA installed as /usr/lib/sendmail.
```
EMAIL=vivek@server1.cyberciti.biz
```
Save and close the file.

### How do I enable uptimed service at boot time?

Enable uptimed service using the systemctl command:
`$ sudo systemctl enable uptimed`

### How do I start/stop/restart or view status of uptimed service?

```
$ sudo systemctl start uptimed ## start it ##
$ sudo systemctl stop uptimed ## stop it ##
$ sudo systemctl restart uptimed ## restart it ##
$ sudo systemctl status uptimed ## view status ##
```
Sample outputs:
```
● uptimed.service - uptime record daemon
   Loaded: loaded (/lib/systemd/system/uptimed.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2017-11-09 17:49:14 UTC; 18min ago
 Main PID: 11137 (uptimed)
   CGroup: /system.slice/uptimed.service
           └─11137 /usr/sbin/uptimed -f
 
Nov 09 17:49:14 gfs04 systemd[1]: Started uptime record daemon.
```

## How to see uptime record

Simply type the following command to see statistics from the uptimed(8) program:
```
$ uprecords
```
Sample outputs:
[![Fig.02: uprecords in action][9]][9]
uprecords has a few more option:
```
$ uprecords -?
```
Sample outputs:
```
usage: uprecords [OPTION]...
 
  -?             this help
  -a             do not print ansi codes
  -b             sort by boottime
  -B             reverse sort by boottime
  -k             sort by sysinfo
  -K             reverse sort by sysinfo
  -d             print downtime seen before every uptimes instead of system
  -c             do not show current entry if not in top entries
  -f             run continously in a loop
  -s             do not print extra statistics
  -w             wide output (more than 80 cols per line)
  -i INTERVAL    use INTERVAL seconds for loop instead of 5, implies -f
  -m COUNT       show a maximum of top COUNT entries instead of 10
  -M             show next milestone
  -v             version information
```

## Conclusion

This is an excellent little tool to show your server uptime records to prove your uptime and business continuity. On a related note, you should get the official [XKCD sysadmin t-shirt][10] as comic was made into a shirt, which includes a new illustration on the back.
[![Fig.03: Sysadmin XKCD shirt features the original comic on the front and a new illustration on the back.][11]][11]


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/hardware/see-records-statistics-about-a-linux-servers-uptime/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/cms/2017/11/devotion_to_duty.png
[2]:https://www.cyberciti.biz//www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/ (See Linux/Unix w command examples for more info)
[3]:https://www.cyberciti.biz/hardware/howto-see-historical-statistical-uptime-on-linux-server/
[4]:https://www.cyberciti.biz//www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[5]:https://www.cyberciti.biz//www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[6]:https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/
[7]:https://www.cyberciti.biz//www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[8]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[9]:https://www.cyberciti.biz/media/new/cms/2017/11/uprecord-screenshot.jpg
[10]:https://store.xkcd.com/collections/apparel/products/sysadmin
[11]:https://www.cyberciti.biz/media/new/cms/2017/11/sysadmin_shirt_5_1024x1024.jpg
