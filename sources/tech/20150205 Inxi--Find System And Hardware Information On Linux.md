Inxi: Find System And Hardware Information On Linux
================================================================================
We already have shown different [applications][1] and ways to find the system and hardware information on Linux. In that series, today we will see how to find such details using **inxi**. It can be used for forum technical support, as a debugging tool, to quickly ascertain user system configuration and hardware.

**Inxi** is a command line tool that can be used to find the complete system and hardware details such as;

- Hardware,
- CPU,
- Drivers,
- Xorg,
- Desktop,
- Kernel,
- GCC version,
- Processes,
- RAM usage,
- and other useful information.

### Installation ###

Inxi is available in the default repositories of most modern GNU/Linux operating systems. So, we can simply install it by running the following commands.

**On Debian based system:**

    sudo apt-get install inxi

**On Fedora:**

    sudo yum install inxi

**On RHEL based systems:**

Install EPEL repository:

    sudo yum install epel-release

Then, install inxi using command:

    sudo yum install inxi

### Usage ###

To find the quick view of the system information, run the following command from Terminal.

    inxi

**Sample output:**

    CPU~Dual core Intel Core i3-2350M CPU (-HT-MCP-) clocked at Min:800.000Mhz Max:1200.000Mhz Kernel~3.13.0-45-generic x86_64 Up~6:41 Mem~1537.7/3861.3MB HDD~500.1GB(52.5% used) Procs~183 Client~Shell inxi~1.9.17

Ofcourse, we can retrieve a particular hardware details. For example to retrieve the **Audio/Sound hardware details**, run the following command:

    inxi -A

**Sample output:**

    Audio:     Card: Intel 6 Series/C200 Series Family High Definition Audio Controller driver: snd_hda_intel 
               Sound: Advanced Linux Sound Architecture ver: k3.13.0-45-generic

Cool, isn’t it?

Likewise, you can retrieve the details of **Graphic card** information.

    inxi -G

**Sample output:**

    Graphics:  Card: Intel 2nd Generation Core Processor Family Integrated Graphics Controller 
               X.Org: 1.15.1 drivers: intel (unloaded: fbdev,vesa) Resolution: 1366x768@60.0hz 
               GLX Renderer: Mesa DRI Intel Sandybridge Mobile GLX Version: 3.0 Mesa 10.3.0

What about harddisk information? That’s also possible. To view the full **harddisk** information, run the following command.

    inxi -D

**Sample Output:**

    Drives:    HDD Total Size: 500.1GB (52.5% used) 1: id: /dev/sda model: ST9601325BD size: 500.1GB

To display the Bios and Motherboard details:

    inxi -M

**Sample output:**

    Machine:   System: Dell (portable) product: Inspiron N5050
               Mobo: Dell model: 01HXXJ version: A05 Bios: Dell version: A05 date: 08/03/2012

Not only hardware details, it can also displays the **list of available repositories** in our system.

    inxi -r

**Sample output:**

    Repos:     Active apt sources in file: /etc/apt/sources.list
               deb http://ubuntu.excellmedia.net/archive/ trusty main restricted
               deb-src http://ubuntu.excellmedia.net/archive/ trusty main restricted
               deb http://ubuntu.excellmedia.net/archive/ trusty-updates main restricted
               deb-src http://ubuntu.excellmedia.net/archive/ trusty-updates main restricted
               deb http://ubuntu.excellmedia.net/archive/ trusty universe
               .
               .
               Active apt sources in file: /etc/apt/sources.list.d/intellinuxgraphics.list
               deb https://download.01.org/gfx/ubuntu/14.04/main trusty main #Intel Graphics drivers
               Active apt sources in file: /etc/apt/sources.list.d/linrunner-tlp-trusty.list
               Active apt sources in file: /etc/apt/sources.list.d/wseverin-ppa-trusty.list
               deb http://ppa.launchpad.net/wseverin/ppa/ubuntu trusty main

Inxi will also display the Weather details of your location. Surprised? Yes, It should.

    inxi -W Erode,Tamilnadu

Here **Erode** is the District and **Tamilnadu** is a state in India.

Sample output:

    Weather:   Conditions: 79 F (26 C) - Clear Time: February 4, 6:00 PM IST

### Viewing Complete Hardware details ###

Tired of finding each hardware details? Well, you can list all details at once using command:

    inxi -F

**Sample output:**

    System:    Host: sk Kernel: 3.13.0-45-generic x86_64 (64 bit) Desktop: LXDE (Openbox 3.5.2) Distro: Ubuntu 14.04 trusty
    Machine:   System: Dell (portable) product: Inspiron N5050
               Mobo: Dell model: 01HXXJ version: A05 Bios: Dell version: A05 date: 08/03/2012
    CPU:       Dual core Intel Core i3-2350M CPU (-HT-MCP-) cache: 3072 KB flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) 
               Clock Speeds: 1: 800.00 MHz 2: 1000.00 MHz 3: 800.00 MHz 4: 800.00 MHz
    Graphics:  Card: Intel 2nd Generation Core Processor Family Integrated Graphics Controller 
               X.Org: 1.15.1 drivers: intel (unloaded: fbdev,vesa) Resolution: 1366x768@60.0hz 
               GLX Renderer: Mesa DRI Intel Sandybridge Mobile GLX Version: 3.0 Mesa 10.3.0
    Audio:     Card: Intel 6 Series/C200 Series Family High Definition Audio Controller driver: snd_hda_intel 
               Sound: Advanced Linux Sound Architecture ver: k3.13.0-45-generic
    Network:   Card-1: Qualcomm Atheros AR9285 Wireless Network Adapter (PCI-Express) driver: ath9k 
               IF: wlan0 state: up mac: 
               Card-2: Realtek RTL8101E/RTL8102E PCI Express Fast Ethernet controller driver: r8169 
               IF: eth0 state: down mac: 
    Drives:    HDD Total Size: 500.1GB (52.5% used) 1: id: /dev/sda model: ST9500325AS size: 500.1GB 
    Partition: ID: / size: 455G used: 245G (57%) fs: ext4 ID: /boot size: 236M used: 159M (72%) fs: ext2 
               ID: swap-1 size: 4.19GB used: 0.00GB (0%) fs: swap 
    RAID:      No RAID devices detected - /proc/mdstat and md_mod kernel raid module present
    Sensors:   System Temperatures: cpu: 64.5C mobo: N/A 
               Fan Speeds (in rpm): cpu: N/A 
    Info:      Processes: 186 Uptime: 6:52 Memory: 1547.2/3861.3MB Client: Shell (bash) inxi: 1.9.17

As you see in the above, inxi displays the complete hardware details.

For more details, refer the man pages.

    man inxi

### Conclusion ###

Are you searching for a simple tool which displays your complete system and hardware details? Then, don’t look anywhere, inxi will give you what actually want. And, it is light weight tool available in your default repositories. What else you want more? Give it a try, you won’t be disappointed.

Cheers!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/inxi-find-system-hardware-information-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.unixmen.com/screenfetch-bash-screenshot-information-tool/