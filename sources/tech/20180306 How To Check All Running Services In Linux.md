How To Check All Running Services In Linux
======
There are many ways and tools to check and list all running services in Linux. Usually most of the administrator use `service service-name status` or `/etc/init.d/service-name status` for sysVinit system and `systemctl status service-name` for systemd systems.

The above command clearly shows that the mentioned service is running on server or not. It is very simple and basic command that should known by every Linux administrator.

If you are new to your environment and you don’t know what services are running on the system. How do you check?

Yes, we can check this. This will will help us to understand what are the services are running on the system and whether it’s necessary or need to disable.

### What Is SysVinit

init (short for initialization) is the first process started during booting of the computer system. Init is a daemon process that continues running until the system is shut down.

SysVinit is an old and traditional init system and system manager for old systems. Most of the latest distributions were adapted to systemd system due to some of the long pending issues on sysVinit system.

### What Is systemd

systemd is a new init system and system manager which is become very popular and widely adapted new standard init system by most of Linux distributions. Systemctl is a systemd utility which is help us to manage systemd system.

### Method-1: How To Check Running Services In sysVinit System

The below command helps us to check and list all running services in sysVinit system.

If you have many number of services, i would advise you to use file view commands such as less, more, etc commands for clear view.
```
# service --status-all
or
# service --status-all | more
or
# service --status-all | less

abrt-ccpp hook is installed
abrtd (pid 2131) is running...
abrt-dump-oops is stopped
acpid (pid 1958) is running...
atd (pid 2164) is running...
auditd (pid 1731) is running...
Frequency scaling enabled using ondemand governor
crond (pid 2153) is running...
hald (pid 1967) is running...
htcacheclean is stopped
httpd is stopped
Table: filter
Chain INPUT (policy ACCEPT)
num target prot opt source destination
1 ACCEPT all ::/0 ::/0 state RELATED,ESTABLISHED
2 ACCEPT icmpv6 ::/0 ::/0
3 ACCEPT all ::/0 ::/0
4 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:80
5 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:21
6 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:22
7 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:25
8 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:2082
9 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:2086
10 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:2083
11 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:2087
12 ACCEPT tcp ::/0 ::/0 state NEW tcp dpt:10000
13 REJECT all ::/0 ::/0 reject-with icmp6-adm-prohibited

Chain FORWARD (policy ACCEPT)
num target prot opt source destination
1 REJECT all ::/0 ::/0 reject-with icmp6-adm-prohibited

Chain OUTPUT (policy ACCEPT)
num target prot opt source destination

iptables: Firewall is not running.
irqbalance (pid 1826) is running...
Kdump is operational
lvmetad is stopped
mdmonitor is stopped
messagebus (pid 1929) is running...
 SUCCESS! MySQL running (24376)
rndc: neither /etc/rndc.conf nor /etc/rndc.key was found
named is stopped
netconsole module not loaded
Usage: startup.sh { start | stop }
Configured devices:
lo eth0 eth1
Currently active devices:
lo eth0
ntpd is stopped
portreserve (pid 1749) is running...
master (pid 2107) is running...
Process accounting is disabled.
quota_nld is stopped
rdisc is stopped
rngd is stopped
rpcbind (pid 1840) is running...
rsyslogd (pid 1756) is running...
sandbox is stopped
saslauthd is stopped
smartd is stopped
openssh-daemon (pid 9859) is running...
svnserve is stopped
vsftpd (pid 4008) is running...
xinetd (pid 2031) is running...
zabbix_agentd (pid 2150 2149 2148 2147 2146 2140) is running...

```

Run the following command to view only running services in the system.
```
# service --status-all | grep running

crond (pid 535) is running...
httpd (pid 627) is running...
mysqld (pid 911) is running...
rndc: neither /etc/rndc.conf nor /etc/rndc.key was found
rsyslogd (pid 449) is running...
saslauthd (pid 492) is running...
sendmail (pid 509) is running...
sm-client (pid 519) is running...
openssh-daemon (pid 478) is running...
xinetd (pid 485) is running...

```

Run the following command to view the particular service status.
```
# service --status-all | grep httpd
httpd (pid 627) is running...

```

Alternatively use the following command to view the particular service status.
```
# service httpd status

httpd (pid 627) is running...

```

Use the following command to view the list of running services enabled in boot.
```
# chkconfig --list
crond 0:off 1:off 2:on 3:on 4:on 5:on 6:off
htcacheclean 0:off 1:off 2:off 3:off 4:off 5:off 6:off
httpd 0:off 1:off 2:off 3:on 4:off 5:off 6:off
ip6tables 0:off 1:off 2:on 3:off 4:on 5:on 6:off
iptables 0:off 1:off 2:on 3:on 4:on 5:on 6:off
modules_dep 0:off 1:off 2:on 3:on 4:on 5:on 6:off
mysqld 0:off 1:off 2:on 3:on 4:on 5:on 6:off
named 0:off 1:off 2:off 3:off 4:off 5:off 6:off
netconsole 0:off 1:off 2:off 3:off 4:off 5:off 6:off
netfs 0:off 1:off 2:off 3:off 4:on 5:on 6:off
network 0:off 1:off 2:on 3:on 4:on 5:on 6:off
nmb 0:off 1:off 2:off 3:off 4:off 5:off 6:off
nscd 0:off 1:off 2:off 3:off 4:off 5:off 6:off
portreserve 0:off 1:off 2:on 3:off 4:on 5:on 6:off
quota_nld 0:off 1:off 2:off 3:off 4:off 5:off 6:off
rdisc 0:off 1:off 2:off 3:off 4:off 5:off 6:off
restorecond 0:off 1:off 2:off 3:off 4:off 5:off 6:off
rpcbind 0:off 1:off 2:on 3:off 4:on 5:on 6:off
rsyslog 0:off 1:off 2:on 3:on 4:on 5:on 6:off
saslauthd 0:off 1:off 2:off 3:on 4:off 5:off 6:off
sendmail 0:off 1:off 2:on 3:on 4:on 5:on 6:off
smb 0:off 1:off 2:off 3:off 4:off 5:off 6:off
snmpd 0:off 1:off 2:off 3:off 4:off 5:off 6:off
snmptrapd 0:off 1:off 2:off 3:off 4:off 5:off 6:off
sshd 0:off 1:off 2:on 3:on 4:on 5:on 6:off
udev-post 0:off 1:on 2:on 3:off 4:on 5:on 6:off
winbind 0:off 1:off 2:off 3:off 4:off 5:off 6:off
xinetd 0:off 1:off 2:off 3:on 4:on 5:on 6:off

xinetd based services:
 chargen-dgram: off
 chargen-stream: off
 daytime-dgram: off
 daytime-stream: off
 discard-dgram: off
 discard-stream: off
 echo-dgram: off
 echo-stream: off
 finger: off
 ntalk: off
 rsync: off
 talk: off
 tcpmux-server: off
 time-dgram: off
 time-stream: off

```

### Method-2: How To Check Running Services In systemd System

The below command helps us to check and list all running services in “systemd” system.
```
# systemctl

 UNIT LOAD ACTIVE SUB DESCRIPTION
 sys-devices-virtual-block-loop0.device loaded active plugged /sys/devices/virtual/block/loop0
 sys-devices-virtual-block-loop1.device loaded active plugged /sys/devices/virtual/block/loop1
 sys-devices-virtual-block-loop2.device loaded active plugged /sys/devices/virtual/block/loop2
 sys-devices-virtual-block-loop3.device loaded active plugged /sys/devices/virtual/block/loop3
 sys-devices-virtual-block-loop4.device loaded active plugged /sys/devices/virtual/block/loop4
 sys-devices-virtual-misc-rfkill.device loaded active plugged /sys/devices/virtual/misc/rfkill
 sys-devices-virtual-tty-ttyprintk.device loaded active plugged /sys/devices/virtual/tty/ttyprintk
 sys-module-fuse.device loaded active plugged /sys/module/fuse
 sys-subsystem-net-devices-enp0s3.device loaded active plugged 82540EM Gigabit Ethernet Controller (PRO/1000 MT Desktop Adapter)
 -.mount loaded active mounted Root Mount
 dev-hugepages.mount loaded active mounted Huge Pages File System
 dev-mqueue.mount loaded active mounted POSIX Message Queue File System
 run-user-1000-gvfs.mount loaded active mounted /run/user/1000/gvfs
 run-user-1000.mount loaded active mounted /run/user/1000
 snap-core-3887.mount loaded active mounted Mount unit for core
 snap-core-4017.mount loaded active mounted Mount unit for core
 snap-core-4110.mount loaded active mounted Mount unit for core
 snap-gping-13.mount loaded active mounted Mount unit for gping
 snap-termius\x2dapp-8.mount loaded active mounted Mount unit for termius-app
 sys-fs-fuse-connections.mount loaded active mounted FUSE Control File System
 sys-kernel-debug.mount loaded active mounted Debug File System
 acpid.path loaded active running ACPI Events Check
 cups.path loaded active running CUPS Scheduler
 systemd-ask-password-plymouth.path loaded active waiting Forward Password Requests to Plymouth Directory Watch
 systemd-ask-password-wall.path loaded active waiting Forward Password Requests to Wall Directory Watch
 init.scope loaded active running System and Service Manager
 session-c2.scope loaded active running Session c2 of user magi
 accounts-daemon.service loaded active running Accounts Service
 acpid.service loaded active running ACPI event daemon
 anacron.service loaded active running Run anacron jobs
 apache2.service loaded active running The Apache HTTP Server
 apparmor.service loaded active exited AppArmor initialization
 apport.service loaded active exited LSB: automatic crash report generation
 aptik-battery-monitor.service loaded active running LSB: start/stop the aptik battery monitor daemon
 atop.service loaded active running Atop advanced performance monitor
 atopacct.service loaded active running Atop process accounting daemon
 avahi-daemon.service loaded active running Avahi mDNS/DNS-SD Stack
 colord.service loaded active running Manage, Install and Generate Color Profiles
 console-setup.service loaded active exited Set console font and keymap
 cron.service loaded active running Regular background program processing daemon
 cups-browsed.service loaded active running Make remote CUPS printers available locally
 cups.service loaded active running CUPS Scheduler
 dbus.service loaded active running D-Bus System Message Bus
 postfix.service loaded active exited Postfix Mail Transport Agent

```

  * **`UNIT`** Unit describe about the corresponding systemd unit name.
  * **`LOAD`** This describes whether the corresponding unit currently loaded in memory or not.
  * **`ACTIVE`** It’s indicate whether the unit is active or not.
  * **`SUB`** It’s indicate whether the unit is running state or not.
  * **`DESCRIPTION`** A short description about the unit.



The below option help you to list units based on the type.
```
# systemctl list-units --type service
 UNIT LOAD ACTIVE SUB DESCRIPTION
 accounts-daemon.service loaded active running Accounts Service
 acpid.service loaded active running ACPI event daemon
 anacron.service loaded active running Run anacron jobs
 apache2.service loaded active running The Apache HTTP Server
 apparmor.service loaded active exited AppArmor initialization
 apport.service loaded active exited LSB: automatic crash report generation
 aptik-battery-monitor.service loaded active running LSB: start/stop the aptik battery monitor daemon
 atop.service loaded active running Atop advanced performance monitor
 atopacct.service loaded active running Atop process accounting daemon
 avahi-daemon.service loaded active running Avahi mDNS/DNS-SD Stack
 colord.service loaded active running Manage, Install and Generate Color Profiles
 console-setup.service loaded active exited Set console font and keymap
 cron.service loaded active running Regular background program processing daemon
 cups-browsed.service loaded active running Make remote CUPS printers available locally
 cups.service loaded active running CUPS Scheduler
 dbus.service loaded active running D-Bus System Message Bus
 fwupd.service loaded active running Firmware update daemon
 [email protected] loaded active running Getty on tty1
 grub-common.service loaded active exited LSB: Record successful boot for GRUB
 irqbalance.service loaded active running LSB: daemon to balance interrupts for SMP systems
 keyboard-setup.service loaded active exited Set the console keyboard layout
 kmod-static-nodes.service loaded active exited Create list of required static device nodes for the current kernel

```

The below option help you to list units based on the state. It’s similar to the above output but straight forward.
```
# systemctl list-unit-files --type service

UNIT FILE STATE
accounts-daemon.service enabled
acpid.service disabled
alsa-restore.service static
alsa-state.service static
alsa-utils.service masked
anacron-resume.service enabled
anacron.service enabled
apache-htcacheclean.service disabled
[email protected] disabled
apache2.service enabled
[email protected] disabled
apparmor.service enabled
[email protected] static
apport.service generated
apt-daily-upgrade.service static
apt-daily.service static
aptik-battery-monitor.service generated
atop.service enabled
atopacct.service enabled
[email protected] enabled
avahi-daemon.service enabled
bluetooth.service enabled

```

Run the following command to view the particular service status.
```
# systemctl | grep apache2
 apache2.service loaded active running The Apache HTTP Server

```

Alternatively use the following command to view the particular service status.
```
# systemctl status apache2
● apache2.service - The Apache HTTP Server
 Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
 Drop-In: /lib/systemd/system/apache2.service.d
 └─apache2-systemd.conf
 Active: active (running) since Tue 2018-03-06 12:34:09 IST; 8min ago
 Process: 2786 ExecReload=/usr/sbin/apachectl graceful (code=exited, status=0/SUCCESS)
 Main PID: 1171 (apache2)
 Tasks: 55 (limit: 4915)
 CGroup: /system.slice/apache2.service
 ├─1171 /usr/sbin/apache2 -k start
 ├─2790 /usr/sbin/apache2 -k start
 └─2791 /usr/sbin/apache2 -k start

Mar 06 12:34:08 magi-VirtualBox systemd[1]: Starting The Apache HTTP Server...
Mar 06 12:34:09 magi-VirtualBox apachectl[1089]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 10.0.2.15. Set the 'ServerName' directive globally to suppre
Mar 06 12:34:09 magi-VirtualBox systemd[1]: Started The Apache HTTP Server.
Mar 06 12:39:10 magi-VirtualBox systemd[1]: Reloading The Apache HTTP Server.
Mar 06 12:39:10 magi-VirtualBox apachectl[2786]: AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using fe80::7929:4ed1:279f:4d65. Set the 'ServerName' directive gl
Mar 06 12:39:10 magi-VirtualBox systemd[1]: Reloaded The Apache HTTP Server.

```

Run the following command to view only running services in the system.
```
# systemctl | grep running
 acpid.path loaded active running ACPI Events Check
 cups.path loaded active running CUPS Scheduler
 init.scope loaded active running System and Service Manager
 session-c2.scope loaded active running Session c2 of user magi
 accounts-daemon.service loaded active running Accounts Service
 acpid.service loaded active running ACPI event daemon
 apache2.service loaded active running The Apache HTTP Server
 aptik-battery-monitor.service loaded active running LSB: start/stop the aptik battery monitor daemon
 atop.service loaded active running Atop advanced performance monitor
 atopacct.service loaded active running Atop process accounting daemon
 avahi-daemon.service loaded active running Avahi mDNS/DNS-SD Stack
 colord.service loaded active running Manage, Install and Generate Color Profiles
 cron.service loaded active running Regular background program processing daemon
 cups-browsed.service loaded active running Make remote CUPS printers available locally
 cups.service loaded active running CUPS Scheduler
 dbus.service loaded active running D-Bus System Message Bus
 fwupd.service loaded active running Firmware update daemon
 [email protected] loaded active running Getty on tty1
 irqbalance.service loaded active running LSB: daemon to balance interrupts for SMP systems
 lightdm.service loaded active running Light Display Manager
 ModemManager.service loaded active running Modem Manager
 NetworkManager.service loaded active running Network Manager
 polkit.service loaded active running Authorization Manager

```

Use the following command to view the list of running services enabled in boot.
```
# systemctl list-unit-files | grep enabled
acpid.path enabled
cups.path enabled
accounts-daemon.service enabled
anacron-resume.service enabled
anacron.service enabled
apache2.service enabled
apparmor.service enabled
atop.service enabled
atopacct.service enabled
[email protected] enabled
avahi-daemon.service enabled
bluetooth.service enabled
console-setup.service enabled
cron.service enabled
cups-browsed.service enabled
cups.service enabled
display-manager.service enabled
dns-clean.service enabled
friendly-recovery.service enabled
[email protected] enabled
gpu-manager.service enabled
keyboard-setup.service enabled
lightdm.service enabled
ModemManager.service enabled
network-manager.service enabled
networking.service enabled
NetworkManager-dispatcher.service enabled
NetworkManager-wait-online.service enabled
NetworkManager.service enabled

```

systemd-cgtop show top control groups by their resource usage such as tasks, CPU, Memory, Input, and Output.
```
# systemd-cgtop

Control Group Tasks %CPU Memory Input/s Output/s
/ - - 1.5G - -
/init.scope 1 - - - -
/system.slice 153 - - - -
/system.slice/ModemManager.service 3 - - - -
/system.slice/NetworkManager.service 4 - - - -
/system.slice/accounts-daemon.service 3 - - - -
/system.slice/acpid.service 1 - - - -
/system.slice/apache2.service 55 - - - -
/system.slice/aptik-battery-monitor.service 1 - - - -
/system.slice/atop.service 1 - - - -
/system.slice/atopacct.service 1 - - - -
/system.slice/avahi-daemon.service 2 - - - -
/system.slice/colord.service 3 - - - -
/system.slice/cron.service 1 - - - -
/system.slice/cups-browsed.service 3 - - - -
/system.slice/cups.service 2 - - - -
/system.slice/dbus.service 6 - - - -
/system.slice/fwupd.service 5 - - - -
/system.slice/irqbalance.service 1 - - - -
/system.slice/lightdm.service 7 - - - -
/system.slice/polkit.service 3 - - - -
/system.slice/repowerd.service 14 - - - -
/system.slice/rsyslog.service 4 - - - -
/system.slice/rtkit-daemon.service 3 - - - -
/system.slice/snapd.service 8 - - - -
/system.slice/system-getty.slice 1 - - - -

```

Also we can check the running services using pstree command (Output from SysVinit system).
```
# pstree
init-|-crond
 |-httpd---2*[httpd]
 |-kthreadd/99149---khelper/99149
 |-2*[mingetty]
 |-mysqld_safe---mysqld---9*[{mysqld}]
 |-rsyslogd---3*[{rsyslogd}]
 |-saslauthd---saslauthd
 |-2*[sendmail]
 |-sshd---sshd---bash---pstree
 |-udevd
 `-xinetd

```

Also we can check the running services using pstree command (Output from systemd system).
```
# pstree
systemd─┬─ModemManager─┬─{gdbus}
 │ └─{gmain}
 ├─NetworkManager─┬─dhclient
 │ ├─{gdbus}
 │ └─{gmain}
 ├─accounts-daemon─┬─{gdbus}
 │ └─{gmain}
 ├─acpid
 ├─agetty
 ├─anacron
 ├─apache2───2*[apache2───26*[{apache2}]]
 ├─aptd───{gmain}
 ├─aptik-battery-m
 ├─atop
 ├─atopacctd
 ├─avahi-daemon───avahi-daemon
 ├─colord─┬─{gdbus}
 │ └─{gmain}
 ├─cron
 ├─cups-browsed─┬─{gdbus}
 │ └─{gmain}
 ├─cupsd
 ├─dbus-daemon
 ├─fwupd─┬─{GUsbEventThread}
 │ ├─{fwupd}
 │ ├─{gdbus}
 │ └─{gmain}
 ├─gnome-keyring-d─┬─{gdbus}
 │ ├─{gmain}
 │ └─{timer}

```

### Method-3: How To Check Running Services In systemd System using chkservice

chkservice is a new tool for managing systemd units in terminal. It requires super user privileges to manage the units.
```
# chkservice

```

![][1]

To view help page, hit `?` button. This will shows you available options to manage the systemd services.
![][2]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-1.png
[2]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-2.png
