**translating by [erlinux](https://github.com/erlinux)**
inxi – A Great Tool to Check Hardware Information on Linux
============================================================

One of the big challenge for Linux administrator to find, all the hardware information on the system. There are many command line utility is are available in Linux to get the hardware information but there will be a lack to get some of the information.

[inxi][1] is a nifty tool to check hardware information on Linux and offers wide range of option to get all the hardware information on Linux system that i never found in any other utility which are available in Linux. It was forked from the ancient and mindbendingly perverse yet ingenius infobash, by locsmif.

inxi is a script that quickly shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, GCC version(s), Processes, RAM usage, and a wide variety of other useful information, also used for forum technical support & debugging tool.

#### Install inix on Linux

inxi is support all Linux distributions and never require latest dependencies, so no need to think about manual installation. Simply install inix from distribution official repository by using below commands.

```
[Install inxi on CentOS/RHEL]
$ sudo yum install inxi

[Install inix on Fedora]
$ sudo dnf install inxi

[Install inxi on Debian/Linux Mint/Ubuntu]
$ sudo apt-get install inxi

[Install inxi on openSUSE]
$ sudo zypper in inxi

[Install inxi on Mageia]
$ sudo urpmi inxi

[Install inxi on Arch based system]
$ yaourt -S inxi
```

By default inxi output comes with colors which can be turned off by using `-c` followed by `0` (you can use 0-32) to get better visibility.

#### Print one line output with inix

Issue inxi command without any option to print the hardware information in one line like, CPU, kernel, architecture, uptime, memory, HDD, process & inxi version.

```
$ inxi -c 0
CPU~Dual core Intel Core i7-6700HQ (-MCP-) speed~2591 MHz (max) Kernel~4.8.0-32-generic x86_64 Up~50 min Mem~1609.9/1999.8MB HDD~42.9GB(17.6% used) Procs~197 Client~Shell inxi~2.3.1
```

#### Print basic system hardware

Issue inxi command with `-b` option wich will print basic system hardware information. I mean, it shows about System, Machine, CPU, Graphics, Network, Drives & Info.

```
$ inxi -b
System:    Host: daygeek Kernel: 4.8.0-32-generic x86_64 (64 bit) Desktop: Unity 7.5.0  Distro: Ubuntu 16.10
Machine:   System: innotek (portable) product: VirtualBox v: 1.2
           Mobo: Oracle model: VirtualBox v: 1.2 BIOS: innotek v: VirtualBox date: 12/01/2006
Battery    BAT0: charge: 31.5 Wh 63.0% condition: 50.0/50.0 Wh (100%)
CPU:       Dual core Intel Core i7-6700HQ (-MCP-) speed: 2591 MHz (max)
Graphics:  Card: InnoTek Systemberatung VirtualBox Graphics Adapter
           Display Server: X.Org 1.18.4 drivers: (unloaded: fbdev,vesa) Resolution: 1920x955@59.89hz
           GLX Renderer: Gallium 0.4 on llvmpipe (LLVM 3.8, 256 bits) GLX Version: 3.0 Mesa 12.0.3
Network:   Card: Intel 82540EM Gigabit Ethernet Controller driver: e1000
Drives:    HDD Total Size: 42.9GB (17.6% used)
Info:      Processes: 197 Uptime: 50 min Memory: 1586.2/1999.8MB Client: Shell (bash) inxi: 2.3.1
```

*   System : Host Name, Kernel version, Architecture, Desktop & Distribution
*   Machine : Motherboard & Bios information
*   CPU : Processor Name and core
*   Graphics : Graphics card info
*   Network : Network card info
*   Drives : HDD size and used percent
*   Info : Total process count, Server Uptime, Memory total and used, inxi version

#### Show Audio/sound card information

Issue inxi command with `-A` which will show Audio/sound card information.

```
$ inxi -A
Audio:     Card Intel 82801AA AC'97 Audio Controller driver: snd_intel8x0 Sound: ALSA v: k4.8.0-32-generic
```

#### Show full CPU info

Issue inxi command with `-C` which will show full CPU information, including per CPU clock speed and CPU max speed (if available).

```
$ inxi -C
CPU:       Dual core Intel Core i7-6700HQ (-MCP-) cache: 6144 KB 
           clock speeds: max: 2591 MHz 1: 2591 MHz 2: 2591 MHz
```

#### Show optical drive information

Issue inxi command with `-d` which will show optical drive data information, including all storage.

```
$ inxi -d
Drives:    HDD Total Size: 42.9GB (17.6% used) ID-1: /dev/sda model: VBOX_HARDDISK size: 42.9GB
           Optical: /dev/sr0 model: VBOX CD-ROM dev-links: cdrom,dvd
           Features: speed: 32x multisession: yes audio: yes dvd: yes rw: none
```
#### Show full hard Disk information

Issue inxi command with `-D` which will show full hard Disk information, including HDD total size, used size and percentage, file system type & mount point.

```
$ inxi -D
Drives:    HDD Total Size: 42.9GB (17.6% used) ID-1: /dev/sda model: VBOX_HARDDISK size: 42.9GB
```

Issue inxi command with `-p` which will show full partition information.

```
$ inxi -p
Partition: ID-1: / size: 38G used: 5.2G (15%) fs: ext4 dev: /dev/sda1
           ID-2: swap-1 size: 2.15GB used: 0.20GB (9%) fs: swap dev: /dev/sda5
```

Issue inxi command with `-0` which will show unmounted partition information.

```
$ inxi -o
Unmounted: No unmounted partitions detected
```

#### Show Graphic card information

Issue inxi command with `-G` which will show Graphic card information.

```
$ inxi -G
Graphics:  Card: InnoTek Systemberatung VirtualBox Graphics Adapter
           Display Server: X.Org 1.18.4 drivers: (unloaded: fbdev,vesa) Resolution: 1920x955@59.89hz
           GLX Renderer: Gallium 0.4 on llvmpipe (LLVM 3.8, 256 bits) GLX Version: 3.0 Mesa 12.0.3
```

#### Show server public IP address

Issue inxi command with `-i` (requires ifconfig network tool) which will show server public IP address.

```
$ inxi -i
Network:   Card: Intel 82540EM Gigabit Ethernet Controller driver: e1000
           IF: enp0s3 state: up speed: 1000 Mbps duplex: full mac: 08:00:27:ae:1d:fe
           WAN IP: 103.5.134.167 IF: enp0s3 ip-v4: 10.0.2.15
```

#### Show machine data information

Issue inxi command with `-M` which will show machine data information, including Device, Motherboard, Bios, and if percentage, System Builder (Like Lenovo).

```
$ inxi -M
Machine:   System: innotek (portable) product: VirtualBox v: 1.2
           Mobo: Oracle model: VirtualBox v: 1.2 BIOS: innotek v: VirtualBox date: 12/01/2006
Battery    BAT0: charge: 32.5 Wh 65.0% condition: 50.0/50.0 Wh (100%)
```

#### Show Show Network card information

Issue inxi command with `-N` which will show Show Network card information.

```
$ inxi -N
Network:   Card: Intel 82540EM Gigabit Ethernet Controller driver: e1000
```

Issue inxi command with `-n` which will show Show Advanced Network card information, including interface, speed, mac id, state, etc.

```
$ inxi -n
Network:   Card: Intel 82540EM Gigabit Ethernet Controller driver: e1000
           IF: enp0s3 state: up speed: 1000 Mbps duplex: full mac: 08:00:27:ae:1d:fe
```

#### Show distro repository data information

Issue inxi command with `-r` which will show distro repository data information.

```
$ inxi -r
Repos:     Active apt sources in file: /etc/apt/sources.list
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety main restricted
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates main restricted
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety universe
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates universe
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety multiverse
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates multiverse
           deb http://in.archive.ubuntu.com/ubuntu/ yakkety-backports main restricted universe multiverse
           deb http://security.ubuntu.com/ubuntu yakkety-security main restricted
           deb http://security.ubuntu.com/ubuntu yakkety-security universe
           deb http://security.ubuntu.com/ubuntu yakkety-security multiverse
           Active apt sources in file: /etc/apt/sources.list.d/arc-theme.list
           deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /
           Active apt sources in file: /etc/apt/sources.list.d/snwh-ubuntu-pulp-yakkety.list
           deb http://ppa.launchpad.net/snwh/pulp/ubuntu yakkety main
```

#### Show possible system hardware information

Issue inxi command with `-F` which will show possible system hardware information.

```
$ inxi -F
System:    Host: daygeek Kernel: 4.8.0-32-generic x86_64 (64 bit) Desktop: Unity 7.5.0  Distro: Ubuntu 16.10
Machine:   System: innotek (portable) product: VirtualBox v: 1.2
           Mobo: Oracle model: VirtualBox v: 1.2 BIOS: innotek v: VirtualBox date: 12/01/2006
Battery    BAT0: charge: 33.0 Wh 66.0% condition: 50.0/50.0 Wh (100%)
CPU:       Dual core Intel Core i7-6700HQ (-MCP-) cache: 6144 KB 
           clock speeds: max: 2591 MHz 1: 2591 MHz 2: 2591 MHz
Graphics:  Card: InnoTek Systemberatung VirtualBox Graphics Adapter
           Display Server: X.Org 1.18.4 drivers: (unloaded: fbdev,vesa) Resolution: 1920x955@59.89hz
           GLX Renderer: Gallium 0.4 on llvmpipe (LLVM 3.8, 256 bits) GLX Version: 3.0 Mesa 12.0.3
Audio:     Card Intel 82801AA AC'97 Audio Controller driver: snd_intel8x0 Sound: ALSA v: k4.8.0-32-generic
Network:   Card: Intel 82540EM Gigabit Ethernet Controller driver: e1000
           IF: enp0s3 state: up speed: 1000 Mbps duplex: full mac: 08:00:27:ae:1d:fe
Drives:    HDD Total Size: 42.9GB (17.6% used) ID-1: /dev/sda model: VBOX_HARDDISK size: 42.9GB
Partition: ID-1: / size: 38G used: 5.2G (15%) fs: ext4 dev: /dev/sda1
           ID-2: swap-1 size: 2.15GB used: 0.20GB (9%) fs: swap dev: /dev/sda5
RAID:      No RAID devices: /proc/mdstat, md_mod kernel module present
Sensors:   None detected - is lm-sensors installed and configured?
Info:      Processes: 198 Uptime: 53 min Memory: 1587.5/1999.8MB Client: Shell (bash) inxi: 2.3.1
```

#### Get extra information about the device

Add `-x` with any above individual output which will show extra information about the device.

```
$ inxi -F -x
System:    Host: daygeek Kernel: 4.8.0-32-generic x86_64 (64 bit gcc: 6.2.0)
           Desktop: Unity 7.5.0 (Gtk 3.20.9-1ubuntu2) Distro: Ubuntu 16.10
Machine:   System: innotek (portable) product: VirtualBox v: 1.2
           Mobo: Oracle model: VirtualBox v: 1.2 BIOS: innotek v: VirtualBox date: 12/01/2006
Battery    BAT0: charge: 33.0 Wh 66.0% condition: 50.0/50.0 Wh (100%) model: innotek 1 status: Charging
CPU:       Dual core Intel Core i7-6700HQ (-MCP-) cache: 6144 KB
           flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3) bmips: 10368
           clock speeds: max: 2591 MHz 1: 2591 MHz 2: 2591 MHz
Graphics:  Card: InnoTek Systemberatung VirtualBox Graphics Adapter bus-ID: 00:02.0
           Display Server: X.Org 1.18.4 drivers: (unloaded: fbdev,vesa) Resolution: 1920x955@59.89hz
           GLX Renderer: Gallium 0.4 on llvmpipe (LLVM 3.8, 256 bits)
           GLX Version: 3.0 Mesa 12.0.3 Direct Rendering: Yes
Audio:     Card Intel 82801AA AC'97 Audio Controller driver: snd_intel8x0 ports: d100 d200 bus-ID: 00:05.0
           Sound: Advanced Linux Sound Architecture v: k4.8.0-32-generic
Network:   Card: Intel 82540EM Gigabit Ethernet Controller
           driver: e1000 v: 7.3.21-k8-NAPI port: d010 bus-ID: 00:03.0
           IF: enp0s3 state: up speed: 1000 Mbps duplex: full mac: 08:00:27:ae:1d:fe
Drives:    HDD Total Size: 42.9GB (17.6% used) ID-1: /dev/sda model: VBOX_HARDDISK size: 42.9GB
Partition: ID-1: / size: 38G used: 5.2G (15%) fs: ext4 dev: /dev/sda1
           ID-2: swap-1 size: 2.15GB used: 0.20GB (9%) fs: swap dev: /dev/sda5
RAID:      No RAID devices: /proc/mdstat, md_mod kernel module present
Sensors:   None detected - is lm-sensors installed and configured?
Info:      Processes: 198 Uptime: 54 min Memory: 1592.5/1999.8MB Init: systemd runlevel: 5 Gcc sys: 6.2.0
           Client: Shell (bash 4.3.461) inxi: 2.3.1
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/inxi-system-hardware-information-on-linux/2/

作者：[ MAGESH MARUTHAMUTHU ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://smxi.org/docs/inxi.htm
