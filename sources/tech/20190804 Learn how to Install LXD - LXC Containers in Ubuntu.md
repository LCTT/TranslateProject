[#]: collector: "lujun9972"
[#]: translator: "runningwater "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Learn how to Install LXD / LXC Containers in Ubuntu"
[#]: via: "https://www.linuxtechi.com/install-lxd-lxc-containers-from-scratch/"
[#]: author: "Shashidhar Soppin https://www.linuxtechi.com/author/shashidhar/"

Learn how to Install LXD / LXC Containers in Ubuntu
======

Let me start by explaining what a container is, it is normal process on the host machine (any Linux based m/c) with following characteristics,

  * It feels like a VM, but it is not.
  * Uses the host Kernel.
  * Cannot boot a different Operating System.
  * Can’t have its own modules.
  * Does not need “**init”** as PID (Process id) as “1”



[![Learn-LXD-LXC-Containers][1]][2]

LXC (**LinuX Containers**) technology was developed long ago and is an Operating System level virtualization technology. This was existing from the days of BSD and System-V Release 4 (Popular Unix flavors during 1980-90’s). But until recently, no one new how much it can help us in saving in terms of resource utilization. Because of this technology change, all enterprises are moving towards adoption of virtualization (be it Cloud or be it Docker containers). This also helped in better management of **OpEX(Operational expenditures)** and **CaPEX(Captial expenditures)** costs. Using this technique, we can create and run multiple and isolated Linux virtual environments on a single Linux host machine (called control host). LXC mainly uses Linux’s cgroups and namespaces functionalities, which were introduced in version 2.6.24(kernel version) onwards. In parallel many advancements in hypervisors happened like that of **KVM**, **QEMU**, **Hyper-V**, **ESXi** etc. Especially KVM (Kernel Virtual Machine) which is core of Linux OS, helped in this kind of advancement.

Difference between LXC and LXD is that LXC is the original and older way to manage containers but it is still supported, all commands of LXC starts with “**lxc-“** like “**lxc-create**” &amp; “**lxc-info**“, whereas LXD is a new way to manage containers and lxc command is used for all containers operations and management.

All of us know that “**Docker**” utilizes LXC and was developed using Go language, cgroups, namespaces and finally the Linux Kernel itself. Complete Docker has been built and developed using LXC as the basic foundation block. Docker is completely dependent on underlying infrastructure &amp; hardware and using the Operating System as the medium. However, Docker is a portable and easily deployable container engine; all its dependencies are run using a virtual container on most of the Linux based servers. Groups, and Namespaces are the building block concepts for both LXC and Docker containers. Following are the brief description of these concepts.

### C Groups (Control Groups)

With Cgroups each resource will have its own hierarchy.

  * CPU, Memory, I/O etc will have their own control group hierarchy. Following are various characterics of Cgroups,
  *  Each process is in each node
  * Each hierarchy starts with one node
  * Initially all processes start at the root node. Therefore “each node” is equivalent to “group of processes”.
  * Hierarchies are independent, ex: CPU, Block I/O, memory etc



As explained earlier there are various Cgroup types as listed below,

1) **Memory Cgroups**

a) Keeps track of pages used by each group.

b) File read/write/mmap from block devices

c) Anonymous memory(stack, heap etc)

d) Each memory page is charged to a group

e) Pages can be shared across multiple groups

2) **CPU Cgroups**

a) Track users/system cpu time

b)  Track usage per CPU

c) Allows set to weights

d) Can’t set cpu limits

3) **Block IO Cgroup**

a) Keep track of read/write(I/O’s)

b) Set throttle (limits) for each group (per block device)

c) Set real weights for each group (per block device)

4) **Devices Cgroup**

a) Controls what the group can do on device nodes

b) Permission include /read/write/mknode

5) **Freezer Cgroup**

a) Allow to freeze/thaw a group  of processes

b) Similar to SIGSTOP/SIGCONT

c) Cannot be detected by processes

### NameSpaces

Namespaces provide processes with their own system view. Each process is in name space of each type.

There are multiple namespaces like,

  * PID – Process within a PID name space only see processes in the same PID name space
  * Net – Processes within a given network namespace get their own private network stack.
  * Mnt – Processes can have their own “root” and private “mount” points.
  * Uts –  Have container its own hostname
  * IPC – Allows processes to have own IPC semaphores, IPC message queues and shared memory
  * USR – Allows to map UID/GID



### Installation and configuration of LXD containers

To have LXD installed on Ubuntu system (18.04 LTS) , we can start with LXD installation using below apt command

```
root@linuxtechi:~$ sudo apt update
root@linuxtechi:~$ sudo apt install lxd -y
```

Once the LXD is installed, we can start with its initialization as below, (most of the times use the default options)

```
root@linuxtechi:~$ sudo lxd init
```

![lxc-init-ubuntu-system][1]

Once the LXD is initialized successfully, run the below command to verify information

```
root@linuxtechi:~$ sudo lxc info | more
```

![lxc-info-command][1]

Use below command to list if there is any container is downloaded on our host,

```
root@linuxtechi:~$ sudo lxc image list
+-------+-------------+--------+-------------+------+------+-------------+
| ALIAS | FINGERPRINT | PUBLIC | DESCRIPTION | ARCH | SIZE | UPLOAD DATE |
+-------+-------------+--------+-------------+------+------+-------------+
root@linuxtechi:~$
```

Quick and easy way to start the first container on Ubuntu 18.04 (or any supported Ubuntu flavor) use the following command. The container name we have provided is “shashi”

```
root@linuxtechi:~$ sudo lxc launch ubuntu:18.04 shashi
Creating shashi
Starting shashi
root@linuxtechi:~$
```

To list out what are the LXC containers that are in the system

```
root@linuxtechi:~$ sudo lxc list
+--------+---------+-----------------------+-----------------------------------------------+------------+-----------+
|  NAME  |  STATE  |         IPV4          |                     IPV6                      |    TYPE    | SNAPSHOTS |
+--------+---------+-----------------------+-----------------------------------------------+------------+-----------+
| shashi | RUNNING | 10.122.140.140 (eth0) | fd42:49da:7c44:cebe:216:3eff:fea4:ea06 (eth0) | PERSISTENT | 0         |
+--------+---------+-----------------------+-----------------------------------------------+------------+-----------+
root@linuxtechi:~$
```

Other Container management commands for LXD are listed below :

**Note:** In below examples, shashi is my container name

**How to take bash shell of your LXD Container?**

```
root@linuxtechi:~$ sudo lxc exec shashi bash
root@linuxtechi:~#
```

**How Stop, Start &amp; Restart LXD Container?**

```
root@linuxtechi:~$ sudo lxc stop shashi
root@linuxtechi:~$ sudo lxc list
+--------+---------+------+------+------------+-----------+
|  NAME  |  STATE  | IPV4 | IPV6 |    TYPE    | SNAPSHOTS |
+--------+---------+------+------+------------+-----------+
| shashi | STOPPED |      |      | PERSISTENT | 0         |
+--------+---------+------+------+------------+-----------+
root@linuxtechi:~$
root@linuxtechi:~$ sudo lxc start shashi
root@linuxtechi:~$ sudo lxc restart shashi
```

**How to delete a LXD Container?**

```
root@linuxtechi:~$ sudo lxc stop  shashi
root@linuxtechi:~$ sudo lxc delete  shashi
root@linuxtechi:~$ sudo lxc list
+------+-------+------+------+------+-----------+
| NAME | STATE | IPV4 | IPV6 | TYPE | SNAPSHOTS |
+------+-------+------+------+------+-----------+
root@linuxtechi:~$
```

**How to take snapshot of LXD container and then restore it?**

Let’s assume we have pkumar container based on centos7 image, so to take the snapshot use the following,

```
root@linuxtechi:~$ sudo lxc snapshot pkumar pkumar_snap0
```

Use below command to verify the snapshot

```
root@linuxtechi:~$ sudo lxc info  pkumar  | grep -i Snapshots -A2
Snapshots:
  pkumar_snap0 (taken at 2019/08/02 19:39 UTC) (stateless)
root@linuxtechi:~$
```

Use below command to restore the LXD container from their snapshot

Syntax:

$ lxc restore {container_name} {snapshot_name}

```
root@linuxtechi:~$ sudo lxc restore pkumar pkumar_snap0
root@linuxtechi:~$
```

**How to delete LXD container snapshot?**

```
$ sudo lxc delete <container_name/snapshot_name>
```

**How to set Memory, CPU and Disk Limit on LXD container?**

Syntax to set Memory limit:

# lxc config set &lt;container_name&gt; limits.memory &lt;Memory_Size&gt;KB/MB/GB

Syntax to set CPU limit:

# lxc config set &lt;container_name&gt;  limits.cpu {Number_of_CPUs}

Syntax to Set Disk limit:

# lxc config device set &lt;container_name&gt; root size &lt;Size_MB/GB&gt;

**Note:** To set a disk limit (it requires btrfs or ZFS filesystem)

Let’s set limit on Memory and CPU on container shashi using the following commands,

```
root@linuxtechi:~$ sudo lxc config set shashi limits.memory 256MB
root@linuxtechi:~$ sudo lxc config set shashi limits.cpu 2
```

### Install and configure LXC container (commands and operations)

To install lxc on your ubuntu system, use the beneath apt command,

```
root@linuxtechi:~$ sudo apt install lxc -y
```

In earlier version of LXC, the command “**lxc-clone**” was used and later it was deprecated. Now, “**lxc-copy**” command is widely used for cloning operation.

**Note:** To get “lxc-copy” command working, use the following installation steps,

```
root@linuxtechi:~$ sudo apt install lxc1 -y
```

**Creating Linux Containers using the templates**

LXC provides ready-made templates for easy installation of Linux containers. Templates are usually found in the directory path /usr/share/lxc/templates, but in fresh installation we will not get the templates, so to download the templates in your local system , run the beneath command,

```
root@linuxtechi:~$ sudo apt install lxc-templates -y
```

Once the lxc-templates are installed successfully then templates will be available,

```
root@linuxtechi:~$ sudo ls /usr/share/lxc/templates/
lxc-alpine     lxc-centos    lxc-fedora         lxc-oci           lxc-plamo      lxc-sparclinux    lxc-voidlinux
lxc-altlinux   lxc-cirros    lxc-fedora-legacy  lxc-openmandriva  lxc-pld        lxc-sshd
lxc-archlinux  lxc-debian    lxc-gentoo         lxc-opensuse      lxc-sabayon    lxc-ubuntu
lxc-busybox    lxc-download  lxc-local          lxc-oracle        lxc-slackware  lxc-ubuntu-cloud
root@linuxtechi:~$
```

Let’s Launch a container using template,

Syntax: lxc-create -n &lt;container_name&gt; lxc -t &lt;template_name&gt;

```
root@linuxtechi:~$ sudo lxc-create -n shashi_lxc -t ubuntu
………………………
invoke-rc.d: could not determine current runlevel
invoke-rc.d: policy-rc.d denied execution of start.
Current default time zone: 'Etc/UTC'
Local time is now:      Fri Aug  2 11:46:42 UTC 2019.
Universal Time is now:  Fri Aug  2 11:46:42 UTC 2019.

##
# The default user is 'ubuntu' with password 'ubuntu'!
# Use the 'sudo' command to run tasks as root in the container.
##
………………………………………
root@linuxtechi:~$
```

Once the complete template is created, we can login into this console using the following steps

```
root@linuxtechi:~$ sudo lxc-start -n shashi_lxc -d
root@linuxtechi:~$ sudo lxc-console -n shashi_lxc

Connected to tty 1
Type <Ctrl+a q> to exit the console, <Ctrl+a Ctrl+a> to enter Ctrl+a itself

Ubuntu 18.04.2 LTS shashi_lxc pts/0

shashi_lxc login: ubuntu
Password:
Last login: Fri Aug  2 12:00:35 UTC 2019 on pts/0
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-20-generic x86_64)
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

root@linuxtechi_lxc:~$ free -h
              total        used        free      shared  buff/cache   available
Mem:           3.9G         23M        3.8G        112K        8.7M        3.8G
Swap:          1.9G        780K        1.9G
root@linuxtechi_lxc:~$ grep -c processor /proc/cpuinfo
1
root@linuxtechi_lxc:~$ df -h /
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        40G  7.4G   31G  20% /
root@linuxtechi_lxc:~$
```

Now logout or exit from the container and go back to host machine login window. With the lxc-ls command we can see that shashi-lxc container is created.

```
root@linuxtechi:~$ sudo lxc-ls
shashi_lxc
root@linuxtechi:~$
```

“**lxc-ls -f**” command provides details with ip address of the container and the same is as below,

```
root@linuxtechi:~$ sudo lxc-ls -f
NAME       STATE   AUTOSTART GROUPS IPV4       IPV6 UNPRIVILEGED
shashi_lxc RUNNING 0         -      10.0.3.190 -    false
root@linuxtechi:~$
```

“**lxc-info -n &lt;container_name&gt;**” command provides with all the required details along with State, ip address etc.

```
root@linuxtechi:~$ sudo lxc-info -n shashi_lxc
Name:           shashi_lxc
State:          RUNNING
PID:            6732
IP:             10.0.3.190
CPU use:        2.38 seconds
BlkIO use:      240.00 KiB
Memory use:     27.75 MiB
KMem use:       5.04 MiB
Link:           vethQ7BVGU
 TX bytes:      2.01 KiB
 RX bytes:      9.52 KiB
 Total bytes:   11.53 KiB
root@linuxtechi:~$
```

**How to Start, Stop, Restart and Delete LXC containers**

```
$ lxc-start -n <container_name>
$ lxc-stop -n <container_name>
$ lxc-destroy -n <container_name>
```

**LXC Cloning operation**

Now the main cloning operation to be performed on the LXC container. The following steps are followed

As described earlier LXC offers a feature of cloning a container from the existing container, by running the following command to clone an existing “shashi_lxc” container to a new container “shashi_lxc_clone”.

**Note:** We have to make sure that before starting the cloning operation, first we have to stop the existing container using the “**lxc-stop**” command.

```
root@linuxtechi:~$ sudo lxc-stop -n shashi_lxc
root@linuxtechi:~$ sudo lxc-copy -n shashi_lxc -N shashi_lxc_clone
root@linuxtechi:~$ sudo lxc-ls
shashi_lxc       shashi_lxc_clone
root@linuxtechi:~$
```

Now start the cloned container

```
root@linuxtechi:~$ sudo lxc-start -n shashi_lxc_clone
root@linuxtechi:~$ sudo lxc-ls -f
NAME             STATE   AUTOSTART GROUPS IPV4       IPV6 UNPRIVILEGED
shashi_lxc       STOPPED 0         -      -          -    false
shashi_lxc_clone RUNNING 0         -      10.0.3.201 -    false
root@linuxtechi:~$
```

With the above set of commands, cloning operation is done and the new clone “shashi_lxc_clone” got created. We can login into this lxc container console with below steps,

```
root@linuxtechi:~$ sudo lxc-console -n shashi_lxc_clone

Connected to tty 1
Type <Ctrl+a q> to exit the console, <Ctrl+a Ctrl+a> to enter Ctrl+a itself
Ubuntu 18.04.2 LTS shashi_lxc pts/0

shashi_lxc login:
```

**LXC Network configuration and commands**

We can attach to the newly created container, but to remotely login into this container using SSH or any other means, we have to do some minimal configuration changes as explained below,

```
root@linuxtechi:~$ sudo lxc-attach -n shashi_lxc_clone
root@linuxtechi_lxc:/#
root@linuxtechi_lxc:/# useradd -m shashi
root@linuxtechi_lxc:/# passwd shashi
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
root@linuxtechi_lxc:/#
```

First install the ssh server using the following command so that smooth “ssh” connect can be established.

```
root@linuxtechi_lxc:/# apt install openssh-server -y
```

Now get the IP address of the existing lxc container using the following command,

```
root@linuxtechi_lxc:/# ip addr show eth0|grep inet
    inet 10.0.3.201/24 brd 10.0.3.255 scope global dynamic eth0
    inet6 fe80::216:3eff:fe82:e251/64 scope link
root@linuxtechi_lxc:/#
```

From the host machine with a new console window, use the following command to connect to this container over ssh

```
root@linuxtechi:~$ ssh 10.0.3.201
root@linuxtechi's password:
$
```

Now, we have logged in a container using ssh session.

**LXC process related commands**

```
root@linuxtechi:~$ ps aux|grep lxc|grep -v grep
```

![lxc-process-ubuntu-system][1]

**LXC snapshot operation**

Snapshotting is one of the main operations which will help in taking point in time snapshot of the lxc container images. These same snapshot images can be used later for further use.

```
root@linuxtechi:~$ sudo lxc-stop -n shashi_lxc
root@linuxtechi:~$ sudo lxc-snapshot -n shashi_lxc
root@linuxtechi:~$
```

The snapshot path can be located using the following command.

```
root@linuxtechi:~$ sudo lxc-snapshot -L -n shashi_lxc
snap0 (/var/lib/lxc/shashi_lxc/snaps) 2019:08:02 20:28:49
root@linuxtechi:~$
```

**Conclusion:**

LXC, LinuX containers is one of the early container technologies. Understanding the concepts and learning about LXC will help in deeper understanding of any other containers like Docker Containers. This article has provided deeper insights on Cgroup and Namespaces which are also very much required concepts for better understanding of Containers and like. Many of the LXC operations like cloning, snapshotting, network operation etc are covered with command line examples.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-lxd-lxc-containers-from-scratch/

作者：[Shashidhar Soppin][a]
选题：[lujun9972][b]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/shashidhar/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/08/Learn-LXD-LXC-Containers.jpg
