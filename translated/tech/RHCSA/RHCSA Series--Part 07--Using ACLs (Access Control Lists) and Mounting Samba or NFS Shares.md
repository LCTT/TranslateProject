[xiqingongzi Translating]
RHCSA Series: Using ACLs (Access Control Lists) and Mounting Samba / NFS Shares – Part 7
================================================================================
在第六篇文章的最后，我们开始解释如何使用parted和SSM 设置和配置本地文件存储([RHCSA series Part 6][1])

![Configure ACL's and Mounting NFS / Samba Shares](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-ACLs-and-Mounting-NFS-Samba-Shares.png)

RHCSA系列：：第七章 ACL的配置和安装NFS/Samba文件分享系统

我们还讨论了如何创建和在启动启动时用密码挂载加密逻辑卷。另外，我们要提醒您要避免在安装 在管理操作系统的存储文件系统事执行关键的操作。接下来我们要回顾在红帽Linux 7 中常用的文件系统格式然后卸载和挂载网络文件系统（CIFS和NFS），
#### 前提 ####

在开始之前，请确保你有一个线上Samba服务器和一个线上NFS服务器（RHEL7 将很快不支持 NFS V2）

在这个指南中,我们将使用一个IP为192.168.0.10的机器作为服务端，RHEL7 盒子作为客户端，IP为192.168.0.18，稍后我们会告诉你该安装哪些软件包。

### RHEL7中的文件格式 ###

从RHEL7 开始，XFS 因为其高可用性和可拓展性被设置为所有架构的默认文件系统。目前，红帽和合作伙伴测试的主流硬件线上他支持最大500TB 每个文件系统。
同时，XFS使user_xattr（扩展用户属性）和ACL（POSIX访问控制列表）作为默认的挂载选项，不像ext3或ext4（ext2在RHEL 7中是过时的），这意味着你不需要明确的指定命令行选项或在/etc/fstab挂载时XFS文件系统（如果你想禁用在后一种情况下，这样的选择你要明确使用no_acl和no_user_xattr）。
记住，扩展用户属性可以指定文件和目录用于存储任意等附加信息的MIME类型，字符集或文件的编码，而对用户属性的访问权限由普通文件权限位的定义。
#### 权限控制列表 ####

每一个系统管理员，无论新手还是专家，都熟悉文件和目录的权限和许可。它能制定特定的权限(读，写和执行)的所有者，属组，和其他的正常访问权限。如果需要，可以回去看看 [Part 3 of the RHCSA series][2] 
然而，由于标准的 ugo/rwx 设置不允许配置不同用户不同权限，所以ACL可以比一般规定更多的文件和目录权限。
事实上，ACL定义的权限是文件权限的一个超集，我们来看一下在真正的场景下是如何转换的。
1. 有两种类型：访问ACL (可以适用于任何一个特定的文件或目录），也是默认的ACL，它只能应用于目录。如果文件包含在其中没有ACL设置，他们继承父目录的默认ACL。
2. 首先，ACL可以配置每个用户，每个组，或不在组内的用户拥有文件。
3。设置ACL（和删除）使用setfacl，分别使用M或X选项。
例如，让我们创建一个组名为tecmint和添加用户johndoe和davenull：
    # groupadd tecmint
    # useradd johndoe
    # useradd davenull
    # usermod -a -G tecmint johndoe
    # usermod -a -G tecmint davenull

让我们确认用户属于组tecmint：

    # id johndoe
    # id davenull

![Verify Users](http://www.tecmint.com/wp-content/uploads/2015/04/Verify-Users.png)

验证用户

Let’s now create a directory called playground within /mnt, and a file named testfile.txt inside. We will set the group owner to tecmint and change its default ugo/rwx permissions to 770 (read, write, and execute permissions granted to both the owner and the group owner of the file):
现在让我们创建一个在/mnt下的目录名为playground，和一个名叫testfile.txt文件。我们将tecmint和更改其默认 ugo/rwx 权限为 770组所有者（读，写，和执行给予属主和属组所有者权限）：
    # mkdir /mnt/playground
    # touch /mnt/playground/testfile.txt
    # chmod 770 /mnt/playground/testfile.txt

然后切换用户johndoe和davenull，按照这个顺序，并写入文件：

    echo "My name is John Doe" > /mnt/playground/testfile.txt
    echo "My name is Dave Null" >> /mnt/playground/testfile.txt

到目前为止很好。现在，让我们的用户gacanepa写入文件–和写操作，可以预料到出现的结果。

但如果我们真的需要用户gacanepa（不是tecmint组的成员）有/mnt/playground/testfile.txt的写入权限。首先，可能是你的想法是添加用户帐户组tecmint。但这会给他写上所有文件的权限，写入的是该组的权限，我们不希望这样。我们只希望他能写/mnt/playground/ testfile.txt。

    # touch /mnt/playground/testfile.txt
    # chown :tecmint /mnt/playground/testfile.txt
    # chmod 777 /mnt/playground/testfile.txt
    # su johndoe
    $ echo "My name is John Doe" > /mnt/playground/testfile.txt
    $ su davenull
    $ echo "My name is Dave Null" >> /mnt/playground/testfile.txt
    $ su gacanepa
    $ echo "My name is Gabriel Canepa" >> /mnt/playground/testfile.txt

![Manage User Permissions](http://www.tecmint.com/wp-content/uploads/2015/04/User-Permissions.png)

管理用户权限

让我们给用户gacanepa添加/mnt/playground/testfile.txt的读写权限
在root下执行

    # setfacl -R -m u:gacanepa:rwx /mnt/playground

您已经成功添加了一个ACL允许gacanepa写入测试文件。然后切换到用户gacanepa试图写入文件：

    $ echo "My name is Gabriel Canepa" >> /mnt/playground/testfile.txt

要查看特定的文件或目录的ACL，使用getfacl：

    # getfacl /mnt/playground/testfile.txt

![Check ACLs of Files](http://www.tecmint.com/wp-content/uploads/2015/04/Check-ACL-of-File.png)

检查文件的ACLs

设置默认ACL目录（它的内容将会继承除非被覆盖），添加d:以前的规则并且指定一个文件名来替代
    # setfacl -m d:o:r /mnt/playground

以上的ACL将允许用户不在属组属主有/mnt/playground的读权限。注意在getfacl /mnt/playground 之前和之后的改变输出的差异：
![Set Default ACL in Linux](http://www.tecmint.com/wp-content/uploads/2015/04/Set-Default-ACL-in-Linux.png)

Set Default ACL in Linux

[Chapter 20 in the official RHEL 7 Storage Administration Guide][3] 提供了更多ACL的例子，我强烈推荐你去读读它，参考起来非常方便。

#### 安装NFS网络共享 ####

显示在你的服务器的NFS共享可用的列表，您可以使用showmount命令与E选项，其次是机器名或IP地址。这个工具包含在NFS utils包：

    # yum update && yum install nfs-utils

然后:

    # showmount -e 192.168.0.10

你会得到一个列表的可用的NFS分享192.168.0.10：
![Check Available NFS Shares](http://www.tecmint.com/wp-content/uploads/2015/04/Mount-NFS-Shares.png)

Check Available NFS Shares

在使用命令行对必要的本地客户端挂载NFS网络共享，使用以下语法：

    # mount -t nfs -o [options] remote_host:/remote/directory /local/directory

在我们的例子中，翻译成：

    # mount -t nfs 192.168.0.10:/NFS-SHARE /mnt/nfs

如果您收到一下错误消息:"rpc-statd.service工作失败,看  “systemctl status rpc-statd.service” 和“journalctl -xn” 获取详细信息.确保你的rpcbind服务在开机时开启。
    # systemctl enable rpcbind.socket
    # systemctl restart rpcbind.service

然后重新启动。这应该做的技巧，你将能够挂载NFS共享就和前面所解释的那样。如果你需要安装NFS共享的自动引导系统，添加一个有效的条目到/etc/fstab文件：

    远程主机:远程目录 本地目录 nfs 选项 0 0

变量远程主机, 远程目录, 本地目录, and 选项 (可选的)在我们手动挂载是谁同样的，就和我们之前的例子一样。

    192.168.0.10:/NFS-SHARE /mnt/nfs nfs defaults 0 0

#### 挂载 Samba 网络文件共享 ####

Samba 代表选择可以在×nix和Windows之间进行网络共享的工具.使用Samba客户端包内的 smbclient 命令 加 -L 参数来展示 Samba 文件分享，其次是机器名或IP地址
将会提示你输入远程主机上的密码:
    # smbclient -L 192.168.0.10

![Check Samba Shares](http://www.tecmint.com/wp-content/uploads/2015/04/Check-Samba-Shares.png)

Check Samba Shares

在本地客户端，你需要首先安装CIFS utils来挂载Samba：

    # yum update && yum install cifs-utils

然后在命令行上使用下面的语法：

    # mount -t cifs -o credentials=/path/to/credentials/file //remote_host/samba_share /local/directory

在我们的例子中，翻译成：

    # mount -t cifs -o credentials=~/.smbcredentials //192.168.0.10/gacanepa /mnt/samba

smbcredentials内容为:

    username=gacanepa
    password=XXXXXX

是一个隐藏文件在root的主目录（/root/），权限设置为600，因此，除了该文件的所有者可以读或写，没有人能够读写。
请注意，samba_share是Samba共享的名字就像 smbclient -L remote_host 返回的那样

现在，如果你需要samba共享可自动在系统启动时，添加一个有效的条目/etc/fstab文件如下：

    //远程主机:/samba_share 本地目录 cifs 选项 0 0

变量 远程主机, /samba_share, 本地目录, 选项 (可选的) 和我们手动安装的意义一样

    //192.168.0.10/gacanepa /mnt/samba	cifs credentials=/root/smbcredentials,defaults 0 0

### 结论 ###

在这篇文章中我们已经讲解了如何在Linux设置ACL，并探讨RHEL7中该如何挂载CIFS和NFS网络共享。
我建议你去实践这些概念，甚至把它们一起安装（先尝试安装网络共享设置ACL）如果你有疑问或意见，请随时使用下面的表格，随时与我们联系。还可以通过你的社交网络来分享这篇文章。
--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-configure-acls-and-mount-nfs-samba-shares/

作者：[Gabriel Cánepa][a]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/rhcsa-exam-create-format-resize-delete-and-encrypt-partitions-in-linux/
[2]:http://www.tecmint.com/rhcsa-exam-manage-users-and-groups/
[3]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Storage_Administration_Guide/ch-acls.html
