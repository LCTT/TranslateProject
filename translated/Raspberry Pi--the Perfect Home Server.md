树莓派（Raspberry Pi）：完美的家庭服务器
---

自从树莓派发布公告，所有在互联网上的网站为此令人兴奋的设备提供了很多有趣和具有挑战性的使用方法。虽然这些想法都很棒，最明显和至少最迷人的是用树莓派（ **RPi** ）创建你的家庭服务器。

如果你有几个不同的电脑需要同步和自动化备份，RPI可以做到。如果你有音乐和视频在房子里，你想要能够从几乎任何屏幕上访问到，RPi也可以让这种事情发生。也有你有一个或两个打印机，你想要很容易的共享其中一个？树莓派在硬件和时间上用最小投资就能满足你的这些需求。

**树莓派的好处**

低成本：35美元（约合242元RMB），RPi模型B接近一台完整的电脑，512M内存，100Mb以太网，SD卡插槽，2个USB接口，音频输出和HDMI或RCA视频输出。我见过的HDMI电缆其费用超过RPI。

能源效率：硬件成本只是服务器费用的一部分，因为你需要考虑能源成本去不断运行设备。多CPU所需的家用不会去支付，大部分时间它都处于空闲中，等待做什么。RPi's超低功率组件非常适合这个工作负载，这有助于使你的电力账单下降。我的模型B单个加上外部硬盘消耗总共只有8瓦，while the old Athlon-based box it replaced drew 54 watts at idle.假设10美分每千瓦一小时，这使得一个RPi每年电力账单在7美元。一个基于速龙的机器是47美元。在不到一年的时间里，RPI基本上支付其自身。

低噪音：因为RPi没有风扇和移动部件，在你最终配置中的唯一组件上生成噪音或任何明显热量的将在硬盘上。如果你担心噪音，像[Silent PC Review][1]发烧友网站经常在他们的评论中包括噪声基准。我的经验是现代驱动器是安静的，足够避免检测任何地方有其他东西已在运行（如媒体中心，游戏控制台或其他电脑）。如果你家里没有为布线提供更多的灵活性，RPi's的小尺寸，最小热输出和低噪音排放量也许使它可能偷偷的在服务器中，在过去很难证明。

![](https://github-camo.global.ssl.fastly.net/37922c152a6abd82b42ca0a965a311e8914fbb16/687474703a2f2f7777772e6c696e75786a6f75726e616c2e636f6d2f66696c65732f6c696e75786a6f75726e616c2e636f6d2f7566696c65732f696d61676563616368652f6c617267652d35353070782d63656e74657265642f75313030323036312f313134353466312e6a7067)

图1,一个紧凑但高能力的家庭服务器

新机会：一个不那么有实质的好处是简单快乐的尝试新事物！对我来说，我第一时间工作在基于Debian的发行版，它大概在第一时间有很多linux爱好者将尝试改变一个基于ARM的体系结构。

**布置硬件**

对于一个家庭服务器来说，你将为本地存储需要一个中等大小的SD闪存卡。它可以使用一个USB引导，但那会用两个宝贵的USB插槽之一。闪存卡不需要很大，但是速度越快越好。我选择了一个名牌SD卡，8GB容量和10级速度等级。为了备份和多媒体文件，一个大的硬盘与USB连接插槽是必须的。我选择一个1.5TB的硬盘和一个Calvary EN-CAHDD-D 2-bay USB 2.0硬盘连接插槽。这个连接插槽有个功能，在RAID-0模式中运行两个驱动器，总有一天会有用。最后，RPi不带电源线，但大多数智能手机充电器电源线所需的5v以上微型USB。看看RPi是否在意电源，我为电源已换了三个不同的微型USB手机充电器。我在这周里尝试了每一个，在任何一个上都没有问题。

**安装操作系统**

安装RPi操作系统在其他地方涵盖广泛细节，但是有一些家庭服务器特定的提示，大致按需要的顺序。

1）直接通过[http://www.raspberrypi.org/downloads][2]获取Raspbian "Wheezy"安装镜像，并复制到SD卡，用网站上已列出的步骤。

2）第一次引导RPi时，附加一个键盘，鼠标和显示器。在引导RPi之前别忘打开显示器，可以检测更正HDMI或合并输出端口。

3）RPi有一个很好的"raspi-config"屏幕，在第一次启动时你会看到。对于家庭服务器来说，以下选择将会有用：

- expand_rootfs：调整默认2GB OS镜像来填充剩余的闪存卡。  
- change_pass：默认密码是"raspberry"，但是，比这更安全的会更好。  
- 设置你的地点和时区。  
- memory_split：分配最小值尽可能为GPU服务留下更多空间。  
- SSH：别忘开启SSH服务。  
- boot_behaviour：关闭启动至桌面（再次为你的服务保存内存）。

完成后，你将在 `pi@raspberrypi` 提示符下。安装脚本可以在任何时间通过 `sudo raspi-config` 重新运行。

只是一些配置项，然后操作系统已经准备就绪。

1）一个静态IP让一切变得更容易，切换eth0的网络设置：
    >>> sudo nano -w /etc/network/interfaces  
    
更改eth0 `iface eth0 inet dhcp` 行，如下所示（更改以满足你的家庭网络设置）：

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
    
4）这里，准备无脑吧！关闭PI：  

    >> sudo /sbin/shutdown -h now
    
一旦关闭（显示器绿色指示灯在RPi电路板知道当完成关闭），拔下显示器，键盘，鼠标和电源线。附加USB存储器，然后插回电源重启RPi。

5）一旦RPi开启（再次这些绿色指示灯提示其状态），你可以从远程网络上从任何其他机器ssh到RPi并完成所有的配置（更改以下命令里的IP为你的静态IP）：

`>> ssh YOURUSERIDHERE@192.168.1.10`

祝贺你，有了一个工作中的树莓派！

**外围设备**

第一要务是要装入外围设备。用dmesg来寻找你的存储设备，会发现--几乎可以肯定是/dev/sda。我喜欢使用自动挂载去处理挂载远程存储设备，因为关于交换设备可能不存在或准备在启动时间更灵活：

    >> sudo apt-get install autofs
    >> sudo nano -w /etc/auto.master 
    ======/etc/auto.master======
    ...
    /misc /etc/auto.misc
    ...
    ======/etc/auto.master======

    >> sudo nano -w /etc/auto.misc
    
注意，我的外部存储设备是ext4格式--如果需要为你需求更改这个：

    ======/etc/auto.misc======
    ...
    storage -fstype=ext4:/dev/sda1
    ...
    ======/etc/auto.misc======
    >> sudo /etc/init.d/autofs restart 
    >> ls -lat /misc/storage 
    
可选，创建一个符号链接至短路径：

    >> ln -s /misc/storage /storage
    
**备份仓库**

在任何家庭服务器功能列表的顶端是提供坚如磐石的备份。RPi，这是漂亮而简单，在Linux中基于范围广泛的网络共享选项：Samba/CIFS用于Windows机器，NFS用于基于UNIX的设备并且甚至SFTP用于更多先进的备份客户端，像deja-dup。由于RPi只有100MB以太网和在USB上的存储设备，它没有非常快的传送速度。在其他方面，好的备份客户端在后台自动运行，所以它不会注意稍慢的传输速度。

我的家庭网络包括一台Windows7电脑。对于它，我通过Samba在RPi's外部USB存储设备上导出一个备份目录。因为备份程序在Windows7的基础版本不支持网络设备作为一个备份目标，我使用[SyncBack Free][3]去设置使其自动化，每日备份。

简单设置Samba。

1）安装samba和common-bin库（具有smbpasswd效用）

    >> sudo apt-get install samba samba-common-bin
    
2）使用 `smbpasswd` 让你的本地ID能访问：

    >> sudo smbpasswd -a YOURUSERIDHERE
    
3）编辑samba配置文件：

    >> sudo nano -w /etc/samba/smb.conf
    
4)更改 `workgroup = WORKGROUP` 行去匹配你的Windows工作组名称。

5）注释掉或删除[homes]和[printers]共享。(打印机通过CUPS访问。)

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

对Linux设备来说，deja-dup是智能简单的设置和使用。它被默认安装在我的Fedora 18和Ubuntu 12.10上。包的名称是“deja-dup”，前端简单的称为“Backup（备份）”。虽然RPi很容易支持NFS导出，我发现使用deja-dup的SSH选项更容易，更方便，在RPi上它消除了对额外服务的需要。指定一个deja-dup加密密码是一个好主意，除非你喜欢的好主意全都进入别人的存储设备：

	>> sudo mkdir /storage/linuxlaptop
	>> sudo chown -R YOURUSERIDHERE:YOURUSERIDHERE /storage/linuxlaptop

从linux客户端启动备份程序，选择“SSH”作为备份位置，输入RPi's IP地址和你创建的存储位置。首次备份会很慢，但是未来运行将只发送增量变化，速度更快。

![](https://github-camo.global.ssl.fastly.net/08111990037d492b22d45de49816f5bc2b02933a/687474703a2f2f7777772e6c696e75786a6f75726e616c2e636f6d2f66696c65732f6c696e75786a6f75726e616c2e636f6d2f7566696c65732f696d61676563616368652f6d656469756d2d33353070782d63656e74657265642f75313030323036312f313134353466322e706e67)

图2,Deja-dup客户端设置

**多媒体服务器：DLNA**

现在每个人的文件安全的备份。让我们继续一些乐趣！一个DLNA服务器将给你一个集中地去存储你的电影，音乐和图片。DLNA客户端可以在房子的每个屏幕不费力的重放这个内容。

至少，这是承诺。现实情况是DLNA规格不相当使很多重要的事情固定，像格式或编码。每个客户端通常希望支持什么格式和服务器功能的一个稍微不同的想法。很多高功率服务器也许能转码本地内容到移动设备支持的格式，但是在RPi上不是问题，在即时烧录转码上经常扰乱其他功能，如暂停，快进和倒带。一般情况下，高功率设备如PS3,Xbox和WD TV设备大多数格式无需任何转码。低端设备如智能TVs或Blu-ray播放器支持更多的编码限制列表。

对于RPi来说，最好的办法是简单的进行标准编码去支持你的初级DLNA设备，然后测试你的其他DLNA客户端。如果没有完美播放，在下一节提示中也许有帮助。在我的案例中，我的PlayStation 3充当DLNA客户端，which plays nicely with the compact .m4v files generated by Handbrake。对于DLNA服务器Minidlna是个很好的选择。它已经在Raspbian发行版中，易于设置和使用最小服务资源运行：

	>> sudo apt-get install minidlna
	>> sudo nano  -w /etc/minidlna.conf

这是我/etc/minidlna.conf文件的有关部分：

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

一旦完成编辑，告诉minidlna重启并重新扫描内容：

	>> sudo /etc/init.d/minidlna force-reload

Minidlna有能力为你的设备支持的电影提供电影海报缩略图（像PS3）。这让找到一个特定的电影在滚动几十个电影文件时更方便。我发现最兼容文件布局的是每个电影一个目录，只是包含影片文件的缩略图，图像命名为“Cover.jpg”。使用像"MovieName.m4v"和"MovieName.jpg"的格式为PS3正常工作。但它破坏VLC（如果你能说服VLC uPNP插件首先查找服务器）。

通过PS3，你可以通过转到在XMB栏上的"Video"测试连通性。当视频向下滚动时，你以前设置的"friendly_name"应该是可见的，测试确保Minidlna是通过浏览器转到http://192.168.1.10:8200/。

**对于非 DLNA 设备多媒体**

一旦DLNA与你的设备工作，你会发现它不想工作，所以多媒体计划B是个好主意。Nginx网站服务器有一个MP4插件尝试改善流传输plain-old HTTP，但是浏览器重放性能差别很大，快进在一部电影里也一贯不工作。它看起来像为多媒体共享或非 DLNA 设备最低的共同标准是好旧的老式的 Samba 共享与来宾只读访问。

这是/etc/samba/smb.conf的部分示例：

	[dlna] 
	path=/storage/dlna 
	read only=yes 
	browsable=yes 
	public=yes 

定义所占份额和重启Samba后（ `sudo /etc/init.d/samba restart` ），你可以开始测试你的客户端。

我测试了以下客户端与一个混合视频编码with Handbrake作为m4v文件：

- Android 4.0.4手机："ES File Explorer"与"ES Media Player"（播放器附带安装）。

- Android 4.1.2平板电脑："ES File Explorer"与"ES Media Player"（播放器附带安装）。

- Linux设备：自动挂载：//192.168.1.10/dlna，然后使用VLC或MPlayer。

- Windows：挂载//192.168.1.10:/dlna，然后使用VLC。

所有设备都能几乎立即开始播放和快进没有延迟的情况。

**打印服务器**

RPi运行CUPS相当不错，所以它易于共享一个较旧的没有本机网络功能的打印机。

安装你的打印机所需的CUPS和任何软件包。我需要hplip-cups，因为我也有HP喷墨打印机：

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

然后转到http://192.168.1.10:631/并点击 "Adding Printers and Classes"去设置你的打印机。我的打印机是自动发现USB，所以我的一切被点击“share”。同样访问https://192.168.1.10:631/admin，确保检查“Share printers connected to this system（共享打印机连接至这个系统）”。

一旦你做完，你可以用通常的方式设置你的客户端。一旦我输入主机名，我的Linux客户端自动发现打印机并挑选正确的打印机设备。在我的Windows7的机器上，一旦我选择“Network Printer（网络打印机）”，我必须点击“The printer that I want isn't listed（我想要的打印机未列出）”，选择“Select a shared printer by name（通过名称选择共享的打印机）”，然后从CUPS网络接口输入URL：http://192.168.1.10:631/printers/HP_J4500。

**结论**

用最少的额外的硬件和配置，树莓派可以是高可用的，简洁的家庭服务器。它通过Linux进入家庭环境与最少硬件费用带来提供广泛的企业服务。


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/raspberry-pi-perfect-home-server

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/vito-L) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.silentpcreview.com/
[2]:http://www.raspberrypi.org/downloads
[3]:http://www.2brightsparks.com/freeware/freeware-hub.html
