Linux中安装Cisco Packet Tracer 
================================================================================
![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Main_picture.png)

### Cisco Packet tracer是什么？ ###

**Cisco Packet Tracer**是一个强大的网络模拟工具，用于进行Cisco认证时的培训。它为我们提供了各个路由器和网络设备的良好的接口视图，这些模拟设备带有很多选项，跟使用物理机一样，我们可以在网络中使用无限的设备。我们能在单个工程中创建多个网络，以获得专业化的训练。Packet Tracer将提供给我们模拟的应用层协议，如**HTTP**，**DNS**，以及像**RIP**，**OSPF**，**EIGRP**等路由协议。

现在，它发布了包含有**ASA 5505防火墙**命令行配置的版本。Packet Tracer通常用于Windows版本，但没有Linux版本。这里，我们可以下载并安装Cisco Packet Tracer。

#### 新发布的Cisco Packet Tracer版本： ####

下一代Cisco Packet Tracer版本将会是Cisco Packet Tracer 6.2，当前还处于开发中。

### 我的环境设置： ###

**主机名**                :           desktop1.unixmen.com

**IP地址**               :           192.168.0.167

**操作系统**    :           Ubuntu 14.04 LTS Desktop

    # hostname

    # ifconfig | grep inet

    # lsb_release -a

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_001.png)

### 步骤 1： 首先，我们需要下载Cisco Packet Tracer。 ###

要从官方网站下载Packet Tracer，我们需要持有一个令牌，登入Cisco NetSpace，然后从Offering菜单选择CCNA > Cisco Packet Tracer来开始下载。如果我们没有令牌，可以从下面的链接中获得，我已经将它上传到了Droppox。

官方站点： [https://www.netacad.com/][1]

大多数人没有下载Packet Tracer的令牌，出于该原因，我已经将它上传到了dropbox，你可以从下面的URL获得Packet Tracer。

[下载Cisco Packet Tracer 6.1.1][2]

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_002.png)

### 步骤 2： 安装Java： ###

要安装Packet Tracer，我们需要安装java。我们可以使用默认的仓库安装java；或者添加PPA仓库，然后更新包缓存来安装java。

使用以下命令来安装默认的jre

        # sudo apt-get install default-jre

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_003.png)

（或者）

使用下面的步骤来安装Java Run-time并设置环境。

从官方站点下载Java：[下载Java][3]

    # tar -zxvf jre-8u31-linux-x64.tar.gz
    # sudo mkdir -p /usr/lib/jvm
    # sudo mv -v jre1.8.0_31 /usr/lib/jvm/
    # cd /usr/lib/jvm/
    # sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jre1.8.0_31/bin/java" 1
    # sudo update-alternatives --set "java" "/usr/lib/jvm/jre1.8.0_31/bin/java"

通过编辑用户参数文件来设置Java环境，并添加路径相关的参数。当我们添加进用户参数文件后，我们机器上的每个用户都可以用java了。

    # sudo vi /etc/profile

将以下条目添加到/etc/profile文件中：

    export JAVA_HOME=/usr/lib/jvm/jre1.8.0_31
    export PATH=$PATH:/usr/java/jre1.8.0_31/bin

运行以下命令来立即激活java路径。

    # . /etc/profile

检查Java版本和环境：

    # echo $JAVA_HOME
    # java -version

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_004.png)

### 步骤 3： 启用32位架构支持： ###

对于Packet Tracer，我们需要一些32位包。要安装32位包，我们需要使用以下命令来安装一些依赖。

    # sudo dpkg --add-architecture i386
    # sudo apt-get update

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_005.png)

    # sudo apt-get install libc6:i386
    # sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0
    # sudo apt-get install libnss3-1d:i386 libqt4-qt3support:i386 libssl1.0.0:i386 libqtwebkit4:i386 libqt4-scripttools:i386

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_006.png)

### 步骤 4： 解压并安装软件包： ###

使用tar命令来解压下载的包。

    # mv Cisco\ Packet\ Tracer\ 6.1.1\ Linux.tar.gz\?dl\=0 Cisco_Packet_tracer.tar.gz

    # tar -zxvf Cisco_Packet_tracer.tar.gz

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_007.png)

导航到解压后的目录

    # cd PacketTracer611Student

现在，该开始安装了。安装过程很简单，只需几秒钟即可搞定。

    # sudo ./install

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_008.png)

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_009.png)

要使用Packet Tracer工作，我们需要设置环境，Cisco已经提供了环境脚本，我们需要以root用户来运行该脚本以设置环境变量。

    # sudo ./set_ptenv.sh

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_010.png)

安装到此结束。接下来，我们需要为Packet Tracer创建桌面图标。

通过创建下面的桌面文件来创建桌面图标。

    # sudo su
    # cd /usr/share/applications
    # sudo vim packettracer.desktop

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_011.png)

使用vim编辑器或你喜爱的那个编辑器来添加以下内容到文件。

    [Desktop Entry]
     Name= Packettracer
     Comment=Networking
     GenericName=Cisco Packettracer
     Exec=/opt/packettracer/packettracer
     Icon=/usr/share/icons/packettracer.jpeg
     StartupNotify=true
     Terminal=false
     Type=Application

使用wq!来保存并退出vim。

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_012.png)

### 步骤 5： 运行Packet Tracer ###

    # sudo packettracer

好了，我们已经成功将Packet Tracer安装到Linux中。上述安装步骤适用于所有基于Debian的Linux发行版。

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_013.png)

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/pkt_014.png)

### 资源 ###

主页：[Netacad][4]

### 尾声： ###

这里，我们展示了如何安装Packet Tracer到Linux发行版中。希望你们找到了将你们所钟爱的模拟器安装到Linux中的方法。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/installing-cisco-packet-tracer-linux/

作者：[babin][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/babin/
[1]:https://www.netacad.com/
[2]:https://www.dropbox.com/s/5evz8gyqqvq3o3v/Cisco%20Packet%20Tracer%206.1.1%20Linux.tar.gz?dl=0
[3]:http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html
[4]:https://www.netacad.com/
