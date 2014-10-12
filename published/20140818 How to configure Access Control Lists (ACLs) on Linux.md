配置 Linux 的访问控制列表(ACL)
================================================================================
使用拥有权限控制的Liunx，工作是一件轻松的任务。它可以定义任何user,group和other的权限。无论是在桌面电脑或者不会有很多用户的虚拟Linux实例，或者当用户不愿意分享他们之间的文件时，这样的工作是很棒的。然而，如果你是在一个大型组织，你运行了NFS或者Samba服务给不同的用户，然后你将会需要灵活的挑选并设置很多复杂的配置和权限去满足你的组织不同的需求。

Linux（和其他Unix等POSIX兼容的操作系统）有一种被称为访问控制列表(ACL)的权限控制方法，它是一种权限分配之外的普遍范式。例如，默认情况下你需要确认3个权限组：owner、group和other。而使用ACL，你可以增加权限给其他用户或组别，而不单只是简单的"other"或者是拥有者不存在的组别。可以允许指定的用户A、B、C拥有写权限而不再是让他们整个组拥有写权限。

ACL支持多种Linux文件系统，包括ext2, ext3, ext4, XFS, Btfrs, 等。如果你不确定你的文件系统是否支持ACL，请参考文档。

### 在文件系统使ACL生效 ###

首先，我们需要安装工具来管理ACL。

Ubuntu/Debian 中:

    $ sudo apt-get install acl

CentOS/Fedora/RHEL 中:

    # yum -y install acl

Archlinux 中:

    # pacman -S acl

出于演示目的，我将使用ubuntu server版本，其他版本类似。

安装ACL完成后，需要激活我们磁盘分区的ACL功能，这样我们才能使用它。

首先，我们检查ACL功能是否已经开启。

    $ mount

![](https://farm4.staticflickr.com/3859/14768099340_eab7b53e28_z.jpg)

你可以注意到，我的root分区中ACL属性已经开启。万一你没有开启，你需要编辑/etc/fstab文件，在你需要开启ACL的分区的选项前增加acl标记。

![](https://farm6.staticflickr.com/5566/14931771056_b48d5daae2_z.jpg)

现在我们需要重新挂载分区（我喜欢完全重启，因为我不想丢失数据），如果你对其它分区开启ACL，你必须也重新挂载它。

    $ sudo mount / -o remount

干的不错！现在我们已经在我们的系统中开启ACL，让我们开始和它一起工作。

### ACL 范例 ###

基础ACL通过两条命令管理：**setfacl**用于增加或者修改ACL，**getfacl**用于显示分配完的ACL。让我们来做一些测试。

我创建一个目录/shared给一个假设的用户，名叫freeuser

    $ ls -lh /

![](https://farm4.staticflickr.com/3869/14954774565_49456360be_z.jpg)

我想要分享这个目录给其他两个用户test和test2，一个拥有完整权限，另一个只有读权限。

首先，为用户test设置ACL：

    $ sudo setfacl -m u:test:rwx /shared

现在用户test可以随意创建文件夹，文件和访问在/shared目录下的任何地方。

![](https://farm4.staticflickr.com/3924/14768099439_44780ff03b_z.jpg)

现在我们增加只读权限给用户test2:

    $ sudo setfacl -m u:test2:rx /shared

注意test2读取目录需要执行(x)权限

![](https://farm4.staticflickr.com/3918/14768215947_4cd86104d3_z.jpg)

让我来解释下setfacl命令格式：

- **-m** 表示修改ACL。你可以增加新的，或修改存在的ACL
- **u:** 表示用户。你可以使用 **g** 来设置组权限
- **test** 用户名
- **:rwx** 需要设置的权限。

现在让我向你展示如何读取ACL：

    $ ls -lh /shared

![](https://farm6.staticflickr.com/5591/14768099389_9a7f3a6bf2_z.jpg)

你可以注意到，正常权限后多一个+标记。这表示ACL已经设置成功。要具体看一下ACL，我们需要运行：

    $ sudo getfacl /shared

![](https://farm4.staticflickr.com/3839/14768099289_81bd9d21a4_z.jpg)

最后，如果你需要移除ACL：

    $ sudo setfacl -x u:test /shared

![](https://farm4.staticflickr.com/3910/14768215837_d5306fe5bf_z.jpg)

如果你想要立即擦除所有ACL条目：

    $ sudo setfacl -b /shared

![](https://farm4.staticflickr.com/3863/14768099130_a7d175f067_z.jpg)

最后，在设置了ACL文件或目录工作时，cp和mv命令会改变这些设置。在cp的情况下,需要添加“p”参数来复制ACL设置。如果这不可行，它将会展示一个警告。mv默认移动ACL设置，如果这也不可行，它也会向您展示一个警告。

### 总结 ###

使用ACL让在你想要分享的文件上拥有更多的能力和控制，特别是在NFS/Samba服务。此外，如果你的主管共享主机，这个工具是必备的。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/configure-access-control-lists-acls-linux.html

作者：[Christopher Valerio][a]
译者：[VicYu](http://www.vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/valerio
