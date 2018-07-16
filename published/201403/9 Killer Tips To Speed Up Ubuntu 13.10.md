九大绝招让你在老机器上加速运行 Ubuntu Linux
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Speed_Up_Ubuntu_1310.jpg)

不管你的Ubuntu 13.10系统是重新安装的或是从以前旧版本升级的，在使用了一段时间后，你应该会感觉到系统开始变慢。在这篇文章中，我们将了解到一些**让你的Ubuntu运行得更快的技巧**。

在我们动手提高Ubuntu 13.10的整体系统性能之前，先思考下为什么系统会随着时间变慢。这里可能有很多原因，比如，你可能有一台简单设置了一下的低配电脑，你可能安装了很多在开机时吃掉系统资源的应用程序。实际上有各种理由。

在这里列出了一些小技巧，能帮你提高一点Ubuntu的速度。还有一些很好的技巧，可以用来提高系统性能，让系统运行更流畅。你可以选择尝试所有技巧或者其中的一部分，他们每一个都可以让你的Ubuntu更流畅，更敏捷，更迅速。

### 让Ubuntu 13.10运行更快的技巧: ###

我已经在我的Ubuntu 13.10上应用过这些技巧，但是我相信它们同样可以应用在旧版本的Ubuntu系统上，或者其他基于Ubuntu的Linux发行版，比如：Linux Mint，Elementary OS Luna等等。

### 减少grub默认的引导等待时间：###

grub默认会给你10秒钟时间来选择要引导的系统或是进入恢复模式，这对于我来说太长了。这意味着你得呆在电脑边上按下确认键来立刻引导Ubuntu。是不是觉得有点浪费时间？第一个小技巧就是改变引导等待时间。如果你更喜欢GUI工具，可以阅读这篇文章[通过Grub Customizer调整grub等待时间和引导顺序][1]。

对其他人来说，只需要通过下面的简单命令来打开grub配置文件：

    sudo gedit /etc/default/grub &

把**GRUB_TIMEOUT=10**改为**GRUB_TIMEOUT=2**，这样就可以把引导等待时间改成2秒。最好不要改成0，因为这样你就不能选择其他操作系统或者恢复模式了。在修改完成后，用下面的命令使改动生效：

    sudo update-grub

### 管理开机启动应用程序： ###

慢慢的你开始安装各种应用程序。如果你是It’s FOSS的读者，你可能安装了许多[本周最佳应用程序][2]系列里推荐的应用。这里面很多应用都会开机启动，程序运行肯定会要消耗系统资源，结果就是：一台每次开机都要很长时间的缓慢启动。打开Unity Dash，然后找到**启动应用**：

![](http://itsfoss.com/wp-content/uploads/2014/01/Startup_Applications_Ubuntu.jpeg)

在里面，检查一下那些开机启动的程序，考虑一下哪些是你觉得没有必要每次开机都启动的程序，然后尽情地移除吧。

![](http://itsfoss.com/wp-content/uploads/2014/01/Startup_applications_ubuntu_1310.jpeg)

万一你不想从开机启动列表里移除程序呢？比如说，你安装了[Ubuntu 13.10里最好的提示插件][3]里推荐的程序，你希望它们可以在每次开机时都自动启动。这种情况可以这样处理，为应用程序的启动设定一个等待时间。这样，你可以缓解一点启动时的资源占用，而你的应用程序仍然会自动启动，不是是在一段时间后。在前一张图中，点击Edit，然后在运行的命令中加入一个等待。例如，如果你想延迟20秒再启动Dropbox提示，只需要在当前的命令前面**增加一条命令**：

    sleep 20;

这样，命令‘**dropbox start -i**‘变成了‘**sleep 20; dropbox start -i**‘。这就意味着Dropbox的启动会有20秒延迟。你可以像这样为其他开机启动的应用程序设置一个等待时间。

![](http://itsfoss.com/wp-content/uploads/2014/01/Edit_startup_applications_Ubuntu.jpeg)

### 安装preload来加速应用程序加载时间： ###

Preload是个后台程序，会分析用户的行为和常用的程序。打开终端，用下面的命令安装preload：

    sudo apt-get install preload

安装完后重启电脑，然后就可以把它忘了，它会在后台运行。[[更多关于preload的信息][4]]

### 选择最快的软件升级镜像服务器： ###

最好检查一下自己用来升级软件的镜像服务器是最快的。Ubuntu软件仓库在全球各地都有镜像服务器，建议选择一个离自己最近的。这样可以减少从服务器下载升级包的时间，所以软件升级会更快。

在**软件与更新->Ubuntu 软件->下载地址**里选择**其它**，然后点击**使用最快的服务器**：

![](http://itsfoss.com/wp-content/uploads/2014/01/Ubuntu_software_Center_Mirror.jpeg)

系统会自动测试并告诉你哪个镜像服务器是最快的。通常来说，系统默认会选择最快的镜像服务器，但是，检查一下总是没有坏处。不过，如果保存升级包的距离最近的镜像服务器并没有经常保持同步的话，获取更新的时候可能会有点延时。对于网络连接速度比较慢的人来说，这个方法很有用。你可以在文章[加速Ubuntu的WIFI速度][5]里更深入地了解这些提示

### 用apt-fast代替apt-get来加速更新： ###

apt-fast是用来代替“apt-get”的的一个shell脚本程序，它通过多线程的方式改善了更新和下载安装包的速度。如果你经常用终端和apt-get来安装和升级软件的话，可以试试apt-fast。用下面的命令通过官方PPA安装apt-fast：

    sudo add-apt-repository ppa:apt-fast/stable
    sudo apt-get update
    sudo apt-get install apt-fast

### 从apt-get更新中移除语言相关的可忽略的包： ###

你有没有注意过sudo apt-get update的输出？里面有三类标志，**hit**，**ign**和**get**。你可以在[这里][6]了解它们的含义。检查一下包含IGN的行，你会发现它们大多数都是语言翻译相关的。如果你所有的程序和安装包都是英文的，那完全没有必要检查从英文到英文的安装包数据库。

如果你跳过apt-get的语言相关的更新，能够轻微地提高apt-get update的速度。想这样做的话，在终端里输入下面的命令：

    sudo gedit /etc/apt/apt.conf.d/00aptitude

然后在文件末尾加入下面这行：

    Acquire::Languages "none";

![](http://itsfoss.com/wp-content/uploads/2014/01/ign_language-apt_get_update.jpeg)

### 减少系统过热： ###

如今，过热是计算机的一个普遍问题，一台过热的电脑运行得非常缓慢。如果你的CPU风扇跑得像尤塞恩.博尔特一样快的话，可能会需要超长的时间来打开一个程序。在Ubuntu 13.10中有两个工具可以帮助减少系统过热来实现更好的系统性能，TLP和CPUFREQ。

通过下面的终端命令来安装使用TLP：

    sudo add-apt-repository ppa:linrunner/tlp
    sudo apt-get update
    sudo apt-get install tlp tlp-rdw
    sudo tlp start

在安装完TLP后不需要做其他额外的事情，它会在后台运行。用下面的命令安装CPUFREQ提示工具：

    sudo apt-get install indicator-cpufreq

然后重启电脑，然后选择CPUFREQ的**Powersave**模式：

![](http://itsfoss.com/wp-content/uploads/2013/11/CPUFREQ-indicator.jpeg)

### 调整LibreOffice让它运行更快： ###

如果你经常使用办公软件，那你应该会想调整一下默认的LibreOffice，让它运行得更快些。这里会调整一下内存选项。打开LibreOffice，然后选择**工具->选项**，然后在左边栏里选择**内存**，并激活**系统加速器**来增加内存占用。

![](http://itsfoss.com/wp-content/uploads/2013/08/LibreOffice_Memory_option_1.jpeg)

你可以看一下[如何加速LibreOffice][7]了解更多的细节。

### 使用软件的轻量替代： ###

这个更像是推荐和喜好。有些系统默认或流行的软件都需要占用大量系统资源，这并不适合一般的低配置电脑。这种情况下，你可以选择使用这些软件的一些替代程序。比如，用[AppGrid][8]来替代Ubuntu Software Center；用[Gdebi][9]来安装软件；用AbiWord来代替LibreOffice Writer等等。

这些就是我搜集的**让Ubuntu 13.10运行更快**的技巧。我相信这些小技巧可以整体提升系统性能表现。你是否也有一些隐藏的技巧来**加速Ubuntu 13.10**？这些小技巧对你是不是有帮助？请和大家分享你的看法，随时欢迎提出任何问题或建议，不要吝啬留下你的评论。


--------------------------------------------------------------------------------

via: http://itsfoss.com/speed-up-ubuntu-1310/

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/windows-default-os-dual-boot-ubuntu-1304-easy/
[2]:http://itsfoss.com/tag/app-of-the-week/
[3]:http://itsfoss.com/7-best-indicator-applets-for-ubuntu-13-10/
[4]:http://itsfoss.com/improve-application-startup-speed-with-preload-in-ubuntu/
[5]:http://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/
[6]:http://ubuntuforums.org/showthread.php?t=231300
[7]:http://itsfoss.com/speed-libre-office-simple-trick/
[8]:http://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/
[9]:http://itsfoss.com/install-deb-files-easily-and-quickly-in-ubuntu-12-10-quick-tip/
