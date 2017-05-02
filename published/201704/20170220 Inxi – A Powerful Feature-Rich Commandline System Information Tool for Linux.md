inxi：一个功能强大的获取 Linux 系统信息的命令行工具
============================================================

Inxi 最初是为控制台和 IRC（网络中继聊天）开发的一个强大且优秀的命令行系统信息脚本。可以使用它获取用户的硬件和系统信息，它也用于调试或者社区技术支持工具。

使用 Inxi 可以很容易的获取所有的硬件信息：硬盘、声卡、显卡、网卡、CPU 和 RAM 等。同时也能够获取大量的操作系统信息，比如硬件驱动、Xorg 、桌面环境、内核、GCC 版本，进程，开机时间和内存等信息。 

运行在命令行和 IRC 上的 Inxi 输出略有不同，IRC 上会有一些可供用户使用的默认过滤器和颜色选项。支持的 IRC 客户端有：BitchX、Gaim/Pidgin、ircII、Irssi、 Konversation、 Kopete、 KSirc、 KVIrc、 Weechat 和 Xchat 以及其它的一些客户端，它们具有展示内置或外部 Inxi 输出的能力。

### 在 Linux 系统上安装 Inxi

大多数主流 Linux 发行版的仓库中都有 Inxi ，包括大多数 BSD 系统。

```
$ sudo apt-get install inxi   [On Debian/Ubuntu/Linux Mint]
$ sudo yum install inxi       [On CentOs/RHEL/Fedora]
$ sudo dnf install inxi       [On Fedora 22+]
```

在使用 Inxi 之前，用下面的命令查看 Inxi 所有依赖和推荐的应用，以及各种目录，并显示需要安装哪些包来支持给定的功能。


```
$ inxi --recommends 
```

Inxi 的输出：

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

### Inxi 工具的基本用法

用下面的基本用法获取系统和硬件的详细信息。

#### 获取 Linux 系统信息

Inix 不加任何选项就能输出下面的信息：CPU 、内核、开机时长、内存大小、硬盘大小、进程数、登录终端以及 Inxi 版本。

```
$ inxi
CPU~Dual core Intel Core i5-4210U (-HT-MCP-) speed/max~2164/2700 MHz Kernel~4.4.0-21-generic x86_64 Up~3:15 Mem~3122.0/7879.9MB HDD~1000.2GB(20.0% used) Procs~234 Client~Shell inxi~2.2.35
```

#### 获取内核和发行版本信息

使用 Inxi 的 `-S` 选项查看本机系统信息（主机名、内核信息、桌面环境和发行版）：

```
$ inxi -S
System: Host: TecMint Kernel: 4.4.0-21-generic x86_64 (64 bit) Desktop: Cinnamon 3.0.7
Distro: Linux Mint 18 Sarah
```

### 获取电脑机型

使用 `-M` 选项查看机型（笔记本/台式机）、产品 ID 、机器版本、主板、制造商和 BIOS 等信息：


```
$ inxi -M
Machine:   System: LENOVO (portable) product: 20354 v: Lenovo Z50-70
Mobo: LENOVO model: Lancer 5A5 v: 31900059WIN Bios: LENOVO v: 9BCN26WW date: 07/31/2014
```

### 获取 CPU 及主频信息

使用 `-C` 选项查看完整的 CPU 信息，包括每核 CPU 的频率及可用的最大主频。 

```
$ inxi -C
CPU:       Dual core Intel Core i5-4210U (-HT-MCP-) cache: 3072 KB 
clock speeds: max: 2700 MHz 1: 1942 MHz 2: 1968 MHz 3: 1734 MHz 4: 1710 MHz
```

#### 获取显卡信息

使用 `-G` 选项查看显卡信息，包括显卡类型、显示服务器、系统分辨率、GLX 渲染器和 GLX 版本等等（LCTT 译注： GLX 是一个 X 窗口系统的 OpenGL 扩展）。

```
$ inxi -G
Graphics:  Card-1: Intel Haswell-ULT Integrated Graphics Controller
Card-2: NVIDIA GM108M [GeForce 840M]
Display Server: X.Org 1.18.4 drivers: intel (unloaded: fbdev,vesa) Resolution: 1920x1080@60.05hz
GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa 11.2.0
```

#### 获取声卡信息

使用 `-A` 选项查看声卡信息：

```
$ inxi -A
Audio:     Card-1 Intel 8 Series HD Audio Controller driver: snd_hda_intel Sound: ALSA v: k4.4.0-21-generic
Card-2 Intel Haswell-ULT HD Audio Controller driver: snd_hda_intel
```

#### 获取网卡信息

使用 `-N` 选项查看网卡信息：

```
$ inxi -N
Network:   Card-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller driver: r8169
Card-2: Realtek RTL8723BE PCIe Wireless Network Adapter driver: rtl8723be
```

#### 获取硬盘信息

使用 `-D` 选项查看硬盘信息（大小、ID、型号）：

```
$ inxi -D
Drives:    HDD Total Size: 1000.2GB (20.0% used) ID-1: /dev/sda model: ST1000LM024_HN size: 1000.2GB
```
####  获取简要的系统信息

使用 `-b` 选项显示上述信息的简要系统信息：

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

#### 获取硬盘分区信息

使用 `-p` 选项输出完整的硬盘分区信息，包括每个分区的分区大小、已用空间、可用空间、文件系统以及文件系统类型。

```
$ inxi -p
Partition: ID-1: / size: 324G used: 183G (60%) fs: ext4 dev: /dev/sda10
ID-2: swap-1 size: 4.00GB used: 0.00GB (0%) fs: swap dev: /dev/sda9
```
#### 获取完整的 Linux 系统信息

使用 `-F` 选项查看可以完整的 Inxi 输出（安全起见比如网络 IP 地址信息没有显示，下面的示例只显示部分输出信息）：

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

### 使用 Inxi 工具监控 Linux 系统

下面是监控 Linux 系统进程、开机时间和内存的几个选项的使用方法。

#### 监控 Linux 进程的内存使用

使用下面的命令查看进程数、开机时间和内存使用情况：

```
$ inxi -I
Info:      Processes: 232 Uptime: 3:35 Memory: 3256.3/7879.9MB Client: Shell (bash) inxi: 2.2.35 
```

#### 监控进程占用的 CPU 和内存资源

Inxi 默认显示 [前 5 个最消耗 CPU 和内存的进程][1]。 `-t` 选项和 `c` 选项一起使用查看前 5 个最消耗 CPU 资源的进程，查看最消耗内存的进程使用 `-t` 选项和 `m` 选项； `-t`选项 和 `cm` 选项一起使用显示前 5 个最消耗 CPU 和内存资源的进程。

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

可以在选项 `cm` 后跟一个整数（在 1-20 之间）设置显示多少个进程，下面的命令显示了前 10 个最消耗 CPU 和内存的进程：

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

#### 监控网络设备

下面的命令会列出网卡信息，包括接口信息、网络频率、mac 地址、网卡状态和网络 IP 等信息。

```
$ inxi -Nni
Network:   Card-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller driver: r8169
IF: enp1s0 state: up speed: 100 Mbps duplex: full mac: 28:d2:44:eb:bd:98
Card-2: Realtek RTL8723BE PCIe Wireless Network Adapter driver: rtl8723be
IF: wlp2s0 state: down mac: 38:b1:db:7c:78:c7
WAN IP: 111.91.115.195 IF: wlp2s0 ip-v4: N/A
IF: enp1s0 ip-v4: 192.168.0.103
```

#### 监控 CPU 温度和电脑风扇转速

可以使用 `-s` 选项监控 [配置了传感器的机器][2] 获取温度和风扇转速：

```
$ inxi -s
Sensors:   System Temperatures: cpu: 53.0C mobo: N/A
Fan Speeds (in rpm): cpu: N/A
```

#### 用 Linux 查看天气预报

使用 `-w` 选项查看本地区的天气情况（虽然使用的 API 可能不是很可靠），使用 `-W  <different_location>` 设置另外的地区。

```
$ inxi -w
Weather:   Conditions: 93 F (34 C) - smoke Time: February 20, 1:38 PM IST
$ inxi -W Mumbai,India
Weather:   Conditions: 93 F (34 C) - smoke Time: February 20, 1:38 PM IST
$ inxi -W Nairobi,Kenya
Weather:   Conditions: 70 F (21 C) - Mostly Cloudy Time: February 20, 11:08 AM EAT
```

#### 查看所有的 Linux 仓库信息

另外，可以使用 `-r` 选项查看一个 Linux 发行版的仓库信息：

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

下面是查看 Inxi 的安装版本、快速帮助和打开 man 主页的方法，以及更多的 Inxi 使用细节。

```
$ inxi -v   #显示版本信息
$ inxi -h   #快速帮助
$ man inxi  #打开 man 主页
```

浏览 Inxi 的官方 GitHub 主页 [https://github.com/smxi/inxi][4] 查看更多的信息。

Inxi 是一个功能强大的获取硬件和系统信息的命令行工具。这也是我使用过的最好的 [获取硬件和系统信息的命令行工具][5] 之一。

写下你的评论。如果你知道其他的像 Inxi 这样的工具，我们很高兴和你一起讨论。


--------------------------------------------------------------------------------


作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S 的狂热爱好者，即任的 Linux 系统管理员，web 开发者，TecMint 网站的专栏作者，他喜欢使用计算机工作，并且乐于分享计算机技术。


--------------------------------------------------------------------------------

via: http://www.tecmint.com/inxi-command-to-find-linux-system-information/

作者：[Aaron Kili][a]
译者：[vim-kakali](https://github.com/vim-kakali)
校对：[wxy](https://github.com/wxy)

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
