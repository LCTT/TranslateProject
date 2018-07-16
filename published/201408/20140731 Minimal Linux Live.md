最精简Linux Live CD版本:Minimal Linux Live
================================================================================

最精简Linux Live是一系列基于[linux内核][1] 和 [BusyBox][2]的自动生成最精简 Live Linux 系统linux shell脚本。所有所需的源码已经自动地被下载，而且所有的生成操作已经完全被封装在脚本中了。

如果你想定制属于自己的最精简Linux Live 的ISO镜像文件，以下是你需要做的:

- 从[下载][3]区域获得最新的脚本。

- 把脚本解压到文件夹下。

- 确保所有的脚本都可执行（可以使用命令chmod +x *.sh 添加可执行属性）

- 在开始生成过程之前，取决于你使用什么Linux系统,可能会有一个或者多个依赖库(也可能不需要，或者更多)需要处理.如果使用Ubuntu的话，以下命令应该足以生成所有需要的依赖库:

----------

    sudo apt-get install wget
    sudo apt-get install make
    sudo apt-get install gcc
    sudo apt-get install bc
    sudo apt-get install syslinux
    sudo apt-get install genisoimage

- 执行脚本 **build_minimal_linux_live.sh**  然后等待完成。如果你已经处理好所有的生成依赖库,那么在一台现代计算机上全部的过程耗费时间应该不超过30分钟。如果由于某些原因生成失败，最可能的应该是没有处理好生成依赖库。一些用户反应到生成所必需的包将会处理所有ubuntu上未知的生成依赖问题。如果使用Linux Mint 而且正在尝试安装 g++ 包，如果你依然遇到很多问题，那么你可以尝试安装必需包。在Fedora系统上你可能需要安装 glibc-static包。

  请记得所有的生成依赖库由于你使用的Linux操作系统和已经安装的软件不同将会发生很大的变化。

  如果依然有问题，请检查失败信息然后在google上搜索一下。如果你找不到解决方案，你可以询问一些更有经验的linux专家(如果你认识的话),或者另外一个选择是联系我们。请确保在发送给我们之前，你已经提前研究过这个问题。

- 当脚本完成它们的工作，你将会在执行脚本的同目录下发现一个新创建的**minimal_linux_live.iso** 文件。你可以烧录iso镜像到CD/DVD，通过[Universal USB Installer][4]工具安装到USB闪存设备，或者直接在PC的虚拟机上运行，例如[VirtualBox][5]。

生成的ISO镜像文件包括使用默认选项编译的linux内核,使用默认选项编译的BusyBox和非常轻量级的initramfs。这意味着你不需要 另辟蹊径去获得windows支持，也不需要使用任何花哨的桌面环境。你所需要的只是一个支持BusyBox applets 的shell控制台，和……好吧。这些就够了。这就是为什么称它为 "最精简"。

最好的消息是不仅操作系统很小很简单，而且生成脚本也同样的小巧玲珑。你可以很轻松地从脚本学习，并且修改他们去包含更多内容(我是很鼓励你这样做).在你学习完这些基础以后你将会拥有所有所必须的工具和技能去创造你自己功能完善的linux操作系统！完全从零开始!是不是帅呆了!?:)

这篇教程提供了更详细的脚本内部结构以及全部的生成过程，我鼓励你们如果有时间的话就去通读这个文档。

下面你会看到一些屏幕截图，它们展示了当你启动你的新一代 Minimal Linux Live 操作系统时的环境情况。

![](http://minimal.linux-bg.org/images/screen1.png)

![](http://minimal.linux-bg.org/images/screen2.png)

![](http://minimal.linux-bg.org/images/screen3.png)

--------------------------------------------------------------------------------

via: http://minimal.linux-bg.org/

译者：[lfzark](https://github.com/lfzark)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernel.org/
[2]:http://busybox.net/
[3]:http://minimal.linux-bg.org/#
[4]:http://www.pendrivelinux.com/
[5]:http://virtualbox.org/ 
