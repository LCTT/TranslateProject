LFCS 系列第五讲：如何在 Linux 中挂载/卸载本地文件系统和网络文件系统（Samba 和 NFS）
================================================================================

Linux 基金会已经发起了一个全新的 LFCS（Linux Foundation Certified Sysadmin，Linux 基金会认证系统管理员）认证，旨在让来自世界各地的人有机会参加到 LFCS 测试，获得关于有能力在 Linux 系统中执行中间系统管理任务的认证。该认证包括：维护正在运行的系统和服务的能力、全面监控和分析的能力以及何时向上游团队请求支持的决策能力。

![Linux Foundation Certified Sysadmin – Part 5](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-5.png)

*LFCS 系列第五讲*

请看以下视频，这里边介绍了 Linux 基金会认证程序。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本讲是系列教程中的第五讲，在这一讲里边，我们会解释如何在 Linux 中挂载/卸载本地和网络文件系统。这些都是 LFCS 认证中的必备知识。

### 挂载文件系统 ###

在个硬盘分好区之后，Linux 需要通过某些方式对硬盘分区上的数据进行访问。Linux 并不会像 DOS 或者 Windows 那样给每个硬盘分区分配一个字母来作为盘符，而是将硬盘分区挂载到统一的目录树上的挂载点。

挂载点是一个目录，挂载是一种访问分区上文件系统的方法，挂载文件系统实际上是将一个确切的文件系统（比如一个分区）和目录树中指定的目录联系起来的过程。

换句话说，管理存储设备的第一步就是把设备关联到文件系统树。要完成这一步，通常可以这样：用 mount 命令来进行临时挂载（用完的时候，使用 umount 命令来卸载），或者通过编辑 /etc/fstab 文件之后重启系统来永久性挂载，这样每次开机都会进行挂载。

不带任何选项的 mount 命令，可以显示当前已挂载的文件系统。

    # mount

![Check Mounted Filesystem in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/check-mounted-filesystems.png)

*检查已挂载的文件系统*

另外，mount 命令通常用来挂载文件系统。其基本语法如下：

    # mount -t type device dir -o options

该命令会指引内核将在设备上找到的文件系统（如已格式化为指定类型的文件系统）挂载到指定目录。像这样的形式，mount 命令不会再到 /etc/fstab 文件中进行确认。

除非像下面，挂载指定的目录或者设备：

    # mount /dir -o options
    或
    # mount device -o options

mount 命令会尝试寻找挂载点，如果找不到就会查找设备（上述两种情况下，mount 命令会在 /etc/fstab 查找相应的设备或挂载点），最后尝试完成挂载操作（这个通常可以成功执行，除非你的挂载点或者设备正在使用中，或者你调用 mount 命令的时候没有 root 权限）。

你可以看到，mount 命令的每行输出都是如下格式：

    device on directory type (options)

例如：

    /dev/mapper/debian-home on /home type ext4 (rw,relatime,user_xattr,barrier=1,data=ordered)

读作：

设备 dev/mapper/debian-home 挂载在 /home 下，它被格式化为 ext4，并且有以下挂载选项： rw，relatime，user_xattr，barrier=1，data=ordered。

**mount 命令选项**

下面列出 mount 命令的常用选项

- async：允许在将要挂载的文件系统上进行异步 I/O 操作
- auto：标示该文件系统通过 mount -a 命令挂载，与 noauto 相反。 
- defaults：该选项相当于 `async,auto,dev,exec,nouser,rw,suid` 的组合。注意，多个选项必须由逗号隔开并且中间没有空格。倘若你不小心在两个选项中间输入了一个空格，mount 命令会把后边的字符解释为另一个参数。
- loop：将镜像文件（如 .iso 文件）挂载为 loop 设备。该选项可以用来模拟显示光盘中的文件内容。
- noexec：阻止该文件系统中可执行文件的执行。与 exec 选项相反。
- nouser：阻止任何用户（除 root 用户外） 挂载或卸载文件系统。与 user 选项相反。
- remount：重新挂载文件系统。
- ro：只读模式挂载。
- rw：读写模式挂载。
- relatime：只要访问时间早于修改时间，就更新文件的的访问时间。
- user_xattr：允许用户设置和移除可扩展文件系统属性。

**以 ro 和 noexec 模式挂载设备**

    # mount -t ext4 /dev/sdg1 /mnt -o ro,noexec

在本例中，我们可以看到，在挂载点 /mnt 中尝试写入文件或者运行可执行文件都会显示相应的错误信息。

    # touch /mnt/myfile
    # /mnt/bin/echo “Hi there”

![Mount Device in Read Write Mode](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Device-Read-Write.png)

*可读写模式挂载设备*

**以默认模式挂载设备**

以下场景，我们在重新挂载设备的挂载点中，像上例一样尝试你写入文件和运行可执行文件。


    # mount -t ext4 /dev/sdg1 /mnt -o defaults

![Mount Device in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Device.png)

*挂载设备*

在这个例子中，我们发现写入文件和命令都完美执行了。

### 卸载设备 ###

使用 umount 命令卸载设备，意味着将所有的“在使用”数据全部写入到文件系统，然后可以安全移除文件系统。请注意，倘若你移除一个没有事先正确卸载的设备，就会有造成设备损坏和数据丢失的风险。

也就是说，你必须“离开”设备的块设备描述符或者挂载点，才能卸载设备。换言之，你的当前工作目录不能是需要卸载设备的挂载点。否则，系统将返回设备繁忙的提示信息。

![Unmount Device in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Unmount-Device.png)

*卸载设备*

离开需卸载设备的挂载点最简单的方法就是，运行不带任何选项的 cd 命令，这样会回到当前用户的家目录。

### 挂载常见的网络文件系统 ###

最常用的两种网络文件系统是 SMB（Server Message Block，服务器消息块）和 NFS（Network File System，网络文件系统）。如果你只向类 Unix 客户端提供共享，用 NFS 就可以了，如果是向 Windows 和其他类 Unix 客户端提供共享服务，就需要用到 Samba 了。

扩展阅读

- [Setup Samba Server in RHEL/CentOS and Fedora][1]
- [Setting up NFS (Network File System) on RHEL/CentOS/Fedora and Debian/Ubuntu][2]

下面的例子中，假设 Samba 和 NFS 已经在地址为 192.168.0.10 的服务器上架设好了（请注意，架设 NFS 服务器也是 LFCS 考试中需要考核的能力，我们会在后边中提到）。

#### 在 Linux 中挂载 Samba 共享 ####

第一步：在 Red Hat 以 Debian 系发行版中安装 samba-client、samba-common 和 cifs-utils 软件包，如下：

    # yum update && yum install samba-client samba-common cifs-utils
    # aptitude update && aptitude install samba-client samba-common cifs-utils
    
然后运行下列命令，查看服务器上可用的 Samba 共享。

    # smbclient -L 192.168.0.10
	
并输入远程机器上 root 账户的密码。

![Mount Samba Share in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Samba-Share.png)

*挂载 Samba 共享*

上图中，已经对可以挂载到我们本地系统上的共享进行高亮显示。你只需要与一个远程服务器上的合法用户名及密码就可以访问共享了。

第二步：当挂载有密码保护的网络文件系统时候，将你的访问凭证写入到 /etc/fstab 文件中并非明智的选择。你需要将这些信息写入到具有 600 权限的隐藏文件中，像这样：

    # mkdir /media/samba
    # echo “username=samba_username” > /media/samba/.smbcredentials
    # echo “password=samba_password” >> /media/samba/.smbcredentials
    # chmod 600 /media/samba/.smbcredentials

第三步：然后将下面的内容添加到 /etc/fstab 文件中。

    # //192.168.0.10/gacanepa /media/samba cifs credentials=/media/samba/.smbcredentials,defaults 0 0

第四步：现在可以挂载你的 Samba 共享了。手动挂载（mount //192.168.0.10/gacanepa）或者重启系统并应用 /etc/fstab 中相应行来用就挂载都可以。

![Mount Password Protect Samba Share](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Password-Protect-Samba-Share.png)

*挂载有密码保护的 Samba 共享*

#### 在 Linux 系统中挂载 NFS 共享 ####

第一步：在 Red Hat 以 Debian 系发行版中安装 nfs-common 和 portmap 软件包。如下：

    # yum update && yum install nfs-utils nfs-utils-lib
    # aptitude update && aptitude install nfs-common

第二步：为 NFS 共享创建挂载点。

    # mkdir /media/nfs

第三步：将下面的内容添加到 /etc/fstab 文件中。

192.168.0.10:/NFS-SHARE /media/nfs nfs defaults 0 0

第四步：现在可以挂载你的 Samba 共享了。手动挂载（mount 192.168.0.10:/NFS-SHARE）或者重启系统并应用 /etc/fstab 中相应行来用就挂载都可以。

![Mount NFS Share in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-NFS-Share.png)

*挂载 NFS 共享*

### 永久性挂载文件系统 ###

像前面两个例子那样，/etc/fstab 控制着Linux如何访问硬盘分区及可移动设备。/etc/fstab 由六个字段的内容组成，各个字段之间通过一个空格符或者制表符来分开。井号（#）开始的行只是会被忽略的注释。

每一行都按照这个格式来写入：

    <file system> <mount point> <type> <options> <dump> <pass>

其中：

- \<file system>: 第一个字段指定挂载的设备。大多数发行版本都通过分区的标卷（label）或者 UUID 来指定。这样做可以避免分区号改变时带来的错误。
- \<mount point>: 第二个字段指定挂载点。
- \<type> ：文件系统的类型代码与 mount 命令挂载文件系统时使用的类型代码是一样的。通过 auto 类型代码可以让内核自动检测文件系统，这对于可移动设备来说非常方便。注意，该选项可能不是对所有文件系统可用。
- \<options>: 一个（或多个）挂载选项。
- \<dump>: 你可能把这个字段设置为 0（否则设置为 1），使得系统启动时禁用 dump 工具（dump 程序曾经是一个常用的备份工具，但现在越来越少用了）对文件系统进行备份。
- \<pass>: 这个字段指定启动系统是是否通过 fsck 来检查文件系统的完整性。0 表示 fsck 不对文件系统进行检查。数字越大，优先级越低。因此，根分区（/）最可能使用数字 1，其他所有需要检查的分区则是以数字 2.

**Mount 命令例示**

1. 在系统启动时，通过 TECMINT 标卷来挂载文件系统，并具备 rw 和 noexec 属性，你应该将以下语句添加到 /etc/fstab 文件中。

    LABEL=TECMINT /mnt ext4 rw,noexec 0 0

2. 若你想在系统启动时挂载 DVD 光驱中的内容，添加以下语句。

    /dev/sr0    /media/cdrom0    iso9660    ro,user,noauto    0    0

其中 /dev/sr0 为你的 DVD 光驱。

### 总结 ###

不用怀疑，在命令行中挂载/卸载本地和网络文件系统将是你作为系统管理员的日常责任的一部分。同时，你需要掌握 /etc/fstab 文件的编写。希望本文对你有帮助。随时在下边发表评论（或者提问），并分享本文到你的朋友圈。


参考链接

- [About the LFCS][3]
- [Why get a Linux Foundation Certification?][4]
- [Register for the LFCS exam][5]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mount-filesystem-in-linux/

作者：[Gabriel Cánepa][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/setup-samba-server-using-tdbsam-backend-on-rhel-centos-6-3-5-8-and-fedora-17-12/
[2]:http://www.tecmint.com/how-to-setup-nfs-server-in-linux/
[3]:https://training.linuxfoundation.org/certification/LFCS
[4]:https://training.linuxfoundation.org/certification/why-certify-with-us
[5]:https://identity.linuxfoundation.org/user?destination=pid/1
