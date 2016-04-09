如何在Linux中用命令行工具管理KVM虚拟环境
================================================================================
在我们[KVM系列专题][1]的第四部分，我们将会一起讨论下在命令行界面下来管理KVM环境。我们分别用‘virt-install’和virsh命令行工具来创建并配置虚拟机和存储池，用qemu-img命令行工具来创建并管理磁盘映像。

![KVM Management in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/KVM-Management-in-Linux.jpg)

*Linux系统的KVM管理*

在这篇文章里没有什么新的概念，我们只是用命令行工具重复之前所做过的事情，也没有什么前提条件，都是相同的过程，之前的文章我们都讨论过。

### 第一步: 配置存储池 ###

Virsh命令行工具是一款管理virsh客户域的用户界面。virsh程序能在命令行中运行所给的命令以及它的参数。

本节中，我们要用它给我们的KVM环境创建存储池。想知道关于这个工具的更多信息，用以下这条命令。

    # man virsh

**1. 用virsh带pool-define-as的命令来定义新的存储池，你需要指定名字、类型和类型参数。**

本例中，我们将名字取为Spool1，类型为目录。默认情况下你可以提供五个参数给该类型：

- source-host
- source-path
- source-dev
- source-name
- target

对于目录类型，我们需要用最后一个参数“target”来指定存储池的路径，其它参数项我们可以用“-”来填充。

    # virsh pool-define-as Spool1 dir - - - - "/mnt/personal-data/SPool1/"

![Create New Storage Pool](http://www.tecmint.com/wp-content/uploads/2015/02/Create-New-Storage-Pool.png)

*创建新存储池*

**2. 查看环境中我们所有的存储池，用以下命令。**

    # virsh pool-list --all

![List All Storage Pools](http://www.tecmint.com/wp-content/uploads/2015/02/List-All-Storage-Pools.png)

*列出所有存储池*

**3. 现在我们来构造存储池了，用以下命令来构造我们刚才定义的存储池。**

    # virsh pool-build Spool1

![Build Storage Pool](http://www.tecmint.com/wp-content/uploads/2015/02/Build-Storage-Pool.png)

*构造存储池*

**4. 用带pool-start参数的virsh命令来激活并启动我们刚才创建并构造完成的存储池。**

    # virsh pool-start Spool1

![Active Storage Pool](http://www.tecmint.com/wp-content/uploads/2015/02/Active-Storage-Pool.png)

*激活存储池*

**5. 查看环境中存储池的状态，用以下命令。**

    # virsh pool-list --all

![Check Storage Pool Status](http://www.tecmint.com/wp-content/uploads/2015/02/Check-Storage-Pool-Status.png)

*查看存储池状态*

你会发现Spool1的状态变成了已激活。

**6. 对Spool1进行配置，让它每次都能被libvirtd服务自启动。**

    # virsh pool-autostart Spool1

![Configure KVM Storage Pool](http://www.tecmint.com/wp-content/uploads/2015/02/Configure-Storage-Pool.png)

*配置KVM存储池*

**7. 最后来看看我们新的存储池的信息吧。**

    # virsh pool-info Spool1

![Check KVM Storage Pool Information](http://www.tecmint.com/wp-content/uploads/2015/02/Check-Storage-Pool-Information.png)

*查看KVM存储池信息*

恭喜你，Spool1已经准备好待命，接下来我们试着创建存储卷来使用它。

### 第二步: 配置存储卷/磁盘映像 ###

现在轮到磁盘映像了，用qemu-img命令在Spool1中创建一个新磁盘映像。获取更多细节信息，可以查看man手册。

    # man qemu-img

**8. 我们应该在qemu-img命令之后指定“create, check,…”等等操作、磁盘映像格式、你想要创建的磁盘映像的路径和大小。**

    # qemu-img create -f raw /mnt/personal-data/SPool1/SVol1.img 10G

![Create Storage Volume](http://www.tecmint.com/wp-content/uploads/2015/02/Create-Storage-Volumes.png)

*创建存储卷*

**9. 通过使用带info的qemu-img命令，你可以获取到你的新磁盘映像的一些信息。**

![Check Storage Volume Information](http://www.tecmint.com/wp-content/uploads/2015/02/Check-Storage-Volume-Information.png)

*查看存储卷信息*

**警告**: 不要用qemu-img命令来修改被运行中的虚拟机或任何其它进程所正在使用的映像，那样映像会被破坏。

现在是时候来创建虚拟机了。

### 第三步: 创建虚拟机 ###

**10. 现在到最后一个环节了，在最后一步中，我们将用virt-install命令来创建虚拟机。virt-install是一个用来创建新的KVM虚拟机命令行工具，它使用“libvirt”管理程序库。想获取更多细节，同样可以查看man手册。**

    # man virt-install

要创建新的KVM虚拟机，你需要用到带以下所有信息的命令。

- Name: 虚拟机的名字。
- Disk Location: 磁盘映像的位置。
- Graphics : 怎样连接VM，通常是SPICE。
- vcpu : 虚拟CPU的数量。
- ram : 以兆字节计算的已分配内存大小。
- Location : 指定安装源路径。
- Network : 指定虚拟网络，通常是virbr0网桥。

    # virt-install --name=rhel7 --disk path=/mnt/personal-data/SPool1/SVol1.img --graphics spice --vcpu=1 --ram=1024 --location=/run/media/dos/9e6f605a-f502-4e98-826e-e6376caea288/rhel-server-7.0-x86_64-dvd.iso --network bridge=virbr0

![Create New Virtual Machine](http://www.tecmint.com/wp-content/uploads/2015/02/Create-New-Virtual-Machines.png)

*创建新的虚拟机*

**11. 你会看到弹出一个virt-vierwer窗口，像是在通过它在与虚拟机通信。**

![Booting Virtual Machine](http://www.tecmint.com/wp-content/uploads/2015/02/Booting-Virtual-Machine.jpeg)

*虚拟机启动程式*

![Installation of Virtual Machine](http://www.tecmint.com/wp-content/uploads/2015/02/Installation-of-Virtual-Machine.jpeg)

*虚拟机安装过程*

### 结论 ###

以上就是我们KVM教程的最后一部分了，当然我们还没有完全覆盖到全部，我们只是打了个擦边球，所以现在该轮到你来好好地利用这些丰富的资源来做自己想做的事了。

- [KVM Getting Started Guide][2]
- [KVM Virtualization Deployment and Administration Guide][3]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/kvm-management-tools-to-manage-virtual-machines/

作者：[Mohammad Dosoukey][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/dos2009/
[1]:http://www.tecmint.com/install-and-configure-kvm-in-linux/
[2]:https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Getting_Started_Guide/index.html
[3]:https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Deployment_and_Administration_Guide/index.html
