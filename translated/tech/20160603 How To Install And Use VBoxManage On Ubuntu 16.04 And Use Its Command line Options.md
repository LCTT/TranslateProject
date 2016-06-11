在 Ubuntu 16.04 上安装使用 VBoxManage 以及 VBoxManage 命令行选项的用法
=================

VirtualBox 拥有一套命令行工具，然后你可以使用 VirtualBox 的命令行界面 (CLI) 对远端无界面的服务器上的虚拟机进行管理操作。在这篇教程中，你将会学到如何在没有 GUI 的情况下使用 VBoxManage 创建、启动一个虚拟机。VBoxManage 是 VirtualBox 的命令行界面，你可以在你的主机操作系统的命令行中来用它实现对 VirtualBox 的所有操作。VBoxManage 拥有图形化用户界面所支持的全部功能，而且它支持的功能远不止这些。它提供虚拟引擎的所有功能，甚至包含 GUI 还不能实现的那些功能。如果你想尝试不同的用户界面而不仅仅是 GUI，或者更改虚拟机更多高级和实验性的配置，那么你就需要用到命令行。

当你想要在 VirtualBox 上创建或运行虚拟机时，你会发现 VBoxManage 非常有用，你只需要使用远程主机的终端就够了。这对于服务器来说是一种常见的情形，因为在服务器上需要进行虚拟机的远程操作。

### 准备工作

在开始使用 VBoxManage 的命令行工具前，确保在运行着 Ubuntu 16.04 的服务器上，你拥有超级用户的权限或者你能够使用 sudo 命令，而且你已经在服务器上安装了 Oracle Virtual Box。 然后你需要安装 VirtualBox 扩展包，这是运行远程桌面环境，访问无界面启动虚拟机所必须的。（headless的翻译拿不准，翻译为无界面启动）

### 安装 VBoxManage

通过 [Virtual Box Download Page][1] 这个链接，你能够获取你所需要的软件扩展包的最新版本，扩展包的版本和你安装的 VirtualBox 版本需要一致！

![](http://linuxpitstop.com/wp-content/uploads/2016/06/12.png)

也可以用下面这条命令来获取 VBoxManage 扩展。

```
$ wget http://download.virtualbox.org/virtualbox/5.0.20/Oracle_VM_VirtualBox_Extension_Pack-5.0.20-106931.vbox-extpack
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/21.png)

运行下面这条命令，确认 VBoxManage 已经成功安装在你的机器上。

```
$ VBoxManage list extpacks
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/31.png)

### 在 Ubuntu 16.04 上使用 VBoxManage

接下来我们将要使用 VBoxManage 向你展现通过命令行终端工具来新建和管理虚拟机是多么的简单。

运行下面的命令，新建一个将用来安装 Ubuntu 系统的虚拟机。

```
# VBoxManage createvm --name Ubuntu16.04 --register
```

在运行了这条命令之后，VBoxMnage 将会新建一个叫 做“Ubuntu16.vbox” 的虚拟机，这个虚拟机的位置是家目录路径下的 “VirtualBox VMs/Ubuntu16/Ubuntu16.04.vbox”。在上面这条命令中，“createvm” 是用来新建虚拟机，“--name” 定义了虚拟机的名字，而 “registervm”  命令是用来注册虚拟机的。

现在，使用下面这条命令为虚拟机创建一个硬盘镜像。

```
$ VBoxManage createhd --filename Ubuntu16.04 --size 5124
```

这里，“createhd” 用来创建硬盘镜像，“--filename” 用来指定虚拟机的名称，也就是创建的硬盘镜像名称。“--size” 表示硬盘镜像的空间容量，空间容量的单位总是 MB。我们指定了 5Gb，也就是 5124 MB。

接下来我们需要设置操作系统类型，如果要安装 Linux 系的系统，那么用下面这条命令指定系统类型为 Linux 或者 Ubuntu 或者 Fedora 之类的。

```
$ VBoxManage modifyvm Ubuntu16.04 --ostype Ubuntu
```

用下面这条命令来设置虚拟系统的内存大小，也就是从主机中分配到虚拟机系统的内存。

```
$ VBoxManage modifyvm Ubuntu10.10 --memory 512
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/52.png)

现在用下面这个命令为虚拟机创建一个存储控制器。

```
$ VBoxManage storagectl Ubuntu16.04 --name IDE --add ide --controller PIIX4 --bootable on
```

这里的 “storagect1” 是给虚拟机创建存储控制器的，“--name” 指定了虚拟机里需要创建、更改或者移除的存储控制器的名称。“--add” 选项指明系统总线类型，可选的选项有 ide / sata / scsi / floppy，存储控制器必须要连接到系统总线。“--controller” 选择主板的类型，主板需要根据需要的存储控制器选择，可选的选项有 LsiLogic / LSILogicSAS / BusLogic / IntelAhci / PIIX3 / PIIX4 / ICH6 / I82078。最后的 “--bootable” 表示控制器是否可以引导。

上面的命令创建了叫做 IDE 的存储控制器。然后虚拟设备就能通过 “storageattach” 命令连接到控制器。

然后运行下面这个命令来创建一个叫做 SATA 的存储控制器，它将会连接到硬盘镜像上。

```
$ VBoxManage storagectl Ubuntu16.04 --name SATA --add sata --controller IntelAhci --bootable on
```

将之前创建的硬盘镜像和 CD/DVD 驱动器加载到 IDE 控制器。将 Ubuntu 的安装光盘插到 CD/DVD 驱动器上。然后用 “storageattach” 命令连接存储控制器和虚拟机。

```
$ VBoxManage storageattach Ubuntu16.04 --storagectl SATA --port 0 --device 0 --type hdd --medium "your_iso_filepath"
```

用媒体把 SATA 存储控制器连接到 Ubuntu16.04 虚拟机中，也就是之前创建的虚拟硬盘镜像里。

运行下面的命令添加像网络连接，音频之类的功能。

```
$ VBoxManage modifyvm Ubuntu10.10 --nic1 nat --nictype1 82540EM --cableconnected1 on
$ VBoxManage modifyvm Ubuntu10.10 --vram 128 --accelerate3d on --audio alsa --audiocontroller ac97
```

通过指定你想要启动虚拟机的名称，用下面这个命令启动虚拟机。

```
 $ VBoxManage startvm Ubuntu16.04
```
 
然后会打开一个新窗口，新窗口里虚拟机通过关联文件中引导。

![](http://linuxpitstop.com/wp-content/uploads/2016/06/62.png)

你可以用接下来的命令来关掉虚拟机。

```
$ VBoxManage controlvm Ubuntu16.04 poweroff
```

“controlvm” 命令用来控制虚拟机的状态，可选的选项有 pause / resume / reset / poweroff / savestate / acpipowerbutton / acpisleepbutton。controlvm 有很多选项，用下面这个命令来查看它支持的所有选项。

```
$VBoxManage controlvm
```

![](http://linuxpitstop.com/wp-content/uploads/2016/06/81.png)

完结！

从这篇文章中，我们了解了 Oracle Virtual Box 中一个十分实用的工具，就是 VBoxManage，包含了 VBoxManage 的安装和在 Ubuntu 16.04 系统上的使用。文章包含详细的教程， 通过 VBoxManage 中实用的命令来创建和管理虚拟机。希望这篇文章对你有帮助，另外别忘了分享你的评论或者建议。

--------------------------------------------------------------------------------

via: http://linuxpitstop.com/install-and-use-command-line-tool-vboxmanage-on-ubuntu-16-04/

作者：[Kashif][a]
译者：[GitFuture](https://github.com/GitFuture)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://linuxpitstop.com/author/kashif/
[1]: https://www.virtualbox.org/wiki/Downloads
