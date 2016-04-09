
RHEL/CentOS 7中配置用于多版本Linux安装的“PXE网络启动服务器”
================================================================================
**PXE服务器**——预启动执行环境——指示客户端计算机直接从网络接口启动、运行或安装操作系统，而不需要烧录CD/DVD或使用某个物理介质，它可以减轻你网络中多台机器同时安装Linux发行版的工作。

![Setting PXE Network Boot in RHEL/CentOS 7](http://www.tecmint.com/wp-content/uploads/2014/10/Setting-PXE-Network-Boot-in-CentOS.png)

*在RHEL/CentOS 7中设置PXE网络启动*

#### 前置阅读 ####

- [CentOS 7最小化安装步骤][1]
- [RHEL 7最小化安装步骤][2]
- [在RHEL/CentOS 7中配置静态IP地址][3]
- [移除RHEL/CentOS 7中不要的服务][4]
- [安装NTP服务器以设置RHEL/CentOS 7的正确时间][5]

本文将介绍如何在配置有本地镜像安装仓库的**RHEL/CentOS 7** 64位上安装并配置一台**PXE服务器**，仓库源由CentOS 7 DVD 的 ISO镜像提供，并由**DNSMASQ**服务器提供解析。

该机器提供了**DNS**和**DHCP**服务，用于网络启动引导的**Syslinux**包，**TFTP-Server**——提供了可通过网络使用**小文件传输协议**下载的可启动镜像，以及提供本地挂载DVD镜像的**VSFTPD**服务器——它将扮演官方RHEL/CentOS 7镜像安装仓库的角色，安装器将从这里提取所需的包。

### 步骤1： 安装并配置DNSMASQ服务器 ###

**1.** 不需要提醒你来确定你的网络接口卡吧，除非你的服务器上有多个网络接口卡，该网卡必须配置有静态IP地址，该IP地址必须处于你要提供PXE服务的网段中。

那么，在你配置好静态IP地址后，更新你的系统并进行其它初始设置。请使用以下命令来安装**DNSMASQ**进程。

    # yum install dnsmasq

![Install dnsmasq Package](http://www.tecmint.com/wp-content/uploads/2014/10/Install-dnsmasq-in-CentOS.jpg)

*安装dnsmasq包*

**2.** DNSMASQ的默认的主配置文件位于**/etc**目录中，虽然不需要任何说明就能看懂，但编辑起来确实相当困难的，即使有很详细的说明性注释。

首先，确保你备份了该文件，以便你需要在以后对它进行恢复。然后使用你爱用的文本编辑器创建一个新的空配置文件，命令如下。

    # mv /etc/dnsmasq.conf  /etc/dnsmasq.conf.backup
    # nano /etc/dnsmasq.conf

**3.** 现在，复制并粘贴以下配置到**dnsmasq.conf**文件中，并确保根据如下说明进行相应修改，以适应你的网络设置。

    interface=eno16777736,lo
    #bind-interfaces
    domain=centos7.lan
    # DHCP range-leases
    dhcp-range= eno16777736,192.168.1.3,192.168.1.253,255.255.255.0,1h
    # PXE
    dhcp-boot=pxelinux.0,pxeserver,192.168.1.20
    # Gateway
    dhcp-option=3,192.168.1.1
    # DNS
    dhcp-option=6,92.168.1.1, 8.8.8.8
    server=8.8.4.4
    # Broadcast Address
    dhcp-option=28,10.0.0.255
    # NTP Server
    dhcp-option=42,0.0.0.0
    
    pxe-prompt="Press F8 for menu.", 60
    pxe-service=x86PC, "Install CentOS 7 from network server 192.168.1.20", pxelinux
    enable-tftp
    tftp-root=/var/lib/tftpboot

![Dnsmasq Configuration](http://www.tecmint.com/wp-content/uploads/2014/10/dnsmasq-configuration.jpg)

*Dnsmasq配置*

你需要修改的声明有以下这些：

- **interface** – 服务器需要监听并提供服务的网络接口。
- **bind-interfaces** – 取消注释来绑定到该网络接口
- **domain** – 替换为你的域名。
- **dhcp-range** – 替换为你的网络掩码定义的网段。
- **dhcp-boot** – 替换该IP地址为你的网络接口IP地址。
- **dhcp-option=3,192.168.1.1** – 替换该IP地址为你的网段的网关。
- **dhcp-option=6,92.168.1.1** – 替换该IP地址为你的DNS服务器IP——可以定义多个IP地址。
- **server=8.8.4.4** – 这里放置DNS转发服务器IP地址。
- **dhcp-option=28,10.0.0.255** – 替换该IP地址为网络广播地址——可选项。
- **dhcp-option=42,0.0.0.0** – 这里放置网络时钟服务器——可选项（0.0.0.0地址表示参考自身）。
- **pxe-prompt** – 保持默认——按F8进入菜单，60秒等待时间。
- **pxe=service** – 使用x86PC作为32为/64位架构，并在字符串引述中输入菜单描述提示。其它类型值可以是：PC98,IA_EFI,Alpha,Arc_x86,Intel_Lean_Client,IA32_EFI,BC_EFI,Xscale_EFI和X86-64_EFI。
- **enable-tftp** – 启用内建TFTP服务器。
- **tftp-root** – 使用/var/lib/tftpboot——所有网络启动文件所在位置。

其它和配置文件相关的高级选项，请参阅[dnsmasq手册][6]。

### 步骤2： 安装SYSLINUX启动加载器 ###

**4.** 在编辑并保存**DNSMASQ**主配置文件后，我们将继续安装**Syslinux** PXE启动加载器，命令如下。

    # yum install syslinux

![Install Syslinux Bootloaders](http://www.tecmint.com/wp-content/uploads/2014/10/install-syslinux-bootloaders.jpg)

*安装Syslinux启动加载器*

**5.** PXE启动加载器文件位于**/usr/share/syslinux**系统绝对路径下，你可以通过列出该路径下的内容来查看。该步骤不是必须的，但你可能需要知道该路径，因为在下一步中，我们将拷贝该路径下的所有内容到**TFTP服务器**路径下。

    # ls /usr/share/syslinux

![Syslinux Files](http://www.tecmint.com/wp-content/uploads/2014/10/syslinux-files.jpg)

*Syslinux文件*

### 步骤3： 安装TFTP-Server并加入SYSLINUX加载启动器 ###

**6.** 现在，让我们进入下一步，安装**TFTP-Server**。然后，拷贝上述位置中Syslinux包提供所有启动加载器文件到**/var/lib/tftpboot**路径中，命令如下。

    # yum install tftp-server
    # cp -r /usr/share/syslinux/* /var/lib/tftpboot

![Install TFTP Server](http://www.tecmint.com/wp-content/uploads/2014/10/install-tftp-server.jpg)

*安装TFTP服务器*

### 步骤4： 设置PXE服务器配置文件 ###

**7.** 通常，**PXE服务器**从位于**pxelinux.cfg**文件夹中一组指定的文件中读取配置（首先是**GUID**文件，接下来是**MAC**文件，最后是**Default**文件），该文件夹必须位于DNSMASQ主配置文件中**tftp-root**声明指定的目录中。

创建需要的目录**pxelinux.cfg**，然后添加**default**文件到该目录中，命令如下。

    # mkdir /var/lib/tftpboot/pxelinux.cfg
    # touch /var/lib/tftpboot/pxelinux.cfg/default

**8.** 现在，该来编辑**PXE服务器**配置文件了，为它添加合理的Linux发行版安装选项。请注意，该文件中使用的所有路径必须是相对于**/var/lib/tftpboot**目录的。

下面，你可以看到配置文件的样例，你可以使用该模板，但请修改安装镜像（kernel和initrd文件）、协议（FTP、HTTP、HTTPS、NFS）以及映射你网络安装源仓库和路径的IP地址等参数。

    # nano /var/lib/tftpboot/pxelinux.cfg/default

添加以下整个节录到文件中。

    default menu.c32
    prompt 0
    timeout 300
    ONTIMEOUT local
    
    menu title ########## PXE Boot Menu ##########
    
    label 1
    menu label ^1) Install CentOS 7 x64 with Local Repo
    kernel centos7/vmlinuz
    append initrd=centos7/initrd.img method=ftp://192.168.1.20/pub devfs=nomount
    
    label 2
    menu label ^2) Install CentOS 7 x64 with http://mirror.centos.org Repo
    kernel centos7/vmlinuz
    append initrd=centos7/initrd.img method=http://mirror.centos.org/centos/7/os/x86_64/ devfs=nomount ip=dhcp
    
    label 3
    menu label ^3) Install CentOS 7 x64 with Local Repo using VNC
    kernel centos7/vmlinuz
    append  initrd=centos7/initrd.img method=ftp://192.168.1.20/pub devfs=nomount inst.vnc inst.vncpassword=password
    
    label 4
    menu label ^4) Boot from local drive

![Configure PXE Server](http://www.tecmint.com/wp-content/uploads/2014/10/configure-pxe-server.jpg)

*配置PXE服务器*

正如你所见，CentOS 7启动镜像（kernel和initrd）位于名为**centos7**的目录，该目录是**/var/lib/tftpboot**目录的相对路径（其系统绝对路径为**/var/lib/tftpboot/centos7**），而安装器仓库位于可通过FTP协议访问的**192.168.1.20/pub**网络位置中——在本例中，这些仓库位于本地，因为IP地址和PXE服务器地址相同。

同时，菜单**label 3**指定客户端安装应该通过**VNC**从一个远程位置实现（这里替换VNC密码为一个健壮的密码），如果你在一台没有输入输出的客户端上安装，菜单**label 2**指定了作为安装源的一个CentOS 7官方互联网镜像（这种情况要求客户端通过DHCP和NAT连接到互联网）。

**重要**：正如你在上述配置中所看到的，我们使用了CentOS 7进行演示，但是你也可以定义一个 RHEL 7镜像。而下面的整个的说明和配置都只是基于CentOS 7的，所以在选发行版时要注意一下。

### 步骤5： 添加CentOS 7启动镜像到PXE服务器 ###

**9.** 对于此步骤，需要用到CentOS的kernel和initrd文件。要获取这些文件，你需要**CentOS 7 DVD ISO**镜像。所以，去下载CentOS DVD镜像吧，然后把它（刻录成光盘）放入你的DVD驱动器并挂载镜像到**/mnt**路径，命令见下面。

使用DVD，而不是最小化CD镜像的原因在于，在后面我们将使用该DVD的内容为**FTP**源创建本地安装器仓库。

    # mount -o loop /dev/cdrom  /mnt
    # ls /mnt

![Mount CentOS DVD](http://www.tecmint.com/wp-content/uploads/2014/10/mount-centos-dvd.jpg)

*挂载CentOS DVD*

如果你的机器没有DVD驱动器，你也可以使用**wget**或**curl**工具从[CentOS镜像站][7]下载**CentOS 7 DVD ISO**到本地并挂载。

    # wget http://mirrors.xservers.ro/centos/7.0.1406/isos/x86_64/CentOS-7.0-1406-x86_64-DVD.iso
    # mount -o loop /path/to/centos-dvd.iso  /mnt

**10.** 在DVD内容可供使用后，创建**centos7**目录并将CentOS 7 的可启动的 kernel和initrd映像文件从DVD挂载位置拷贝到centos7文件夹。

    # mkdir /var/lib/tftpboot/centos7
    # cp /mnt/images/pxeboot/vmlinuz  /var/lib/tftpboot/centos7
    # cp /mnt/images/pxeboot/initrd.img  /var/lib/tftpboot/centos7

![Copy CentOS Bootable Files](http://www.tecmint.com/wp-content/uploads/2014/10/copy-centos-bootable-files.jpg)

*拷贝CentOS可启动文件*

使用该方法的原因在于，今后你可能会在**/var/lib/tftpboot**路径中创建新的独立的目录，并添加其它Linux发行版到PXE菜单中，你就不会将整个目录结构弄得一团糟了。

### 步骤6： 创建CentOS 7本地镜像安装源 ###

**11.** 虽然你可以通过多种协议设置**安装源镜像**，如HTTP、HTTPS或NFS，但对于本指南，我选择了使用**FTP**协议。因为通过**vsftpd**，你可以很便捷地配置，而且它也很稳定。

接下里，安装vsftpd进程，然后复制所有DVD挂载目录中的内容到**vsftpd**默认服务器路径下（**/var/ftp/pub**）——这会花费一些时间，这取决于你的系统资源。然后为该路径设置可读权限，命令如下。

    # yum install vsftpd
    # cp -r /mnt/*  /var/ftp/pub/ 
    # chmod -R 755 /var/ftp/pub

![Install Vsftpd Server](http://www.tecmint.com/wp-content/uploads/2014/10/install-vsftpd-in-centos.jpg)

*安装Vsftpd服务器*

![Copy Files to FTP Path](http://www.tecmint.com/wp-content/uploads/2014/10/copy-files-to-ftp-path.jpg)

*拷贝Files到FTP路径*

![Set Permissions on FTP Path](http://www.tecmint.com/wp-content/uploads/2014/10/set-permission-on-ftp-path.jpg)

*设置FTP路径的权限*

### 步骤7： 在系统范围内启动并启用进程 ###

**12.** 既然PXE服务器配置已经完成，那么就来启动**DNSMASQ**和**VSFTPD**服务器吧。验证它们的状况并在系统上启用，以便让这些服务在每次系统重启后都能随系统启动，命令如下。

    # systemctl start dnsmasq
    # systemctl status dnsmasq
    # systemctl start vsftpd
    # systemctl status vsftpd
    # systemctl enable dnsmasq
    # systemctl enable vsftpd

![Start Dnsmasq Service](http://www.tecmint.com/wp-content/uploads/2014/10/start-dnsmasq.jpg)

*启动Dnsmasq服务*

![Start Vsftpd Service](http://www.tecmint.com/wp-content/uploads/2014/10/start-vsftpd.jpg)

*启动Vsftpd服务*

### 步骤8： 打开防火墙并测试FTP安装源 ###

**13.** 要获取需要在防火墙打开的端口列表，以便让客户机可访问并从PXE服务器启动，请运行**netstat**命令并根据dnsmasq和vsftpd监听列表添加CentOS 7防火墙规则。

    # netstat -tulpn
    # firewall-cmd --add-service=ftp --permanent  	## Port 21
    # firewall-cmd --add-service=dns --permanent  	## Port 53
    # firewall-cmd --add-service=dhcp --permanent  	## Port 67
    # firewall-cmd --add-port=69/udp --permanent  	## Port for TFTP
    # firewall-cmd --add-port=4011/udp --permanent  ## Port for ProxyDHCP
    # firewall-cmd --reload  ## Apply rules

![Check Listening Ports](http://www.tecmint.com/wp-content/uploads/2014/10/check-listening-ports.jpg)

*检查监听端口*

![Open Ports in Firewall](http://www.tecmint.com/wp-content/uploads/2014/10/open-ports-on-firewall.jpg)

*在防火墙上开启端口*

**14.** 要测试FTP安装源网络路径，请在本地或另外一台计算机上打开浏览器（[**lynx**][8]就可以做此事），然后输入你架设有FTP服务的PXE服务器的IP地址，并在填入的URL后面加上**/pub**网络位置，结果应该和截图中看到的一样。

    ftp://192.168.1.20/pub

![Access FTP Files via Browser](http://www.tecmint.com/wp-content/uploads/2014/10/browse-ftp-files.jpg)

*通过浏览器访问FTP文件*

**15.** 要解决PXE服务器最终的配置或其它信息产生的问题，请在live模式下诊断，命令如下：

    # tailf /var/log/messages

![Check PXE Logs for Errors](http://www.tecmint.com/wp-content/uploads/2014/10/check-pxe-errors.jpg)

*检查PXE日志错误*

**16.** 最后，最终所需的步骤就是卸载CentOS 7 DVD，并移除物理介质。

    # umount /mnt

### 步骤9： 配置客户端从网络启动 ###

**17.** 现在，你的客户端可以通过它们的系统BIOS或在**BIOS开机自检**时按指定键来配置网络启动作为**首选启动设备**，具体方法见主板说明手册。

为了选择网络启动，在第一次PXE提示符出现时，请按下**F8**键进入到PXE安装界面，然后敲**回车**键继续进入PXE菜单。

![PXE Network Boot](http://www.tecmint.com/wp-content/uploads/2014/10/pxe-network-boot.jpg)

*PXE网络启动*

![PXE Network OS Boot](http://www.tecmint.com/wp-content/uploads/2014/10/pxe-network-os-boot.jpg)

*PXE网络OS启动*

**18.** 一旦你进入PXE菜单，请选择你的CentOS 7安装类型，敲**回车**键继续安装过程，就像你使用本地启动介质安装一样。

请记住这一点，使用菜单中的变体2需要激活目标客户端上的互联网连接。在下面的屏幕截图中，你可以通过VNC看到远程安装的实例。

![PXE Menu](http://www.tecmint.com/wp-content/uploads/2014/10/pxe-menu.jpg)

*PXE菜单*

![Remote Linux Installation via VNC](http://www.tecmint.com/wp-content/uploads/2014/10/os-installation-via-vnc.jpg)

*通过VNC远程安装Linux*

![Remote Installation of CentOS](http://www.tecmint.com/wp-content/uploads/2014/10/remote-centos-installation.jpg)

*远程安装CentOS*

以上是**CentOS 7**上配置最小化**PXE服务器**的所有内容。在我的本系列下一篇文章中，我将讨论其它PXE服务器配置过程中的其它问题，如怎样使用**Kickstart**文件来配置自动化安装**CentOS 7**，以及添加其它Linux发行版到PXE菜单——**Ubuntu Server**和**Debian 7**。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-pxe-network-boot-server-in-centos-7/

作者：[Matei Cezar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/centos-7-installation/
[2]:http://www.tecmint.com/redhat-enterprise-linux-7-installation/
[3]:http://linux.cn/article-3977-1.html
[4]:http://www.tecmint.com/remove-unwanted-services-in-centos-7/
[5]:http://www.tecmint.com/install-ntp-server-in-centos/
[6]:http://www.thekelleys.org.uk/dnsmasq/docs/dnsmasq-man.html
[7]:http://isoredirect.centos.org/centos/7/isos/x86_64/
[8]:http://www.tecmint.com/command-line-web-browsers/
