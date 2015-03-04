设置iSCSI的发起程序（客户端）（三）
============================

**iSCSI** 发起程序是一种用于同 iSCSI 目标器认证并访问服务器上共享的LUN的客户端。我们可以在本地挂载的硬盘上部署任何操作系统，只需要安装一个包来与目标器验证。

![Client Initiator Setup](http://www.tecmint.com/wp-content/uploads/2014/07/Client-Initiator-Setup.jpg)

*初始器客户端设置*

### 功能 ###

- 可以处理本地挂载磁盘上的任意文件系统
- 在使用fdisk命令分区后不需要重启系统

### 前置阅读 ###

- [使用iSCSI Target创建集中式安全存储（一）][1]
- [在 iSCSI Target 服务器中使用LVM创建和设置LUN（二）][2]

#### 我的客户端设置 ####

- 操作系统 – CentOS  6.5 (Final)
- iSCSI 目标器 IP – 192.168.0.50
- 使用的端口 : TCP 3260

**警告**：永远不要在LUN还挂载在客户端（发起程序）时停止服务。

### 客户端设置 ###

**1.** 在客户端，我们需要安装包‘**iSCSI-initiator-utils**’，用下面的命令搜索包。
 
    # yum search iscsi

**示例输出**

    ============================= N/S Matched: iscsi ================================
    iscsi-initiator-utils.x86_64 : iSCSI daemon and utility programs
    iscsi-initiator-utils-devel.x86_64 : Development files for iscsi-initiator-utils

**2.** 找到了包，就用下面的yum命令安装初始化包。

    # yum install iscsi-initiator-utils.x86_64

**3.** 安装完毕后，我们需要发现**目标器**上的共享。客户端的命令有点难记，因此我们使用man找到需要运行的命令列表。

    # man iscsiadm

![man iscsiadm](http://www.tecmint.com/wp-content/uploads/2014/07/man-iscsiadm.jpg)

*man iscsiadm*

**4.** 按下**SHIFT+G** 进入man页的底部并且稍微向上滚动找到示例的登录命令。下面的发现命令中，需要用我们的**服务器IP地址**来替换。

    # iscsiadm --mode discoverydb --type sendtargets --portal 192.168.0.200 --discover

**5.** 这里我们从下面的命令输出中找到了iSCSI的限定名（iqn）。

    192.168.0.200:3260,1 iqn.2014-07.com.tecmint:tgt1

![Discover Target](http://www.tecmint.com/wp-content/uploads/2014/07/Discover-Target.jpg)

*发现服务器*

**6.** 要登录就用下面的命令来连接一台LUN到我们本地系统中，这会与服务器验证并允许我们登录LUN。

    # iscsiadm --mode node --targetname iqn.2014-07.com.tecmint:tgt1 --portal 192.168.0.200:3260 --login

![Login To Target Server](http://www.tecmint.com/wp-content/uploads/2014/07/Login-To-Target-Server.jpg)

*登录到服务器*

**注意**：登出使用登录命令并在命令的最后使用logout来替换。

    # iscsiadm --mode node --targetname iqn.2014-07.com.tecmint:tgt1 --portal 192.168.0.200:3260 --logout

![Logout from Target Server](http://www.tecmint.com/wp-content/uploads/2014/07/Logout-from-Target-Server.jpg)

*登出服务器*

**7.** 登录服务器后，使用下面的命令列出节点的记录行。

    # iscsiadm --mode node

![List Node](http://www.tecmint.com/wp-content/uploads/2014/07/List-Node.jpg)

*列出节点*

**8.** 显示特定节点的所有数据

    # iscsiadm --mode node --targetname iqn.2014-07.com.tecmint:tgt1 --portal 192.168.0.200:3260

**示例输出**

    # BEGIN RECORD 6.2.0-873.10.el6
    node.name = iqn.2014-07.com.tecmint:tgt1
    node.tpgt = 1
    node.startup = automatic
    node.leading_login = No
    iface.hwaddress = <empty>
    iface.ipaddress = <empty>
    iface.iscsi_ifacename = default
    iface.net_ifacename = <empty>
    iface.transport_name = tcp
    iface.initiatorname = <empty>
    iface.bootproto = <empty>
    iface.subnet_mask = <empty>
    iface.gateway = <empty>
    iface.ipv6_autocfg = <empty>
    iface.linklocal_autocfg = <empty>
    ....

**9.** 接着列出使用的磁盘，fdisk会列出所有的登录认证过的磁盘。

    # fdisk -l /dev/sda

![List Disks](http://www.tecmint.com/wp-content/uploads/2014/07/List-Disks.jpg)

列出磁盘

**10.** 运行fdisk命令来创建一个新的分区

    # fdisk -cu /dev/sda

![Create New Partition](http://www.tecmint.com/wp-content/uploads/2014/07/Create-New-Partition.jpg)

*创建新分区*

**注意**：在使用fdisk创建新分区之后，我们无需重启，就像使用我们本地的文件系统一样就行。因为这个将远程共享存储挂载到本地了。

**11.** 格式化新创建的分区

    # mkfs.ext4 /dev/sda1

![Format New Partition](http://www.tecmint.com/wp-content/uploads/2014/07/Format-New-Partition.jpg)

*格式化新分区*

**12.** 创建一个目录来挂载新创建的分区

    # mkdir /mnt/iscsi_share
    # mount /dev/sda1 /mnt/iscsi_share/
    # ls -l /mnt/iscsi_share/

![Mount New Partition](http://www.tecmint.com/wp-content/uploads/2014/07/Mount-New-Partition.jpg)

*挂载新分区*

**13.** 列出挂载点

    # df -Th

- **-T** – 输出文件系统类型
- **-h** – 以易读的方式显示大小 

![List New Partition](http://www.tecmint.com/wp-content/uploads/2014/07/List-New-Partition.jpg)

*列出新分区*

**14.** 如果需要永久挂载，使用fdtab文件

    # vim /etc/fstab

**15.**在fstab后追加下面行

    /dev/sda1  /mnt/iscsi_share/   ext4    defaults,_netdev   0 0

**注意：** 在fdtab中使用_netdev，说明这是一个网络设备。

![Auto Mount Partition](http://www.tecmint.com/wp-content/uploads/2014/07/Auto-Mount-Partition.jpg)

*自动挂载分区*

**16.** 最后检查我们fstab文件是否有错误。

    # mount -av

- **-a** – 所有挂载点
- **-v** – 冗余模式

![Verify fstab Entries](http://www.tecmint.com/wp-content/uploads/2014/07/Verify-fstab-Entries.jpg)

*验证fstab文件*

我们已经成功完成了我们的客户端配置。现在让我们像本地磁盘一样使用它吧。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/iscsi-initiator-client-setup/

作者：[Babin Lonston][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://linux.cn/article-4971-1.html
[2]:http://linux.cn/article-4972-1.html
