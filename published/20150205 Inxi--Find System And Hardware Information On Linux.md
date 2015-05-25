Inxi：获取Linux的系统和硬件信息
================================================================================

我们已经展示了一些不同的[应用程序][1]和方法来获取Linux的系统和硬件信息。在这一系列里，我们将看到如何使用**inxi**来获取这些详情信息。在论坛技术支持中，它可以作为调试工具，迅速确定用户的系统配置和硬件信息。

**Inxi**是一个可以获取完整的系统和硬件详情信息的命令行工具，内容包括：

- 硬件
- CPU
- 磁盘驱动器
- Xorg
- 桌面环境
- 内核
- GCC版本
- 进程
- 内存占用
- 和其他有用的信息

### 安装方法 ###

Inxi在多数现代GNU/Linux操作系统的默认软件仓库中。所以我们可以简单地运行下列命令安装。

**在基于Debian的发行版：**

    sudo apt-get install inxi

**在Fedora：**

    sudo yum install inxi

**在基于RHEL的发行版：**

安装EPEL软件仓库：

    sudo yum install epel-release

然后使用如下命令安装inxi：

    sudo yum install inxi

### 使用方法 ###

在终端运行如下命令可以获取系统的概况信息。

    inxi

**示例输出：**

    CPU~Dual core Intel Core i3-2350M CPU (-HT-MCP-) clocked at Min:800.000Mhz Max:1200.000Mhz Kernel~3.13.0-45-generic x86_64 Up~6:41 Mem~1537.7/3861.3MB HDD~500.1GB(52.5% used) Procs~183 Client~Shell inxi~1.9.17

当然，我们可以获取一个特定硬件的详情信息。比如获取**声音/音频硬件详情信息**，可以运行如下命令：

    inxi -A

**示例输出：**

    Audio:     Card: Intel 6 Series/C200 Series Family High Definition Audio Controller driver: snd_hda_intel 
               Sound: Advanced Linux Sound Architecture ver: k3.13.0-45-generic

很酷是吧？

同样的，你可以获取**显卡**的详情信息。

    inxi -G

**示例输出：**

    Graphics:  Card: Intel 2nd Generation Core Processor Family Integrated Graphics Controller 
               X.Org: 1.15.1 drivers: intel (unloaded: fbdev,vesa) Resolution: 1366x768@60.0hz 
               GLX Renderer: Mesa DRI Intel Sandybridge Mobile GLX Version: 3.0 Mesa 10.3.0

硬盘信息呢？也是可以的。运行如下命令来获取完整的**硬盘**信息。

    inxi -D

**示例输出：**

    Drives:    HDD Total Size: 500.1GB (52.5% used) 1: id: /dev/sda model: ST9601325BD size: 500.1GB

显示Bios和主板详情信息：

    inxi -M

**示例输出：**

    Machine:   System: Dell (portable) product: Inspiron N5050
               Mobo: Dell model: 01HXXJ version: A05 Bios: Dell version: A05 date: 08/03/2012

不仅是硬性详情信息，它也可以显示我们系统中的**可用软件仓库列表**。

    inxi -r

**示例输出：**

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

Inxi还可以显示你所在位置的天气信息。感到意外吗？是的，它可以。

    inxi -W Erode,Tamilnadu

这里**Erode**是地区，**Tamilnadu**是印度的一个邦。

示例输出：

    Weather:   Conditions: 79 F (26 C) - Clear Time: February 4, 6:00 PM IST

### 查看完整的硬件详情信息 ###

厌倦了逐一获取每种硬件的信息？你可以使用如下命令将所有信息一次列出：

    inxi -F

**示例输出：**

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

就像上面你看到的那样，inxi显示出了完整的硬件详情信息。

更多的细节可以参考man手册。

    man inxi

### 结论 ###

你在寻找一个可以显示完整的系统和硬件详情信息的简单工具吗？那么不用再找了，inxi会提供你所需要的。并且，它还是在你系统默认的软件仓库中的轻量级工具。你还想要更多东西吗？试一试它，你不会失望。

欢呼吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/inxi-find-system-hardware-information-linux/

作者：[SK][a]
译者：[goreliu](https://github.com/goreliu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://linux.cn/article-1947-1.html
