Ubuntu每日小贴士 - 在Ubuntu下创建虚拟网卡

================================================================================

这个教程是为那些想用Ubuntu做点小实验的用户准备的.这并不适用于所有人,尤其是那些正在使用生产机器的用户.

如果你对网络运行和IP网络有所了解,你应该知道在大多数情况下,每个网卡只会分配一个IP地址.我们习惯认为这是一对一的事物.

一个网卡对应一个IP地址,你在一台机器用一个网卡和IP地址只能绑定或运行单一的网络服务/端口.例如,如果你想在80端口运行一个web服务器,只有一个web服务器将监听一个IP地址和端口#.这就是它如何工作的.

所以,网卡和IP地址并不是一对一的关系,你可以创建可以单独分配IP地址的虚拟网卡.因此,单一的物理网卡可以群集无限的子网卡或虚拟网卡.每一个都能分配它自己IP地址到对应的端口.

这个简短的教程将展示给你如何在Ubuntu做到这些.这是极好的方式在一台电脑上用一张物理网卡和单一的端口#运行和测试多个网络服务.

动手吧,运行下列命令打开网络接口文件.

    sudo gedit /etc/network/interfaces

然后按照下图中的步骤吗,尽可能多的添加你想要的虚拟网卡.默认情况下,Linux会给第一张网卡分配eth0的名称.所以如果你的机子只有一张网卡,那么它会被命名为eth0

添加虚拟网卡,创建多个静态网卡并命名为eth0:1,eth0:2,eth0:3, etc.(eth0后面紧跟冒号和数字).

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/virtualnetworkcardubuntu.png)

对于你创建的每一个网卡,也要确保网络都是不同的子网 .. 

完成以后,保存文件并用下列命令重置网络服务.

    sudo service networking restart

就是这样!

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/virtualnetworkcardubuntu1.png)

玩得开心!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-create-virtual-network-cards-in-ubuntu-linux/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
