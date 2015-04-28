安装体验开源车载系统Automotive Grade Linux
================================================================================
> Linux基金会和他的合作伙伴本周发布了Automotive Grade Linux的第一个版本，这是一个在连网汽车内部使用的开源平台。

![](http://thevarguy.com/site-files/thevarguy.com/files/imagecache/medium_img/uploads/2014/07/automotivelinux.jpg)

随着本周 [Automotive Grade Linux][1](AGL)的第一个版本的发布，这个在物联网时代专为汽车定制的Linux发行版将转变为一个新的生态系统。

AGL是由Linux基金会发起的合作项目，Linux基金会汇集了来自汽车行业，通信，计算硬件，学术界和其他领域的合作伙伴。AGL的第一个版本于6月30号发布在网上并且在可[免费下载][5]，这个开源操作系统基于[Tizen IVI][4]。Tizen IVI是一个基于Linux的平台，它被用于为广泛的设备提供操作系统解决方案，从智能手机，到电视，汽车，笔记本电脑。

![](http://automotive.linuxfoundation.org/sites/automotive.linuxfoundation.org/files/features/agl-jlr_0.png)

在第一个版本中，AGL提供了一系列的功能和为汽车（或其他车辆）部署定制的应用程序，包括：

- 主屏幕
- 仪表盘
- 谷歌地图
- 暖通空调
- 媒体回放
- 新闻阅读器
- 音响控制
- 蓝牙手机
- 智能设备连接集成

Linux基金会和他的参与AGL项目的合作伙伴希望这个解决方案将帮助确保未来“连网汽车”使用开源软件以提供下一代娱乐，导航和其他车内使用的工具。“公开和合作是促进一个公共的，标准的汽车平台发展的关键，以便这个产业可以更快速地实现供连网汽车使用的愿望。”Linux基金会的汽车总经理Dan Cauchy这样说。

Cauchy补充道，Linux基金会期望AGL是一个良好的开端，其合作者希望在以后的版本中能加入“一些额外的功能和特点。”

## 下载和安装测试 ###

### 下载 ###

可以从此下载镜像：http://content.linuxfoundation.org/auto/downloads/images/

支持在PC上测试，也提供了Vmware镜像。

### 安装在X86上 ###

**创建一个USB启动盘**

1. 下载GPartd Live 镜像的压缩文件：http://gparted.sourceforge.net/download.php 。
2. 使用FAT32文件系统格式化一个最少8GB的U盘。
3. 解压 GPartd Live镜像的压缩包，并复制全部内容到U盘。保持完整的目录格式，比如你可以确认GPL这个文件是不是在U盘的根目录。
4. 把U盘变成可启动的，根据你使用的系统不同而不同：
   a) Linux: 执行U盘里 utils/linux 目录下的 makeboot.sh 。
   b) Windows: 执行U盘里 utils\win32  目录下的 makeboot.bat 。
5. 按 脚本提示执行。
6. 复制 [AGL 演示镜像][6]到U盘。

**安装到机器上**

注意：这会破坏你的机器上的所有数据！所以请确保机器上的硬盘上的数据是无用的。

1. 使用刚刚制作好的 GPartd U盘启动系统。
2. 默认运行 GPartd （所有选项直接回车确认即可）
3. 打开一个终端，并复制镜像内容到机器的硬盘：
     gunzip -c agl-demo_1-0.img.gz | dd of=/dev/sda bs=16M
4. 关闭终端。
5. 在  GPartd 窗口，刷新设备。
6. 将 /dev/sda3 的大小扩展到整个硬盘的可用空间。
7. 关机。
8. 拔下U盘。
9. 重启！


### 创建VMware虚拟机 ###

在 64位Windows 7和32位Windows XP上的 VMware Player 5 测试通过。

1. 下载 VMWare Player： http://www.vmware.com/products/player
2. 解压缩 [AGL VMWare image][7]
3. 在 VMware 中增加新的虚拟机：
	
	1. 选择“我将稍后安装操作系统”
	2. 使用 'Linux' -> 'Fedora'
    3. 给个名字，比如： tizen-ivi-2.0
    4. 创建一个新的磁盘，不过这个磁盘我们稍后会删除并重建一个新的
    	（将\<image.vmdk\> 作为 IDE(0:0) 设备添加）
    5. 创建好虚拟机之后，然后“编辑虚拟机设置”
    6.  （可选）取消CD/DVD的“启动后连接”的选项（除非你的宿主机上有这个设备）
    7.  （可选）取消打印机的“启动后连接”的选项
    8. 删除虚拟机当前的硬盘
    9. 添加一个新的硬盘
    10. 选择“使用已有的虚拟磁盘”，使用那个解压缩得到文件
    11. 当第一次启动虚拟机时，如果询问你是否要升级当前格式时，选择“保持现在的格式”
4. 运行：
 	1. 启动虚拟机
 	2. 系统启动后显示一个黑屏，在桌面上任何地方右键点击并打开一个终端
    3. 运行如下命令
         ./start_demo.sh
      这会调整屏幕分辨率，打开声音，启动node.js引擎，并最终显示界面。

### 更多的演示截图 ###

请参看我们之前的一篇文章：http://linux.cn/article-3324-1.html

--------------------------------------------------------------------------------

via: http://thevarguy.com/open-source-application-software-companies/070114/automotive-grade-linux-released-open-source-cars

译者：[linuhap](https://github.com/linuhap) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://automotive.linuxfoundation.org/
[2]:http://linuxfoundation.org/
[3]:http://automotive.linuxfoundation.org/
[4]:https://www.tizen.org/
[5]:http://automotive.linuxfoundation.org/node/add/downloads
[6]:http://content.linuxfoundation.org/auto/downloads/images/agl-demo-x86-1.0.img.gz
[7]:http://content.linuxfoundation.org/auto/downloads/images/agl-demo-vmware-1.0.vmdk.bz2

