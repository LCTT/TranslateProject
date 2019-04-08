[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ClusterShell – A Nifty Tool To Run Commands On Cluster Nodes In Parallel)
[#]: via: (https://www.2daygeek.com/clustershell-clush-run-commands-on-cluster-nodes-remote-system-in-parallel-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

ClusterShell – A Nifty Tool To Run Commands On Cluster Nodes In Parallel
======

We had written two articles in the past to run commands on multiple remote server in parallel.

These are **[Parallel SSH (PSSH)][1]** or **[Distributed Shell (DSH)][2]**.

Today also, we are going to discuss about the same kind of topic but it allows us to perform the same on cluster nodes as well.

You may think, i can write a small shell script to archive this instead of installing these third party packages.

Of course you are right and if you are going to run some commands in 10-15 remote systems then you don’t need to use this.

However, the scripts take some time to complete this task as it’s running in a sequential order.

Think about if you would like to run some commands on 1000+ servers what will be the options?

In this case your script won’t help you. Also, it would take good amount of time to complete a task.

So, to overcome this kind of issue and situation. We need to run the command in parallel on remote machines.

For that, we need use in one of the Parallel applications. I hope this explanation might fulfilled your doubts about parallel utilities.

### What Is ClusterShell?

clush stands for [ClusterShell][3]. ClusterShell is an event-driven open source Python library, designed to run local or distant commands in parallel on server farms or on large Linux clusters.

It will take care of common issues encountered on HPC clusters, such as operating on groups of nodes, running distributed commands using optimized execution algorithms, as well as gathering results and merging identical outputs, or retrieving return codes.

ClusterShell takes advantage of existing remote shell facilities already installed on your systems, like SSH.

ClusterShell’s primary goal is to improve the administration of high- performance clusters by providing a lightweight but scalable Python API for developers. It also provides clush, clubak and cluset/nodeset, convenient command-line tools that allow traditional shell scripts to benefit from some of the library features.

ClusterShell’s written in Python and it requires Python (v2.6+ or v3.4+) to run on your system.

### How To Install ClusterShell On Linux?

ClusterShell package is available in most of the distribution official package manager. So, use the distribution package manager tool to install it.

For **`Fedora`** system, use **[DNF Command][4]** to install clustershell.

```
$ sudo dnf install clustershell
```

Python 2 module and tools are installed and if it’s default on your system then run the following command to install Python 3 development on Fedora System.

```
$ sudo dnf install python3-clustershell
```

Make sure you should have enabled the **[EPEL repository][5]** on your system before performing clustershell installation.

For **`RHEL/CentOS`** systems, use **[YUM Command][6]** to install clustershell.

```
$ sudo yum install clustershell
```

Python 2 module and tools are installed and if it’s default on your system then run the following command to install Python 3 development on CentOS/RHEL System.

```
$ sudo yum install python34-clustershell
```

For **`openSUSE Leap`** system, use **[Zypper Command][7]** to install clustershell.

```
$ sudo zypper install clustershell
```

Python 2 module and tools are installed and if it’s default on your system then run the following command to install Python 3 development on OpenSUSE System.

```
$ sudo zypper install python3-clustershell
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][8]** or **[APT Command][9]** to install clustershell.

```
$ sudo apt install clustershell
```

### How To Install ClusterShell In Linux Using PIP?

Use PIP to install ClusterShell because it’s written in Python.

Make sure you should have enabled the **[Python][10]** and **[PIP][11]** on your system before performing clustershell installation.

```
$ sudo pip install ClusterShell
```

### How To Use ClusterShell On Linux?

It’s straight forward and awesome tool compared with other utilities such as pssh and dsh. It has so many options to perform the remote execution in parallel.

Make sure you should have enabled the **[password less login][12]** on your system before start using clustershell.

The following configuration file defines system-wide default values. You no need to modify anything here.

```
$ cat /etc/clustershell/clush.conf
```

If you would like to create a servers group. Here you can go. By default some examples were available so, do the same for your requirements.

```
$ cat /etc/clustershell/groups.d/local.cfg
```

Just run the clustershell command in the following format to get the information from the given nodes.

```
$ clush -w 192.168.1.4,192.168.1.9 cat /proc/version
192.168.1.9: Linux version 4.15.0-45-generic ([email protected]) (gcc version 7.3.0 (Ubuntu 7.3.0-16ubuntu3)) #48-Ubuntu SMP Tue Jan 29 16:28:13 UTC 2019
192.168.1.4: Linux version 3.10.0-957.el7.x86_64 ([email protected]) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC) ) #1 SMP Thu Nov 8 23:39:32 UTC 2018
```

**Option:**

  * **`-w:`** nodes where to run the command.



You can use the regular expressions instead of using full hostname and IPs.

```
$ clush -w 192.168.1.[4,9] uname -r
192.168.1.9: 4.15.0-45-generic
192.168.1.4: 3.10.0-957.el7.x86_64
```

Alternatively you can use the following format if you have the servers in the same IP series.

```
$ clush -w 192.168.1.[4-9] date
192.168.1.6: Mon Mar 4 21:08:29 IST 2019
192.168.1.7: Mon Mar 4 21:08:29 IST 2019
192.168.1.8: Mon Mar 4 21:08:29 IST 2019
192.168.1.5: Mon Mar 4 09:16:30 CST 2019
192.168.1.9: Mon Mar 4 21:08:29 IST 2019
192.168.1.4: Mon Mar 4 09:16:30 CST 2019
```

clustershell allow us to run the command in batch mode. Use the following format to achieve this.

```
$ clush -w 192.168.1.4,192.168.1.9 -b
Enter 'quit' to leave this interactive mode
Working with nodes: 192.168.1.[4,9]
clush> hostnamectl
---------------
192.168.1.4
---------------
 Static hostname: CentOS7.2daygeek.com
 Icon name: computer-vm
 Chassis: vm
 Machine ID: 002f47b82af248f5be1d67b67e03514c
 Boot ID: f9b37a073c534dec8b236885e754cb56
 Virtualization: kvm
 Operating System: CentOS Linux 7 (Core)
 CPE OS Name: cpe:/o:centos:centos:7
 Kernel: Linux 3.10.0-957.el7.x86_64
 Architecture: x86-64
---------------
192.168.1.9
---------------
 Static hostname: Ubuntu18
 Icon name: computer-vm
 Chassis: vm
 Machine ID: 27f6c2febda84dc881f28fd145077187
 Boot ID: f176f2eb45524d4f906d12e2b5716649
 Virtualization: oracle
 Operating System: Ubuntu 18.04.2 LTS
 Kernel: Linux 4.15.0-45-generic
 Architecture: x86-64
clush> free -m
---------------
192.168.1.4
---------------
 total used free shared buff/cache available
Mem: 1838 641 217 19 978 969
Swap: 2047 0 2047
---------------
192.168.1.9
---------------
 total used free shared buff/cache available
Mem: 1993 352 1067 1 573 1473
Swap: 1425 0 1425
clush> w
---------------
192.168.1.4
---------------
 09:21:14 up 3:21, 3 users, load average: 0.00, 0.01, 0.05
USER TTY FROM [email protected] IDLE JCPU PCPU WHAT
daygeek :0 :0 06:02 ?xdm? 1:28 0.30s /usr/libexec/gnome-session-binary --session gnome-classic
daygeek pts/0 :0 06:03 3:17m 0.06s 0.06s bash
daygeek pts/1 192.168.1.6 06:03 52:26 0.10s 0.10s -bash
---------------
192.168.1.9
---------------
 21:13:12 up 3:12, 1 user, load average: 0.08, 0.03, 0.00
USER TTY FROM [email protected] IDLE JCPU PCPU WHAT
daygeek pts/0 192.168.1.6 20:42 29:41 0.05s 0.05s -bash
clush> quit
```

If you would like to run the command on a group of nodes then use the following format.

```
$ clush -w @dev uptime
or
$ clush -g dev uptime
or
$ clush --group=dev uptime

192.168.1.9: 21:10:10 up 3:09, 1 user, load average: 0.09, 0.03, 0.01
192.168.1.4: 09:18:12 up 3:18, 3 users, load average: 0.01, 0.02, 0.05
```

If you would like to run the command on more than one group of nodes then use the following format.

```
$ clush -w @dev,@uat uptime
or
$ clush -g dev,uat uptime
or
$ clush --group=dev,uat uptime

192.168.1.7: 07:57:19 up 59 min, 1 user, load average: 0.08, 0.03, 0.00
192.168.1.9: 20:27:20 up 1:00, 1 user, load average: 0.00, 0.00, 0.00
192.168.1.5: 08:57:21 up 59 min, 1 user, load average: 0.00, 0.01, 0.05
```

clustershell allow us to copy a file to remote machines. To copy local file or directory to the remote nodes in the same location.

```
$ clush -w 192.168.1.[4,9] --copy /home/daygeek/passwd-up.sh
```

We can verify the same by running the following command.

```
$ clush -w 192.168.1.[4,9] ls -lh /home/daygeek/passwd-up.sh
192.168.1.4: -rwxr-xr-x. 1 daygeek daygeek 159 Mar 4 09:00 /home/daygeek/passwd-up.sh
192.168.1.9: -rwxr-xr-x 1 daygeek daygeek 159 Mar 4 20:52 /home/daygeek/passwd-up.sh
```

To copy local file or directory to the remote nodes in the different location.

```
$ clush -g uat --copy /home/daygeek/passwd-up.sh --dest /tmp
```

We can verify the same by running the following command.

```
$ clush --group=uat ls -lh /tmp/passwd-up.sh
192.168.1.7: -rwxr-xr-x. 1 daygeek daygeek 159 Mar 6 07:44 /tmp/passwd-up.sh
```

To copy file or directory from remote nodes to local system.

```
$ clush -w 192.168.1.7 --rcopy /home/daygeek/Documents/magi.txt --dest /tmp
```

We can verify the same by running the following command.

```
$ ls -lh /tmp/magi.txt.192.168.1.7
-rw-r--r-- 1 daygeek daygeek 35 Mar 6 20:24 /tmp/magi.txt.192.168.1.7
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/clustershell-clush-run-commands-on-cluster-nodes-remote-system-in-parallel-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/
[2]: https://www.2daygeek.com/dsh-run-execute-shell-commands-on-multiple-linux-servers-at-once/
[3]: https://cea-hpc.github.io/clustershell/
[4]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[8]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[9]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[10]: https://www.2daygeek.com/3-methods-to-install-latest-python3-package-on-centos-6-system/
[11]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[12]: https://www.2daygeek.com/linux-passwordless-ssh-login-using-ssh-keygen/
