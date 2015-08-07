systemctl 完全指南
================================================================================
Systemctl是一个systemd工具，主要负责控制systemd系统和服务管理器。

Systemd是一个系统管理守护进程、工具和库的集合，用于取代System V初始进程。Systemd的功能是用于集中管理和配置类UNIX系统。

在Linux生态系统中，Systemd被部署到了大多数的标准Linux发行版中，只有为数不多的几个发行版尚未部署。Systemd通常是所有其它守护进程的父进程，但并非总是如此。

![Manage Linux Services Using Systemctl](http://www.tecmint.com/wp-content/uploads/2015/04/Manage-Linux-Services-Using-Systemctl.jpg)

*使用Systemctl管理Linux服务*

本文旨在阐明在运行systemd的系统上“如何控制系统和服务”。

### Systemd初体验和Systemctl基础 ###

#### 1. 首先检查你的系统中是否安装有systemd并确定当前安装的版本 ####

    # systemd --version
    
    systemd 215
    +PAM +AUDIT +SELINUX +IMA +SYSVINIT +LIBCRYPTSETUP +GCRYPT +ACL +XZ -SECCOMP -APPARMOR

上例中很清楚地表明，我们安装了215版本的systemd。

#### 2. 检查systemd和systemctl的二进制文件和库文件的安装位置 ####

    # whereis systemd 
    systemd: /usr/lib/systemd /etc/systemd /usr/share/systemd /usr/share/man/man1/systemd.1.gz
    
    
    # whereis systemctl
    systemctl: /usr/bin/systemctl /usr/share/man/man1/systemctl.1.gz

#### 3. 检查systemd是否运行 ####

    # ps -eaf | grep [s]ystemd
    
    root         1     0  0 16:27 ?        00:00:00 /usr/lib/systemd/systemd --switched-root --system --deserialize 23
    root       444     1  0 16:27 ?        00:00:00 /usr/lib/systemd/systemd-journald
    root       469     1  0 16:27 ?        00:00:00 /usr/lib/systemd/systemd-udevd
    root       555     1  0 16:27 ?        00:00:00 /usr/lib/systemd/systemd-logind
    dbus       556     1  0 16:27 ?        00:00:00 /bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation

**注意**：systemd是作为父进程（PID=1）运行的。在上面带（-e）参数的ps命令输出中，选择所有进程，（-a）选择除会话前导外的所有进程，并使用（-f）参数输出完整格式列表（即 -eaf）。

也请注意上例中后随的方括号和例子中剩余部分。方括号表达式是grep的字符类表达式的一部分。

#### 4. 分析systemd启动进程 ####

    # systemd-analyze
    Startup finished in 487ms (kernel) + 2.776s (initrd) + 20.229s (userspace) = 23.493s

#### 5. 分析启动时各个进程花费的时间 ####

    # systemd-analyze blame
    
    8.565s mariadb.service
    7.991s webmin.service
    6.095s postfix.service
    4.311s httpd.service
    3.926s firewalld.service
    3.780s kdump.service
    3.238s tuned.service
    1.712s network.service
    1.394s lvm2-monitor.service
    1.126s systemd-logind.service
    ....

#### 6. 分析启动时的关键链 ####

    # systemd-analyze critical-chain
    
    The time after the unit is active or started is printed after the "@" character.
    The time the unit takes to start is printed after the "+" character.
    
    multi-user.target @20.222s
    └─mariadb.service @11.657s +8.565s
      └─network.target @11.168s
        └─network.service @9.456s +1.712s
          └─NetworkManager.service @8.858s +596ms
            └─firewalld.service @4.931s +3.926s
              └─basic.target @4.916s
                └─sockets.target @4.916s
                  └─dbus.socket @4.916s
                    └─sysinit.target @4.905s
                      └─systemd-update-utmp.service @4.864s +39ms
                        └─auditd.service @4.563s +301ms
                          └─systemd-tmpfiles-setup.service @4.485s +69ms
                            └─rhel-import-state.service @4.342s +142ms
                              └─local-fs.target @4.324s
                                └─boot.mount @4.286s +31ms
                                  └─systemd-fsck@dev-disk-by\x2duuid-79f594ad\x2da332\x2d4730\x2dbb5f\x2d85d19608096
                                    └─dev-disk-by\x2duuid-79f594ad\x2da332\x2d4730\x2dbb5f\x2d85d196080964.device @4

**重要**：Systemctl接受服务（.service），挂载点（.mount），套接口（.socket）和设备（.device）作为单元。

#### 7. 列出所有可用单元 ####

    # systemctl list-unit-files
    
    UNIT FILE                                   STATE   
    proc-sys-fs-binfmt_misc.automount           static  
    dev-hugepages.mount                         static  
    dev-mqueue.mount                            static  
    proc-sys-fs-binfmt_misc.mount               static  
    sys-fs-fuse-connections.mount               static  
    sys-kernel-config.mount                     static  
    sys-kernel-debug.mount                      static  
    tmp.mount                                   disabled
    brandbot.path                               disabled
    .....

#### 8. 列出所有运行中单元 ####

    # systemctl list-units
    
    UNIT                                        LOAD   ACTIVE SUB       DESCRIPTION
    proc-sys-fs-binfmt_misc.automount           loaded active waiting   Arbitrary Executable File Formats File Syste
    sys-devices-pc...0-1:0:0:0-block-sr0.device loaded active plugged   VBOX_CD-ROM
    sys-devices-pc...:00:03.0-net-enp0s3.device loaded active plugged   PRO/1000 MT Desktop Adapter
    sys-devices-pc...00:05.0-sound-card0.device loaded active plugged   82801AA AC'97 Audio Controller
    sys-devices-pc...:0:0-block-sda-sda1.device loaded active plugged   VBOX_HARDDISK
    sys-devices-pc...:0:0-block-sda-sda2.device loaded active plugged   LVM PV Qzyo3l-qYaL-uRUa-Cjuk-pljo-qKtX-VgBQ8
    sys-devices-pc...0-2:0:0:0-block-sda.device loaded active plugged   VBOX_HARDDISK
    sys-devices-pl...erial8250-tty-ttyS0.device loaded active plugged   /sys/devices/platform/serial8250/tty/ttyS0
    sys-devices-pl...erial8250-tty-ttyS1.device loaded active plugged   /sys/devices/platform/serial8250/tty/ttyS1
    sys-devices-pl...erial8250-tty-ttyS2.device loaded active plugged   /sys/devices/platform/serial8250/tty/ttyS2
    sys-devices-pl...erial8250-tty-ttyS3.device loaded active plugged   /sys/devices/platform/serial8250/tty/ttyS3
    sys-devices-virtual-block-dm\x2d0.device    loaded active plugged   /sys/devices/virtual/block/dm-0
    sys-devices-virtual-block-dm\x2d1.device    loaded active plugged   /sys/devices/virtual/block/dm-1
    sys-module-configfs.device                  loaded active plugged   /sys/module/configfs
    ...

#### 9. 列出所有失败单元 ####

    # systemctl --failed
    
    UNIT          LOAD   ACTIVE SUB    DESCRIPTION
    kdump.service loaded failed failed Crash recovery kernel arming
    
    LOAD   = Reflects whether the unit definition was properly loaded.
    ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
    SUB    = The low-level unit activation state, values depend on unit type.
    
    1 loaded units listed. Pass --all to see loaded but inactive units, too.
    To show all installed unit files use 'systemctl list-unit-files'.

#### 10. 检查某个单元（如 cron.service）是否启用 ####

    # systemctl is-enabled crond.service
    
    enabled

#### 11. 检查某个单元或服务是否运行 ####

    # systemctl status firewalld.service
    
    firewalld.service - firewalld - dynamic firewall daemon
       Loaded: loaded (/usr/lib/systemd/system/firewalld.service; enabled)
       Active: active (running) since Tue 2015-04-28 16:27:55 IST; 34min ago
     Main PID: 549 (firewalld)
       CGroup: /system.slice/firewalld.service
               └─549 /usr/bin/python -Es /usr/sbin/firewalld --nofork --nopid
    
    Apr 28 16:27:51 tecmint systemd[1]: Starting firewalld - dynamic firewall daemon...
    Apr 28 16:27:55 tecmint systemd[1]: Started firewalld - dynamic firewall daemon.

### 使用Systemctl控制并管理服务 ###

#### 12. 列出所有服务（包括启用的和禁用的） ####

    # systemctl list-unit-files --type=service
    
    UNIT FILE                                   STATE   
    arp-ethers.service                          disabled
    auditd.service                              enabled 
    autovt@.service                             disabled
    blk-availability.service                    disabled
    brandbot.service                            static  
    collectd.service                            disabled
    console-getty.service                       disabled
    console-shell.service                       disabled
    cpupower.service                            disabled
    crond.service                               enabled 
    dbus-org.fedoraproject.FirewallD1.service   enabled 
    ....

#### 13. Linux中如何启动、重启、停止、重载服务以及检查服务（如 httpd.service）状态 ####

    # systemctl start httpd.service
    # systemctl restart httpd.service
    # systemctl stop httpd.service
    # systemctl reload httpd.service
    # systemctl status httpd.service
    
    httpd.service - The Apache HTTP Server
       Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled)
       Active: active (running) since Tue 2015-04-28 17:21:30 IST; 6s ago
      Process: 2876 ExecStop=/bin/kill -WINCH ${MAINPID} (code=exited, status=0/SUCCESS)
     Main PID: 2881 (httpd)
       Status: "Processing requests..."
       CGroup: /system.slice/httpd.service
               ├─2881 /usr/sbin/httpd -DFOREGROUND
               ├─2884 /usr/sbin/httpd -DFOREGROUND
               ├─2885 /usr/sbin/httpd -DFOREGROUND
               ├─2886 /usr/sbin/httpd -DFOREGROUND
               ├─2887 /usr/sbin/httpd -DFOREGROUND
               └─2888 /usr/sbin/httpd -DFOREGROUND
    
    Apr 28 17:21:30 tecmint systemd[1]: Starting The Apache HTTP Server...
    Apr 28 17:21:30 tecmint httpd[2881]: AH00558: httpd: Could not reliably determine the server's fully q...ssage
    Apr 28 17:21:30 tecmint systemd[1]: Started The Apache HTTP Server.
    Hint: Some lines were ellipsized, use -l to show in full.

**注意**：当我们使用systemctl的start，restart，stop和reload命令时，我们不会从终端获取到任何输出内容，只有status命令可以打印输出。

#### 14. 如何激活服务并在启动时启用或禁用服务（即系统启动时自动启动服务） ####

    # systemctl is-active httpd.service
    # systemctl enable httpd.service
    # systemctl disable httpd.service

#### 15. 如何屏蔽（让它不能启动）或显示服务（如 httpd.service） ####

    # systemctl mask httpd.service
    ln -s '/dev/null' '/etc/systemd/system/httpd.service'
    
    # systemctl unmask httpd.service
    rm '/etc/systemd/system/httpd.service'

#### 16. 使用systemctl命令杀死服务 ####

    # systemctl kill httpd
    # systemctl status httpd
    
    httpd.service - The Apache HTTP Server
       Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled)
       Active: failed (Result: exit-code) since Tue 2015-04-28 18:01:42 IST; 28min ago
     Main PID: 2881 (code=exited, status=0/SUCCESS)
       Status: "Total requests: 0; Current requests/sec: 0; Current traffic:   0 B/sec"
    
    Apr 28 17:37:29 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:29 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:39 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:39 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:49 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:49 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:59 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 17:37:59 tecmint systemd[1]: httpd.service: Got notification message from PID 2881, but recepti...bled.
    Apr 28 18:01:42 tecmint systemd[1]: httpd.service: control process exited, code=exited status=226
    Apr 28 18:01:42 tecmint systemd[1]: Unit httpd.service entered failed state.
    Hint: Some lines were ellipsized, use -l to show in full.

### 使用Systemctl控制并管理挂载点 ###

#### 17. 列出所有系统挂载点 ####

    # systemctl list-unit-files --type=mount
    
    UNIT FILE                     STATE   
    dev-hugepages.mount           static  
    dev-mqueue.mount              static  
    proc-sys-fs-binfmt_misc.mount static  
    sys-fs-fuse-connections.mount static  
    sys-kernel-config.mount       static  
    sys-kernel-debug.mount        static  
    tmp.mount                     disabled

#### 18. 挂载、卸载、重新挂载、重载系统挂载点并检查系统中挂载点状态 ####

    # systemctl start tmp.mount
    # systemctl stop tmp.mount
    # systemctl restart tmp.mount
    # systemctl reload tmp.mount
    # systemctl status tmp.mount
    
    tmp.mount - Temporary Directory
       Loaded: loaded (/usr/lib/systemd/system/tmp.mount; disabled)
       Active: active (mounted) since Tue 2015-04-28 17:46:06 IST; 2min 48s ago
        Where: /tmp
         What: tmpfs
         Docs: man:hier(7)
    
    http://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
    
      Process: 3908 ExecMount=/bin/mount tmpfs /tmp -t tmpfs -o mode=1777,strictatime (code=exited, status=0/SUCCESS)
    
    Apr 28 17:46:06 tecmint systemd[1]: Mounting Temporary Directory...
    Apr 28 17:46:06 tecmint systemd[1]: tmp.mount: Directory /tmp to mount over is not empty, mounting anyway.
    Apr 28 17:46:06 tecmint systemd[1]: Mounted Temporary Directory.

#### 19. 在启动时激活、启用或禁用挂载点（系统启动时自动挂载） ####

    # systemctl is-active tmp.mount
    # systemctl enable tmp.mount
    # systemctl disable  tmp.mount

#### 20. 在Linux中屏蔽（让它不能启用）或可见挂载点 ####

    # systemctl mask tmp.mount
    
    ln -s '/dev/null' '/etc/systemd/system/tmp.mount'
    
    # systemctl unmask tmp.mount
    
    rm '/etc/systemd/system/tmp.mount'
    
### 使用Systemctl控制并管理套接口 ###

#### 21. 列出所有可用系统套接口 ####

    # systemctl list-unit-files --type=socket
    
    UNIT FILE                    STATE   
    dbus.socket                  static  
    dm-event.socket              enabled 
    lvm2-lvmetad.socket          enabled 
    rsyncd.socket                disabled
    sshd.socket                  disabled
    syslog.socket                static  
    systemd-initctl.socket       static  
    systemd-journald.socket      static  
    systemd-shutdownd.socket     static  
    systemd-udevd-control.socket static  
    systemd-udevd-kernel.socket  static  
    
    11 unit files listed.

#### 22. 在Linux中启动、重启、停止、重载套接口并检查其状态####

    # systemctl start cups.socket
    # systemctl restart cups.socket
    # systemctl stop cups.socket
    # systemctl reload cups.socket
    # systemctl status cups.socket
    
    cups.socket - CUPS Printing Service Sockets
       Loaded: loaded (/usr/lib/systemd/system/cups.socket; enabled)
       Active: active (listening) since Tue 2015-04-28 18:10:59 IST; 8s ago
       Listen: /var/run/cups/cups.sock (Stream)
    
    Apr 28 18:10:59 tecmint systemd[1]: Starting CUPS Printing Service Sockets.
    Apr 28 18:10:59 tecmint systemd[1]: Listening on CUPS Printing Service Sockets.

#### 23. 在启动时激活套接口，并启用或禁用它（系统启动时自启动） ####

    # systemctl is-active cups.socket
    # systemctl enable cups.socket
    # systemctl disable cups.socket

#### 24. 屏蔽（使它不能启动）或显示套接口 ####

    # systemctl mask cups.socket
    ln -s '/dev/null' '/etc/systemd/system/cups.socket'
    
    # systemctl unmask cups.socket
    rm '/etc/systemd/system/cups.socket'

### 服务的CPU利用率（分配额） ###

#### 25. 获取当前某个服务的CPU分配额（如httpd） ####

    # systemctl show -p CPUShares httpd.service
    
    CPUShares=1024

**注意**：各个服务的默认CPU分配份额=1024，你可以增加/减少某个进程的CPU分配份额。

#### 26. 将某个服务（httpd.service）的CPU分配份额限制为2000 CPUShares/ ####

    # systemctl set-property httpd.service CPUShares=2000
    # systemctl show -p CPUShares httpd.service
    
    CPUShares=2000

**注意**：当你为某个服务设置CPUShares，会自动创建一个以服务名命名的目录（如 httpd.service），里面包含了一个名为90-CPUShares.conf的文件，该文件含有CPUShare限制信息，你可以通过以下方式查看该文件：

    # vi /etc/systemd/system/httpd.service.d/90-CPUShares.conf 
    
    [Service]
    CPUShares=2000        

#### 27. 检查某个服务的所有配置细节 ####

    # systemctl show httpd
    
    Id=httpd.service
    Names=httpd.service
    Requires=basic.target
    Wants=system.slice
    WantedBy=multi-user.target
    Conflicts=shutdown.target
    Before=shutdown.target multi-user.target
    After=network.target remote-fs.target nss-lookup.target systemd-journald.socket basic.target system.slice
    Description=The Apache HTTP Server
    LoadState=loaded
    ActiveState=active
    SubState=running
    FragmentPath=/usr/lib/systemd/system/httpd.service
    ....

#### 28. 分析某个服务（httpd）的关键链 ####

    # systemd-analyze critical-chain httpd.service
    
    The time after the unit is active or started is printed after the "@" character.
    The time the unit takes to start is printed after the "+" character.
    
    httpd.service +142ms
    └─network.target @11.168s
      └─network.service @9.456s +1.712s
        └─NetworkManager.service @8.858s +596ms
          └─firewalld.service @4.931s +3.926s
            └─basic.target @4.916s
              └─sockets.target @4.916s
                └─dbus.socket @4.916s
                  └─sysinit.target @4.905s
                    └─systemd-update-utmp.service @4.864s +39ms
                      └─auditd.service @4.563s +301ms
                        └─systemd-tmpfiles-setup.service @4.485s +69ms
                          └─rhel-import-state.service @4.342s +142ms
                            └─local-fs.target @4.324s
                              └─boot.mount @4.286s +31ms
                                └─systemd-fsck@dev-disk-by\x2duuid-79f594ad\x2da332\x2d4730\x2dbb5f\x2d85d196080964.service @4.092s +149ms
                                  └─dev-disk-by\x2duuid-79f594ad\x2da332\x2d4730\x2dbb5f\x2d85d196080964.device @4.092s

#### 29. 获取某个服务（httpd）的依赖性列表 ####

    # systemctl list-dependencies httpd.service
    
    httpd.service
    ├─system.slice
    └─basic.target
      ├─firewalld.service
      ├─microcode.service
      ├─rhel-autorelabel-mark.service
      ├─rhel-autorelabel.service
      ├─rhel-configure.service
      ├─rhel-dmesg.service
      ├─rhel-loadmodules.service
      ├─paths.target
      ├─slices.target
      │ ├─-.slice
      │ └─system.slice
      ├─sockets.target
      │ ├─dbus.socket
    ....

#### 30. 按等级列出控制组 ####

    # systemd-cgls
    
    ├─1 /usr/lib/systemd/systemd --switched-root --system --deserialize 23
    ├─user.slice
    │ └─user-0.slice
    │   └─session-1.scope
    │     ├─2498 sshd: root@pts/0    
    │     ├─2500 -bash
    │     ├─4521 systemd-cgls
    │     └─4522 systemd-cgls
    └─system.slice
      ├─httpd.service
      │ ├─4440 /usr/sbin/httpd -DFOREGROUND
      │ ├─4442 /usr/sbin/httpd -DFOREGROUND
      │ ├─4443 /usr/sbin/httpd -DFOREGROUND
      │ ├─4444 /usr/sbin/httpd -DFOREGROUND
      │ ├─4445 /usr/sbin/httpd -DFOREGROUND
      │ └─4446 /usr/sbin/httpd -DFOREGROUND
      ├─polkit.service
      │ └─721 /usr/lib/polkit-1/polkitd --no-debug
    ....

#### 31. 按CPU、内存、输入和输出列出控制组 ####

    # systemd-cgtop
    
    Path                                                              Tasks   %CPU   Memory  Input/s Output/s
    
    /                                                                    83    1.0   437.8M        -        -
    /system.slice                                                         -    0.1        -        -        -
    /system.slice/mariadb.service                                         2    0.1        -        -        -
    /system.slice/tuned.service                                           1    0.0        -        -        -
    /system.slice/httpd.service                                           6    0.0        -        -        -
    /system.slice/NetworkManager.service                                  1      -        -        -        -
    /system.slice/atop.service                                            1      -        -        -        -
    /system.slice/atopacct.service                                        1      -        -        -        -
    /system.slice/auditd.service                                          1      -        -        -        -
    /system.slice/crond.service                                           1      -        -        -        -
    /system.slice/dbus.service                                            1      -        -        -        -
    /system.slice/firewalld.service                                       1      -        -        -        -
    /system.slice/lvm2-lvmetad.service                                    1      -        -        -        -
    /system.slice/polkit.service                                          1      -        -        -        -
    /system.slice/postfix.service                                         3      -        -        -        -
    /system.slice/rsyslog.service                                         1      -        -        -        -
    /system.slice/system-getty.slice/getty@tty1.service                   1      -        -        -        -
    /system.slice/systemd-journald.service                                1      -        -        -        -
    /system.slice/systemd-logind.service                                  1      -        -        -        -
    /system.slice/systemd-udevd.service                                   1      -        -        -        -
    /system.slice/webmin.service                                          1      -        -        -        -
    /user.slice/user-0.slice/session-1.scope                              3      -        -        -        -

### 控制系统运行等级 ###

#### 32. 启动系统救援模式 ####

    # systemctl rescue
    
    Broadcast message from root@tecmint on pts/0 (Wed 2015-04-29 11:31:18 IST):
    
    The system is going down to rescue mode NOW!

#### 33. 进入紧急模式 ####

    # systemctl emergency
    
    Welcome to emergency mode! After logging in, type "journalctl -xb" to view
    system logs, "systemctl reboot" to reboot, "systemctl default" to try again
    to boot into default mode.

#### 34. 列出当前使用的运行等级 ####

    # systemctl get-default
    
    multi-user.target

#### 35. 启动运行等级5，即图形模式 ####

    # systemctl isolate runlevel5.target
    或
    # systemctl isolate graphical.target

#### 36. 启动运行等级3，即多用户模式（命令行） ####

    # systemctl isolate runlevel3.target
    或
    # systemctl isolate multiuser.target

#### 36. 设置多用户模式或图形模式为默认运行等级 ####

    # systemctl set-default runlevel3.target
    
    # systemctl set-default runlevel5.target

#### 37. 重启、停止、挂起、休眠系统或使系统进入混合睡眠 ####

    # systemctl reboot
    
    # systemctl halt
    
    # systemctl suspend
    
    # systemctl hibernate
    
    # systemctl hybrid-sleep

对于不知运行等级为何物的人，说明如下。

- Runlevel 0 : 关闭系统
- Runlevel 1 : 救援？维护模式
- Runlevel 3 : 多用户，无图形系统
- Runlevel 4 : 多用户，无图形系统
- Runlevel 5 : 多用户，图形化系统
- Runlevel 6 : 关闭并重启机器

到此为止吧。保持连线，进行评论。别忘了在下面的评论中为我们提供一些有价值的反馈哦。喜欢我们、与我们分享，求扩散。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-services-using-systemd-and-systemctl-in-linux/

作者：[Avishek Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
