[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Five Methods To Check Your Current Runlevel In Linux?)
[#]: via: (https://www.2daygeek.com/check-current-runlevel-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Five Methods To Check Your Current Runlevel In Linux?
======

A run level is an operating system state on Linux system.

There are seven runlevels exist, numbered from zero to six.

A system can be booted into any of the given runlevel. Run levels are identified by numbers.

Each runlevel designates a different system configuration and allows access to a different combination of processes.

By default Linux boots either to runlevel 3 or to runlevel 5.

Only one runlevel is executed at a time on startup. It doesn’t execute one after another.

The default runlevel for a system is specified in the /etc/inittab file for SysVinit system.

But systemd systems doesn’t read this file and it uses the following file `/etc/systemd/system/default.target` to get default runlevel information.

We can check the Linux system current runlevel using the below five methods.

  * **`runlevel Command:`** runlevel prints the previous and current runlevel of the system.
  * **`who Command:`** Print information about users who are currently logged in. It will print the runlevel information with “-r” option.
  * **`systemctl Command:`** It controls the systemd system and service manager.
  * **`Using /etc/inittab File:`** The default runlevel for a system is specified in the /etc/inittab file for SysVinit System.
  * **`Using /etc/systemd/system/default.target File:`** The default runlevel for a system is specified in the /etc/systemd/system/default.target file for systemd System.



Detailed runlevels information is described in the below table.

**Runlevel** | **SysVinit System** | **systemd System**
---|---|---
0 | Shutdown or Halt the system | shutdown.target
1 | Single user mode | rescue.target
2 | Multiuser, without NFS | multi-user.target
3 | Full multiuser mode | multi-user.target
4 | unused | multi-user.target
5 | X11 (Graphical User Interface) | graphical.target
6 | reboot the system | reboot.target

The system will execute the programs/service based on the runlevel.

For SysVinit system, it will be execute from the following location.

  * Run level 0 – /etc/rc.d/rc0.d/
  * Run level 1 – /etc/rc.d/rc1.d/
  * Run level 2 – /etc/rc.d/rc2.d/
  * Run level 3 – /etc/rc.d/rc3.d/
  * Run level 4 – /etc/rc.d/rc4.d/
  * Run level 5 – /etc/rc.d/rc5.d/
  * Run level 6 – /etc/rc.d/rc6.d/



For systemd system, it will be execute from the following location.

  * runlevel1.target – /etc/systemd/system/rescue.target
  * runlevel2.target – /etc/systemd/system/multi-user.target.wants
  * runlevel3.target – /etc/systemd/system/multi-user.target.wants
  * runlevel4.target – /etc/systemd/system/multi-user.target.wants
  * runlevel5.target – /etc/systemd/system/graphical.target.wants



### 1) How To Check Your Current Runlevel In Linux Using runlevel Command?

runlevel prints the previous and current runlevel of the system.

```
$ runlevel
N 5
```

  * **`N:`** “N” indicates that the runlevel has not been changed since the system was booted.
  * **`5:`** “5” indicates the current runlevel of the system.



### 2) How To Check Your Current Runlevel In Linux Using who Command?

Print information about users who are currently logged in. It will print the runlevel information with `-r` option.

```
$ who -r
         run-level 5  2019-04-22 09:32
```

### 3) How To Check Your Current Runlevel In Linux Using systemctl Command?

systemctl is used to controls the systemd system and service manager. systemd is system and service manager for Unix like operating systems.

It can work as a drop-in replacement for sysvinit system. systemd is the first process get started by kernel and holding PID 1.

systemd uses `.service` files Instead of bash scripts (SysVinit uses). systemd sorts all daemons into their own Linux cgroups and you can see the system hierarchy by exploring `/cgroup/systemd` file.

```
$ systemctl get-default
graphical.target
```

### 4) How To Check Your Current Runlevel In Linux Using /etc/inittab File?

The default runlevel for a system is specified in the /etc/inittab file for SysVinit System but systemd systemd doesn’t read the files.

So, it will work only on SysVinit system and not in systemd system.

```
$ cat /etc/inittab
# inittab is only used by upstart for the default runlevel.
#
# ADDING OTHER CONFIGURATION HERE WILL HAVE NO EFFECT ON YOUR SYSTEM.
#
# System initialization is started by /etc/init/rcS.conf
#
# Individual runlevels are started by /etc/init/rc.conf
#
# Ctrl-Alt-Delete is handled by /etc/init/control-alt-delete.conf
#
# Terminal gettys are handled by /etc/init/tty.conf and /etc/init/serial.conf,
# with configuration in /etc/sysconfig/init.
#
# For information on how to write upstart event handlers, or how
# upstart works, see init(5), init(8), and initctl(8).
#
# Default runlevel. The runlevels used are:
#   0 - halt (Do NOT set initdefault to this)
#   1 - Single user mode
#   2 - Multiuser, without NFS (The same as 3, if you do not have networking)
#   3 - Full multiuser mode
#   4 - unused
#   5 - X11
#   6 - reboot (Do NOT set initdefault to this)
#
id:5:initdefault:
```

### 5) How To Check Your Current Runlevel In Linux Using /etc/systemd/system/default.target File?

The default runlevel for a system is specified in the /etc/systemd/system/default.target file for systemd System.

It doesn’t work on SysVinit system.

```
$ cat /etc/systemd/system/default.target
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-current-runlevel-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
