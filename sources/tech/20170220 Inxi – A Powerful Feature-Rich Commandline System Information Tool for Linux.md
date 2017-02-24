Inxi – A Powerful Feature-Rich Commandline System Information Tool for Linux
============================================================


Inxi is a powerful and remarkable command line-system information script designed for both console and IRC (Internet Relay Chat). It can be employed to instantly deduce user system configuration and hardware information, and also functions as a debugging, and forum technical support tool.

It displays handy information concerning system hardware (hard disk, sound cards, graphic card, network cards, CPU, RAM, and more), together with system information about drivers, Xorg, desktop environment, kernel, GCC version(s), processes, uptime, memory, and a wide array of other useful information.

However, it’s output slightly differs between the command line and IRC, with a few default filters and color options applicable to IRC usage. The supported IRC clients include: BitchX, Gaim/Pidgin, ircII, Irssi, Konversation, Kopete, KSirc, KVIrc, Weechat, and Xchat plus any others that are capable of showing either built in or external Inxi output.

### How to Install Inxi in Linux System

Inix is available in most mainstream Linux distribution repositories, and runs on BSDs as well.

```
$ sudo apt-get install inxi   [On Debian/Ubuntu/Linux Mint]
$ sudo yum install inxi       [On CentOs/RHEL/Fedora]
$ sudo dnf install inxi       [On Fedora 22+]
```

Before we start using it, we can run the command that follows to check all application dependencies plus recommends, and various directories, and display what package(s) we need to install to add support for a given feature.

```
$ inxi --recommends 
```
Inxi Checking
```
inxi will now begin checking for the programs it needs to operate. First a check of the main languages and tools
inxi uses. Python is only for debugging data collection.
---------------------------------------------------------------------------
Bash version: 4.3.42(1)-release
Gawk version: 4.1.3,
Sed version: 
Sudo version: 1.8.16
Python version: 2.7.12
---------------------------------------------------------------------------
Test One: Required System Directories (Linux Only).
If one of these system directories is missing, inxi cannot operate:
/proc....................................................................... Present
/sys........................................................................ Present
All the  directories are present.
---------------------------------------------------------------------------
Test Two: Required Core Applications.
If one of these applications is missing, inxi cannot operate:
df (info: partition data)................................................... /bin/df
gawk (info: core tool)...................................................... /usr/bin/gawk
grep (info: string search).................................................. /bin/grep
lspci (info: hardware data)................................................. /usr/bin/lspci
ps (info: process data)..................................................... /bin/ps
readlink.................................................................... /bin/readlink
sed (info: string replace).................................................. /bin/sed
tr (info: character replace)................................................ /usr/bin/tr
uname (info: kernel data)................................................... /bin/uname
wc (info: word character count)............................................. /usr/bin/wc
All the  applications are present.
---------------------------------------------------------------------------
Test Three: Script Recommends for Graphics Features.
NOTE: If you do not use X these do not matter (like a headless server). Otherwise, if one of these applications
is missing, inxi will have incomplete output:
glxinfo (info: -G glx info)................................................. /usr/bin/glxinfo
xdpyinfo (info: -G multi screen resolution)................................. /usr/bin/xdpyinfo
xprop (info: -S desktop data)............................................... /usr/bin/xprop
xrandr (info: -G single screen resolution).................................. /usr/bin/xrandr
All the  applications are present.
---------------------------------------------------------------------------
Test Four: Script Recommends for Remaining Features.
If one of these applications is missing, inxi will have incomplete output:
dig (info: -i first wlan ip default test)................................... /usr/bin/dig
dmidecode (info: -M if no sys machine data; -m memory)...................... /usr/sbin/dmidecode
file (info: -o unmounted file system)....................................... /usr/bin/file
hciconfig (info: -n -i bluetooth data)...................................... /bin/hciconfig
hddtemp (info: -Dx show hdd temp)........................................... /usr/sbin/hddtemp
ifconfig (info: -i ip lan-deprecated)....................................... /sbin/ifconfig
ip (info: -i ip lan)........................................................ /sbin/ip
sensors (info: -s sensors output)........................................... /usr/bin/sensors
strings (info: -I sysvinit version)......................................... /usr/bin/strings
lsusb (info: -A usb audio;-N usb networking)................................ /usr/bin/lsusb
modinfo (info: -Ax,-Nx module version)...................................... /sbin/modinfo
runlevel (info: -I runlevel)................................................ /sbin/runlevel
sudo (info: -Dx hddtemp-user;-o file-user).................................. /usr/bin/sudo
uptime (info: -I uptime (check which package owns Debian)).................. /usr/bin/uptime
All the  applications are present.
---------------------------------------------------------------------------
Test Five: Script Recommends for Remaining Features.
One of these downloaders needed for options -i/-w/-W (-U/-! [11-15], if supported):
wget (info: -i wan ip;-w/-W;-U/-! [11-15] (if supported))................... /usr/bin/wget
curl (info: -i wan ip;-w/-W;-U/-! [11-15] (if supported))................... /usr/bin/curl
All the  applications are present.
---------------------------------------------------------------------------
Test Six: System Directories for Various Information.
(Unless otherwise noted, these are for GNU/Linux systems)
If one of these directories is missing, inxi may have incomplete output:
/sys/class/dmi/id (info: -M system, motherboard, bios)...................... Present
/dev (info: -l,-u,-o,-p,-P,-D disk partition data).......................... Present
/dev/disk/by-label (info: -l,-o,-p,-P partition labels)..................... Present
/dev/disk/by-uuid (info: -u,-o,-p,-P partition uuid)........................ Present
All the  directories are present.
---------------------------------------------------------------------------
Test Seven: System Files for Various Information.
(Unless otherwise noted, these are for GNU/Linux systems)
If one of these files is missing, inxi may have incomplete output:
/proc/asound/cards (info: -A sound card data)............................... Present
/proc/asound/version (info: -A ALSA data)................................... Present
/proc/cpuinfo (info: -C cpu data)........................................... Present
/etc/lsb-release (info: -S distro version data [deprecated])................ Present
/proc/mdstat (info: -R mdraid data)......................................... Present
/proc/meminfo (info: -I memory data)........................................ Present
/etc/os-release (info: -S distro version data).............................. Present
/proc/partitions (info: -p,-P partitions data).............................. Present
/proc/modules (info: -G module data)........................................ Present
/proc/mounts (info: -P,-p partition advanced data).......................... Present
/var/run/dmesg.boot (info: -D,-d disk data [BSD only])...................... Missing
/proc/scsi/scsi (info: -D Advanced hard disk data [used rarely])............ Present
/var/log/Xorg.0.log (info: -G graphics driver load status).................. Present
The following files are missing from your system:
File: /var/run/dmesg.boot
---------------------------------------------------------------------------
All tests completed.
```

### Basic Usage of Inxi Tool in Linux

Below are some basic Inxi options we can use to collect machine plus system information.

#### Show Linux System Information

When run without any flags, Inxi will produce output to do with system CPU, kernel, uptime, memory size, hard disk size, number of processes, client used and inxi version:

```
$ inxi
CPU~Dual core Intel Core i5-4210U (-HT-MCP-) speed/max~2164/2700 MHz Kernel~4.4.0-21-generic x86_64 Up~3:15 Mem~3122.0/7879.9MB HDD~1000.2GB(20.0% used) Procs~234 Client~Shell inxi~2.2.35
```

#### Show Linux Kernel and Distribution Info

The command below will show sample system info (hostname, kernel info, desktop environment and disto) using the `-S` flag:

```
$ inxi -S
System: Host: TecMint Kernel: 4.4.0-21-generic x86_64 (64 bit) Desktop: Cinnamon 3.0.7
Distro: Linux Mint 18 Sarah
```

#### Find Linux Laptop or PC Model Information

To print machine data-same as product details (system, product id, version, Mobo, model, BIOS etc), we can use the option `-M` as follows:

```
$ inxi -M
Machine:   System: LENOVO (portable) product: 20354 v: Lenovo Z50-70
Mobo: LENOVO model: Lancer 5A5 v: 31900059WIN Bios: LENOVO v: 9BCN26WW date: 07/31/2014
```

#### Find Linux CPU and CPU Speed Information

We can display complete CPU information, including per CPU clock-speed and CPU max speed (if available) with the `-C` flag as follows:

```
$ inxi -C
CPU:       Dual core Intel Core i5-4210U (-HT-MCP-) cache: 3072 KB 
clock speeds: max: 2700 MHz 1: 1942 MHz 2: 1968 MHz 3: 1734 MHz 4: 1710 MHz
```

#### Find Graphic Card Information in Linux

The option `-G` can be used to show graphics card info (card type, display server, resolution, GLX renderer and GLX version) like so:

```
$ inxi -G
Graphics:  Card-1: Intel Haswell-ULT Integrated Graphics Controller
Card-2: NVIDIA GM108M [GeForce 840M]
Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,vesa) Resolution: 1920x1080@60.05hz
GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa 11.2.0
```

#### Find Audio/Sound Card Information in Linux

To get info about system audio/sound card, we use the `-A` flag:

```
$ inxi -A
Audio:     Card-1 Intel 8 Series HD Audio Controller driver: snd_hda_intel Sound: ALSA v: k4.4.0-21-generic
Card-2 Intel Haswell-ULT HD Audio Controller driver: snd_hda_intel
```

#### Find Linux Network Card Information

To display network card info, we can make use of `-N` flag:

```
$ inxi -N
Network:   Card-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller driver: r8169
Card-2: Realtek RTL8723BE PCIe Wireless Network Adapter driver: rtl8723be
```

#### Find Linux Hard Disk Information

To view full hard disk information,(size, id, model) we can use the flag `-D`:

```
$ inxi -D
Drives:    HDD Total Size: 1000.2GB (20.0% used) ID-1: /dev/sda model: ST1000LM024_HN size: 1000.2GB
```

#### Summarize Full Linux System Information Together

To show a summarized system information; combining all the information above, we need to use the `-b` flag as below:

```
$ inxi -b 
System:    Host: TecMint Kernel: 4.4.0-21-generic x86_64 (64 bit) Desktop: Cinnamon 3.0.7
Distro: Linux Mint 18 Sarah
Machine:   System: LENOVO (portable) product: 20354 v: Lenovo Z50-70
Mobo: LENOVO model: Lancer 5A5 v: 31900059WIN Bios: LENOVO v: 9BCN26WW date: 07/31/2014
CPU:       Dual core Intel Core i5-4210U (-HT-MCP-) speed/max: 2018/2700 MHz
Graphics:  Card-1: Intel Haswell-ULT Integrated Graphics Controller
Card-2: NVIDIA GM108M [GeForce 840M]
Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,vesa) Resolution: 1920x1080@60.05hz
GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa 11.2.0
Network:   Card-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller driver: r8169
Card-2: Realtek RTL8723BE PCIe Wireless Network Adapter driver: rtl8723be
Drives:    HDD Total Size: 1000.2GB (20.0% used)
Info:      Processes: 233 Uptime: 3:23 Memory: 3137.5/7879.9MB Client: Shell (bash) inxi: 2.2.35  
```

#### Find Linux Hard Disk Partition Details

The next command will enable us view complete list of hard disk partitions in relation to size, used and available space, filesystem as well as filesystem type on each partition with the `-p` flag:

```
$ inxi -p
Partition: ID-1: / size: 324G used: 183G (60%) fs: ext4 dev: /dev/sda10
ID-2: swap-1 size: 4.00GB used: 0.00GB (0%) fs: swap dev: /dev/sda9
```

#### Shows Full Linux System Information

In order to show complete Inxi output, we use the `-F` flag as below (note that certain data is filtered for security reasons such as WAN IP):

```
$ inxi -F 
System:    Host: TecMint Kernel: 4.4.0-21-generic x86_64 (64 bit) Desktop: Cinnamon 3.0.7
Distro: Linux Mint 18 Sarah
Machine:   System: LENOVO (portable) product: 20354 v: Lenovo Z50-70
Mobo: LENOVO model: Lancer 5A5 v: 31900059WIN Bios: LENOVO v: 9BCN26WW date: 07/31/2014
CPU:       Dual core Intel Core i5-4210U (-HT-MCP-) cache: 3072 KB 
clock speeds: max: 2700 MHz 1: 1716 MHz 2: 1764 MHz 3: 1776 MHz 4: 1800 MHz
Graphics:  Card-1: Intel Haswell-ULT Integrated Graphics Controller
Card-2: NVIDIA GM108M [GeForce 840M]
Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,vesa) Resolution: 1920x1080@60.05hz
GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa 11.2.0
Audio:     Card-1 Intel 8 Series HD Audio Controller driver: snd_hda_intel Sound: ALSA v: k4.4.0-21-generic
Card-2 Intel Haswell-ULT HD Audio Controller driver: snd_hda_intel
Network:   Card-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller driver: r8169
IF: enp1s0 state: up speed: 100 Mbps duplex: full mac: 28:d2:44:eb:bd:98
Card-2: Realtek RTL8723BE PCIe Wireless Network Adapter driver: rtl8723be
IF: wlp2s0 state: down mac: 38:b1:db:7c:78:c7
Drives:    HDD Total Size: 1000.2GB (20.0% used) ID-1: /dev/sda model: ST1000LM024_HN size: 1000.2GB
Partition: ID-1: / size: 324G used: 183G (60%) fs: ext4 dev: /dev/sda10
ID-2: swap-1 size: 4.00GB used: 0.00GB (0%) fs: swap dev: /dev/sda9
RAID:      No RAID devices: /proc/mdstat, md_mod kernel module present
Sensors:   System Temperatures: cpu: 56.0C mobo: N/A
Fan Speeds (in rpm): cpu: N/A
Info:      Processes: 234 Uptime: 3:26 Memory: 3188.9/7879.9MB Client: Shell (bash) inxi: 2.2.35 
```

### Linux System Monitoring with Inxi Tool

Following are few options used to monitor Linux system processes, uptime, memory etc.

#### Monitor Linux Processes Memory Usage

Get summarized system info in relation to total number of processes, uptime and memory usage:

```
$ inxi -I
Info:      Processes: 232 Uptime: 3:35 Memory: 3256.3/7879.9MB Client: Shell (bash) inxi: 2.2.35 
```

#### Monitoring Processes by CPU and Memory Usage

By default, it can help us determine the [top 5 processes consuming CPU or memory][1]. The `-t` option used together with `c` (CPU) and/or `m` (memory) options lists the top 5 most active processes eating up CPU and/or memory as shown below:

```
----------------- Linux CPU Usage ----------------- 
$ inxi -t c 
Processes: CPU: % used - top 5 active
1: cpu: 53.7% command: plugin-container pid: 3066
2: cpu: 20.0% command: java pid: 1527
3: cpu: 19.7% command: firefox pid: 3018
4: cpu: 4.6% command: Xorg pid: 2114
5: cpu: 3.0% command: cinnamon pid: 2835
```

```
----------------- Linux Memoery Usage ----------------- 
$ inxi -t m
Processes: Memory: MB / % used - Used/Total: 3212.5/7879.9MB - top 5 active
1: mem: 980.51MB (12.4%) command: plugin-container pid: 3066
2: mem: 508.96MB (6.4%) command: java pid: 1527
3: mem: 507.89MB (6.4%) command: firefox pid: 3018
4: mem: 244.05MB (3.0%) command: chrome pid: 7405
5: mem: 211.46MB (2.6%) command: chrome pid: 6146
```

```
----------------- Linux CPU and Memory Usage ----------------- 
$ inxi -t cm
Processes: CPU: % used - top 5 active
1: cpu: 53.7% command: plugin-container pid: 3066
2: cpu: 20.0% command: java pid: 1527
3: cpu: 19.7% command: firefox pid: 3018
4: cpu: 4.6% command: Xorg pid: 2114
5: cpu: 3.0% command: cinnamon pid: 2835
Memory: MB / % used - Used/Total: 3223.6/7879.9MB - top 5 active
1: mem: 991.93MB (12.5%) command: plugin-container pid: 3066
2: mem: 508.96MB (6.4%) command: java pid: 1527
3: mem: 507.86MB (6.4%) command: firefox pid: 3018
4: mem: 244.45MB (3.1%) command: chrome pid: 7405
5: mem: 211.68MB (2.6%) command: chrome pid: 6146
```

We can use `cm` number (number can be 1-20) to specify a number other than 5, the command below will show us the [top 10 most active processes][2] eating up CPU and memory.

```
$ inxi -t cm10
Processes: CPU: % used - top 10 active
1: cpu: 53.4% command: plugin-container pid: 3066
2: cpu: 19.8% command: java pid: 1527
3: cpu: 19.5% command: firefox pid: 3018
4: cpu: 4.5% command: Xorg pid: 2114
5: cpu: 3.0% command: cinnamon pid: 2835
6: cpu: 2.8% command: chrome pid: 7405
7: cpu: 1.1% command: pulseaudio pid: 2733
8: cpu: 1.0% command: soffice.bin pid: 7799
9: cpu: 0.9% command: chrome pid: 5763
10: cpu: 0.5% command: chrome pid: 6179
Memory: MB / % used - Used/Total: 3163.1/7879.9MB - top 10 active
1: mem: 976.82MB (12.3%) command: plugin-container pid: 3066
2: mem: 511.70MB (6.4%) command: java pid: 1527
3: mem: 466.01MB (5.9%) command: firefox pid: 3018
4: mem: 244.40MB (3.1%) command: chrome pid: 7405
5: mem: 203.71MB (2.5%) command: chrome pid: 6146
6: mem: 199.74MB (2.5%) command: chrome pid: 5763
7: mem: 168.30MB (2.1%) command: cinnamon pid: 2835
8: mem: 165.51MB (2.1%) command: soffice.bin pid: 7799
9: mem: 158.91MB (2.0%) command: chrome pid: 6179
10: mem: 151.83MB (1.9%) command: mysqld pid: 1259
```

#### Monitor Linux Network Interfaces

The command that follows will show us advanced network card information including interface, speed, mac id, state, IPs, etc:

```
$ inxi -Nni
Network:   Card-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller driver: r8169
IF: enp1s0 state: up speed: 100 Mbps duplex: full mac: 28:d2:44:eb:bd:98
Card-2: Realtek RTL8723BE PCIe Wireless Network Adapter driver: rtl8723be
IF: wlp2s0 state: down mac: 38:b1:db:7c:78:c7
WAN IP: 111.91.115.195 IF: wlp2s0 ip-v4: N/A
IF: enp1s0 ip-v4: 192.168.0.103
```

#### Monitor Linux CPU Temperature and Fan Speed

We can keep track of the [hardware installed/configured sensors][3] output by using the -s option:

```
$ inxi -s
Sensors:   System Temperatures: cpu: 53.0C mobo: N/A
Fan Speeds (in rpm): cpu: N/A
```

#### Find Weather Report in Linux

We can also view whether info (though API used is unreliable) for the current location with the `-w` or `-W``<different_location>` to set a different location.

```
$ inxi -w
Weather:   Conditions: 93 F (34 C) - smoke Time: February 20, 1:38 PM IST
$ inxi -W Mumbai,India
Weather:   Conditions: 93 F (34 C) - smoke Time: February 20, 1:38 PM IST
$ inxi -W Nairobi,Kenya
Weather:   Conditions: 70 F (21 C) - Mostly Cloudy Time: February 20, 11:08 AM EAT
```

#### Find All Linux Repsitory Information

We can additionally view a distro repository data with the `-r` flag:

```
$ inxi -r 
Repos:     Active apt sources in file: /etc/apt/sources.list.d/dawidd0811-neofetch-xenial.list
deb http://ppa.launchpad.net/dawidd0811/neofetch/ubuntu xenial main
deb-src http://ppa.launchpad.net/dawidd0811/neofetch/ubuntu xenial main
Active apt sources in file: /etc/apt/sources.list.d/dhor-myway-xenial.list
deb http://ppa.launchpad.net/dhor/myway/ubuntu xenial main
deb-src http://ppa.launchpad.net/dhor/myway/ubuntu xenial main
Active apt sources in file: /etc/apt/sources.list.d/official-package-repositories.list
deb http://packages.linuxmint.com sarah main upstream import backport
deb http://archive.ubuntu.com/ubuntu xenial main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu xenial-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu xenial-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ xenial partner
Active apt sources in file: /etc/apt/sources.list.d/qbittorrent-team-qbittorrent-stable-xenial.list
deb http://ppa.launchpad.net/qbittorrent-team/qbittorrent-stable/ubuntu xenial main
deb-src http://ppa.launchpad.net/qbittorrent-team/qbittorrent-stable/ubuntu xenial main
Active apt sources in file: /etc/apt/sources.list.d/slgobinath-safeeyes-xenial.list
deb http://ppa.launchpad.net/slgobinath/safeeyes/ubuntu xenial main
deb-src http://ppa.launchpad.net/slgobinath/safeeyes/ubuntu xenial main
Active apt sources in file: /etc/apt/sources.list.d/snwh-pulp-xenial.list
deb http://ppa.launchpad.net/snwh/pulp/ubuntu xenial main
deb-src http://ppa.launchpad.net/snwh/pulp/ubuntu xenial main
Active apt sources in file: /etc/apt/sources.list.d/twodopeshaggy-jarun-xenial.list
deb http://ppa.launchpad.net/twodopeshaggy/jarun/ubuntu xenial main
deb-src http://ppa.launchpad.net/twodopeshaggy/jarun/ubuntu xenial main
Active apt sources in file: /etc/apt/sources.list.d/ubuntu-mozilla-security-ppa-xenial.list
deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu xenial main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu xenial main
```

To view it’s current installed version, a quick help, and open the man page for a full list of options and detailed usage info plus lots more, type:

```
$ inxi -v   #show version
$ inxi -h   #quick help
$ man inxi  #open man page
```

For more information, visit official GitHub Repository: [https://github.com/smxi/inxi][4]

That’s all for now! In this article, we reviewed Inxi, a full featured and remarkable command line tool for collecting machine hardware and system info. This is one of the best CLI based [hardware/system information collection tools][5] for Linux, I have ever used.

To share your thoughts about it, use the comment form below. Lastly, in case you know of other, such useful tools as Inxi out there, you can inform us and we will be delighted to review them as well.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/inxi-command-to-find-linux-system-information/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/find-processes-by-memory-usage-top-batch-mode/
[2]:http://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
[3]:http://www.tecmint.com/psensor-monitors-hardware-temperature-in-linux/
[4]:https://github.com/smxi/inxi
[5]:http://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/
[6]:http://www.tecmint.com/author/aaronkili/
[7]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[8]:http://www.tecmint.com/free-linux-shell-scripting-books/
