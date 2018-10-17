How to Enable or Disable Services on Boot in Linux Using chkconfig and systemctl Command
======
It’s a important topic for Linux admin (such a wonderful topic) so, everyone must be aware of this and practice how to use this in the efficient way.

In Linux, whenever we install any packages which has services or daemons. By default all the services “init & systemd” scripts will be added into it but it wont enabled.

Hence, we need to enable or disable the service manually if it’s required. There are three major init systems are available in Linux which are very famous and still in use.

### What is init System?

In Linux/Unix based operating systems, init (short for initialization) is the first process that started during the system boot up by the kernel.

It’s holding a process id (PID) of 1. It will be running in the background continuously until the system is shut down.

Init looks at the `/etc/inittab` file to decide the Linux run level then it starts all other processes & applications in the background as per the run level.

BIOS, MBR, GRUB and Kernel processes were kicked up before hitting init process as part of Linux booting process.

Below are the available run levels for Linux (There are seven runlevels exist, from zero to six).

  * **`0:`** halt
  * **`1:`** Single user mode
  * **`2:`** Multiuser, without NFS
  * **`3:`** Full multiuser mode
  * **`4:`** Unused
  * **`5:`** X11 (GUI – Graphical User Interface)
  * **`:`** reboot



Below three init systems are widely used in Linux.

  * System V (Sys V)
  * Upstart
  * systemd



### What is System V (Sys V)?

System V (Sys V) is one of the first and traditional init system for Unix like operating system. init is the first process that started during the system boot up by the kernel and it’s a parent process for everything.

Most of the Linux distributions started using traditional init system called System V (Sys V) first. Over the years, several replacement init systems were released to address design limitations in the standard versions such as launchd, the Service Management Facility, systemd and Upstart.

But systemd has been adopted by several major Linux distributions over the traditional SysV init systems.

### What is Upstart?

Upstart is an event-based replacement for the /sbin/init daemon which handles starting of tasks and services during boot, stopping them during shutdown and supervising them while the system is running.

It was originally developed for the Ubuntu distribution, but is intended to be suitable for deployment in all Linux distributions as a replacement for the venerable System-V init.

It was used in Ubuntu from 9.10 to Ubuntu 14.10 & RHEL 6 based systems after that they are replaced with systemd.

### What is systemd?

Systemd is a new init system and system manager which was implemented/adapted into all the major Linux distributions over the traditional SysV init systems.

systemd is compatible with SysV and LSB init scripts. It can work as a drop-in replacement for sysvinit system. systemd is the first process get started by kernel and holding PID 1.

It’s a parant process for everything and Fedora 15 is the first distribution which was adapted systemd instead of upstart. systemctl is command line utility and primary tool to manage the systemd daemons/services such as (start, restart, stop, enable, disable, reload & status).

systemd uses .service files Instead of bash scripts (SysVinit uses). systemd sorts all daemons into their own Linux cgroups and you can see the system hierarchy by exploring `/cgroup/systemd` file.

### How to Enable or Disable Services on Boot Using chkconfig Commmand?

The chkconfig utility is a command-line tool that allows you to specify in which
runlevel to start a selected service, as well as to list all available services along with their current setting.

Also, it will allows us to enable or disable a services from the boot. Make sure you must have superuser privileges (either root or sudo) to use this command.

All the services script are located on `/etc/rd.d/init.d`.

### How to list All Services in run-level

The `-–list` parameter displays all the services along with their current status (What run-level the services are enabled or disabled).

```
    # chkconfig --list
    NetworkManager 0:off 1:off 2:on 3:on 4:on 5:on 6:off
    abrt-ccpp 0:off 1:off 2:off 3:on 4:off 5:on 6:off
    abrtd 0:off 1:off 2:off 3:on 4:off 5:on 6:off
    acpid 0:off 1:off 2:on 3:on 4:on 5:on 6:off
    atd 0:off 1:off 2:off 3:on 4:on 5:on 6:off
    auditd 0:off 1:off 2:on 3:on 4:on 5:on 6:off
    .
    .
```

### How to check the Status of Specific Service

If you would like to see a particular service status in run-level then use the following format and grep the required service.

In this case, we are going to check the `auditd` service status in run-level.

```
    # chkconfig --list| grep auditd
    auditd 0:off 1:off 2:on 3:on 4:on 5:on 6:off
```

### How to Enable a Particular Service on Run Levels

Use `--level` parameter to enable a service in the required run-level. In this case, we are going to enable `httpd` service on run-level 3 and 5.

```
    # chkconfig --level 35 httpd on
```

### How to Disable a Particular Service on Run Levels

Use `--level` parameter to disable a service in the required run-level. In this case, we are going to enable `httpd` service on run-level 3 and 5.

```
    # chkconfig --level 35 httpd off
```

### How to Add a new Service to the Startup List

The `-–add` parameter allows us to add any new service to the startup. By default, it will turn on level 2, 3, 4 and 5 automatically for that service.

```
    # chkconfig --add nagios
```

### How to Remove a Service from Startup List

Use `--del` parameter to remove the service from the startup list. Here, we are going to remove the Nagios service from the startup list.

```
    # chkconfig --del nagios
```

### How to Enable or Disable Services on Boot Using systemctl Command?

systemctl is command line utility and primary tool to manage the systemd daemons/services such as (start, restart, stop, enable, disable, reload & status).

All the created systemd unit files are located on `/etc/systemd/system/`.

### How to list All Services

Use the following command to list all the services which included enabled and disabled.

```
    # systemctl list-unit-files --type=service
    UNIT FILE STATE
    arp-ethers.service disabled
    auditd.service enabled
    [email protected] enabled
    blk-availability.service disabled
    brandbot.service static
    [email protected] static
    chrony-wait.service disabled
    chronyd.service enabled
    cloud-config.service enabled
    cloud-final.service enabled
    cloud-init-local.service enabled
    cloud-init.service enabled
    console-getty.service disabled
    console-shell.service disabled
    [email protected] static
    cpupower.service disabled
    crond.service enabled
    .
    .
    150 unit files listed.
```

If you would like to see a particular service status then use the following format and grep the required service. In this case, we are going to check the `httpd` service status.

```
    # systemctl list-unit-files --type=service | grep httpd
    httpd.service disabled
```

### How to Enable a Particular Service on boot

Use the following systemctl command format to enable a particular service. To enable a service, it will create a symlink. The same can be found below.

```
    # systemctl enable httpd
    Created symlink from /etc/systemd/system/multi-user.target.wants/httpd.service to /usr/lib/systemd/system/httpd.service.
```

Run the following command to double check whether the services is enabled or not on boot.

```
    # systemctl is-enabled httpd
    enabled
```

### How to Disable a Particular Service on boot

Use the following systemctl command format to disable a particular service. When you run the command, it will remove a symlink which was created by you while enabling the service. The same can be found below.

```
    # systemctl disable httpd
    Removed symlink /etc/systemd/system/multi-user.target.wants/httpd.service.
```

Run the following command to double check whether the services is disabled or not on boot.

```
    # systemctl is-enabled httpd
    disabled
```

### How to Check the current run level

Use the following systemctl command to verify which run-level you are in. Still “runlevel” command works with systemd, however runlevels is a legacy concept in systemd so, i would advise you to use systemctl command for all activity.

We are in `run-level 3`, the same is showing below as `multi-user.target`.

```
    # systemctl list-units --type=target
    UNIT LOAD ACTIVE SUB DESCRIPTION
    basic.target loaded active active Basic System
    cloud-config.target loaded active active Cloud-config availability
    cryptsetup.target loaded active active Local Encrypted Volumes
    getty.target loaded active active Login Prompts
    local-fs-pre.target loaded active active Local File Systems (Pre)
    local-fs.target loaded active active Local File Systems
    multi-user.target loaded active active Multi-User System
    network-online.target loaded active active Network is Online
    network-pre.target loaded active active Network (Pre)
    network.target loaded active active Network
    paths.target loaded active active Paths
    remote-fs.target loaded active active Remote File Systems
    slices.target loaded active active Slices
    sockets.target loaded active active Sockets
    swap.target loaded active active Swap
    sysinit.target loaded active active System Initialization
    timers.target loaded active active Timers
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-enable-or-disable-services-on-boot-in-linux-using-chkconfig-and-systemctl-command/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
