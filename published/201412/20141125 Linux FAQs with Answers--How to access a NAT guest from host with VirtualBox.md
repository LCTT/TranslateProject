Linux 有问必答：如何从VirtualBox中从主机访问NAT客户机
================================================================================
> **提问**: 我有一台运行在VirtualBox上的使用NAT的虚拟机，因此虚拟机会被VirtualBox分配一个私有IP地址(10.x.x.x)。如果我想要从主机SSH到虚拟机中，我该怎么做？

VirtualBox对虚拟机支持几种不同的网络方式，其中一种是NAT网络。当虚拟机启用NAT后，VirtualBox会自动在虚拟机和主机之间进行网络翻译，因此你不必在虚拟机和主机之间配置任何东西。这也意味着NAT中的虚拟机对于外部网络以及主机本身是不可见的。这会在你想要从主机访问虚拟机时会产生问题（比如SSH）。

如果你想从VirtualBox的NAT环境的虚拟机，你可以在GUI或者命令行下启用VirtualBox NAT的端口转发。本篇教程将会演示**如何通过启用22端口转发而从主机SSH连接到NAT环境的客户机**。如果你先想要从HTTP访问NAT的客户机，用80端口代替22端口即可。

### 通过GUI配置VirtualBox端口转发 ###

在VirtualBox中选择你想要访问的虚拟机，打开虚拟机的“设置”。点击左侧的“网络”菜单，点击网络适配选项的“高级”。

![](https://farm8.staticflickr.com/7583/15797904856_2753dc785e_z.jpg)

点击“端口转发”按钮

![](https://farm8.staticflickr.com/7527/15636152708_cf2be7c7e8_z.jpg)

你会看到一个配置端口转发规则的窗口。点击右上角的“添加”图标。

![](https://farm8.staticflickr.com/7489/15636391217_48a9954480_z.jpg)

就会看到像下面那样的转发规则。

- **Name**: SSH (可以是任意唯一名)
- **Protocol**: TCP
- **Host IP**: 127.0.0.1
- **Host Port**: 2222 (任何大于1024未使用的端口)
- **Guest IP**: 虚拟机IP
- **Guest Port**: 22 (SSH 端口) 

![](https://farm6.staticflickr.com/5603/15202135853_02a07c3212_o.png)

端口转发的规则会自动在你启动虚拟机的时候启用。为了验证。可以在你启用虚拟机后检查端口2222是否被VirtualBox开启了。

    $ sudo netstat -nap | grep 2222 

![](https://farm8.staticflickr.com/7461/15819682411_6bb9707f8a_z.jpg)

现在端口转发可以使用了，你可以用下面的命令SSH到虚拟机。

     $ ssh -p 2222 <login>@127.0.0.1 

发送到127.0.0.1:2222的登录请求会自动被VirtualBox翻译成10.0.2.15:22，这可以让你SSH到虚拟机中。

### 通过命令行配置VirtualBox端口转发 ###

VirtualBox有一个称为VBoxManage的命令行管理工具。使用命令行工具，你也可以为你的虚拟机设置端口转发。

下面的命令会为IP地址为10.0.2.15的虚拟机设置一个名字为"centos7"的端口转发规则，SSH的端口号为22,映射到本地主机的端口为2222。规则的名字（本例中是SSH）必须是唯一的。

    $ VBoxManage modifyvm "centos7" --natpf1 "SSH,tcp,127.0.0.1,2222,10.0.2.15,22" 

规则创建之后，你可以用下面的命令来验证。

     $ VBoxManage showvminfo "centos7" | grep NIC 

![](https://farm8.staticflickr.com/7559/15636458427_7a0959900c_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/access-nat-guest-from-host-virtualbox.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
