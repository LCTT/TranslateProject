[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 things to do in your first 10 minutes on a Linux server)
[#]: via: (https://opensource.com/article/20/12/linux-server)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

9 things to do in your first 10 minutes on a Linux server
======
Before putting a newly provisioned server to work, make sure you know
what you're working with.
![Parts, modules, containers for software][1]

When I test software on Linux (a regular part of my job), I need to use multiple servers with various architectures running Linux. I provision the machines, install the required software packages, run my tests, gather the results, and return the machine to the pool so that others can use it for their tests.

Since I do this so often (even multiple times a day), my first 10 minutes on a Linux server have become a daily ritual. When I first log into a Linux server, I look for certain things using commands to gather the information I need. I'll go through my process in this article, but please note that, in most cases, I'll just give the command name, so you will need to identify the specific flags for those commands to get the information that you need. Reading man pages for the commands is a good starting point.

### 1\. First contact

As soon as I log into a server, the first thing I do is check whether it has the operating system, kernel, and hardware architecture needed for the tests I will be running. I often check how long a server has been up and running. While this does not matter very much for a test system because it will be rebooted multiple times, I still find this information helpful.

Use the following commands to get this information. I mostly use Red Hat Linux for testing, so if you are using another Linux distro, use `*-release` in the filename instead of `redhat-release`:


```
cat /etc/redhat-release
uname -a
hostnamectl
uptime
```

### 2\. Is anyone else on board?

Once I know that the machine meets my test needs, I need to ensure no one else is logged into the system at the same time running their own tests. Although it is highly unlikely, given that the provisioning system takes care of this for me, it's still good to check once in a while—especially if it's my first time logging into a server. I also check whether there are other users (other than root) who can access the system.

Use the following commands to find this information. The last command looks for users in the `/etc/passwd` file who have shell access; it skips other services in the file that do not have shell access or have a shell set to `nologin`:


```
who
who -Hu
grep sh$ /etc/passwd
```

### 3\. Physical or virtual machine

Now that I know I have the machine to myself, I need to identify whether it's a physical machine or a virtual machine (VM). If I provisioned the machine myself, I could be sure that I have what I asked for. However, if you are using a machine that you did not provision, you should check whether the machine is physical or virtual.

Use the following commands to identify this information. If it's a physical system, you will see the vendor's name (e.g., HP, IBM, etc.) and the make and model of the server; whereas, in a virtual machine, you should see KVM, VirtualBox, etc., depending on what virtualization software was used to create the VM:


```
dmidecode -s system-manufacturer
dmidecode -s system-product-name
lshw -c system | grep product | head -1
cat /sys/class/dmi/id/product_name
cat /sys/class/dmi/id/sys_vendor
```

### 4\. Hardware

Because I often test hardware connected to the Linux machine, I usually work with physical servers, not VMs. On a physical machine, my next step is to identify the server's hardware capabilities—for example, what kind of CPU is running, how many cores does it have, which flags are enabled, and how much memory is available for running tests. If I am running network tests, I check the type and capacity of the Ethernet or other network devices connected to the server.

Use the following commands to display the hardware connected to a Linux server. Some of the commands might be deprecated in newer operating system versions, but you can still install them from yum repos or switch to their equivalent new commands:


```
lscpu or cat /proc/cpuinfo
lsmem or cat /proc/meminfo
ifconfig -a
ethtool &lt;devname&gt;
lshw
lspci
dmidecode
```

### 5\. Installed software

Testing software always requires installing additional dependent packages, libraries, etc. However, before I install anything, I check what is already installed (including what version it is), as well as which repos are configured, so I know where the software comes from, and I can debug any package installation issues.

Use the following commands to identify what software is installed:


```
rpm -qa
rpm -qa | grep &lt;pkgname&gt;
rpm -qi &lt;pkgname&gt;
yum repolist
yum repoinfo
yum install &lt;pkgname&gt;
ls -l /etc/yum.repos.d/
```

### 6\. Running processes and services

Once I check the installed software, it's natural to check what processes are running on the system. This is crucial when running a performance test on a system—if a running process, daemon, test software, etc. is eating up most of the CPU/RAM, it makes sense to stop that process before running the tests. This also checks that the processes or daemons the test requires are up and running. For example, if the tests require httpd to be running, the service to start the daemon might not have run even if the package is installed.

Use the following commands to identify running processes and enabled services on your system:


```
pstree -pa 1
ps -ef
ps auxf
systemctl
```

### 7\. Network connections

Today's machines are heavily networked, and they need to communicate with other machines or services on the network. I identify which ports are open on the server, if there are any connections from the network to the test machine, if a firewall is enabled, and if so, is it blocking any ports, and which DNS servers the machine talks to.

Use the following commands to identify network services-related information. If a deprecated command is not available, install it from a yum repo or use the equivalent newer command:


```
netstat -tulpn
netstat -anp
lsof -i
ss
iptables -L -n
cat /etc/resolv.conf
```

### 8\. Kernel

When doing systems testing, I find it helpful to know kernel-related information, such as the kernel version and which kernel modules are loaded. I also list any [tunable kernel parameters][2] and what they are set to and check the options used when booting the running kernel.

Use the following commands to identify this information:


```
uname -r
cat /proc/cmdline
lsmod
modinfo &lt;module&gt;
sysctl -a
cat /boot/grub2/grub.cfg
```

### 9\. Logs

By now, I have a good idea about the server, including what software is installed and what processes are running. One other thing I cannot escape is log files—I need to know where to check the information that is continuously being updated.

Use the following commands to see your system's logs:


```
dmesg
tail -f /var/log/messages
journalctl
```

### Next steps

While commands and utilities will change, the underlying information they show remains more or less the same. You need a high-level view of the information you are looking for and what category it falls into before you can focus on which commands to master.

Since Linux saves most information in files, these commands basically read information from the files and present them in an easy-to-understand way. A good next step is to identify the files each command uses to get the information to display. A hint for finding that information is the `strace` command.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/linux-server

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://www.oreilly.com/library/view/red-hat-enterprise/9781785283550/ch10s05.html
