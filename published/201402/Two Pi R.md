树莓派使用实例之：2 Pi R
================================================================================

很多人都对树莓派的硬件 hack 功能（译注：就是用户可以自己发挥想像力，把树莓派设计成自己想要的机器）感兴趣，而我看中的一点是树莓派的低耗电功能，我可以用它来代替现在在用的 Linux 服务器。在以前的文章中我已经介绍过如何用树莓派代替这些服务器来管理我的啤酒冰箱，以及我在澳大利亚托管的一台树莓派。托管树莓派之后，我开始思考我正在使用的服务器的单点故障问题，并且考虑着手解决它。当你看到文章标题里的“2 Pi R”，你也许会想到圆周长计算公式（C = 2*Pi*R，Pi 为圆周率，R 为半径），但在本文中，“R”的意思是“冗余（redundancy）”。当然，一块树莓派并不能实现冗余，至少需要两块。下面我将介绍如何用两块树莓派实现冗余。

本文将建立一个底层框架，为俩树莓派实现冗余提供基础服务，首先我要用 GlusterFS 建立一个集群网络文件系统。在之后的文章中，我还会介绍如何利用共享存储来建立其他冗余服务。注意，虽然本文使用的是树莓派，但下面的配置操作同样适用于其他硬件。

### 配置俩树莓派 ###

首先从树莓派官网下载最新的 Linux 发行版，并安装到两块 SD 卡中。将树莓派接到电视机上，然后按照文档提示选择内核镜像并启动系统，确认一下 SSH 服务有没有启动（默认情况下 SSH 应该是开机启动的）。你可以使用 raspi-config 命令来增加根分区空间，以便能充分利用 SD 卡的容量。确认系统正常工作、SSH 正常启动后，我可以过程访问它了。我将树莓派与电视机断开，并连到交换机上，重启系统，没有显示界面。

默认情况下，Raspbian 会通过 DHCP 获取自己的网络信息，但是在设置冗余服务时，我们希望树莓派每次开机都使用同一个 IP 地址。在我的环境中，我设置了我的 DHCP 服务器，它会在树莓派启动时为它们分配固定的 IP 地址。而你可以编辑 /etc/network/interfaces 文件：

    iface eth0 inet dhcp

修改成： 

    auto eth0
    iface eth0 inet static
      address 192.168.0.121
      netmask 255.255.255.0
      gateway 192.168.0.1

当然，要将上面的参数修改成你自己的参数，确保每个树莓派使用不同的 IP 地址。我把两个树莓派的主机名都改了，便于在（通过 SSH）登录的时候区分它们。怎么改主机名呢？以 root 权限编辑 /etc/hostname 文件。最后重启系统，确认树莓派使用了正确的网络配置和主机名。

### 配置 GlusterFS 服务器 ###

GlusterFS 是一个用户态的集群文件系统，我选择它，是因为它配置共享网络文件系统很方便。首先选一个树莓派作为主设备（master）。在主设备上你需要做一些初始化操作，完成后，它们会自动执行故障转移。下面是我架设的环境：

    Master hostname: pi1
    Master IP: 192.168.0.121
    Master brick path: /srv/gv0
    Secondary hostname: pi2
    Secondary IP: 192.168.0.122
    Secondary brick path: /srv/gv0

在开始之前，登入这两个树莓派，然后安装 glusterfs-server 软件包：

    $ sudo apt-get install glusterfs-server

GlusterFS 将数据保存在一些被称为“块”的设备中。一个“块”是一个系统路径，由你指定给 gluster 使用。GlusterFS 会将所有“块”组合成一个存储卷，给客户端使用。GlusterFS 会将文件的数据分割成多份，保存在不同的“块”中。所以虽然一个“块”看起来就是一个普通的路径，你最好不要在树莓派中直接操作它，而应该通过客户端访问 GlusterFS 服务，让 GlusterFS 操作。本文中我在两个树莓派中都新建一个 /srv/gv0 目录作为 GlusterFS 的“块”：

    $ sudo mkdir /srv/gv0

在我的环境中，我将 SD 卡上的根文件系统共享出来，而你可能需要共享更大的存储空间。如果是这样的话，在两块树莓派上都接上 USB 硬盘，格式化后挂载到 /srv/gv0 上。编辑下 /etc/fstab 文件，确保系统每次启动时都会把你的 USB 硬盘挂载上去。两个树莓派上的“块”不一定需要有相同的名字或者相同的路径名称，但是把它们设置为相同的值也没什么坏处。

配置好“块”的路径，安装好 glusterfs-server 软件包，确认两个树莓派都正常工作，然后登入被你设为主设备的树莓派，输入“gluster peer probe”命令，将次设备加入到集群中。在我的环境中，我用 IP 地址表示第二个节点，如果你比较有个性，并且有设置过 DNS，你也可以用主机名表示这个节点。

    pi@pi1 ~ $ sudo gluster peer probe 192.168.0.122
    Probe successful

目前为止，我的 pi1 (192.168.0.121) 信任 pi2 (192.168.0.122)，我可以建立一个存储卷，名字都想好了：gv0。在主设备端运行命令“gluster volume create”：

    pi@pi1 ~ $ sudo gluster volume create gv0 replica 2 192.168.0.121:/srv/gv0 192.168.0.122:/srv/gv0
    Creation of volume gv0 has been successful. Please start 
    the volume to access data.

这里稍微解释一下命令的意思。“gluster volume create”就是新建一个卷；“gv0”是卷名，这个名称将会在客户端被用到；“replica 2”表示这个卷的数据会在两个“块”之间作冗余，而不是将数据分割成两份分别存于两个“块”。这个命令保证了卷内的数据会被复制成两份分别保存在两个“块”中。最后我定义两个独立的“块”，作为卷的存储空间：192.168.0.121 上的 /srv/gv0 和 192.168.0.122 上的 /srv/gv0。

现在，卷被成功创建，我只需启动它：

    pi@pi1 ~ $ sudo gluster volume start gv0
    Starting volume gv0 has been successful

然后我可以在任何一个树莓派上使用“volume info”命令来查看状态：

    $ sudo gluster volume info

    Volume Name: gv0
    Type: Replicate
    Status: Started
    Number of Bricks: 2
    Transport-type: tcp
    Bricks:
    Brick1: 192.168.0.121:/srv/gv0
    Brick2: 192.168.0.122:/srv/gv0

### 配置 GlusterFS 客户端 ###

卷已启动，现在我可以在一个支持 GlusterFS 的客户端上，将它作为一个 GlusterFS 类型的文件系统挂载起来。首先我想在这两个树莓派上挂载这个卷，于是我在两个树莓派上都创建了挂载点，并下面的命令把这个卷挂载上去：

    $ sudo mkdir -p /mnt/gluster1
    $ sudo mount -t glusterfs 192.168.0.121:/gv0 /mnt/gluster1
    $ df
    Filesystem         1K-blocks    Used Available Use% Mounted on
    rootfs               1804128 1496464    216016  88% /
    /dev/root            1804128 1496464    216016  88% /
    devtmpfs               86184       0     86184   0% /dev
    tmpfs                  18888     216     18672   2% /run
    tmpfs                   5120       0      5120   0% /run/lock
    tmpfs                  37760       0     37760   0% /run/shm
    /dev/mmcblk0p1         57288   18960     38328  34% /boot
    192.168.0.121:/gv0   1804032 1496448    215936  88% /mnt/gluster1

如果你是一个喜欢钻研的读者，你可能会问了：“如果我指定了一个 IP 地址，如果192.168.0.121当机了，怎么办？”。别担心，这个 IP 地址仅仅是为了指定使用哪个卷，当我们访问这个卷的时候，卷内的两个“块”都会被访问到。

当你挂载好这个文件系统后，试试在里面新建文件，然后查看一下“块”对应的路径：/srv/gv0。你应该可以看到你在 /mngt/gluster1 里创建的文件，在两个树莓派的 /srv/gv0 上都出现了（重申一遍，不要往 /srv/gv0 里写数据）：

    pi@pi1 ~ $ sudo touch /mnt/gluster1/test1
    pi@pi1 ~ $ ls /mnt/gluster1/test1
    /mnt/gluster1/test1
    pi@pi1 ~ $ ls /srv/gv0
    test1
    pi@pi2 ~ $ ls /srv/gv0
    test1

你可以在 /etc/fstab 上添加下面一段，就可以在系统启动的时候自动把 GlusterFS 的卷挂载上来：

    192.168.0.121:/gv0  /mnt/gluster1  glusterfs  defaults,_netdev  0  0

注意：如果你想通过其他客户端访问到这个 GlusterFS 卷，只需要安装一个 GlusterFS 客户端（在基于 Debian 的发行版里，这个客户端叫 glusterfs-client），然后接我上面介绍的，创建挂载点，将卷挂载上去。

### 冗余测试 ###

现在我们就来测试一下这个冗余文件系统。我们的目标是，当其中一个节点当掉，我们还能访问 GlusterFS 卷里面的文件。首先我配置一个独立的客户端用于挂载 GlusterFS 卷，然后新建一个简单的脚本文件放在卷中，文件名为“glustertest”：

    #!/bin/bash

    while [ 1 ]
    do
      date > /mnt/gluster1/test1
      cat /mnt/gluster1/test1
      sleep 1
    done

这个脚本运行无限循环并每隔1秒打印出系统时间。当我运行这个脚本时，我可以看到下面的信息：

    # chmod a+x /mnt/gluster1/glustertest
    root@moses:~# /mnt/gluster1/glustertest
    Sat Mar  9 13:19:02 PST 2013
    Sat Mar  9 13:19:04 PST 2013
    Sat Mar  9 13:19:05 PST 2013
    Sat Mar  9 13:19:06 PST 2013
    Sat Mar  9 13:19:07 PST 2013
    Sat Mar  9 13:19:08 PST 2013

我发现这个脚本偶尔会跳过1秒，可能是 date 这个命令并不是很精确地每隔1秒钟打印一次，所以偶尔会出现输出时间不连惯的现象。

当我执行这个脚本后，我登入一个树莓派并输入“sudo reboot”重启这个设备。这个脚本一直在运行，如果出现输出时间不连惯现象，我不知道还是不是上面说的偶然现象。当第一个树莓派启动后，我重启第二个树莓派，确认下这个系统有一个节点丢失后，我的程序仍然能正常工作。这个冗余系统配置起来只需要几个命令，如果你需要一个冗余系统，这是个不错的选择。

现在你已经实现了 2 Pi R 组成的冗余文件系统，在我的下篇文章中，我将会加入新的冗余服务，将这个共享存储系统好好利用起来。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/two-pi-r

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
