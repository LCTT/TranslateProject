如何在 Ubuntu 15.04 下创建一个可供 Android/iOS 连接的 AP
================================================================================
我成功地在 Ubuntu 15.04 下用 Gnome Network Manager 创建了一个无线AP热点。接下来我要分享一下我的步骤。请注意：你必须要有一个可以用来创建AP热点的无线网卡。如果你不知道如何确认它的话，在终端(Terminal)里输入`iw list`。

如果你没有安装`iw`的话, 在Ubuntu下你可以使用`sudo apt-get install iw`进行安装.

在你键入`iw list`之后, 查看“支持的接口模式”， 你应该会看到类似下面的条目中看到 AP:

	Supported interface modes:

	* IBSS
	* managed
	* AP
	* AP/VLAN
	* monitor
	* mesh point

让我们一步步看：

1、 断开WIFI连接。使用有线网络接入你的笔记本。

2、 在顶栏面板里点击网络的图标 -> Edit Connections(编辑连接) -> 在弹出窗口里点击Add(新增)按钮。

3、 在下拉菜单内选择Wi-Fi。

4、 接下来：

a、 输入一个链接名 比如: Hotspot 1

b、 输入一个 SSID 比如: Hotspot 1

c、 选择模式(mode): Infrastructure （基础设施）

d、 设备 MAC 地址: 在下拉菜单里选择你的无线设备

![](http://i2.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome1.jpg)

5、 进入Wi-Fi安全选项卡，选择 WPA & WPA2 Personal 并且输入密码。
6、 进入IPv4设置选项卡，在Method(方法)下拉菜单里，选择Shared to other computers(共享至其他电脑)。

![](http://i1.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome4.jpg)

7、 进入IPv6选项卡，在Method(方法)里设置为忽略ignore (只有在你不使用IPv6的情况下这么做)
8、 点击 Save(保存) 按钮以保存配置。
9、 从 menu/dash 里打开Terminal。
10、 修改你刚刚使用 network settings 创建的连接。

使用 VIM 编辑器:

    sudo vim /etc/NetworkManager/system-connections/Hotspot

或使用Gedit 编辑器:

    gksu gedit /etc/NetworkManager/system-connections/Hotspot

把名字 Hotspot 用你在第4步里起的连接名替换掉。

![](http://i2.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome2.jpg?resize=640%2C402)

a、 把 `mode=infrastructure` 改成 `mode=ap` 并且保存文件。
b、 一旦你保存了这个文件，你应该能在 Wifi 菜单里看到你刚刚建立的AP了。(如果没有的话请再顶栏里 关闭/打开 Wifi 选项一次)

![](http://i1.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome3.jpg?resize=290%2C375)

11、你现在可以把你的设备连上Wifi了。已经过 Android 5.0的小米4测试。(下载了1GB的文件以测试速度与稳定性)

--------------------------------------------------------------------------------

via: http://www.linuxveda.com/2015/08/23/how-to-create-an-ap-in-ubuntu-15-04-to-connect-to-androidiphone/

作者：[Sayantan Das][a]
译者：[Moelf](https://github.com/Moelf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxveda.com/author/sayantan_das/
