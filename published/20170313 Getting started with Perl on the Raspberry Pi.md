在树莓派中开启激动人心的 Perl 之旅
============================================================

> 树莓派，随心所欲。

 ![Getting started with Perl on the Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberry_pi_blue_board.jpg?itok=hZkYuk-m "Getting started with Perl on the Raspberry Pi") 

我最近在 SVPerl （硅谷 Perl 聚会）谈到在树莓派上运行  Perl 语言的时候，有人问我，“我听说树莓派应该使用 Python ，是这样吗？”。我非常乐意回答他，这是个常见误解。树莓派可以支持任何语言： Python、Perl 和其他树莓派官方软件 Raspbian Linux 初始安装的语言。

看似很厉害，其实很简单。树莓派的创造者英国的计算机科学教授 Eben Upton 曾经说过，树莓派名字中的‘派’（pi），是想为了听起来像 Python，因为他喜欢这门语言。他选择了这门语言作为孩子们的启蒙语言。但是他和他的团队做了一个通用计算机。开源软件没给树莓派任何限制。我们想运行什么就运行什么，全凭自己心意。

我在 SVPerl 和这篇文章中还想讲第二点，就是介绍我的 “PiFlash” 脚本。虽然它是用 Perl 写的，但是不需要你有多了解 Perl 就可以在 Linux 下将树莓派系统自动化烧录到 SD 卡。这样对初学者就比较友好，避免他们在烧录 SD 卡时候，偶然擦除了整个硬盘。即使是高级用户也可以从它的自动化工作中受益，包括我，这也是我开发这个工具的原因。在 Windows 和 Mac 下也有类似的工具，但是树莓派网站没有介绍类似工具给 Linux 用户。不过，现在有了。

开源软件早就有自己造轮子的传统，因为他们总是崇尚“自痒自挠”去解决问题。这种方式在 Eric S 1997 年的论文和 1999 年的书籍《[大教堂与集市][8]》中早有提及，它定义了开源软件的方法论。我也是为了满足想我这样的 Linux 用户，所以写了这个脚本。

### 下载系统镜像

想要开启树莓派之旅，你首先需要为它下载一个操作系统。我们称之为“系统镜像”文件。一旦你把它下载到你的桌面、手提电脑，或者甚至是另一个树莓派中，我就需要写入或者称之为“烧录”进你的 SD卡。详细情况可以看在线文件。手动做这件事情需要一些功底，你要把系统镜像烧录到整个 SD卡，而不是其中一块分区。系统镜像必须独自包含至少一个分区，因为树莓派引导需要一个 FAT32文件系统分区，系统引导这里开始。除了引导分区，其他分区可以是操作系统内核支持的任何分区类型。

在大部分树莓派中，我们都运行的是某些使用 Linux 内核的发行版。已经有一系列树莓派中常用的系统镜像你可以下载使用。（当然，没什么能阻止你自己造轮子）

树莓派基金会向新手推荐的是“[NOOBS][9]”系统。它代表了 “New Out of the Box System”（新鲜出炉即开即用系统），显然它好像听起来像术语 “noob"”（小白），通俗点说就是 “newbie”（菜鸟）。NOOBS 是一个基于树莓派的 Linux 系统，它会给你一个菜单可以在你的树莓派上自动下载安装几个其它的系统镜像。

[Raspbian Linux][10] 是 Debian Linux 发行版的树莓派定制版。它是为树莓派开发的正式 Linux 发行版，并且由树莓派基金会维护。几乎所有树莓派驱动和软件都会在 Raspbian 上先试用，然后才会放到其它发行版上。其默认安装博客 Perl。

Ubuntu Linux （还有其社区版的 Ubuntu MATE）也将树莓派作为其支持 ARM （Advanced RISC Machines）处理器的平台之一。RISC（Reduced Instruction Set Computer）Ubuntu 是一个 Debian Linux 的商业化支持的开源分支，它也使用 DEB 包管理器。Perl 也在其中。它仅仅支持 32 位 ARM7 或者 64 位 ARM8 处理器的树莓派 2 和 3。ARM6 的树莓派 1 和 Zero 从未被 Ubuntu 构建过程支持。

[Fedora Linux][12] 支持树莓派2	，而 Fedora 25 支持 3。 Fedora 是一个隶属于红帽（Red Hat）的开源项目。Fedora  是个基础，商业版的 RHEL（Red Hat Enterprise Linux）在其上增加了商业软件包和支持，所以其软件像所有的兼容红帽的发行版一样来自 RPM（Red Hat Package Manager） 软件包。就像其它发行版一样，也包括 Perl。

[RISC OS][13] 是一个特别针对 ARM 处理器的单用户操作系统。如果你想要一个比 Linux 系统更加简洁的小型桌面（功能更少），你可以考虑一下。它同样支持 Perl。

[RaspBSD][14] 是一个 FreeBSD 的树莓派发行版。它是一个基于 Unix 的系统，而不是 Linux。作为开源 Unix 的一员，它延续了 Unix 的功能，而且和 Linux 有着众多相似之处。包括有类似的开源软件带来的相似的系统环境，包括 Perl。

[OSMC][15]，即开源多媒体中心，以及 [LibreElec][16] 电视娱乐中心，它们都基于运行 Linux 内核之上的 Kodi 娱乐中心。它是一个小巧、特化的 Linux 系统，所以不要期望它能支持 Perl。

[Microsoft Windows IoT Core][17] 是仅运行在树莓派３上的新成员。你需要微软开发者身份才能下载。而作为一个 Linux 极客，我根本不看它。我的 PiFlash 脚本还不支持它，但如果你找的是它，你可以去看看。

### PiFlash 脚本

如果你想看看[树莓派 SD 卡烧录指导][19]，你可以找到在 Windows 或者 Mac 系统下需要下载的工具来完成烧录任务。但是对于 Linux 系统，只有一系列手工操作建议。我已经手工做过这个太多次，这很容易引发一个开发者的本能去自动化这个过程，这就是 PiFlash 脚本的起源。这有点难，因为 Linux 有太多方法可以配置，但是它们都是基于 Linux 内核的。

我总是觉得，手工操作潜在最大的失误恐怕就是偶然错误地擦除了某个设备，而不是擦除了 SD 卡，然后彻底清除了我本想保留在硬盘的东西。我在 SVPerl 演讲中也说了，我很惊讶地发现在听众中有犯了这种错误（而且不害怕承认）的人。因此，PiFlash 其中一个目的就是保护新手的安全，不会擦除 SD 卡之外的设备。PiFlash 脚本还会拒绝覆写包含了已经挂载的文件系统的设备。

对于有经验的用户，包括我，PiFlash 脚本还提供提供一个简便的自动化服务。下载完系统镜像之后，我不需要必须从 zip格式中解压缩或者提取出系统镜像。PiFlash 可以直接提取它，不管是哪种格式，并且直接烧录到 SD 卡中。

我把 [PiFlash 及其指导][21]发布在了 GitHub 上。

命令行用法如下：

```
piflash [--verbose] input-file output-device
piflash [--verbose] --SDsearch
```

`input-file` 参数是你要写入的系统镜像文件，只要是你从树莓派发行版网站下载的镜像都行。`output-device` 参数是你要写入的 SD 卡的块设备路径。

你也可以使用 `--SDsearch` 参数列出挂载在系统中 SD  卡设备名称。

可选项 `--verbose` 可以输出所有的程序状态数据，它在你需要帮助时或者递送 bug 报告和自行排错时很有用。它就是我开发时用的。

下面的例子是我使用该脚本写入仍是 zip 存档的 Raspbian 镜像到位于 `/dev/mmcblk0` 的 SD 卡：

```
piflash 2016-11-25-raspbian-jessie.img.zip /dev/mmcblk0
```

如果你已经指定了 `/dev/mmcblk0p1` （SD 卡的第一分区），它会识别到这个分区不是一个正确的位置，并拒绝写入。	

在不同的 Linux 系统中怎样去识别哪个设备是 SD 卡是一个技术活。像 mmcblk0 这种在我的笔记本上是基于 PCI 的 SD卡接口。如果我使用了 USB SD 卡接口，它就是 `/dev/sdb`，这在多硬盘的系统中不好区分。然而，只有少量的 Linux 块设备支持 SD 卡。PiFlash 在这两种情况下都会检查块设备的参数。如果全部失败，它会认为可写入、可移动的，并有着正确物理扇区数量的 USB 驱动器是 SD 卡。

我想这应该能涵盖大部分情况。但是，如果你使用了我不知道的 SD 卡接口呢？我乐意看到你的来信。请在输出信息中加上 `--verbos --SDsearch` 参数，以便让我可以知道你系统目前的环境。理想情况下，如果 PiFlash 脚本可以被广泛利用，我们可以构建一个开源社区去尽可能的帮助更多的树莓派用户。

### 树莓派的 CPAN 模块

[CPAN][22]（Comprehensive Perl Archive Network）是一个世界范围内包含各种 Perl 模块的的下载镜像。它们都是开源的。大量 CPAN 中的模块都是历久弥坚。对于成千上百的任务，你不需要重复造轮子，只要利用别人已经发布的代码就可以了。然后，你还可以提交你的新功能。

尽管树莓派是个五脏俱全的 Linux 系统，支持大部分 CPAN 模块，但是这里我想强调一下专为树莓派硬件开发的东西。一般来说它们都用在测量、控制、机器人方面的嵌入式系统中。你可以通过 GPIO （General-Purpose Input/Output）针脚将你的树莓派连接到外部电子设备。

可以使用树莓派 GPIO 针脚的模块如下：[Device::SMBus][23]、[Device::I2C][24]、[Rpi::PIGPIO][25]、[Rpi::SPI][26]、[Rpi::WiringPi][27]、[Device::WebIO::RaspberryPI][28] 和 [Device::PiGlow][29]。树莓派支持的嵌入式模块如下：[UAV::Pilot::Wumpus::Server::Backend::RaspberryPiI2C][30]、[RPI::DHT11][31]（温度/湿度）、[RPI::HCSR04][32]（超声波）、[App::RPI::EnvUI][33]、[RPi::DigiPot::MCP4XXXX][34]、[RPI::ADC::ADS][35]、[Device::PaPiRus][36] 和 [Device::BCM2835::Timer][37]。

### 例子

这里有些我们在树莓派上可以用 Perl 做的事情的例子。

#### 例一：在 OSMC 使用 PiFlash 播放视频

本例中，你将练习如何设置并运行使用 OSMC 操作系统的树莓派。

*   到 [RaspberryPi.Org][5] 下载区，下载最新的 OSMC 版本。
*   将空 SD 卡插入你的 Linux 电脑或者笔记本。树莓派第一代是全尺寸的 SD 卡，除此以外都在使用 microSD，你也许需要一个通用适配器才能插入它。
*   在插入前后分别运行 `cat /proc/partitions` 命令来看看系统分给硬件的设备名称。它可能像这样 `/dev/mmcblk0` 或者 `/dev/sdb`， 用如下命令将正确的系统镜像烧录到 SD 卡：`piflash OSMC_TGT_rbp2_20170210.img.gz /dev/mmcblk0`。
*   弹出 SD 卡，将它插入树莓派中，接上 HDMI 显示器，开机。
*   当 OSMC 设置完毕，插入一个 USB 设备，在里面放点视频。出于示范目的，我将使用 `youtube-dl` 程序下载两个视频。运行 `youtube-dl OHF2xDrq8dY` （彭博关于英国高新产业，包括树莓派的介绍）还有 `youtube-dl nAvZMgXbE9c` （CNet 发表的“排名前五的树莓派项目”) 。将它们下载到 USB 中，然后卸载移除设备。
*   将 USB 设备插入到 OSMC 树莓派。点击视频选项进入到外部设备。  
*   只要你能在树莓派中播放视频，那么恭喜你，你已经完成了本次练习。玩的愉快。

#### 例二：随机播放目录中的视频的脚本

这个例子将使用一个脚本在树莓派上的目录中乱序播放视频。根据视频的不同和设备的摆放位置，这可以用作信息亭显示的用途。我写这个脚本用来展示室内体验视频。

*   设置树莓派引导 Raspbian Linux。连接到 HDMI 监视器。
*   从 GitHub 上下载 [do-video 脚本][6]。把它放到树莓派中。
*   跟随该页面的安装指导。最主要的事情就是安装 omxplayer 包，它可以使用树莓派硬件视频加速功能平滑地播放视频。
*   在家目录的 Videos 目录下放一些视频。
*   运行 `do-video` ，这样，应该就可以播放视频了

#### 例三：读取 GPS 数据的脚本

这个例子更加深入，更有针对性。它展示了 Perl 怎么从外部设备中读取数据。在先前例子中出现的我的 GitHub上 “[Perl on Pi][6]” 有一个 gps-read.pl 脚本。它可以通过一系列端口从 GPS 读取 NMEA（国家海洋电子协会）的数据。页面还有教程，包括构建它所使用的 AdaFruit Industries 部分，但是你可以使用任何能输出 NMEA 数据的 GPS。

通过这些任务，我想你应该可以在树莓派上像使用其他语言一样使用 Perl了。希望你喜欢。

--------------------------------------------------------------------------------

作者简介：

Ian Kluft - 上学开始，Ian 就对喜欢编程和飞行。他一直致力于 Unix 的工作。在 Linux 内核发布后的六个月他转向了 Linux。他有计算机科学硕士学位，并且拥有 CSSLP 资格证（认证规范开发流程专家），另一方面，他还是引航员和认证的飞机指令长。作为一个超过二十五年的认证的无线电爱好者，在近些年，他在一些电子设备上陆续做了实验，包括树莓派。

------------------

via: https://opensource.com/article/17/3/perl-raspberry-pi

作者：[Ian Kluft][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ikluft
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu
[5]:http://raspberrypi.org/
[6]:https://github.com/ikluft/ikluft-tools/tree/master/perl-on-pi
[7]:https://opensource.com/article/17/3/perl-raspberry-pi?rate=OsZH1-H_xMfLtSFqZw4SC-_nyV4yo_sgKKBJGjUsbfM
[8]:http://www.catb.org/~esr/writings/cathedral-bazaar/
[9]:https://www.raspberrypi.org/downloads/noobs/
[10]:https://www.raspberrypi.org/downloads/raspbian/
[11]:https://www.raspberrypi.org/downloads/raspbian/
[12]:https://fedoraproject.org/wiki/Raspberry_Pi#Downloading_the_Fedora_ARM_image
[13]:https://www.riscosopen.org/content/downloads/raspberry-pi
[14]:http://www.raspbsd.org/raspberrypi.html
[15]:https://osmc.tv/
[16]:https://libreelec.tv/
[17]:http://ms-iot.github.io/content/en-US/Downloads.htm
[18]:http://ms-iot.github.io/content/en-US/Downloads.htm
[19]:https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[20]:https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[21]:https://github.com/ikluft/ikluft-tools/tree/master/piflash
[22]:http://www.cpan.org/
[23]:https://metacpan.org/pod/Device::SMBus
[24]:https://metacpan.org/pod/Device::I2C
[25]:https://metacpan.org/pod/RPi::PIGPIO
[26]:https://metacpan.org/pod/RPi::SPI
[27]:https://metacpan.org/pod/RPi::WiringPi
[28]:https://metacpan.org/pod/Device::WebIO::RaspberryPi
[29]:https://metacpan.org/pod/Device::PiGlow
[30]:https://metacpan.org/pod/UAV::Pilot::Wumpus::Server::Backend::RaspberryPiI2C
[31]:https://metacpan.org/pod/RPi::DHT11
[32]:https://metacpan.org/pod/RPi::HCSR04
[33]:https://metacpan.org/pod/App::RPi::EnvUI
[34]:https://metacpan.org/pod/RPi::DigiPot::MCP4XXXX
[35]:https://metacpan.org/pod/RPi::ADC::ADS
[36]:https://metacpan.org/pod/Device::PaPiRus
[37]:https://metacpan.org/pod/Device::BCM2835::Timer
[38]:https://opensource.com/user/120171/feed
[39]:https://opensource.com/article/17/3/perl-raspberry-pi#comments
[40]:https://opensource.com/users/ikluft
