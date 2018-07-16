树莓派进阶学习的五个建议
=======================
![](http://readwrite.com/files/styles/1400_0/public/fields/Rasberry-Pi_1_red.jpg)

> 从SSH到端口转发，这些先进的技术将使你的树莓派开发更简单。

当你命令行输入命令时，你就不再是一个新手在做一些[新手的设置][1]了。虽然进度不快，但是你的确正在通过你的方式去学习使用这物超所值的、只有信用卡大小的计算机去满足一些DIY想法，这就是树莓派。

> 然而，从基础跨越到中级还是存在较大距离。当你从“设置你的派”的教程转而学习“创建一个媒体服务器”时，项目开始前的需求就会有一点点挑战。许多中级的Pi教程，包括ReadWrite的一些文章，都会假设你已经对树莓派设置好了一些东西。

并非每一个项目都需要找个教程里的所有建议，但是知道这些步骤可以使项目更顺利地贴合需求。

当你准备脱离小白行列时，做一些树莓派教程的预先准备工作对你非常有用。

### 1) 使用SSH登录 ###

SSH意思是[Secure Shell][2]，它是一种加密网络协议，用于安全地在计算机与树莓派之间传输你的数据。项目中也许需要你通过你的计算机的命令行控制树莓派，而不是通过给树莓派连接显示器和键盘来控制。

现在SSH已经预先安装在树莓派系统 [Raspbian][3] 中了，所以如果你安装的是最新版本或较新版本的树莓派都是支持SSH使用的。

要使用SSH，第一，你需要知道你的树莓派的IP地址，在你的树莓派中输入以下命令：

    sudo ifconfig

[会显示出三个段落][4]。你的IP地址将会在第一段或者第三段显示，这主要看你的树莓派是通过线缆还是通过WIFI适配器连接网络的。如果是通过线缆连接，那请查看第一段，在“eth0”那行开始显示。如果是通过wifi链接，将在第三段“wlan0”开头的地方显示。

无论通过哪种方式，你将会看到以“inet addr”开头后面跟着像192.168.2.2这样类型的IP地址，这是我们在这篇文章中经常引用到的一种默认IP地址格式。

现在你有一个可以连接树莓派与你的电脑的IP地址了，如果你使用的是Mac，你已经有了内置的SSH，启动你的终端应用并输入：

    ssh pi@192.168.2.2

连接之后将会要求输入密码，默认情况下，密码一般是“respberry”.如果你修改了默认密码，请输入你的新密码。这样，您将登入了树莓派系统。

如果你在一台PC，还需要附加的一个步骤。

![](http://readwrite.com/files/putty2.jpg)

下载并运行[PuTTY][5]或者其它支持Windows系统的SSH客户端。输入你的IP地址在如上截图中的输入框中。保持默认端口为22不变。然后安心回车，PuTTY将会提示你输入用户名和密码。输入之后，就可以开始在你的树莓派里远程工作了。

### 2) 使用远程桌面连接到你的树莓派 ###

使用SSH去从命令行远程控制你的Pi是极好的，但是如果你想通过图形界面去管理你的Pi怎么办呢？幸运的是MAC和PC都已经内建了这种方式。

在你的树莓派中的命令行（是的，你可以通过SSH来操作），输入：

    sudo apt-get install xrdp 

xdrp是一种在可以在后台运行的计算机[守护进程][6]，并支持Mac和PC上的微软远程桌面客户端。当树莓派中安装好xrdp之后，你的MAC或者PC就可以通过客户端登录到树莓派中了。 

找到你的电脑中一个叫远程桌面的客户端。它本身并不是隐藏起来的，但没有放到应用程序的文件夹中。

![](http://readwrite.com/files/Screen%20Shot%202014-04-07%20at%2010.14.13%20PM.png)

出现上述提示时输入你的IP地址。接下来会弹出xrdp窗口，提示你输入用户名和密码。

![](http://readwrite.com/files/Screen%20Shot%202014-04-07%20at%2010.14.31%20PM.png)

如果进展顺利，你的树莓派桌面就会在你的电脑屏幕上的窗口里面显示出来了。

![](http://readwrite.com/files/Screen%20Shot%202014-04-07%20at%2010.14.48%20PM.png)

### 3) 给你的树莓派设置一个家庭网络的静态地址 ###

在之前（第一步）找到的树莓派的IP地址现在是可以连接的，但是不能保证你的路由器会一直给你的树莓派分配一个永久固定的IP地址。这意味着在你网段中的其它计算机无法知道树莓派被分配了什么IP地址。那么如何来给树莓派分配静态的IP地址而不是每隔几天就在树莓派上执行“sudo ifconfig”命令，或者糟糕到每隔几个小时一次？

显然，我们要从“ifconfig”命令开始，所以输入：

    sudo ifconfig

拿出笔和纸做准备，记录下面的三个IP地址。（#后面的代码是注释，实际不会显示.）：

    inet addr: 192.168.2.2 # 树莓派的当前IP地址

    Bcast: 192.168.0.255 # 地址广播范围

    Mask: 255.255.255.0 # 子网掩码

此外，你还需要知道另外2个信息。请输入以下命令获取网关和目的地址（译注：实际上我们只需要知道默认网关的IP就行了）。

    netstat -nr

接下来，去查看你路由器上的配置。（如何进行这一步主要取决于你用什么路由器，所以还是查看下说明书吧）找出你的设备通过DHCP设置了哪段ip地址。有些地址是不能使用的，因为DHCP协议中已经分配使用了。所以要选择没有被使用的，例如，192.168.2.2。你的路由器也许可以让你保留一个未使用的IP地址，固定分配给像树莓派这样的本地设备。（如果你的路由器是Belkin，那大概就是这样）如果是这样的，那就不用看下面的部分了。

如果不能固定分配，你需要让树莓派知道它的新的ip地址。我们通过nano编辑器来编辑树莓派中相关的文件。

    sudo nano /etc/network/interfaces

将“iface eth0 inet dhcp”这一段修改成“iface eth0 inet static”，也就是将动态获取IP修改成静态IP。

接下来输入如下，将下列X取代成你之前所记下来的地址信息。最上面的地址是我们将要把DHCP中没有使用的IP地址分配作为树莓派的静态IP地址。

    address 192.168.2.2
    
    netmask XXX.XXX.XXX.X
    
    network XXX.XXX.X.X
    
    broadcast XXX.XXX.X.X
    
    gateway XXX.XXX.X.X

使用“sudo reboot”的命令重启树莓派系统后，在命令行再次输入“ifconfig”，我们刚刚新设置的静态IP设置就会呈现。

### 4) 端口转发至树莓派 ###

一些树莓派程序可能需要你转发一个特定的网络端口号到你的树莓派。端口是信息在互联网传送的虚拟路径。有时候你需要转发一个端口来使像树莓派这样计算机可以被互联网访问，即使它在路由器后面。这种情况有点像拨电话分机号一样。

端口转发能够用于像[树莓派网页服务器][8]，树莓派的VOIP或者简单的点对点下载。有超过65000个端口可供选择，你可以分配不同的端口给不同的树莓派项目用来进行通信。

某些端口默认情况下代表着特定的应用。例如80端口默认为HTML页面，21端口默认代表FTP传输，1194端口默认用于设置VPN服务器。所以大多情况下，你可以随便选择哪个端口作为默认使用。（译注：此处原文“So a lot of the time, you can just go with whichever port is set as the default. ”似乎不能和上文衔接，以译者判断，应该是“所以大多数情况下，你应该选择默认的端口提供服务。”）

设置端口转发的方法完全取决于你的路由器，于是很难创建一个固定的关于设置[端口转发][9]教程。你只能阅读你路由器的说明书来定义端口和转发了。

下面链接了几个主流路由器厂商的端口转发教程。

- [Belkin][10]
- [Netgear][11]
- [Linksys][12]

### 5) 在互联网上给你的树莓派设置静态地址 ###

再次声明，如果你的运营商给了你一个静态IP，你就不需要看这个部分了。

我们已经给树莓派设置了一个静态的内部IP地址，这意味着在你的内部网络中总是能够连到你的树莓派。但是如果程序需要树莓派连接到互联网呢？如果你想要在你的树莓派上搭建一个Web服务器，在你网络之外的人们需要知道你的树莓派在哪里，这意味着我们要来设置一个像静态IP的公开地址。

我之所以说“看起来像”是因为我们已经设置了一个伪静态IP地址。通常，你所在的运营商将会不断变换分配给你的地址。所以每一次有人连接到你的树莓派时，我们就要写个脚本说：“树莓派已经搬家了，让我带你去新的地址吧！ ”

我们可以通过[DDNS][13]（即动态DNS）来实现，它实时维护名字解析，并通过 [DDClient][14] 程序通知DDNS修改指向到你的树莓派。

首先需要注册一个类似[DNS Dynamic][15]的动态主机服务。根据指示并创建新的名称服务器类似Yourserver.dnsdynamic.com.

接下来进入树莓派中的命令行，使用下面命令来安装DDNS客户端：

    sudo apt-get install ddclient

我们需要编辑DDNS客户端配置，使用新的名称服务器：

    sudo nano /etc/ddclient/ddclient.conf 

每种服务配置都会有略微的不同，但是DDNS的网站会告诉你需要在配置文件中修改的内容。一个标准的DDNS配置，举个栗子，如 [DDNS配置][16]，可以直接复制粘贴。 

你的运营商不会因为你的这个文件而停止更新给你分配的IP地址，因此我们在脚本的最前面设置一个守护进程执行的频度，以确保及时检查IP地址是否已经更改。

    daemon=600
    # check every 600 seconds

这里设置的是每10分钟检查一次，这是一个不错的选择。如果你设置成每秒钟检查一次，你的动态服务器恐怕不干，因为这样对它来说是一种轰炸。记得按下ctrl+x保存并退出配置文件。

接下来，输入：

   ddclient

如上输入程序的名称就可以运行了。当你的树莓派开着的时候就会持续运行了。如果你重启树莓派，键入 “ddclient”就会重新开始运行了。

现在你的树莓派已经被装修一番，可以迎接更高级的教程了，请从中获得更多乐趣吧！

### 关于作者：

本文的美女作者：[Lauren Orsini](http://readwrite.com/author/lauren-orsini#awesm=~oEMljxDCpMKnXj)是一个专业记者、业余程序员和全职宅女，她住在饱受交通之苦的Arlington, VA。

![Lauren Orsini](http://readwrite.com/files/fields/LaurenOrsini.jpg)



--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial#feed=/hack&awesm=~oB1b7zvteUQGOV

译者：[disylee](https://github.com/disylee) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.raspberrypi.org/downloads/
[2]:http://en.wikipedia.org/wiki/Secure_Shell
[3]:http://www.raspbian.org/
[4]:https://learn.adafruit.com/adafruits-raspberry-pi-lesson-3-network-setup/finding-your-pis-ip-address
[5]:http://www.chiark.greenend.org.uk/~sgtatham/putty/
[6]:http://en.wikipedia.org/wiki/Daemon_(computing)
[7]:https://www.modmypi.com/blog/tutorial-how-to-give-your-raspberry-pi-a-static-ip-address
[8]:http://raspberrywebserver.com/serveradmin/get-your-raspberry-pi-web-site-on-line.html
[9]:http://portforward.com/help/portforwarding.htm
[10]:http://www.belkin.com/us/support-article?articleNum=10790
[11]:http://kb.netgear.com/app/answers/detail/a_id/24046/~/how-do-i-configure-port-forwarding-on-routers-with-the-netgear-genie-interface%3F
[12]:http://kb.linksys.com/Linksys/ukp.aspx?pid=80&vw=1&articleid=21470
[13]:http://en.wikipedia.org/wiki/Dynamic_DNS
[14]:http://sourceforge.net/p/ddclient/wiki/Home/
[15]:https://www.dnsdynamic.org/
[16]:http://dnsdynamic.blog.com/2011/06/26/using-ddclient-with-dnsdynamic/
[17]:http://readwrite.com/2014/01/21/raspberry-pi-great-projects#feed=/search?keyword=raspberry+pi&awesm=~oAWzuuuChYu9vm
