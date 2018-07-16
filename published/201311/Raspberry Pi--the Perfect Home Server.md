树莓派（Raspberry Pi）：完美的家用服务器
================================

自从树莓派发布后，所有在互联网上的网站为此激动人心的设备提供了很多有趣和具有挑战性的使用方法。虽然这些想法都很棒，但树莓派( **RPi** )最明显却又是最不吸引人的用处是：创建你的完美家用服务器。

如果你有几个不同的电脑需要同步和自动化备份，RPi可以做到。如果你想通过家中的任意屏幕来访问你的音乐和视频，RPi也能实现。也许你有一个或两个打印机，你想要简单与大家共享，树莓派在硬件和时间上用最小投资就能满足你的这些需求。

###树莓派的好处

低成本：35美元（约合242元RMB），B型的RPi接近一台完整的电脑，512M内存，100Mb以太网，SD卡插槽，2个USB接口，音频输出和HDMI或RCA视频输出。我知道HDMI电缆就比树莓派贵。

能源效率：硬件成本只是服务器费用的一部分，因为你需要考虑能源成本去不断运行设备。家用服务器所需要的服务不会占用太多CPU，大部分时间它都处于空闲状态，等待发挥功效。RPi's超低功率组件非常适合这个工作负载，这有助于降低你的电费消耗。我的一个B型的RPi加上外部硬盘消耗总共只有8瓦，然而用老式速龙代替的机器在闲置时消耗54瓦。假设10美分每千瓦一小时，这使得一个RPi每年的电费在7美元。一个基于速龙的机器是47美元。在不到一年的时间里，RPI基本上能够收回成本。

低噪音：因为RPi没有风扇和移动部件，在你最终配置中的唯一能生成噪音或明显热量的组件就是硬盘。如果你担心噪音，像[Silent PC Review][1]发烧友网站经常在他们的评论中涉及到噪声基准。我的体会是现代驱动器足够安静，要比其他的设备安静的多（如媒体中心，游戏机或其他电脑）。如果你家里没有为布线提供更多的灵活性选择，RPi的小尺寸、少量发热和低噪音也许让你走过它旁边都很难发现。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11454f1.jpg)

图1,一个简洁高效的家用服务器

新机会：一个不怎么实际的好处是-简单快乐的尝试新事物！对我来说，这是我第一次真正工作在基于Debian的发行版，很可能也是许多Linux爱好者们第一次有机会尝试一个基于ARM的体系结构。

###布置硬件

对于一个家庭服务器来说，你将需要一个中等容量的SD闪存卡作为本地存储。它可以使用一个USB引导，但那会占用两个宝贵的USB插槽之一。闪存卡不需要很大容量，但是速度越快越好。我选择了一个名牌SD卡，8GB容量和CLASS 10的速度等级。对于备份和存储多媒体文件，一个有USB连接插槽的硬盘驱动器是必须的。我选择一个1.5TB的硬盘和一个Calvary EN-CAHDD-D 2-bay USB 2.0硬盘连接基座。这个连接基座有个功能，在RAID-0模式中连接两个硬盘，总有一天会有用的。最后，RPi不带电源线，但可以用大多数智能手机充电器所用的5v微型USB。看看RPi是否挑剔电源，我为电源已换了三个不同的微型USB手机充电器。我在这周内尝试了每一个，在任何一个上都没有问题。

###安装操作系统

安装RPi操作系统包括了许多方面的大量细节，但这里有一些家用特定服务器的安装提示，大致按需要的顺序讲述。

1）直接通过[http://www.raspberrypi.org/downloads][2]获取Raspbian "Wheezy"安装镜像，并复制到SD卡，用网站上已列出的步骤。

2）第一次引导RPi时，连接一个键盘、鼠标和显示器。在引导RPi之前别忘打开显示器，可以检测到正确的HDMI或混合输出端口。

3）RPi有一个很好的"raspi-config"屏幕，在第一次启动时你会看到。对于家庭服务器来说，以下选择将会有用：

- expand_rootfs：调整默认2GB OS镜像的大小，来填满闪存卡剩余的内存。  
- change_pass：修改默认密码"raspberry"，但是，越安全的密码越好。  
- 设置你的地点和时区。  
- memory_split：给GPIU服务分配最少的内存（16M）尽可能为其他服务留下更多内存。  
- SSH：别忘开启SSH服务。  
- boot_behaviour：关闭“启动至桌面（boot to desktop）”（再次为你的其他服务节省内存）。

完成后，你将在出现 `pi@raspberrypi` 提示符下。安装脚本可以在任何时间通过 `sudo raspi-config` 重新运行。

还有一些其他配置，然后操作系统就可以用了。

1）一个静态IP让一切变得更容易，切换eth0的网络设置： 


       >> sudo nano -w /etc/network/interfaces  
    
更改eth0的那行 `iface eth0 inet dhcp` ，如下所示（根据你的家庭网络设置修改）：

    ======/etc/network/interfaces======
    ...
    iface eth0 inet static
    address 192.168.1.10
    netmask 255.255.255.0
    gateway 192.168.1.1
    ...
    ======/etc/network/interfaces======
    
2）创建本地用户并加入到users组和sudo组：

    >> sudo adduser YOURUSERIDHERE
    >> sudo usermod -a -G users YOURUSERIDHERE
    >> sudo usermod -a -G sudo YOURUSERIDHERE
    
3）更新系统确保所有的库是最新最好的：

    >> sudo apt-get update; sudo apt-get upgrade
    
4）好了，准备重新启动吧！先关闭PI：  

    >> sudo /sbin/shutdown -h now
    
一旦关闭（注意RPi电路板上的绿色LED状态指示灯，可以知道什么时候完成关闭了），拔下显示器，键盘，鼠标和电源线。插入USB端口上的硬盘，然后插回电源重启RPi。

5）一旦RPi开启（这些绿色LED指示灯用来描述状态），你可以从远程网络上从任何其他机器ssh到RPi并完成所有的配置（更改以下命令里的IP为你的静态IP）：

	>> ssh YOURUSERIDHERE@192.168.1.10

祝贺你，有了一个可以工作的树莓派！

###外设

第一件事是要连接外设。用dmesg来寻找你的存储设备，会发现——几乎可以肯定是/dev/sda。我喜欢使用自动挂载去挂载移动存储设备，这样更灵活，因为在启动时这些设备也许没有或者没准备好：

    >> sudo apt-get install autofs
    >> sudo nano -w /etc/auto.master 
    ======/etc/auto.master======
    ...
    /misc /etc/auto.misc
    ...
    ======/etc/auto.master======

    >> sudo nano -w /etc/auto.misc
    
注意，我的外部存储设备是ext4格式，如果需要话可以在下面更改：

    ======/etc/auto.misc======
    ...
    storage -fstype=ext4:/dev/sda1
    ...
    ======/etc/auto.misc======
    >> sudo /etc/init.d/autofs restart 
    >> ls -lat /misc/storage 
    
可选的，创建一个符号链接的短路径：

    >> ln -s /misc/storage /storage
    
###备份仓库

在任何家庭服务器功能列表里面最重要的是提供坚如磐石的备份。对于RPi来说，这很简单而优美，在Linux中有丰富的网络共享选项：Samba/CIFS用于Windows机器，NFS用于基于UNIX的设备，并且甚至SFTP可以用于更多新的备份客户端，如deja-dup。由于RPi只有100MB以太网接口和USB上的存储设备，它没有非常快的传送速度。不过在另一方面，好的备份客户端是在后台自动运行的，所以你不会注意略微缓慢的传输速度。

我的家庭网络包括一台Windows 7电脑。对于它，我通过Samba在RPi's外部USB存储设备上导出一个备份目录。因为备份程序在Windows7基础版上不支持网络设备作为备份目标，我使用[SyncBack Free][3]去设置使其自动化，每日备份。

配置Samba是容易的。

1）安装samba和common-bin库（具有smbpasswd效用）

    >> sudo apt-get install samba samba-common-bin
    
2）使用 `smbpasswd` 让你的本地ID能访问：

    >> sudo smbpasswd -a YOURUSERIDHERE
    
3）编辑samba配置文件：

    >> sudo nano -w /etc/samba/smb.conf
    
4）更改 `workgroup = WORKGROUP` 行以匹配你的Windows工作组名称。

5）注释掉或删除[homes]和[printers]共享。(打印机共享稍后将通过直接CUPS访问来完成。)

6）为Windows备份路径增加一个条目。这是我的示例，放置在该文件的底部：

	======/etc/samba/smb.conf======
	...
	[win7pc] 
	comment=Backup for windows PC
	path=/storage/win7pc 
	writeable=Yes 
	create mask=0777 
	directory mask=0777 
	browsable=Yes 
	public=Yes 
	valid users=YOURUSERIDHERE
	...
	======/etc/samba/smb.conf======

7）重启Samba使你的编辑生效：

	>> sudo /etc/init.d/samba restart

8）从Windows机器文件资源管理器通过映射一个网络设备测试连通。

对Linux设备来说，设置和使用deja-dup非常简单。它被默认安装在我的Fedora 18和Ubuntu 12.10上。包的名称是“deja-dup”，程序名简单的称为“Backup（备份）”。虽然RPi很容易支持NFS导出，我发现使用deja-dup的SSH选项更容易，更方便，在RPi上它不需要额外服务的支持。指定一个deja-dup加密密码是一个好主意，除非你不在意一旦丢失了存储器，别人就可以拿走全部数据：

	>> sudo mkdir /storage/linuxlaptop
	>> sudo chown -R YOURUSERIDHERE:YOURUSERIDHERE /storage/linuxlaptop

从linux客户端启动备份程序，选择“SSH”作为备份位置，输入RPi的IP地址和你创建的存储位置。首次备份会很慢，但是以后的运行将只发送增量变化，速度更快。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/medium-350px-centered/u1002061/11454f2.png)

图2,Deja-dup客户端设置

###多媒体服务器：DLNA

现在每个人的文件都已安全备份。让我们继续看些有趣的！一个DLNA服务器可以让你集中存储你的电影、音乐和图片。通过这个中心库，家中每一个屏幕的DLNA客户端都可以轻松重放此内容。

至少，这是一个宣称。事实是这样的，DNLA规格并不太确定一些重要的事情，如支持哪些格式或编码。每个客户端通常对于支持什么格式和服务器功能都有略微不同的想法。很多高功率的服务器也许能转码本地内容到移动设备支持的格式，但是在RPi上是不可能的，在即时转码上经常扰乱其他功能，如暂停，快进和倒带。一般情况下，高功率设备如PS3、Xbox和WD TV设备支持大多数格式，而无需任何转码。低端设备如智能TVs或Blu-ray播放器只支持更有限的编码列表。

对于RPi来说，最好的办法是支持你的主要的DLNA设备的标准编码，然后测试你的其他DLNA客户端。如果没有完美播放，在下一节的提示也许有帮助。在我的情况下，我的PlayStation 3充当DLNA客户端，PS3能够流畅播放经Handbrake制作后的.m4v文件。

对于RPi的DLNA服务器来说，Minidlna是个很好的选择。它已经在Raspbian发行版中，易于设置和使用最小服务资源运行：

	>> sudo apt-get install minidlna
	>> sudo nano  -w /etc/minidlna.conf

这是我/etc/minidlna.conf文件的相关部分：

	...
	# I found keeping video + audio in different paths helpful
	media_dir=V,/storage/dlna/video 
	media_dir=A,/storage/dlna/music 
	...
	presentation_url=http://192.168.1.10:8200/
	...	
	friendly_name=MyRPi
	...
	# Since I add new media infrequently, turning off 
	# inotify keeps minidlna for polling for 
	# content changes. It's simple enough to run 
	# sudo /etc/init.d/minidlna force-reload
	# when new content is added.
	inotify=no

一旦完成编辑，重启minidlna以加载新配置：

	>> sudo /etc/init.d/minidlna force-reload

Minidlna能够为你的设备支持的电影提供电影海报缩略图（像PS3）。这让我能够更方便地在几十个电影文件中滚屏查找我想要的那个电影。我发现每个电影一个目录是最兼容的文件布局，只包含影片文件和缩略图，图像命名为“Cover.jpg”。使用像"MovieName.m4v"和"MovieName.jpg"的格式在PS3上工作的很好，但它不太适合VLC（除非你能让VLC uPNP插件首先查找服务器的话）。

通过PS3，你可以通过转到在XMB栏上的"Video"测试连通性。当视频列表向下翻页时，你以前设置的"friendly_name"应该是可见的，测试确保Minidlna是通过浏览器转到http://192.168.1.10:8200/。

###非DLNA设备的多媒体

当你让DNLA与你的一些设备一起工作时，你可能会发现有些设备并不适合它，所以多媒体计划B是个好主意。Nginx网站服务器有一个MP4插件尝试在旧式的HTTP连接上改善流媒体传输，但是浏览器回放的性能差别很大，在一部电影里快进也一直不工作。看起来多媒体共享或非 DLNA 设备的最低共同特性是使用传统Samba共享的访客只读访问。

这是/etc/samba/smb.conf的部分示例：

	[dlna] 
	path=/storage/dlna 
	read only=yes 
	browsable=yes 
	public=yes 

定义了共享设置后重启Samba（ `sudo /etc/init.d/samba restart` ），你可以开始测试你的客户端。

我用一个混合的编码m4v视频文件测试了以下客户端：

- Android 4.0.4手机："ES File Explorer"与"ES Media Player"（播放器附带安装）。

- Android 4.1.2平板电脑："ES File Explorer"与"ES Media Player"（播放器附带安装）。

- Linux设备：自动挂载：//192.168.1.10/dlna，然后使用VLC或MPlayer。

- Windows：挂载//192.168.1.10:/dlna，然后使用VLC。

所有设备都能几乎立即开始播放和快进没有延迟的情况。

###打印服务器

RPi运行CUPS相当不错，所以它容易共享一个较旧的没有本地网络接口的打印机。

安装你的打印机所需的CUPS和任何软件包。我需要hplip-cups，因为我有一个HP喷墨打印机：

	>>  sudo apt-get install cups hplip-cups

更新“Listen”行和增加 `Allow @LOCAL` 到位置指令，如下所示（你可以使用其他机器在你的LAN上去管理CUPS）：

	======/etc/cups/cupsd.conf======
	#Listen localhost:631  #Comment this out
	Listen 192.168.1.10:631 #Add this line
	...
	<Location /> 
	  Order allow,deny 
	  Allow @LOCAL 
	</Location> 
	
	# Restrict access to the admin pages... 
	<Location /admin> 
	  Order allow,deny 
	  Allow @LOCAL 
	</Location> 
	
	# Restrict access to configuration files... 
	<Location /admin/conf> 	
	  AuthType Default 
	  Require user @SYSTEM 
	  Order allow,deny 
	  Allow @LOCAL 
	</Location> 
	======/etc/cups/cupsd.conf======

添加你的本地ID到lpadmin组就能管理CUPS：

	>> sudo usermod -a -G lpadmin  YOURUSERIDHERE

重启CUPS：

	>> sudo /etc/init.d/cups restart

然后转到http://192.168.1.10:631/并点击 "Adding Printers and Classes"去设置你的打印机。我的打印机是自动发现的USB设备，所以，我只需点击“share”就可以。同样访问https://192.168.1.10:631/admin，确保检查“Share printers connected to this system（共享连接至这个系统的打印机）”。

完成后，你可以用通常的方式设置你的客户端。当我输入主机名，我的Linux客户端就能够自动发现打印机，并选择正确的驱动程序。在我的Windows7的机器上，一旦我选择“Network Printer（网络打印机）”，我必须点击“The printer that I want isn't listed（我想要的打印机未列出）”，选择“Select a shared printer by name（通过名称选择共享的打印机）”，然后从CUPS网络接口输入URL：http://192.168.1.10:631/printers/HP_J4500。

###结论

用最少的额外的硬件和配置，树莓派是高效、简洁的家用服务器。它能够花最小的硬件费用来为你的家庭环境带来由Linux提供的广泛企业服务。


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/raspberry-pi-perfect-home-server

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Vito](https://github.com/vito-L) 校对：[Caroline](https://github.com/carolinewuyan)

[1]:http://www.silentpcreview.com/
[2]:http://www.raspberrypi.org/downloads
[3]:http://www.2brightsparks.com/freeware/freeware-hub.html
