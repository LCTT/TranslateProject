How to find hidden processes and ports on Linux/Unix/Windows
======
Unhide is a little handy forensic tool to find hidden processes and TCP/UDP ports by rootkits / LKMs or by another hidden technique. This tool works under Linux, Unix-like system, and MS-Windows operating systems. From the man page:

> It detects hidden processes using three techniques:
>
>   1. The proc technique consists of comparing /proc with the output of [/bin/ps][1].
>   2. The sys technique consists of comparing information gathered from [/bin/ps][1] with information gathered from system calls.
>   3. The brute technique consists of bruteforcing the all process IDs. This technique is only available on Linux 2.6 kernels.
>



Most rootkits/malware use the power of the kernel to hide, they are only visible from within the kernel. You can use unhide or tool such as [rkhunter to scan for rootkits, backdoors, and possible][2] local exploits.
[![How to find hidden process and ports on Linux, Unix, FreeBSD and Windows][3]][3]
This page describes how to install unhide and search for hidden process and TCP/UDP ports.

### How do I Install Unhide?

It is recommended that you run this tool from read-only media. To install the same under a Debian or Ubuntu Linux, type the following [apt-get command][4]/[apt command][5]:
`$ sudo apt-get install unhide`
Sample outputs:
```
[sudo] password for vivek: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  rkhunter
The following NEW packages will be installed:
  unhide
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 46.6 kB of archives.
After this operation, 136 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 unhide amd64 20130526-1 [46.6 kB]
Fetched 46.6 kB in 0s (49.0 kB/s)
Selecting previously unselected package unhide.
(Reading database ... 205367 files and directories currently installed.)
Preparing to unpack .../unhide_20130526-1_amd64.deb ...
Unpacking unhide (20130526-1) ...
Setting up unhide (20130526-1) ...
Processing triggers for man-db (2.7.6.1-2) ...
```

### How to install unhide on a RHEL/CentOS/Oracle/Scientific/Fedora Linux

Type the following [yum command][6] (first turn on [EPLE repo on a CentOS/RHEL version 6.x][7] or [version 7.x][8]):
`$ sudo yum install unhide`
If you are using a Fedora Linux, type the following dnf command:
`$ sudo dnf install unhide`

### How to install unhide on an Arch Linux

Type the following pacman command:
`$ sudo pacman -S unhide`

### FreeBSD : Install unhide

Type the following command to install unhide using the port, enter:
```
# cd /usr/ports/security/unhide/
# make install clean
```
OR, you can install the same using the binary package with help of pkg command:
`# pkg install unhide`
**unhide-tcp** is a forensic tool that identifies TCP/UDP ports that are listening but are not listed in [/bin/netstat][9] or [/bin/ss command][10] through brute forcing of all TCP/UDP ports available.

### How do I use unhide tool?

The syntax is:
` unhide [options] test_list`
Test_list is one or more of the following standard tests:

  1. brute
  2. proc
  3. procall
  4. procfs
  5. quick
  6. reverse
  7. sys



Elementary tests:

  1. checkbrute
  2. checkchdir
  3. checkgetaffinity
  4. checkgetparam
  5. checkgetpgid
  6. checkgetprio
  7. checkRRgetinterval
  8. checkgetsched
  9. checkgetsid
  10. checkkill
  11. checknoprocps
  12. checkopendir
  13. checkproc
  14. checkquick
  15. checkreaddir
  16. checkreverse
  17. checksysinfo
  18. checksysinfo2
  19. checksysinfo3



You can use it as follows:
```
# unhide proc
# unhide sys
# unhide quick
```
Sample outputs:
```
Unhide 20130526
Copyright © 2013 Yago Jesus & Patrick Gouin
License GPLv3+ : GNU GPL version 3 or later
http://www.unhide-forensics.info
 
NOTE : This version of unhide is for systems using Linux >= 2.6 
 
Used options: 
[*]Searching for Hidden processes through  comparison of results of system calls, proc, dir and ps
```

### How to use unhide-tcp forensic tool that identifies TCP/UDP ports

From the man page:

> unhide-tcp is a forensic tool that identifies TCP/UDP ports that are listening but are not listed by /sbin/ss (or alternatively by /bin/netstat) through brute forcing of all TCP/UDP ports available.
>  Note1 : On FreeBSD ans OpenBSD, netstat is allways used as iproute2 doesn't exist on these OS. In addition, on FreeBSD, sockstat is used instead of fuser.
>  Note2 : If iproute2 is not available on the system, option -n or -s SHOULD be given on the command line.

```
# unhide-tcp
```
Sample outputs:
```
Unhide 20100201
http://www.security-projects.com/?Unhide

Starting TCP checking

Starting UDP checking
```

(Fig.02: No hidden ports found using the unhide-tcp command)
However, I found something interesting:
`# unhide-tcp `
Sample outputs:
```
Unhide 20100201
http://www.security-projects.com/?Unhide


Starting TCP checking

Found Hidden port that not appears in netstat: 1048
Found Hidden port that not appears in netstat: 1049
Found Hidden port that not appears in netstat: 1050
Starting UDP checking

```

The [netstat -tulpn][11] or [ss commands][12] displayed nothing about the hidden TCP ports # 1048, 1049, and 1050:
```
# netstat -tulpn | grep 1048
# ss -lp
# ss -l | grep 1048
```
For more info read man pages by typing the following command:
```
$ man unhide
$ man unhide-tcp
```

### A note about Windows users

You can grab the WinUnhide/WinUnhide-TCP by [visiting this page][13].


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/linux-unix-windows-find-hidden-processes-tcp-udp-ports.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/show-all-running-processes-in-linux/ (Linux / Unix ps command)
[2]:https://www.cyberciti.biz/faq/howto-check-linux-rootkist-with-detectors-software/
[3]:https://www.cyberciti.biz/tips/wp-content/uploads/2011/11/Linux-FreeBSD-Unix-Windows-Find-Hidden-Process-Ports.jpg
[4]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[5]://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[7]:https://www.cyberciti.biz/faq/fedora-sl-centos-redhat6-enable-epel-repo/
[8]:https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/
[9]:https://www.cyberciti.biz/tips/linux-display-open-ports-owner.html (Linux netstat command)
[10]:https://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html
[11]:https://www.cyberciti.biz/tips/netstat-command-tutorial-examples.html
[12]:https://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html
[13]:http://www.unhide-forensics.info/?Windows:Download
