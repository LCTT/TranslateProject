用 screenfetch 和 linux_logo 显示带有酷炫 Linux 标志的基本硬件信息
================================================================================
想在屏幕上显示出你的 Linux 发行版的酷炫标志和基本硬件信息吗？不用找了，来试试超赞的 screenfetch 和 linux_logo 工具。

### 来看看 screenfetch 吧 ###

screenFetch 是一个能够在截屏中显示系统/主题信息的命令行脚本。它可以在 Linux，OS X，FreeBSD 以及其它的许多类Unix系统上使用。来自 man 手册的说明：

> 这个方便的 Bash 脚本可以用来生成那些漂亮的终端主题信息和用 ASCII 构成的发行版标志，就像如今你在别人的截屏里看到的那样。它会自动检测你的发行版并显示 ASCII 版的发行版标志，并且在右边显示一些有价值的信息。

#### 在 Linux 上安装 screenfetch ####

打开终端应用。在基于 Debian 或 Ubuntu 或 Mint 的系统上只需要输入下列 [apt-get 命令][1]：

    $ sudo apt-get install screenfetch

![](http://s0.cyberciti.org/uploads/cms/2015/09/ubuntu-debian-linux-apt-get-install-screenfetch.jpg)

*图一：用 apt-get 安装 screenfetch*

#### 在 Mac OS X 上安装 screenfetch ####

输入下列命令：

    $ brew install screenfetch

![](http://s0.cyberciti.org/uploads/cms/2015/09/apple-mac-osx-install-screenfetch.jpg)

*图二：用 brew 命令安装 screenfetch*

#### 在 FreeBSD 上安装 screenfetch ####

输入下列 pkg 命令：

    $ sudo pkg install sysutils/screenfetch

![](http://s0.cyberciti.org/uploads/cms/2015/09/freebsd-install-pkg-screenfetch.jpg)

*图三：在 FreeBSD 用 pkg 安装 screenfetch*

#### 在 Fedora 上安装 screenfetch ####

输入下列 dnf 命令：

    $ sudo dnf install screenfetch

![](http://s0.cyberciti.org/uploads/cms/2015/09/fedora-dnf-install-screenfetch.jpg)

*图四：在 Fedora 22 用 dnf 安装 screenfetch*

#### 我该怎么使用 screefetch 工具？ ####

只需输入以下命令：

    $ screenfetch

这是不同系统的输出：

![](http://s0.cyberciti.org/uploads/cms/2015/09/fedora-screenfetch.jpg)

*Fedora 上的 Screenfetch*

![](http://s0.cyberciti.org/uploads/cms/2015/09/screenfetch-osx.jpg)

*OS X 上的 Screenfetch*

![](http://s0.cyberciti.org/uploads/cms/2015/09/screenfetch-freebsd.jpg)

*FreeBSD 上的 Screenfetch*

![](http://s0.cyberciti.org/uploads/cms/2015/09/debian-ubutnu-screenfetch-outputs.jpg)

*Debian 上的 Screenfetch*

#### 获取截屏 ####

要获取截屏并保存成文件，输入：

    $ screenfetch -s

你会看到一个文件 ~/Desktop/screenFetch-*.jpg。获取截屏并直接上传到 imgur，输入：

    $ screenfetch -su imgur

**输出示例：**

                     -/+:.          veryv@Viveks-MacBook-Pro
                    :++++.          OS: 64bit Mac OS X 10.10.5 14F27
                   /+++/.           Kernel: x86_64 Darwin 14.5.0
           .:-::- .+/:-``.::-       Uptime: 3d 1h 36m
        .:/++++++/::::/++++++/:`    Packages: 56
      .:///////////////////////:`   Shell: bash 3.2.57
      ////////////////////////`     Resolution: 2560x1600 1920x1200
     -+++++++++++++++++++++++`      DE: Aqua
     /++++++++++++++++++++++/       WM: Quartz Compositor
     /sssssssssssssssssssssss.      WM Theme: Blue
     :ssssssssssssssssssssssss-     Font: Not Found
      osssssssssssssssssssssssso/`  CPU: Intel Core i5-4288U CPU @ 2.60GHz
      `syyyyyyyyyyyyyyyyyyyyyyyy+`  GPU: Intel Iris
       `ossssssssssssssssssssss/    RAM: 6405MB / 8192MB
         :ooooooooooooooooooo+.
          `:+oo+/:-..-:/+o+/-      

    Taking shot in 3.. 2.. 1.. 0.
    ==>  Uploading your screenshot now...your screenshot can be viewed at http://imgur.com/HKIUznn

你可以访问 [http://imgur.com/HKIUznn][2] 来查看上传的截屏。

### 再来看看 linux_logo ###

linux_logo 程序生成一个彩色的 ANSI 版企鹅图片，还包含一些来自 /proc 的系统信息。

#### 安装 ####

只需按照你的 Linux 发行版输入对应的命令：

#### Debian/Ubutnu/Mint ####

    # apt-get install linux_logo

#### CentOS/RHEL/旧版 Fedora ####

    # yum install linux_logo

#### Fedora Linux v22+ 或更新版本 ####

    # dnf install linux_logo

#### 运行它 ####

只需输入下列命令：

    $ linux_logo

![](http://s0.cyberciti.org/uploads/cms/2015/09/debian-linux_logo.jpg)

*运行 linux_logo*

#### 等等，还有更多！ ####

你可以用这个命令查看内置的标志列表：

    $ linux_logo -f -L list

**输出示例：**

    Available Built-in Logos:
    	Num	Type	Ascii	Name		Description
    	1	Classic	Yes	aix		AIX Logo
    	2	Banner	Yes	bsd_banner	FreeBSD Logo
    	3	Classic	Yes	bsd		FreeBSD Logo
    	4	Classic	Yes	irix		Irix Logo
    	5	Banner	Yes	openbsd_banner	OpenBSD Logo
    	6	Classic	Yes	openbsd		OpenBSD Logo
    	7	Banner	Yes	solaris		The Default Banner Logos
    	8	Banner	Yes	banner		The Default Banner Logo
    	9	Banner	Yes	banner-simp	Simplified Banner Logo
    	10	Classic	Yes	classic		The Default Classic Logo
    	11	Classic	Yes	classic-nodots	The Classic Logo, No Periods
    	12	Classic	Yes	classic-simp	Classic No Dots Or Letters
    	13	Classic	Yes	core		Core Linux Logo
    	14	Banner	Yes	debian_banner_2	Debian Banner 2
    	15	Banner	Yes	debian_banner	Debian Banner (white)
    	16	Classic	Yes	debian		Debian Swirl Logos
    	17	Classic	Yes	debian_old	Debian Old Penguin Logos
    	18	Classic	Yes	gnu_linux	Classic GNU/Linux
    	19	Banner	Yes	mandrake	Mandrakelinux(TM) Banner
    	20	Banner	Yes	mandrake_banner	Mandrake(TM) Linux Banner
    	21	Banner	Yes	mandriva	Mandriva(TM) Linux Banner
    	22	Banner	Yes	pld		PLD Linux banner
    	23	Classic	Yes	raspi		An ASCII Raspberry Pi logo
    	24	Banner	Yes	redhat		RedHat Banner (white)
    	25	Banner	Yes	slackware	Slackware Logo
    	26	Banner	Yes	sme		SME Server Banner Logo
    	27	Banner	Yes	sourcemage_ban	Source Mage GNU/Linux banner
    	28	Banner	Yes	sourcemage	Source Mage GNU/Linux large
    	29	Banner	Yes	suse		SUSE Logo
    	30	Banner	Yes	ubuntu		Ubuntu Logo

    Do "linux_logo -L num" where num is from above to get the appropriate logo.
    Remember to also use -a to get ascii version.

查看 aix 的标志，输入：

    $ linux_logo -f -L aix

查看 openbsd 的标志：

    $ linux_logo -f -L openbsd

或者只是随机看看一些 Linux 标志：

    $ linux_logo -f -L random_xy

你[可以像下面那样结合 bash 的循环来显示不同的标志][3]，输入：

![](http://s0.cyberciti.org/uploads/cms/2015/09/linux-logo-fun.gif)

*动图1： linux_logo 和 bash 循环，既有趣又能发朋友圈耍酷*

### 获取帮助 ###

输入下列命令：

    $ screefetch -h
    $ linux_logo -h

**参考**

- [screenFetch 主页][4]
- [linux_logo 主页][5]

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/hardware/howto-display-linux-logo-in-bash-terminal-using-screenfetch-linux_logo/

作者：Vivek Gite
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html
[2]:http://imgur.com/HKIUznn
[3]:http://www.cyberciti.biz/faq/bash-for-loop/
[4]:https://github.com/KittyKatt/screenFetch
[5]:https://github.com/deater/linux_logo
