
5个指引提升你的树莓派项目

> 从SSH到端口转发，这些先进技术将使树莓派的发展轻松前进。
当你命令行输入命令时，你将不再是一个新手在做一些陌生的设置了。虽然进度缓慢，但是你正在通过你的方式去学习使用这廉价的，信用卡尺寸的大计算机去满足一些DIY想法，这就是树莓派。


> 然而，在基础和中间的东西之间还是存在较大差距。当你从“设置你的派”的教程例如“创建一个媒体服务器”，前期项目的需求就变得有点冒险了。许多中级的Pi教程，包括其中的一些读写操作，例如一些关于树莓派的安装设置。 并非每一个项目都需要教程里的所有建议，但是知道这些步骤可以使项目更顺利地贴合需求。当你准备超越基础知识时，这里有一些关于树莓派的教程将提前为你准备。
### 1) Using SSH ###
使用SSH登录 
SSH代表Secure Shell，是一种加密网络协议，用于安全地传输你的计算机与树莓派之间的数据。项目中也许需要你通过计算机的命令行而不是直接通过链接显示器和键盘来实现。如今SSH已经提前安装在树莓派系统中，所以如果你安装的是最新版本或者接近最新版本的树莓派都是支持SSH使用的。
如何使用SSH，第一，你需要知道你的派的IP地址，在你的派中输入一下命令：

    sudo ifconfig
你的IP地址将会在第一段或者第三段显示，这主要看你的树莓派是通过线缆还是通过WIFI适配器连接网络的。如果是通过线缆连接，那请查看第一段，在“eth0”那行开始显示。如果是通过wifi链接，将在第三段“wlan0”开头的地方显示。
无论通过哪种方式，你将会看到以“inet addr”开头后面跟着像192.168.2.2这样类型的IP地址，这是我们在这篇文章中经常引用到的一种默认IP地址格式。
现在你有一个可以链接树莓派与你的电脑的IP地址了，如果你使用的是Mac，你已经建立了SSH链接，启动你的终端应用并输入：

    ssh pi@192.168.2.2
连接之后将会要求输入密码，默认情况下，密码一般是“respberry”.如果你修改了默认密码，请输入新的密码取而代之。这样，您将进入树莓派系统。
如果你在一台PC，那这是一个多余的步骤。

下载并运行PuTTY或者另一种支持Windows系统的SSH客户端。输入你的IP地址在空格 中，如一下截图所示。将默认端口设置成22.点击enter，PuTTY将会提示你输入用户名和密码。填完之后，将可以开始在你的Pi里远程工作了。
### 2) Remote Desktop Your Raspberry Pi ###
使用远程桌面工具到你的树莓派

使用SSH去从命令行远程控制你的Pi是极好的，但是如果你想通过图形界面去管理你的Pi。幸运的是MAC和PC都已经建立了这种接口。
在你的树莓派中的命令行（当然你也可以通过SSH来操作），输入：

    sudo apt-get install xrdp 

Xdrp是一种在可以在后台运行的计算机守护进程，并可以在Mac和PC中支持微软远程桌面客户端。通过一旦在树莓派中安装了，你的MAC或者PC将可以通过客户端登录到Pi中。 
找到你电脑中一个叫远程桌面的客户端。它本身是不完全隐藏起来的，但不会隐藏在应用程序的文件夹中。

出现提示时输入你的IP地址。接下来会弹出xrdp窗口，提示你输入用户名和密码。
如果进展顺利，你的树莓派桌面就会在你的窗口或者在电脑屏幕上显示。
### 3) Static IP For Your Pi On The Home Network ###
在您的同网段给树莓派设置静态IP地址
我们发现如第一步所说很容易就可以管理树莓派，但是不能保证你的路由器会一直给你的树莓派分配一个永久固定的IP地址。这意味着在你网段中的计算机无法知道树莓派被分配了什么IP地址。那么如何来给树莓派分配静态的IP地址而不是每隔几天就在树莓派上执行“sudo ifconfig”命令，有时候情况糟糕，几个小时就更变了一次IP。
可想而知，我们从“ifconfig”命令开始，所以输入：

    sudo ifconfig
拿出笔和纸做准备，记录下面的三个IP地址。（#后面的代码是注释，不会在显示.）：

    inet addr: 192.168.2.2 # Pi's Current IP Address

    Bcast: 192.168.0.255 # The Broadcast IP Range

    Mask: 255.255.255.0 # Subnet Mask Address

此外，你还需要知道另外2个信息。请输入一下命令获取网关和目的地址。

    netstat -nr

接下来，去查看你路由器上的配置。（如何进行这一步主要取决于你用什么路由器，所以还是查看下说明书吧）找出你的设备通过DHCP设置了哪段ip地址。有些地址是被禁止使用的，因为有些协议中已经使用了。所以要选择没有被使用过的，例如，192.168.2.2.你的路由器会保留一个未使用的IP地址分配给想树莓派这样的设备。（如果你的路由器是Belkin，那大概就是这样）

如果不是，你需要让树莓派知道它的新的ip地址。我们通过nano编辑器来编辑树莓派中相关的文件。

    sudo nano /etc/network/interfaces

将“iface eth0 inet dhcp”这一段修改成“iface eth0 inet static”，也就是将动态获取IP修改成静态IP。

接下来输入如下，将下列X取代成你之前所复制的IP地址。最上面的地址是我们将要把DHCP中没有使用的IP地址分配作为树莓派的静态IP地址。

    address 192.168.2.2
    
    netmask XXX.XXX.XXX.X
    
    network XXX.XXX.X.X
    
    broadcast XXX.XXX.X.X
    
    gateway XXX.XXX.X.X

使用“sudo reboot”的命令重启树莓派系统后再命令行在再输入“ifconfig”，我们刚刚新设置的静态IP设置就会呈现。

### 4) Forwarding Ports To Raspberry Pi ###
端口转发至树莓派

一些Pi程序可能需要你转发一个特定的网络端口号到你的树莓派。端口是信息在互联网传送的虚拟路径。有时候你需要转发一个端口来使像树莓派的计算机可以访问互联网，即使绕过了路由器。这种情况有点像拨电话在网络上的延升。
端口转发能够用于像树莓派网页服务器，树莓派的IP语音服务器或者简单的点对点下载。奖金65，000个端口可供选择，你可以分配不同的端口给不同的树莓派项目用来进行通信。
默认情况下，某些端口代表着特定的应用。例如80端口默认为HTML页面，21端口默认代表文件传输协议，1194端口默认为设置VPN服务器。所以大多情况下，你需要选择一些没有被默认制定的端口号来设置。
设置端口转发的方法完全取决于你的路由器，于是很难创建一个固定的关于设置端口转发教程。你只能阅读你路由器的说明书来定义端口和转发了。
下面链接了几个主流路由器厂商的端口转发教程。

- [Belkin][10]
- [Netgear][11]
- [Linksys][12]

### 5) Static IP For Your Pi On The Internet ###
在网络中给你的Pi设置静态IP
再次声明，如果你的运营商给了你一个静态IP，你就不需要担心这个部分了。
我们已经给树莓派设置了一个静态的内部IP地址，这意味着在你的内部网络中总是能够连到你的树莓派。但是如果程序需要树莓派连接到互联网呢？如果你想要在你的树莓派上搭建一个Web服务器，在你网络之外的人们需要知道你的Pi在哪里，这意味着我们要来设置一个像静态IP的公有IP地址。
我之所以说“看起来像”是因为我们已经设置了一个伪静态IP地址。通常，你所在的运营商将会继续更变。所以每一次有人连接到你的树莓派时，将要重新写脚本时，都会发现得树莓派已经移动，我们需要重新更改新的IP地址。
我们是可以通过DDNS（即动态DNS）,这可以保持一个名称服务器得到实时更新，相关程序和树莓派就通过DDNS保持相对应。
首先需要注册一个动态的主机服务。根据指示并创建新的名称服务器类似Yourserver.dnsdynamic.com.
接下来进入树莓派中的命令行根据下面命令来安装DDNS客户端：

    sudo apt-get install ddclient
我们需要编辑DDNS客户端配置更改新的名称服务器：

    sudo nano /etc/ddclient/ddclient.conf 
每种服务配置都会有略微的不同，但是DDNS网址会告诉你需要配置相关文件中的内容。一个标准的DDNS配置，将会举例，可以从中复制和粘贴。 
由于这个文件的存在，你所在的运营商将不会停止更新树莓派的IP地址，因此我们需要设置一个守护进程在脚本的最前面以确保检查IP地址是否已经更改。

    daemon=600
    # check every 600 seconds
这里设置的是每10分钟检查一次，这里只是一个练习。如果你设置成每秒钟检查一次，你的动态服务器应该不会接受，因为这样就像扔垃圾邮件到服务器。同事按下ctrl+x保存并退出配置文件。
接下来，输入：
    ddclient
只需要输入程序的名称就可以运行了。当你的树莓派开着的时候就会持续运行了。如果你重启树莓派，键入 “ddclient”就会重新开始运行了。
现在你的树莓派已经被装修一番和准备了更高级的教程了，请从中获得更多乐趣吧！

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial#feed=/hack&awesm=~oB1b7zvteUQGOV

译者：disylee(https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://readwrite.com/2014/03/04/raspberry-pi-quantified-fish-acquarium#awesm=~oAWz5ZbkX6w7ZL
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
