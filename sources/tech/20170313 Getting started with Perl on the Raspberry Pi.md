在树莓派中开启激动人心的Perl之旅
============================================================

树莓派，随心所欲．

 ![Getting started with Perl on the Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/raspberry_pi_blue_board.jpg?itok=01NR5MX4 "Getting started with Perl on the Raspberry Pi") 
>Image by : opensource.com

我最近在 SVPerl 谈到运行在树莓派上的 Perl 语言时候，有人问我，＂我听说树莓派应该使用 Python ，是这样吗？＂．我非常乐意回答他，这是个常见误解．树莓派可以支持任何语言: Python,Perl和其他树莓派官方理事会初始安装在树莓派上的语言．

看似很厉害，其实也非常简单．树莓派是个创造者，英国科学教授 Eben Upton，树莓派中的＇派＇(pi)，是想为了听起来像 'python',因为他喜欢这门语言．他选择了这门语言作为孩子们的启蒙语言．但是他和他的团队做了一个通用计算机．开源软件没给树莓派任何限制．我们想运行什么就运行什么，全凭自己心意．

更多关于树莓派的信息

*   [Our latest on Raspberry Pi][1]
*   [What is Raspberry Pi?][2]
*   [Getting started with Raspberry Pi][3]
*   [Send us your Raspberry Pi projects and tutorials][4]

我在 SVPerl 和这篇文章中还想讲第二点，就是介绍我的 'PiFlash' 脚本．虽然它是用 Perl 写的，但是不需要你有多了解 Perl 就可以将树莓派系统写入到 SD卡．这样对初学者就比较友好，避免他们在烧录SD卡时候，偶然擦除了整个硬盘．即使是高级用户也可以从它的自动化工作中受益，包括我．这也是我开发它的原因．在 Windows 和 Macs 下也有类似的工具，但是树莓派网站没有介绍类似工具给 Linux 用户．不过，现在有了．

开源软件早就有自己造轮子的传统，因为大牛总是崇尚 "自痒自挠"去解决问题．Eric S在他 1997年的论文和 1999年的书籍 The Cathedral and Bazaar中早有提及，它定义了开源软件的方法论．我也是为了满足 Linux 用户，比如我，所以写了这个脚本．


### 下载系统镜像

想要开启树莓派之旅，你首先需要为它下载一个操作系统．我们称之为 "系统镜像"文件．一旦你把它下载到你的桌面，手提电脑，或者甚至是另一个树莓派中，我就需要写入或者称之为烧录进你的 SD卡．详细情况可以看在线文件．手动做这件事情需要一些功底，你要把系统镜像烧录到整个 SD卡，而不是其中一块．系统镜像必须独自包含至少一个分区，因为树莓派引导需要从它启动的地方读取 FAT32文件系统分区.除了 boot 分区，其他分区可以是操作系统内核支持的任何分区类型．

在大部分树莓派中，我们都是搭载一些 Linux 内核．这里有一些树莓派中常用的系统镜像．（当然，没什么能阻止你自己造轮子）

树莓派基金会向新手推荐的是 "NOOBS"系统．它代表了 "New Out of the Box System"，显然它好像听起来像术语 "noob"(小白)，通俗点说 "newbie"(菜鸟的口语化)．NOOBS是一个基于 Linux 系统的树莓派系统，它会给你一个菜单可以在你的树莓派上自动下载安装几个系统镜像．

Raspbian Linux是 Debian Linux 发行版的树莓派定制版．它是由树莓派开发的正式 Linux 发行版，并且由树莓派基金会维护．在运行在 Linux发行版之前的所有驱动和软件都会在 Raspbian上先试用．默认安装了 Perl.

Ubuntu Linux (还有 社区版的 Ubuntu MATE)也支持 ARM处理器的树莓派平台．Ubuntu 是一个商业化的开源软件，是 Debian Linux 的衍生版，它也使用 DEB 包管理器．Perl 也在其中．它仅仅支持32位或者64位的ARM处理器的树莓派2,3模块．`

Fedora Linux.Fedora 25支持树莓派2,3. Fedora 是一个隶属于 红帽(Red Hat)的开源操作系统．Fedora 是增加了商业包的企业版红帽( Red Hat Enterprise Linux)的急先锋，它当然也像所有的 Hat-compatible Linux 发行版一样使用 RPM 包管理器．同样，它也包含 Perl．

RISC OS 是一个 ARM 处理器的特化单用户操作系统．如果你想要一个比 Linux 系统更加简洁的小型桌面（特点更少），你可以考虑一下．它同样支持 Perl.

RaspBSD 是一个 FreeBsd 树莓派发行版．它是一个基于 Unix 的系统，而不是 Linux．作为开源 Unix 的一员，它延续了 Unix 的风格，而且和 Linux 有着众多相似之处．包括相似的系统环境，和 Perl．

OSMC 开源多媒体中心，LibreElec 电视娱乐中心．它们都基于运行 Linux 内核的Kodi 娱乐中心.它是一个小巧，特化的 Linux 系统，所以不要期望它能支持 Perl．

Microsoft Windows IoI 是运行树莓派３大家庭的新成员．你需要微软开发者身份才能下载．而作为一个 Linux 极客，我现在还没看．我的 PiFlash 脚本还不支持它．

### PiFlash 脚本

如果你想看看树莓派烧录及引导，那么在 Windows 或者 Mac 系统下，你很容易下载到工具完成烧录任务．但是对于 Linux 系统，你有一套工作要自己去做．我已经做过这个太多次，这很容易引发一个开发者的本能去自动化这个过程，这就是 PiFlash 脚本．它能通用的诀窍就在于 Linux系统各有千秋，但是内核却完全相同．

我想，手工操作最大的潜在错误恐怕就是偶然错误地擦除了某个设备，而没有擦除 SD卡，彻底清除了我本想保留在硬盘的东西．我在 SVPerl 中演讲也说了，能在台下听众中找到这种人(恐怕他们不会承认)我会非常高兴．因此，PiFlash 其中一个目的就是保护新手的安全，只擦除 SD卡．PiFlash　脚本还会拒绝覆盖已经包含文件系统的设备．

对于有经验的用户，包括我，PiFlash 脚本还提供提供一个简便的自动化服务．下载完系统镜像之后，一般需要从zip格式中归档或者说解压缩系统镜像.PiFlash 可以直接提取它的文件格式，并且直接烧录到 SD卡中．

我把 PiFlash与指导 发布在了 GitHub 上．

命令行用法如下：

**piflash [--verbose] input-file output-device**

**piflash [--verbose] --SDsearch**

input-file参数是你要写入的系统镜像文件，只要是你从树莓派发行版网站下载的镜像都行．output-device参数是你要写入的sd卡块设备路径．

你也可以使用SDsearch 参数列出挂载在系统中sd卡设备名称．

可选项 verbose 在你需要帮助时非常有用，它可以输出所有的程序状态数据，递送 bug 报告，还可以帮助你修复错误．这本来也就是我开发它的目的．

下面是一个列子用来向目标路径 /dev/mmcblk0 的 sd 卡写入经过 zip 压缩的树莓派镜像

**piflash 2016-11-25-raspbian-jessie.img.zip /dev/mmcblk0**

如果你已经指定了 /dev/mmcblk0p1 (sd卡的第一分区)，它会识别到这个分区不可用，然后重新写入．	

在不同的 Linux 系统中怎样去识别你的 SD卡 设备是一个技术活．像 mmcblk0 这种在我的笔记本上是基于外设互联的 SD卡接口．如果我使用了 USBSD 卡接口，它就是 /dev/sdb．这在多硬盘的系统中不好区分．但是只有少量的 Linux 块驱动支持 SD卡．PiFlash 在这两种情况下都会块设备的参数．如果全部失败，它会默认使用SD卡中，可写可删除并且有着正确物理扇区数量的 USB 驱动．

我想这应该能涵盖大部分情况．但是，如果你使用了我不知道的 sd 卡呢？我乐意看到你的来信．请在输出信息中加上 --verbos --SDsearch 参数，让我可以知道你系统目前的环境．理想情况下，如果 PiFlash 脚本可以被广泛利用，我们可以构建一个开源社区去尽可能的帮助更多的树莓派用户．

树莓派的 CPAN 模块

CPAN 是一个世界范围内包含各种 Perl 模块的的下载镜像．它们都是开源的．大量 CPAN 中的模块都是历久弥坚．对于成千上百的任务，你不需要重复造轮子，只要利用别人已经发布的代码就可以了．然后，你还可以提交你的新功能．

尽管树莓派是个五脏俱全的 Linux 系统，支持大部分 CPAN 模块，但是这里我想强调一下专为树莓派硬件开发的东西．一般来说它们都用在测量，控制，机械方面的嵌入式系统中．你可以通过 GPIO 针脚将你的树莓派连接到外部电子设备．

可以使用树莓派 GPIO 针脚的模块如下：[Device::SMBus],[Device::I2C],[Rpi::PIGPIO],[Rpi::SPI],[Rpi::WiringPi],[Device::WebIO::RaspberryPI]和[Device::PiGlow].树莓派支持的嵌入式模块如下[UAV::Pilot::Wumpus::Server::Backend::RaspberryPiI2C],[RPI::DHT11],[RPI::HCSR04],[App::RPI::EnvUI],[RPi::DigiPot::MCP4XXXX],[RPI::ADC::ADS],[Device::PaPiRus]和[Device::BCM2835::Timer]

### 例子

这里有些我们在树莓派上可以用Perl做的事情的例子

### 例一：在 OSMC 使用 PiFlash 播放视频

本例中，你将练习如何设置并运行使用 OSMC 操作系统的树莓派．

*   到[RaspberryPi.Org][5]下载区，下载最新的 OSMC 版本.
*   将空 SD卡插入你的 Linux 电脑或者笔记本．树莓派第一代是全尺寸的 SD卡，而其他树莓派版本需要一个通用适配器才能插入 SD卡
*   在插入前后分别运行 cat /proc/partitions 命令才得到系统分给硬件的设备名称．它可能像这样 /dev/mmcblk0 或者 /dev/sdb 用如下命令将正确的系统镜像烧录到 SD卡．

**           piflash OSMC_TGT_rbp2_20170210.img.gz /dev/mmcblk0**

*   弹出 SD卡，将它插入树莓派中，接上 HDMI 显示器，开机．
*   当 OSMC 设置完毕，插入一个USB设备，我打算里面放点视频．示范目的，我将使用 youtube-dl 程序下载两个视频．运行 youtube-dl OHF2xDrq8dY(彭博关于英国高新产业，包括树莓派，的首次介绍）还有, youtube-dl nAvZMgXbE9c ( CNet上排名前五的树莓派项目) ．将它们下载到USB中，然后卸载移除设备．
*   

*   将 USB 设备插入到 OSMC 树莓派．点击视频选项进入到外部设备
*   
*   只要你能在树莓派中播放视频，那么恭喜你，你已经完成了本次练习．玩的愉快．

### 例二：随意打开目录中的视频的脚本

This example uses a script to shuffle-play videos from a directory on the Raspberry Pi. Depending on the videos and where it's installed, this could be a kiosk display. I wrote it to display videos while using indoor exercise equipment.
这个例子将使用一个脚本在树莓派目录中随机播放某个视频．不同的视频和安装位置，可能有不同的结果．写这个脚本用来展示视频．

*   设置树莓派引导 Raspbian Linux．连接到 HDMI 监视器
*   从 GitHub 上下载 "do-video"脚本．把它写入到树莓派中．
*   跟随安装指导．最主要的事情就是安装 omxplayer 包，它可以使用树莓派硬件安全，稳定地播放视频
*   在家目录的 "Videos" 下放一些视频
*   运行 do-video ，这样，应该就可以播放视频了

### 例三：读取GPS数据的脚本

这个例子更加深入，更有针对性．它展示了 Perl 怎么从外部设备中读取数据．在先前例子中出现的我的GitHub上 "Perl on Pi"有一个 gps-read.pl 脚本．它可以通过一系列端口从 GPS 读取 NMEA(国家海洋电子协会)的数据．页面还有教程，包括构建它所使用的AdaFruit Industries 部分，但是你可以使用任何能输出 NMEA 数据的 GPS

通过这些任务，我想你应该可以在树莓派上，像使用其他语言一样使用 Perl了．希望你喜欢．

--------------------------------------------------------------------------------

作者简介：

Ian Kluft - 上学开始，Ian 就对喜欢编程和飞行．他一直致力于 Unix 的工作．内核发布后的六个月他转向了 Linux 的工作．他有计算机科学硕士学位，并且拥有 CSSLP资格证（认证规范开发流程专家），另一方面，他还是引航员，飞机的指令长．作为一个获得二十五认证的无线电爱好者，在近些年，他在一些电子设备上陆续做了实验，包括树莓派．

------------------

via: https://opensource.com/article/17/3/perl-raspberry-pi

作者：[Ian Kluft ][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[校对者ID](https://github.com/校对者ID)

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
