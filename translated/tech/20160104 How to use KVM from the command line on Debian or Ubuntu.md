
怎样在ubuntu和debian中用命令行使用KVM
================================================================================
有很多不同的方式去管理运行在KVM管理程序上的虚拟机。例如，virt-manager就是一个流行的基于图形用户界面的前端虚拟机管理工具。然而，如果你想要在没有图形窗口的服务器环境下使用KVM，那么基于图形用户界面的解决方案显然是行不通的。事实上，你可以纯粹的使用包装了kvm命令行脚本的命令行来管理KVM虚拟机。作为替代方案，你可以使用virsh这个容易使用的命令行用户接口来管理客户虚拟机。在virsh中，它通过和libvirtd服务通信来达到控制虚拟机的目的，而libvirtd可以控制几个不同的虚拟机管理器，包括KVM，Xen，QEMU，LXC和OpenVZ。
  当你想要对虚拟机的前期准备和后期管理实现自动化操作时，像virsh这样的命令行管理工具是非常有用的。同样，virsh支持多个管理器的事实也意味着你可以通过相同的virsh接口去管理不同的虚拟机管理器。
  在这篇文章中，我会示范**怎样在ubuntu和debian上通过使用virsh命令行去运行KVM**。

### 第一步：确认你的硬件平台支持虚拟化 ###

作为第一步，首先要确认你的主机CPU配备了硬件虚拟化拓展（e.g.，Intel VT或者AMD-V)，这是KVM对硬件的要求。下面的命令可以检查硬件是否支持虚拟化。

    $ egrep '(vmx|svm)' --color /proc/cpuinfo

![](https://c2.staticflickr.com/2/1505/24050288606_758a44c4c6_c.jpg)

 如果在输出中不包含vmx或者svm标识，那么就意味着你的主机cpu不支持硬件虚拟化。因此你不能在你的机器上使用KVM。确认了主机cpu存在vmx或者svm之后，接下来开始安装KVM。
对于KVM来说，它不要求运行在拥有64位内核系统的主机上，但是通常我们会推荐在64位系统的主机上面运行KVM。

### 第二步：安装KVM ###

使用apt-get安装KVM和相关的用户空间工具。

    $ sudo apt-get install qemu-kvm libvirt-bin

安装期间，libvirtd组（在debian上是libvirtd-qemu组）将会被创建，并且你的用户id将会被自动添加到该组中。这样做的目的是让你可以以一个普通用户而不是root用户的身份去管理虚拟机。你可以使用id命令来确认这一点，下面将会告诉你怎么去显示你的组id：

    $ id <your-userID>

![](https://c2.staticflickr.com/6/5597/15432586092_64dfb867d3_c.jpg)

如果因为某些原因，libvirt（在debian中是libvirt-qemu）没有在你的组id中被找到，你也可以手动将你自己添加到对应的组中，如下所示：
在ubuntu上：

    $ sudo adduser [youruserID] libvirtd

在debian上：

    $ sudo adduser [youruserID] libvirt-qemu

按照如下形式重修载入更新后的组成员关系。如果要求输入密码，那么输入你的登陆密码即可。

    $ exec su -l $USER

这时，你应该可以以普通用户的身份去执行virsh了。做一个如下所示的测试，这个命令将会以列表的形式列出可用的虚拟机（当前的列表是空的）。如果你没有遇到权限问题，那意味着迄今为止一切都是正常的。

    $ virsh list

----------

     Id    Name                           State
    ----------------------------------------------------
    
### 第三步：配置桥接网络 ###

为了使KVM虚拟机能够访问外部网络，一种方法是通过在KVM宿主机上创建Linux桥来实现。创建之后的桥能够将虚拟机的虚拟网卡和宿主机的物理网卡连接起来，因此，虚拟机能够发送和接受由物理网卡发送过来的流量数据包。这种方式叫做网桥连接。
下面将告诉你如何创建并且配置网桥，我们称它为br0.
首先，安装一个必需的包，然后用命令行创建一个网桥。

    $ sudo apt-get install bridge-utils
    $ sudo brctl addbr br0

下一步就是配置已经创建好的网桥，即修改位于/etc/network/interfaces的配置文件。我们需要将该桥接网卡设置成开机启动。为了修改该配置文件，你需要关闭你的操作系统上的网络管理器（如果你在使用它的话）。跟随[操作指南][1]的说明去关闭网络管理器。
   关闭网络管理器之后，接下来就是通过修改配置文件来配置网桥了。

    #auto eth0
    #iface eth0 inet dhcp
    
    auto br0
    iface br0 inet dhcp
            bridge_ports eth0
            bridge_stp off
            bridge_fd 0
            bridge_maxwait 0


在上面的配置中，我假设eth0是主要网卡，它也是连接到外网的网卡，同样，我假设eth0将会通过DHCP得到它的ip地址。注意，之前在/etc/network/interfaces中还没有对eth0进行任何配置。桥接网卡br0引用了eth0的配置，而eth0也会受到br0的制约。
重启网络服务，并确认网桥已经被成功的配置好。如果成功的话，br0的ip地址将会是eth0的被自动分配的ip地址，而且eth0不会被分配任何ip地址。

    $ sudo /etc/init.d/networking restart
    $ ifconfig

如果因为某些原因，eth0仍然保留了之前分配给了br0的ip地址，那么你可能必须明确的删除eth0的ip地址。

![](https://c2.staticflickr.com/2/1698/23780708850_66cd7ba6ea_c.jpg)

###第四步：用命令行创建一个虚拟机 ###

对于虚拟机来说，它的配置信息被存储在它对应的xml文件中。因此，创建一个虚拟机的第一步就是准备一个与主机名对应的xml文件。
下面是一个示例xml文件，你可以根据需要手动修改它。
	
    <domain type='kvm'>
      <name>alice</name>
      <uuid>f5b8c05b-9c7a-3211-49b9-2bd635f7e2aa</uuid>
      <memory>1048576</memory>
      <currentMemory>1048576</currentMemory>
      <vcpu>1</vcpu>
      <os>
        <type>hvm</type>
        <boot dev='cdrom'/>
      </os>
      <features>
        <acpi/>
      </features>
      <clock offset='utc'/>
      <on_poweroff>destroy</on_poweroff>
      <on_reboot>restart</on_reboot>
      <on_crash>destroy</on_crash>
      <devices>
        <emulator>/usr/bin/kvm</emulator>
        <disk type="file" device="disk">
          <driver name="qemu" type="raw"/>
          <source file="/home/dev/images/alice.img"/>
          <target dev="vda" bus="virtio"/>
          <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x0"/>
        </disk>
        <disk type="file" device="cdrom">
          <driver name="qemu" type="raw"/>
          <source file="/home/dev/iso/CentOS-6.5-x86_64-minimal.iso"/>
          <target dev="hdc" bus="ide"/>
          <readonly/>
          <address type="drive" controller="0" bus="1" target="0" unit="0"/>
        </disk>
        <interface type='bridge'>
          <source bridge='br0'/>
          <mac address="00:00:A3:B0:56:10"/>
        </interface>
        <controller type="ide" index="0">
          <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x1"/>
        </controller>
        <input type='mouse' bus='ps2'/>
        <graphics type='vnc' port='-1' autoport="yes" listen='0.0.0.0'/>
        <console type='pty'>
          <target port='0'/>
        </console>
      </devices>
    </domain>

上面的主机xml配置文件定义了如下的虚拟机内容。

- 1GB内存，一个虚拟cpu和一个硬件驱动。
- Disk image：/home/dev/images/alice.img。
- Boot from CD-ROM（/home/dev/iso/CentOS-6.5-x86_64-minomal.iso）。
- Networking:一个桥接到br0的虚拟网卡。
- 通过VNC远程访问。
<uuid></uuid>中的UUID字符串可以随机生成。为了得到一个随机的uuid字符串，你可能需要使用uuid命令行工具。

    $ sudo apt-get install uuid
    $ uuid

生成一个主机xml配置文件的方式就是通过一个已经存在的虚拟机来导出它的xml配置文件。如下所示。

    $ virsh dumpxml alice > bob.xml

![](https://c2.staticflickr.com/6/5808/23968234602_25e8019ec8_c.jpg)

###第五步：使用命令行启动虚拟机###

在启动虚拟机之前，我们需要创建它的初始磁盘镜像。为此，你需要使用qemu-img命令来生成一个你已经安装的qemu-kvm镜像。下面的命令将会创建10GB大小的空磁盘，并且它是qcow2格式的。

    $ qemu-img create -f qcow2 /home/dev/images/alice.img 10G

使用qcow2格式的磁盘镜像的好处就是它在创建之初并不会给它分配全部大小磁盘容量（这里是10GB），而是随着虚拟机中文件的增加而逐渐增大。因此，它对空间的使用更加有效。
现在，你可以准备通过使用之前创建的xml配置文件启动你的虚拟机了。下面的命令将会创建一个虚拟机，然后自动启动它。

    $ virsh create alice.xml

----------

    Domain alice created from alice.xml

**注意**:如果你对一个已经存在的虚拟机运行了上面的命令，那么这个操作将会在没有警告信息的情况下抹去那个已经存在的虚拟机的全部信息。如果你已经创建了一个虚拟机，你可能会使用下面的命令来启动虚拟机。

    $ virsh start alice.xml

使用如下命令确认一个新的虚拟机已经被创建并成功的被启动。

    $ virsh list

----------

     Id    Name                           State
    ----------------------------------------------------
     3     alice                          running

同样，使用如下命令确认你的虚拟机的虚拟网卡已经被成功的添加到了你先前创建的br0网桥中。

    $ sudo brctl show

![](https://c2.staticflickr.com/2/1546/23449585383_a371e9e579_c.jpg)

### 远程连接虚拟机 ###

为了远程访问一个正在运行的虚拟机的控制台，你可以使用VNC客户端。
首先，你需要使用如下命令找出用于虚拟机的VNC端口号。

    $ sudo netstat -nap | egrep '(kvm|qemu)'

![](https://c2.staticflickr.com/6/5633/23448144274_49045bc868_c.jpg)

在这个例子中，用于alice虚拟机的VNC端口号是5900
然后启动一个VNC客户端，连接到一个端口号为5900的VNC服务器。在我们的例子中，虚拟机支持由CentOS光盘文件启动。

![](https://c2.staticflickr.com/2/1533/24076369675_99408972a4_c.jpg)

### 使用virsh管理虚拟机 ###

下面列出了virsh命令的常规用法
创建客户机并且启动虚拟机：

    $ virsh create alice.xml

停止虚拟机并且删除客户机

    $ virsh destroy alice

关闭虚拟机（不用删除它）

    $ virsh shutdown alice

暂停虚拟机

    $ virsh suspend alice

恢复虚拟机

    $ virsh resume alice

访问正在运行的虚拟机的登陆控制台

    $ virsh console alice

设置虚拟机开机启动:

    $ virsh autostart alice

查看虚拟机的详细信息

    $ virsh dominfo alice

编辑虚拟机的配置文件：

    $ virsh edit alice

上面的这个命令将会使用一个默认的编辑器来调用主机配置文件。该配置文件中的任何改变都将自动被libvirt验证其正确性。
你也可以在一个virsh会话中管理虚拟机。下面的命令会创建并进入到一个virsh会话中：

    $ virsh
在virsh提示中，你可以使用任何virsh命令。

![](https://c2.staticflickr.com/6/5645/23708565129_b1ef968b30_c.jpg)

### 问题处理 ###

1. 我在创建虚拟机的时候遇到了一个错误：

    error: internal error: no supported architecture for os type 'hvm'

 如果你的硬件不支持虚拟化的话你可能就会遇到这个错误。（例如，Intel VT或者AMD-V），这是运行KVM所必需的。如果你遇到了这个错误，而你的cpu支持虚拟化，那么这里可以给你一些可用的解决方案：

首先，检查你的内核模块是否丢失。

    $ lsmod | grep kvm

如果内核模块没有加载，你必须按照如下方式加载它。

    $ sudo modprobe kvm_intel (for Intel processor)
    $ sudo modprobe kvm_amd (for AMD processor)

第二个解决方案就是添加“--connect qemu:///system”参数到virsh命令中，如下所示。当你正在你的硬件平台上使用超过一个虚拟机管理器的时候就需要添加这个参数（例如，VirtualBox，VMware）。
    $ virsh --connect qemu:///system create alice.xml

2. 当我试着访问我的虚拟机的登陆控制台的时候遇到了错误：

     $ virsh console alice

----------

    error: internal error: cannot find character device <null>

这个错误发生的原因是你没有在你的虚拟机配置文件中定义控制台设备。在xml文件中加上下面的内部设备部分即可。
	
    <console type='pty'>
      <target port='0'/>
    </console>

--------------------------------------------------------------------------------

via: http://xmodulo.com/use-kvm-command-line-debian-ubuntu.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/disable-network-manager-linux.html
