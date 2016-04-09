为LUKS加密的磁盘/分区做增量备份
================================================================================
我们中有些人出于安全原因，在家里或者[VPS][1]上通过[Linux统一密钥配置（LUKS）][2]为硬盘驱动器加密，而这些驱动器的容量很快会增长到数十或数百GB。因此，虽然我们享受着LUKS设备带来的安全感，但是我们也该开始考虑一个可能的远程备份方案了。对于安全的非现场备份，我们将需要能在LUKS加密的设备上以块级别操作的东西。因此，最后我们发现这么个状况，我们每次都需要传输想要做备份的整个LUKS设备（比如说200GB大）。很明显，这是不可行的。我们该怎么来处理这个问题呢？

### 一个解决方案： Bdsync ###

这时，一个卓越的开源工具来拯救我们了，它叫[Bdsync][3]（多亏了Rolf Fokkens）。顾名思义，Bdsync可以通过网络同步“块设备”。对于快速同步，Bdsync会生成并对比本地/远程块设备的块的MD5校验和，只同步差异部分。rsync在文件系统级别可以做的，Bdsync可以在块设备级别完成。很自然，对于LUKS加密的设备它也能工作得很好。相当地灵巧！

使用Bdsync，首次备份将拷贝整个LUKS块设备到远程主机，因而会花费大量时间来完成。然而，在初始备份后，如果我们在LUKS设备新建一些文件，再次备份就会很快完成，因为我们只需拷贝修改过的块。经典的增量备份在起作用了！

### 安装Bdsync到Linux ###

Bdsync并不包含在Linux发行版的标准仓库中，因而你需要从源代码来构建它。使用以下针对特定版本的指令来安装Bdsync及其手册页到你的系统中。

#### Debian，Ubuntu或Linux Mint ####

    $ sudo apt-get install git gcc libssl-dev
    $ git clone https://github.com/TargetHolding/bdsync.git
    $ cd bdsync
    $ make
    $ sudo cp bdsync /usr/local/sbin
    $ sudo mkdir -p /usr/local/man/man1
    $ sudo sh -c 'gzip -c bdsync.1 > /usr/local/man/man1/bdsync.1.gz'

#### Fedora或CentOS/RHEL ####

    $ sudo yum install git gcc openssl-devel
    $ git clone https://github.com/TargetHolding/bdsync.git
    $ cd bdsync
    $ make
    $ sudo cp bdsync /usr/local/sbin
    $ sudo mkdir -p /usr/local/man/man1
    $ sudo sh -c 'gzip -c bdsync.1 > /usr/local/man/man1/bdsync.1.gz'

### 对LUKS加密的设备实施非现场增量备份 ###

我假定你已经准备好了一个LUKS加密的块设备作为备份源（如，/dev/LOCDEV）。同时，我假定你也有一台远程主机，用以作为源设备的备份点（如，/dev/REMDEV）。

你需要在两台系统上具有root帐号访问权限，并且设置从本地访问远程的[无密码SSH访问][5]。最后，你需要安装Bdsync到两台主机上。

要在本地主机上初始化一个远程备份进程，我们需要以root执行以下命令：

    # bdsync "ssh root@remote_host bdsync --server" /dev/LOCDEV /dev/REMDEV | gzip > /some_local_path/DEV.bdsync.gz 

这里需要进行一些说明。Bdsync客户端将以root打开一个到远程主机的SSH连接，并执行带有--server选项的Bdsync客户端。明确说明一下，/dev/LOCDEV是我们的本地主机上的源LUKS块设备，而/dev/REMDEV是远程主机上的目标块设备。它们可以是/dev/sda（作为整个磁盘），或者/dev/sda2（作为单个分区）。本地Bdsync客户端的输出结果随后被管道输送到gzip，用来在本地主机中创建DEV.bdsync.gz（所谓的二进制补丁文件）。

你第一次运行上面的命令的时候，它会花费很长一段时间，这取决于你的互联网/局域网速度，以及/dev/LOCDEV的大小。记住，你必须有两个大小相同的块设备（/dev/LOCDEV和/dev/REMDEV）。

下一步是要将补丁文件从本地主机拷贝到远程主机。一种方式是使用scp：

    # scp /some_local_path/DEV.bdsync.gz root@remote_host:/remote_path 

最后一步，是要在远程主机上执行以下命令，它们会将补丁文件应用到/dev/REMDEV：

    # gzip -d < /remote_path/DEV.bdsync.gz | bdsync --patch=/dev/DSTDEV 

我推荐在使用真实数据部署Bdsync前，使用一些（没有任何重要数据）小分区来做这些测试。在你完全弄懂整个设置是如何工作之后，你可以开始备份真实数据。

### 尾声 ###

小结之，我们演示了如何使用Bdsync来为LUKS设备实施增量备份。和rsync一样，每次备份只有一小部分数据，而不是整个LUKS设备，需要被推送到非现场备份点，这样会节省带宽和备份时间。剩下来，需要通过SSH或SCP来保证所有数据传输的安全，事实上设备自身是由LUKS加密的。也可以通过使用可以运行bdsync的专用用户（而非root）来改进该配置。我们也可以将bdsync用于任何块设备，如LVM卷或RAID磁盘，也可以很轻易地设置Bdsync备份本地磁盘到USB驱动器上。如你所见，它有着无限可能性！

随时分享你的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/remote-incremental-backup-luks-encrypted-disk-partition.html

作者：[Iulian Murgulet][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/iulian
[1]:http://xmodulo.com/go/digitalocean
[2]:http://xmodulo.com/how-to-create-encrypted-disk-partition-on-linux.html
[3]:http://bdsync.rolf-fokkens.nl/
[4]:http://xmodulo.com/recommend/linuxbook
[5]:https://linux.cn/article-5444-1.html
