Ubuntu每日小贴士 - 在Ubuntu下创建虚拟网卡
================================================================================

这个教程是为那些想用Ubuntu做点小实验的用户准备的。这并不适用于所有人，尤其是那些在（正式环境中）使用生产机器的用户。

如果你对网络运行和IP网络有所了解，你应该知道在大多数情况下，每个网卡只会分配一个IP地址。我们习惯认为这是一对一的事物。

一个网卡对应一个IP地址，你在一台机器上的一个网卡及其IP地址只能绑定或运行单一的网络服务/端口。例如，如果你想在80端口运行一个web服务器，而一个IP地址和端口号只能由一个web服务器监听。这是这样设计的。

所以，网卡和IP地址并不是一对一的关系，你可以创建可以单独分配IP地址的虚拟网卡。因此，单一的物理网卡可以群集无限的子网卡或虚拟网卡。每一个都能分配它自己IP地址到对应的端口。

这个简短的教程将展示给你如何在Ubuntu上做到这些。这是在一台电脑上用一张物理网卡和单一的端口号运行及测试多个网络服务的好方式。

动手吧，运行下列命令打开网络接口文件。

    sudo gedit /etc/network/interfaces

然后按照下图中的步骤，添加你想要的任意多的虚拟网卡。默认情况下，Linux会给第一张网卡分配eth0的名称，所以如果你的机子只有一张网卡，那么它会被命名为eth0。

添加虚拟网卡，创建多个静态网卡并命名为eth0:1、eth0:2、eth0:3等等(eth0后面紧跟冒号和数字)。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/virtualnetworkcardubuntu.png)

对于你创建的每一个网卡，也要确保网络都是不同的子网，这是网络常识（译注：事实上并非如此，虚拟网卡完全可以是相同子网的IP地址，只要你需要） 

完成以后，保存文件并用下列命令重启网络服务。

    sudo service networking restart

就是这样!

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/virtualnetworkcardubuntu1.png)

玩得开心!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-create-virtual-network-cards-in-ubuntu-linux/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
