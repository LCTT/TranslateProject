[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Find Linux System Details Using inxi)
[#]: via: (https://www.ostechnix.com/how-to-find-your-system-details-using-inxi/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Find Linux System Details Using inxi
======

![find Linux system details using inxi][1]

**Inxi** is a free, open source, and full featured command line system information tool. It shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, GCC version(s), Processes, RAM usage, and a wide variety of other useful information. Be it a hard disk or CPU, mother board or the complete detail of the entire system, inxi will display it more accurately in seconds. Since it is CLI tool, you can use it in Desktop or server edition. Inxi is available in the default repositories of most Linux distributions and some BSD systems.

### Install inxi

**On Arch Linux and derivatives:**

To install inxi in Arch Linux or its derivatives like Antergos, and Manajaro Linux, run:

```
$ sudo pacman -S inxi
```

Just in case if Inxi is not available in the default repositories, try to install it from AUR (It varies year to year) using any AUR helper programs.

Using [**Yay**][2]:

```
$ yay -S inxi
```

**On Debian / Ubuntu and derivatives:**

```
$ sudo apt-get install inxi
```

**On Fedora / RHEL / CentOS / Scientific Linux:**

inxi is available in the Fedora default repositories. So, just run the following command to install it straight away.

```
$ sudo dnf install inxi
```

In RHEL and its clones like CentOS and Scientific Linux, you need to add the EPEL repository and then install inxi.

To install EPEL repository, just run:

```
$ sudo yum install epel-release
```

After installing EPEL repository, install inxi using command:

```
$ sudo yum install inxi
```

**On SUSE/openSUSE:**

```
$ sudo zypper install inxi
```

### Find Linux System Details Using inxi

inxi will require some additional programs to operate properly. They will be installed along with inxi. However, in case if they are not installed automatically, you need to find and install them.

To list all required programs, run:

```
$ inxi --recommends
```

If you see any missing programs, then install them before start using inxi.

Now, let us see how to use it to reveal the Linux system details. inxi usage is pretty simple and straight forward.

Open up your Terminal and run the following command to print a short summary of CPU, memory, hard drive and kernel information:

```
$ inxi
```

**Sample output:**

```
CPU: Dual Core Intel Core i3-2350M (-MT MCP-) speed/min/max: 798/800/2300 MHz
Kernel: 5.1.2-arch1-1-ARCH x86_64 Up: 1h 31m Mem: 2800.5/7884.2 MiB (35.5%)
Storage: 465.76 GiB (80.8% used) Procs: 163 Shell: bash 5.0.7 inxi: 3.0.34
```

![][3]

Find Linux System Details Using inxi

As you can see, Inxi displays the following details of my Arch Linux desktop:

  1. CPU type,
  2. CPU speed,
  3. Kernel details,
  4. Uptime,
  5. Memory details (Total and used memory),
  6. Hard disk size along with current usage,
  7. Procs,
  8. Default shell details,
  9. Inxi version.



To display full summary, use **“-F”** switch as shown below.

```
$ inxi -F
```

**Sample output:**

```
System:    Host: sk Kernel: 5.1.2-arch1-1-ARCH x86_64 bits: 64 Desktop: Deepin 15.10.1 Distro: Arch Linux
Machine:   Type: Portable System: Dell product: Inspiron N5050 v: N/A serial: <root required>
           Mobo: Dell model: 01HXXJ v: A05 serial: <root required> BIOS: Dell v: A05 date: 08/03/2012
Battery:   ID-1: BAT0 charge: 39.0 Wh condition: 39.0/48.8 Wh (80%)
CPU:       Topology: Dual Core model: Intel Core i3-2350M bits: 64 type: MT MCP L2 cache: 3072 KiB
           Speed: 798 MHz min/max: 800/2300 MHz Core speeds (MHz): 1: 798 2: 798 3: 798 4: 798
Graphics:  Device-1: Intel 2nd Generation Core Processor Family Integrated Graphics driver: i915 v: kernel
           Display: x11 server: X.Org 1.20.4 driver: modesetting unloaded: vesa resolution: 1366x768~60Hz
           Message: Unable to show advanced data. Required tool glxinfo missing.
Audio:     Device-1: Intel 6 Series/C200 Series Family High Definition Audio driver: snd_hda_intel
           Sound Server: ALSA v: k5.1.2-arch1-1-ARCH
Network:   Device-1: Realtek RTL810xE PCI Express Fast Ethernet driver: r8169
           IF: enp5s0 state: down mac: 45:c8:gh:89:b6:45
           Device-2: Qualcomm Atheros AR9285 Wireless Network Adapter driver: ath9k
           IF: wlp9s0 state: up mac: c3:11:96:22:87:3g
           Device-3: Qualcomm Atheros AR3011 Bluetooth type: USB driver: btusb
Drives:    Local Storage: total: 465.76 GiB used: 376.31 GiB (80.8%)
           ID-1: /dev/sda vendor: Seagate model: ST9500325AS size: 465.76 GiB
Partition: ID-1: / size: 456.26 GiB used: 376.25 GiB (82.5%) fs: ext4 dev: /dev/sda2
           ID-2: /boot size: 92.8 MiB used: 62.9 MiB (67.7%) fs: ext4 dev: /dev/sda1
           ID-3: swap-1 size: 2.00 GiB used: 0 KiB (0.0%) fs: swap dev: /dev/sda3
Sensors:   System Temperatures: cpu: 58.0 C mobo: N/A
           Fan Speeds (RPM): cpu: 3445
Info:      Processes: 169 Uptime: 1h 38m Memory: 7.70 GiB used: 2.94 GiB (38.2%) Shell: bash inxi: 3.0.34
```

Inxi used on IRC automatically filters out your network device MAC address, WAN and LAN IP, your /home username directory in partitions, and a few other items in order to maintain basic privacy and security. You can also trigger this filtering with the **-z** option like below.

```
$ inxi -Fz
```

To override the IRC filter, use the **-Z** option.

```
$ inxi -FZ
```

This can be useful in debugging network connection issues online in a private chat, for example. Please be very careful while using -Z option. It will display your MAC addresses. You shouldn’t share the results got with -Z option in public forums.

##### Displaying device-specific details

When running inxi without any options, you will get basic details of your system, such as CPU, Memory, Kernel, Uptime, harddisk etc.

You can, of course, narrow down the result to show specific device details using various options. Inxi has numerous options (both uppercase and lowercase).

First, we will see example commands for all uppercase options in alphabetical order. Some commands may require root/sudo privileges to get actual data.

####### **Uppercase options**

**1\. Display Audio/Sound card details**

To show your audio and sound card(s) information with sound card driver, use **-A** option.

```
$ inxi -A
Audio:     Device-1: Intel 6 Series/C200 Series Family High Definition Audio driver: snd_hda_intel
           Sound Server: ALSA v: k5.1.2-arch1-1-ARCH
```

**2\. Display Battery details**

To show battery details of your system with current charge and condition, use **-B** option.

```
$  inxi -B
Battery:   ID-1: BAT0 charge: 39.0 Wh condition: 39.0/48.8 Wh (80%)
```

**3\. Display CPU details**

To show complete CPU details including no of cores, CPU model, CPU cache, CPU clock speed, CPU min/max speed etc., use **-C** option.

```
$ inxi -C
CPU:       Topology: Dual Core model: Intel Core i3-2350M bits: 64 type: MT MCP L2 cache: 3072 KiB
           Speed: 798 MHz min/max: 800/2300 MHz Core speeds (MHz): 1: 798 2: 798 3: 798 4: 798
```

**4\. Display hard disk details**

To show information about your hard drive, such as Disk type, vendor, device ID, model, disk size, total disk space, used percentage etc., use **-D** option.

```
$ inxi -D
Drives:    Local Storage: total: 465.76 GiB used: 376.31 GiB (80.8%)
           ID-1: /dev/sda vendor: Seagate model: ST9500325AS size: 465.76 GiB
```

**5\. Disply Graphics details**

To show details about the graphics card, including details of grahics card, driver, vendor, display server, resolution etc., use **-G** option.

```
$ inxi -G
Graphics:  Device-1: Intel 2nd Generation Core Processor Family Integrated Graphics driver: i915 v: kernel
           Display: x11 server: X.Org 1.20.4 driver: modesetting unloaded: vesa resolution: 1366x768~60Hz
           Message: Unable to show advanced data. Required tool glxinfo missing.
```

**6\. Display details about processes, uptime, memory, inxi version**

To show information about no of processes, total uptime, total memory with used memory, Shell details and inxi version etc., use **-I** option.

```
$ inxi -I
Info:      Processes: 170 Uptime: 5h 47m Memory: 7.70 GiB used: 3.27 GiB (42.4%) Shell: bash inxi: 3.0.34
```

**7\. Display Motherboard details**

To show information about your machine details, manufacturer, motherboard, BIOS, use **-M** option.

```
$ inxi -M
Machine:   Type: Portable System: Dell product: Inspiron N5050 v: N/A serial: <root required>
           Mobo: Dell model: 034ygt v: A018 serial: <root required> BIOS: Dell v: A001 date: 09/04/2015
```

**8\. Display network card details**

To show information about your network card, including vendor, card driver and no of network interfaces etc., use **-N** option.

```
$ inxi -N
Network:   Device-1: Realtek RTL810xE PCI Express Fast Ethernet driver: r8169
           Device-2: Qualcomm Atheros AR9285 Wireless Network Adapter driver: ath9k
           Device-3: Qualcomm Atheros AR3011 Bluetooth type: USB driver: btusb
```

If you want to show the advanced details of the network cards, such as MAC address, speed and state of nic, use **-n** option.

```
$ inxi -n
```

Please careful sharing this details on public forum.

**9\. Display Partition details**

To display basic partition information, use **-P** option.

```
$ inxi -P
Partition: ID-1: / size: 456.26 GiB used: 376.25 GiB (82.5%) fs: ext4 dev: /dev/sda2
           ID-2: /boot size: 92.8 MiB used: 62.9 MiB (67.7%) fs: ext4 dev: /dev/sda1
           ID-3: swap-1 size: 2.00 GiB used: 0 KiB (0.0%) fs: swap dev: /dev/sda3
```

To show full partition information including mount points, use **-p** option.

```
$ inxi -p
```

**10\. Display RAID details**

To show RAID info, use **-R** option.

```
$ inxi -R
```

**11\. Display system details**

To show Linux system information such as hostname, kernel, DE, OS version etc., use **-S** option.

```
$ inxi -S
System:    Host: sk Kernel: 5.1.2-arch1-1-ARCH x86_64 bits: 64 Desktop: Deepin 15.10.1 Distro: Arch Linux
```

**12\. Displaying weather details**

Inixi is not just for finding hardware details. It is useful for getting other stuffs too.

For example, you can display the weather details of a given location. To do so, run inxi with **-W** option like below.

```
$ inxi -W 95623,us
Weather:   Temperature: 21.1 C (70 F) Conditions: Scattered clouds Current Time: Tue 11 Jun 2019 04:34:35 AM PDT
           Source: WeatherBit.io
```

Please note that you should use only ASCII letters in city/state/country names to get valid results.

####### Lowercase options

**1\. Display basic system details**

To show only the basic summary of your system details, use **-b** option.

```
$ inxi -b
```

Alternatively, you can use this command:

Both servers the same purpose.

```
$ inxi -v 2
```

**2\. Set color scheme**

We can set different color schemes for inxi output using **-c** option. Yu can set color scheme number from **0** to **42**. If no scheme number is supplied, **0** is assumed.

Here is inxi output with and without **-c** option.

![][4]

inxi output without color scheme

As you can see, when we run inxi with -c option, the color scheme is disabled. The -c option is useful to turnoff colored output when redirecting clean output without escape codes to a text file.

Similarly, we can use other color scheme values.

```
$ inxi -c10

$ inxi -c42
```

**3\. Display optical drive details**

We can show the optical drive data details along with local hard drive details using **-d** option.

```
$ inxi -d
Drives:    Local Storage: total: 465.76 GiB used: 376.31 GiB (80.8%)
           ID-1: /dev/sda vendor: Seagate model: ST9500325AS size: 465.76 GiB
           Optical-1: /dev/sr0 vendor: PLDS model: DVD+-RW DS-8A8SH dev-links: cdrom
           Features: speed: 24 multisession: yes audio: yes dvd: yes rw: cd-r,cd-rw,dvd-r,dvd-ram
```

**4\. Display all CPU flags**

To show all CPU flags used, run:

```
$ inxi -f
```

**5\. Display IP details**

To show WAN and local ip address along network card details such as device vendor, driver, mac, state etc., use **-i** option.

```
$ inxi -i
```

**6\. Display partition labels**

If you have set labels for the partitions, you can view them using **-l** option.

```
$ inxi -l
```

You can also view the labels of all partitions along with mountpoints using command:

```
$ inxi -pl
```

**7\. Display Memory details**

We can display memory details such as total size of installed RAM, how much memory is used, no of available DIMM slots, total size of supported RAM, how much RAM is currently installed in each slots etc., using **-m** option.

```
$ sudo inxi -m
[sudo] password for sk:
Memory:    RAM: total: 7.70 GiB used: 2.26 GiB (29.3%)
           Array-1: capacity: 16 GiB slots: 2 EC: None
           Device-1: DIMM_A size: 4 GiB speed: 1067 MT/s
           Device-2: DIMM_B size: 4 GiB speed: 1067 MT/s
```

**8\. Display unmounted partition details**

To show unmounted partition details, use **-o** option.

```
$ inxi -o
```

If there were no unmounted partitions in your system, you will see an output something like below.

```
Unmounted: Message: No unmounted partitions found.
```

**9\. Display list of repositories**

To display the the list of repositories in your system, use **-r** option.

```
$ inxi -r
```

**Sample output:**

```
Repos: Active apt sources in file: /etc/apt/sources.list
deb http://in.archive.ubuntu.com/ubuntu/ xenial main restricted
deb http://in.archive.ubuntu.com/ubuntu/ xenial-updates main restricted
deb http://in.archive.ubuntu.com/ubuntu/ xenial universe
deb http://in.archive.ubuntu.com/ubuntu/ xenial-updates universe
deb http://in.archive.ubuntu.com/ubuntu/ xenial multiverse
deb http://in.archive.ubuntu.com/ubuntu/ xenial-updates multiverse
deb http://in.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu xenial-security main restricted
deb http://security.ubuntu.com/ubuntu xenial-security universe
deb http://security.ubuntu.com/ubuntu xenial-security multiverse
```

* * *

**Suggested read:**

  * [**How To Find The List Of Installed Repositories From Commandline In Linux**][5]



* * *

**10\. Show system temperature, fan speed details**

Inxi is capable to find motherboard/CPU/GPU temperatures and fan speed.

```
$ inxi -s
Sensors:   System Temperatures: cpu: 60.0 C mobo: N/A
           Fan Speeds (RPM): cpu: 3456
```

Please note that Inxi requires sensors to find the system temperature. Make sure **lm_sensors** is installed and correctly configured in your system. For more details about lm_sensors, check the following guide.

  * [**How To View CPU Temperature On Linux**][6]



**11\. Display details about processes**

To show the list processes top 5 processes which are consuming most CPU and Memory, simply run:

```
$ inxi -t
Processes: CPU top: 5
           1: cpu: 14.3% command: firefox pid: 15989
           2: cpu: 10.5% command: firefox pid: 13487
           3: cpu: 7.1% command: firefox pid: 15062
           4: cpu: 3.1% command: xorg pid: 13493
           5: cpu: 3.0% command: firefox pid: 14954
           System RAM: total: 7.70 GiB used: 2.99 GiB (38.8%)
           Memory top: 5
           1: mem: 1115.8 MiB (14.1%) command: firefox pid: 15989
           2: mem: 606.6 MiB (7.6%) command: firefox pid: 13487
           3: mem: 339.3 MiB (4.3%) command: firefox pid: 13630
           4: mem: 303.1 MiB (3.8%) command: firefox pid: 18617
           5: mem: 260.1 MiB (3.2%) command: firefox pid: 15062
```

We can also sort this output by either CPU usage or Memory usage.

For instance, to find the which top 5 processes are consuming most memory, use the following command:

```
$ inxi -t m
Processes: System RAM: total: 7.70 GiB used: 2.73 GiB (35.4%)
           Memory top: 5
           1: mem: 966.1 MiB (12.2%) command: firefox pid: 15989
           2: mem: 468.2 MiB (5.9%) command: firefox pid: 13487
           3: mem: 347.9 MiB (4.4%) command: firefox pid: 13708
           4: mem: 306.7 MiB (3.8%) command: firefox pid: 13630
           5: mem: 247.2 MiB (3.1%) command: firefox pid: 15062
```

To sort the top 5 processes based on CPU usage, run:

```
$ inxi -t c
Processes: CPU top: 5
           1: cpu: 14.9% command: firefox pid: 15989
           2: cpu: 10.6% command: firefox pid: 13487
           3: cpu: 7.0% command: firefox pid: 15062
           4: cpu: 3.1% command: xorg pid: 13493
           5: cpu: 2.9% command: firefox pid: 14954
```

Bydefault, Inxi will display the top 5 processes. You can change the number of processes, for example 10, like below.

```
$ inxi -t cm10
Processes: CPU top: 10
           1: cpu: 14.9% command: firefox pid: 15989
           2: cpu: 10.6% command: firefox pid: 13487
           3: cpu: 7.0% command: firefox pid: 15062
           4: cpu: 3.1% command: xorg pid: 13493
           5: cpu: 2.9% command: firefox pid: 14954
           6: cpu: 2.8% command: firefox pid: 13630
           7: cpu: 1.8% command: firefox pid: 18325
           8: cpu: 1.4% command: firefox pid: 18617
           9: cpu: 1.3% command: firefox pid: 13708
           10: cpu: 0.8% command: firefox pid: 14427
           System RAM: total: 7.70 GiB used: 2.92 GiB (37.9%)
           Memory top: 10
           1: mem: 1160.9 MiB (14.7%) command: firefox pid: 15989
           2: mem: 475.1 MiB (6.0%) command: firefox pid: 13487
           3: mem: 353.4 MiB (4.4%) command: firefox pid: 13708
           4: mem: 308.0 MiB (3.9%) command: firefox pid: 13630
           5: mem: 269.6 MiB (3.4%) command: firefox pid: 15062
           6: mem: 249.3 MiB (3.1%) command: firefox pid: 14427
           7: mem: 238.5 MiB (3.0%) command: firefox pid: 14954
           8: mem: 208.2 MiB (2.6%) command: firefox pid: 18325
           9: mem: 194.0 MiB (2.4%) command: firefox pid: 18617
           10: mem: 143.6 MiB (1.8%) command: firefox pid: 23960
```

The above command will display the top 10 processes that consumes the most CPU and Memory.

To display only top10 based on memory usage, run:

```
$ inxi -t m10
```

**12\. Display partition UUID details**

To show partition UUIDs ( **U** niversally **U** nique **Id** entifier), use **-u** option.

```
$ inxi -u
```

There are much more options are yet to be covered. But, these are just enough to get almost all details of your Linux box.

For more details and options, refer the man page.

```
$ man inxi
```

* * *

**Related read:**

  * **[Neofetch – Display your Linux system’s information][7]**



* * *

The primary purpose of Inxi tool is to use in IRC or forum support. If you are looking for any help via a forum or website where someone is asking the specification of your system, just run this command, and copy/paste the output.

**Resources:**

  * [**Inxi GitHub Repository**][8]
  * [**Inxi home page**][9]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-your-system-details-using-inxi/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2016/08/inxi-520x245-1-720x340.png
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[3]: http://www.ostechnix.com/wp-content/uploads/2016/08/Find-Linux-System-Details-Using-inxi.png
[4]: http://www.ostechnix.com/wp-content/uploads/2016/08/inxi-output-without-color-scheme.png
[5]: https://www.ostechnix.com/find-list-installed-repositories-commandline-linux/
[6]: https://www.ostechnix.com/view-cpu-temperature-linux/
[7]: http://www.ostechnix.com/neofetch-display-linux-systems-information/
[8]: https://github.com/smxi/inxi
[9]: http://smxi.org/docs/inxi.htm
