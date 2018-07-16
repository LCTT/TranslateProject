如何无盘启动Linux
================================================================================
无盘启动意味着一台客户端电脑在启动操作系统时没有任何的磁盘存储介质。在这种情形之下，电脑能够通过网络从远程NFS服务器上加载内核和根文件系统。在这过程中可能会用到多种不同的方法来从NFS服务器上加载内核和根文件系统：RARP，BOOTP或是DHCP协议。在这个指导教程中，我会使用BOOTP/DHCP协议，因为它们能够被大多数的网卡所支持。

### 无盘计算机的优势 ###

想象一下你的办公室内有30台电脑，每一台都需要使用相同的应用程序。如果你作为管理这些电脑的管理员，你会怎么做？如果你在每一台电脑上安装应用程序，那只是在浪费你的时间。另一方面来说，一套无盘系统就能解决你的问题。有了一套无盘系统，你只需在中央NFS服务器上安装需要的程序，然后通过网络启动这30台客户机即可。

### 需要什么 ###

两台或更多的装备有支持DHCP协议的网卡的Linux电脑。这些将扮演NFS服务器角色的电脑应当配有硬盘，其它客户机不需要任何的硬盘。服务器和客户机需要连接到同一个本地网络之内。

设置一个无盘系统共需要五步。

1. 安装所需的包
1. 配置TFTP服务器
1. 配置DHCP服务器
1. 配置NFS服务器
1. 启动无盘客户机

在这个指导教程中，我假设作为启动服务器的电脑运行的是 Ubuntu。如何你正在使用其它的Linux发行版，原理是一样的。

### 第一步：安装所需的包 ###

像下面这样使用 apt-get 命令来安装所有需要的包。

    $ sudo apt-get install dhcp3-server tftpd-hpa syslinux nfs-kernel-server initramfs-tools

### 第二步：配置TFTP服务器 ###

TFTP服务器是一个小型FTP服务器，需要用它来在本地网络中的客户机和服务器之间自动传输启动文件。

向/etc/default/tftpd-hpa中添加以下行：

    RUN_DAEMON="yes"
    OPTIONS="-l -s /var/lib/tftpboot/"

接着，创建一个启动文件夹。

    $ sudo mkdir -p /var/lib/tftpboot/pxelinux.cfg

复制引导程序镜像。

    $ sudo cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot

像下面这样创建一个默认启动配置文件。

    $ sudo vi /tftpboot/pxelinux.cfg/default

----------

    LABEL Ubuntu
    KERNEL vmlinuz
    APPEND root=/dev/nfs initrd=initrd.img nfsroot=10.10.101.1:/nfsroot ip=dhcp rw

注意：

- "root=/dev/nfs"表示服务器上的网络文件系统（不需要修改）。
- "initrd=initrd.img"是一个用于系统启动的启动脚本。
- "nfsroot=10.10.101.1/nfsroot"指明了服务器的IP地址以及NFS共享文件夹的名称。用你的服务器地址来替换掉IP地址。
- "ip=dhcp"表示客户端电脑使用DHCP寻址方案。
- "rw"表示NFS共享是可读/可写的。

最后，重启TFTPD服务。
 
    sudo /etc/init.d/tftpd-hpa restart

### 第三步：配置DHCP服务 ###

你还需要在NFS服务器上配置DHCP服务来允许使用/var/lib/tftpboot/pxelinux.0启动。假设你在使用10.10.101.0作为子网，你的配置可能看起来像下面这样子。

    $ sudo vi /etc/dhcp3/dhcpd.conf

----------

    allow booting;
    allow bootp;

    subnet 10.10.101.0 netmask 255.255.255.0 {
    	range 10.10.101.2 10.10.101.254;
    	option broadcast-address 10.10.101.255;
    	option routers 10.10.101.1;
    	filename "/pxelinux.0";
    }

然后重启DHCP服务。

    $ sudo service isc-dhcp-server restart

### 第四步：配置NFS服务器 ###

创建一个保存客户机根文件系统目录的文件夹。

    $ sudo mkdir /nfsroot

接着，设置NFS服务器导出客户机根文件系统。向/etc/exports添加以下行来实现。

    /nfsroot             *(rw,no_root_squash,async,insecure,no_subtree_check)

运行下列命令来重新载入修改过的/etc/exports。

    $ sudo exportfs -rv

默认情况下，Ubuntu在initrd镜像中不提供网络启动支持。因此你需要创建一个新的initrd.img文件。首先添加下列行到/etc/initramfs-tools/initramfs.conf中。

    BOOT=nfs
    MODULES=netboot

然后运行下列命令来创建一个新的initrd.img。

    $ sudo mkinitramfs -o /var/lib/tftpboot/initrd.img

将新的内核镜像文件复制到/var/lib/tftpboot中。

    $ sudo cp /boot/vmlinuz-`uname -r` /var/lib/tfftpboot/vmlinuz

是时候将整个根文件系统拷贝到/nfsroot中了。

假设您使用的是一个全新的Ubuntu服务器安装，你只需将文件系统拷贝到NFS的根之中。

    $ sudo cp -ax / /nfsroot

然后通过文本编辑器打开/nfsroot/etc/fstab 并添加以下行。

    /dev/nfs       /               nfs    defaults          1       1

文件夹/var/lib/tftpboot应拥有全局读写权限。否则客户机无法从网络启动。

    $ sudo chmod -R 777 /var/lib/tfftpboot

最后，为了避免任何服务器设置出现错误，我推荐对运行DHCP服务的网卡使用静态IP。举个例子，如果网卡名为eth0，你的/etc/network/interfaces中的配置应该看起来像这样：

    iface eth0 inet static
    	address 10.10.101.1
    	netmask 255.255.255.0
    	broadcast 10.10.101.255
    	network 10.10.101.0

### 第五步：启动无盘客户机 ###

在您完成了服务器上的配置之后，从网络启动你的客户机。要从网络启动一般你只需修改BIOS设置中的启动优先顺序即可。

如果客户机启动成功，您的无盘环境就配置好了。无需做任何修改就可以任意添加一台或多台客户端电脑。 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/diskless-boot-linux-machine.html

译者：[alim0x](https://github.com/alim0x) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
