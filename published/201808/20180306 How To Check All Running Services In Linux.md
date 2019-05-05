如何查看 Linux 中所有正在运行的服务
======

有许多方法和工具可以查看 Linux 中所有正在运行的服务。大多数管理员会在 System V（SysV）初始化系统中使用 `service service-name status` 或 `/etc/init.d/service-name status`，而在 systemd 初始化系统中使用 `systemctl status service-name`。

以上命令可以清楚地显示该服务是否在服务器上运行，这也是每个 Linux 管理员都该知道的非常简单和基础的命令。

如果你对系统环境并不熟悉，也不清楚系统在运行哪些服务，你会如何检查？

是的，我们的确有必要这样检查一下。这将有助于我们了解系统上运行了什么服务，以及哪些是必要的、哪些需要被禁用。

init（<ruby>初始化<rt>initialization</rt></ruby>的简称）是在系统启动期间运行的第一个进程。`init` 是一个守护进程，它将持续运行直至关机。

大多数 Linux 发行版都使用如下的初始化系统之一：

- System V 是更老的初始化系统
- Upstart 是一个基于事件的传统的初始化系统的替代品
- systemd 是新的初始化系统，它已经被大多数最新的 Linux 发行版所采用

### 什么是 System V（SysV）

SysV（意即 System V） 初始化系统是早期传统的初始化系统和系统管理器。由于 sysVinit 系统上一些长期悬而未决的问题，大多数最新的发行版都适用于 systemd 系统。

### 什么是 Upstart 初始化系统

Upstart 是一个基于事件的 /sbin/init 的替代品，它控制在启动时的任务和服务的开始，在关机时停止它们，并在系统运行时监控它们。

它最初是为 Ubuntu 发行版开发的，但其是以适合所有 Linux 发行版的开发为目标的，以替换过时的 System-V 初始化系统。

### 什么是 systemd

systemd 是一个新的初始化系统以及系统管理器，它已成为大多数 Linux 发行版中非常流行且广泛适应的新的标准初始化系统。`systemctl` 是一个 systemd 管理工具，它可以帮助我们管理 systemd 系统。

### 方法一：如何在 System V（SysV）系统中查看运行的服务

以下命令可以帮助我们列出  System V（SysV） 系统中所有正在运行的服务。

如果服务很多，我建议使用文件查看命令，如 `less`、`more` 等，以便得到清晰的结果。

```
# service --status-all
或
# service --status-all | more
或
# service --status-all | less
```

```
abrt-ccpp hook is installed
abrtd (pid  2131) is running...
abrt-dump-oops is stopped
acpid (pid  1958) is running...
atd (pid  2164) is running...
auditd (pid  1731) is running...
Frequency scaling enabled using ondemand governor
crond (pid  2153) is running...
hald (pid  1967) is running...
htcacheclean is stopped
httpd is stopped
Table: filter
Chain INPUT (policy ACCEPT)
num  target     prot opt source               destination
1    ACCEPT     all      ::/0                 ::/0                state RELATED,ESTABLISHED
2    ACCEPT     icmpv6    ::/0                 ::/0
3    ACCEPT     all      ::/0                 ::/0
4    ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:80
5    ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:21
6    ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:22
7    ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:25
8    ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:2082
9    ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:2086
10   ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:2083
11   ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:2087
12   ACCEPT     tcp      ::/0                 ::/0                state NEW tcp dpt:10000
13   REJECT     all      ::/0                 ::/0                reject-with icmp6-adm-prohibited

Chain FORWARD (policy ACCEPT)
num  target     prot opt source               destination
1    REJECT     all      ::/0                 ::/0                reject-with icmp6-adm-prohibited

Chain OUTPUT (policy ACCEPT)
num  target     prot opt source               destination

iptables: Firewall is not running.
irqbalance (pid 1826) is running...
Kdump is operational
lvmetad is stopped
mdmonitor is stopped
messagebus (pid  1929) is running...
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
portreserve (pid  1749) is running...
master (pid  2107) is running...
Process accounting is disabled.
quota_nld is stopped
rdisc is stopped
rngd is stopped
rpcbind (pid  1840) is running...
rsyslogd (pid  1756) is running...
sandbox is stopped
saslauthd is stopped
smartd is stopped
openssh-daemon (pid  9859) is running...
svnserve is stopped
vsftpd (pid 4008) is running...
xinetd (pid  2031) is running...
zabbix_agentd (pid 2150 2149 2148 2147 2146 2140) is running...
```

执行以下命令，可以只查看正在运行的服务：

```
# service --status-all | grep running
```

```
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

运行以下命令以查看指定服务的状态：

```
# service --status-all | grep httpd
httpd (pid 627) is running...
```

或者，使用以下命令也可以查看指定服务的状态：

```
# service httpd status
httpd (pid 627) is running...
```

使用以下命令查看系统启动时哪些服务会被启用：

```
# chkconfig --list
```

```
crond           0:off   1:off   2:on    3:on    4:on    5:on    6:off
htcacheclean    0:off   1:off   2:off   3:off   4:off   5:off   6:off
httpd           0:off   1:off   2:off   3:on    4:off   5:off   6:off
ip6tables       0:off   1:off   2:on    3:off   4:on    5:on    6:off
iptables        0:off   1:off   2:on    3:on    4:on    5:on    6:off
modules_dep     0:off   1:off   2:on    3:on    4:on    5:on    6:off
mysqld          0:off   1:off   2:on    3:on    4:on    5:on    6:off
named           0:off   1:off   2:off   3:off   4:off   5:off   6:off
netconsole      0:off   1:off   2:off   3:off   4:off   5:off   6:off
netfs           0:off   1:off   2:off   3:off   4:on    5:on    6:off
network         0:off   1:off   2:on    3:on    4:on    5:on    6:off
nmb             0:off   1:off   2:off   3:off   4:off   5:off   6:off
nscd            0:off   1:off   2:off   3:off   4:off   5:off   6:off
portreserve     0:off   1:off   2:on    3:off   4:on    5:on    6:off
quota_nld       0:off   1:off   2:off   3:off   4:off   5:off   6:off
rdisc           0:off   1:off   2:off   3:off   4:off   5:off   6:off
restorecond     0:off   1:off   2:off   3:off   4:off   5:off   6:off
rpcbind         0:off   1:off   2:on    3:off   4:on    5:on    6:off
rsyslog         0:off   1:off   2:on    3:on    4:on    5:on    6:off
saslauthd       0:off   1:off   2:off   3:on    4:off   5:off   6:off
sendmail        0:off   1:off   2:on    3:on    4:on    5:on    6:off
smb             0:off   1:off   2:off   3:off   4:off   5:off   6:off
snmpd           0:off   1:off   2:off   3:off   4:off   5:off   6:off
snmptrapd       0:off   1:off   2:off   3:off   4:off   5:off   6:off
sshd            0:off   1:off   2:on    3:on    4:on    5:on    6:off
udev-post       0:off   1:on    2:on    3:off   4:on    5:on    6:off
winbind         0:off   1:off   2:off   3:off   4:off   5:off   6:off
xinetd          0:off   1:off   2:off   3:on    4:on    5:on    6:off

xinetd based services:
        chargen-dgram:  off
        chargen-stream: off
        daytime-dgram:  off
        daytime-stream: off
        discard-dgram:  off
        discard-stream: off
        echo-dgram:     off
        echo-stream:    off
        finger:         off
        ntalk:          off
        rsync:          off
        talk:           off
        tcpmux-server:  off
        time-dgram:     off
        time-stream:    off
```

### 方法二：如何在 System V（SysV）系统中查看运行的服务

另外一种在 Linux 系统上列出运行的服务的方法是使用 initctl 命令：

```
# initctl list
rc stop/waiting
tty (/dev/tty3) start/running, process 1740
tty (/dev/tty2) start/running, process 1738
tty (/dev/tty1) start/running, process 1736
tty (/dev/tty6) start/running, process 1746
tty (/dev/tty5) start/running, process 1744
tty (/dev/tty4) start/running, process 1742
plymouth-shutdown stop/waiting
control-alt-delete stop/waiting
rcS-emergency stop/waiting
readahead-collector stop/waiting
kexec-disable stop/waiting
quit-plymouth stop/waiting
rcS stop/waiting
prefdm stop/waiting
init-system-dbus stop/waiting
ck-log-system-restart stop/waiting
readahead stop/waiting
ck-log-system-start stop/waiting
splash-manager stop/waiting
start-ttys stop/waiting
readahead-disable-services stop/waiting
ck-log-system-stop stop/waiting
rcS-sulogin stop/waiting
serial stop/waiting
```

### 方法三：如何在 systemd 系统中查看运行的服务

以下命令帮助我们列出 systemd 系统中所有服务：

```
# systemctl
  UNIT                                                                                     LOAD   ACTIVE SUB       DESCRIPTION                                                      
  sys-devices-virtual-block-loop0.device                                                   loaded active plugged   /sys/devices/virtual/block/loop0                                 
  sys-devices-virtual-block-loop1.device                                                   loaded active plugged   /sys/devices/virtual/block/loop1                                 
  sys-devices-virtual-block-loop2.device                                                   loaded active plugged   /sys/devices/virtual/block/loop2                                 
  sys-devices-virtual-block-loop3.device                                                   loaded active plugged   /sys/devices/virtual/block/loop3                                 
  sys-devices-virtual-block-loop4.device                                                   loaded active plugged   /sys/devices/virtual/block/loop4                                 
  sys-devices-virtual-misc-rfkill.device                                                   loaded active plugged   /sys/devices/virtual/misc/rfkill                                 
  sys-devices-virtual-tty-ttyprintk.device                                                 loaded active plugged   /sys/devices/virtual/tty/ttyprintk                               
  sys-module-fuse.device                                                                   loaded active plugged   /sys/module/fuse                                                 
  sys-subsystem-net-devices-enp0s3.device                                                  loaded active plugged   82540EM Gigabit Ethernet Controller (PRO/1000 MT Desktop Adapter)
  -.mount                                                                                  loaded active mounted   Root Mount                                                       
  dev-hugepages.mount                                                                      loaded active mounted   Huge Pages File System                                           
  dev-mqueue.mount                                                                         loaded active mounted   POSIX Message Queue File System                                  
  run-user-1000-gvfs.mount                                                                 loaded active mounted   /run/user/1000/gvfs                                              
  run-user-1000.mount                                                                      loaded active mounted   /run/user/1000                                                   
  snap-core-3887.mount                                                                     loaded active mounted   Mount unit for core                                              
  snap-core-4017.mount                                                                     loaded active mounted   Mount unit for core                                              
  snap-core-4110.mount                                                                     loaded active mounted   Mount unit for core                                              
  snap-gping-13.mount                                                                      loaded active mounted   Mount unit for gping                                             
  snap-termius\x2dapp-8.mount                                                              loaded active mounted   Mount unit for termius-app                                       
  sys-fs-fuse-connections.mount                                                            loaded active mounted   FUSE Control File System                                         
  sys-kernel-debug.mount                                                                   loaded active mounted   Debug File System                                                
  acpid.path                                                                               loaded active running   ACPI Events Check                                                
  cups.path                                                                                loaded active running   CUPS Scheduler                                                   
  systemd-ask-password-plymouth.path                                                       loaded active waiting   Forward Password Requests to Plymouth Directory Watch            
  systemd-ask-password-wall.path                                                           loaded active waiting   Forward Password Requests to Wall Directory Watch                
  init.scope                                                                               loaded active running   System and Service Manager                                       
  session-c2.scope                                                                         loaded active running   Session c2 of user magi                                          
  accounts-daemon.service                                                                  loaded active running   Accounts Service                                                 
  acpid.service                                                                            loaded active running   ACPI event daemon                                                
  anacron.service                                                                          loaded active running   Run anacron jobs                                                 
  apache2.service                                                                          loaded active running   The Apache HTTP Server                                           
  apparmor.service                                                                         loaded active exited    AppArmor initialization                                          
  apport.service                                                                           loaded active exited    LSB: automatic crash report generation                           
  aptik-battery-monitor.service                                                            loaded active running   LSB: start/stop the aptik battery monitor daemon                 
  atop.service                                                                             loaded active running   Atop advanced performance monitor                                
  atopacct.service                                                                         loaded active running   Atop process accounting daemon                                   
  avahi-daemon.service                                                                     loaded active running   Avahi mDNS/DNS-SD Stack                                          
  colord.service                                                                           loaded active running   Manage, Install and Generate Color Profiles                      
  console-setup.service                                                                    loaded active exited    Set console font and keymap                                      
  cron.service                                                                             loaded active running   Regular background program processing daemon                     
  cups-browsed.service                                                                     loaded active running   Make remote CUPS printers available locally                      
  cups.service                                                                             loaded active running   CUPS Scheduler                                                   
  dbus.service                                                                             loaded active running   D-Bus System Message Bus                                         
  postfix.service                                                                          loaded active exited    Postfix Mail Transport Agent                        
```
  * `UNIT` 相应的 systemd 单元名称
  * `LOAD` 相应的单元是否被加载到内存中
  * `ACTIVE` 该单元是否处于活动状态
  * `SUB` 该单元是否处于运行状态（LCTT 译注：是较于 ACTIVE 更加详细的状态描述，不同的单元类型有不同的状态。）
  * `DESCRIPTION` 关于该单元的简短描述

以下选项可根据类型列出单元：

```
# systemctl list-units --type service
  UNIT                               LOAD   ACTIVE SUB     DESCRIPTION                                                      
  accounts-daemon.service            loaded active running Accounts Service                                                 
  acpid.service                      loaded active running ACPI event daemon                                                
  anacron.service                    loaded active running Run anacron jobs                                                 
  apache2.service                    loaded active running The Apache HTTP Server                                           
  apparmor.service                   loaded active exited  AppArmor initialization                                          
  apport.service                     loaded active exited  LSB: automatic crash report generation                           
  aptik-battery-monitor.service      loaded active running LSB: start/stop the aptik battery monitor daemon                 
  atop.service                       loaded active running Atop advanced performance monitor                                
  atopacct.service                   loaded active running Atop process accounting daemon                                   
  avahi-daemon.service               loaded active running Avahi mDNS/DNS-SD Stack                                          
  colord.service                     loaded active running Manage, Install and Generate Color Profiles                      
  console-setup.service              loaded active exited  Set console font and keymap                                      
  cron.service                       loaded active running Regular background program processing daemon                     
  cups-browsed.service               loaded active running Make remote CUPS printers available locally                      
  cups.service                       loaded active running CUPS Scheduler                                                   
  dbus.service                       loaded active running D-Bus System Message Bus                                         
  fwupd.service                      loaded active running Firmware update daemon                                           
  getty@tty1.service                 loaded active running Getty on tty1                                                    
  grub-common.service                loaded active exited  LSB: Record successful boot for GRUB                             
  irqbalance.service                 loaded active running LSB: daemon to balance interrupts for SMP systems                
  keyboard-setup.service             loaded active exited  Set the console keyboard layout                                  
  kmod-static-nodes.service          loaded active exited  Create list of required static device nodes for the current kernel
```

以下选项可帮助您根据状态列出单位，输出与前例类似但更直截了当：

```
# systemctl list-unit-files --type service

UNIT FILE                                  STATE   
accounts-daemon.service                    enabled 
acpid.service                              disabled
alsa-restore.service                       static  
alsa-state.service                         static  
alsa-utils.service                         masked  
anacron-resume.service                     enabled 
anacron.service                            enabled 
apache-htcacheclean.service                disabled
apache-htcacheclean@.service               disabled
apache2.service                            enabled 
apache2@.service                           disabled
apparmor.service                           enabled 
apport-forward@.service                    static  
apport.service                             generated
apt-daily-upgrade.service                  static  
apt-daily.service                          static  
aptik-battery-monitor.service              generated
atop.service                               enabled 
atopacct.service                           enabled 
autovt@.service                            enabled 
avahi-daemon.service                       enabled 
bluetooth.service                          enabled 
```

运行以下命令以查看指定服务的状态：

```
# systemctl | grep apache2
  apache2.service                                                                          loaded active running   The Apache HTTP Server
```

或者，使用以下命令也可查看指定服务的状态：

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

执行以下命令，只查看正在运行的服务：
```
# systemctl | grep running
  acpid.path                                                                               loaded active running   ACPI Events Check                                                
  cups.path                                                                                loaded active running   CUPS Scheduler                                                   
  init.scope                                                                               loaded active running   System and Service Manager                                       
  session-c2.scope                                                                         loaded active running   Session c2 of user magi                                          
  accounts-daemon.service                                                                  loaded active running   Accounts Service                                                 
  acpid.service                                                                            loaded active running   ACPI event daemon                                                
  apache2.service                                                                          loaded active running   The Apache HTTP Server                                           
  aptik-battery-monitor.service                                                            loaded active running   LSB: start/stop the aptik battery monitor daemon                 
  atop.service                                                                             loaded active running   Atop advanced performance monitor                                
  atopacct.service                                                                         loaded active running   Atop process accounting daemon                                   
  avahi-daemon.service                                                                     loaded active running   Avahi mDNS/DNS-SD Stack                                          
  colord.service                                                                           loaded active running   Manage, Install and Generate Color Profiles                      
  cron.service                                                                             loaded active running   Regular background program processing daemon                     
  cups-browsed.service                                                                     loaded active running   Make remote CUPS printers available locally                      
  cups.service                                                                             loaded active running   CUPS Scheduler                                                   
  dbus.service                                                                             loaded active running   D-Bus System Message Bus                                         
  fwupd.service                                                                            loaded active running   Firmware update daemon                                           
  getty@tty1.service                                                                       loaded active running   Getty on tty1                                                    
  irqbalance.service                                                                       loaded active running   LSB: daemon to balance interrupts for SMP systems                
  lightdm.service                                                                          loaded active running   Light Display Manager                                            
  ModemManager.service                                                                     loaded active running   Modem Manager                                                    
  NetworkManager.service                                                                   loaded active running   Network Manager                                                  
  polkit.service                                                                           loaded active running   Authorization Manager                                 
```

使用以下命令查看系统启动时会被启用的服务列表：

```
# systemctl list-unit-files | grep enabled
acpid.path                                 enabled 
cups.path                                  enabled 
accounts-daemon.service                    enabled 
anacron-resume.service                     enabled 
anacron.service                            enabled 
apache2.service                            enabled 
apparmor.service                           enabled 
atop.service                               enabled 
atopacct.service                           enabled 
autovt@.service                            enabled 
avahi-daemon.service                       enabled 
bluetooth.service                          enabled 
console-setup.service                      enabled 
cron.service                               enabled 
cups-browsed.service                       enabled 
cups.service                               enabled 
display-manager.service                    enabled 
dns-clean.service                          enabled 
friendly-recovery.service                  enabled 
getty@.service                             enabled 
gpu-manager.service                        enabled 
keyboard-setup.service                     enabled 
lightdm.service                            enabled 
ModemManager.service                       enabled 
network-manager.service                    enabled 
networking.service                         enabled 
NetworkManager-dispatcher.service          enabled 
NetworkManager-wait-online.service         enabled 
NetworkManager.service                     enabled 
```

`systemd-cgtop` 按资源使用情况（任务、CPU、内存、输入和输出）列出控制组：

```
# systemd-cgtop

Control Group                                              Tasks   %CPU   Memory  Input/s Output/s
/                                                              -      -     1.5G        -        -
/init.scope                                                    1      -        -        -        -
/system.slice                                                153      -        -        -        -
/system.slice/ModemManager.service                             3      -        -        -        -
/system.slice/NetworkManager.service                           4      -        -        -        -
/system.slice/accounts-daemon.service                          3      -        -        -        -
/system.slice/acpid.service                                    1      -        -        -        -
/system.slice/apache2.service                                 55      -        -        -        -
/system.slice/aptik-battery-monitor.service                    1      -        -        -        -
/system.slice/atop.service                                     1      -        -        -        -
/system.slice/atopacct.service                                 1      -        -        -        -
/system.slice/avahi-daemon.service                             2      -        -        -        -
/system.slice/colord.service                                   3      -        -        -        -
/system.slice/cron.service                                     1      -        -        -        -
/system.slice/cups-browsed.service                             3      -        -        -        -
/system.slice/cups.service                                     2      -        -        -        -
/system.slice/dbus.service                                     6      -        -        -        -
/system.slice/fwupd.service                                    5      -        -        -        -
/system.slice/irqbalance.service                               1      -        -        -        -
/system.slice/lightdm.service                                  7      -        -        -        -
/system.slice/polkit.service                                   3      -        -        -        -
/system.slice/repowerd.service                                14      -        -        -        -
/system.slice/rsyslog.service                                  4      -        -        -        -
/system.slice/rtkit-daemon.service                             3      -        -        -        -
/system.slice/snapd.service                                    8      -        -        -        -
/system.slice/system-getty.slice                               1      -        -        -        -
```

同时，我们可以使用 `pstree` 命令（输出来自 SysVinit 系统）查看正在运行的服务：

```
# pstree
init-+-crond
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

我们还可以使用 `pstree` 命令（输出来自 systemd 系统）查看正在运行的服务：

```
# pstree
systemd─┬─ModemManager─┬─{gdbus}
        │              └─{gmain}
        ├─NetworkManager─┬─dhclient
        │                ├─{gdbus}
        │                └─{gmain}
        ├─accounts-daemon─┬─{gdbus}
        │                 └─{gmain}
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
        │        └─{gmain}
        ├─cron
        ├─cups-browsed─┬─{gdbus}
        │              └─{gmain}
        ├─cupsd
        ├─dbus-daemon
        ├─fwupd─┬─{GUsbEventThread}
        │       ├─{fwupd}
        │       ├─{gdbus}
        │       └─{gmain}
        ├─gnome-keyring-d─┬─{gdbus}
        │                 ├─{gmain}
        │                 └─{timer}
```

### 方法四：如何使用 chkservice 在 systemd 系统中查看正在运行的服务

`chkservice` 是一个管理系统单元的终端工具，需要超级用户权限。

```
# chkservice
```

![][1]

要查看帮助页面，请按下 `?` ，它将显示管理 systemd 服务的可用选项。

![][2]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-1.png
[2]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-2.png