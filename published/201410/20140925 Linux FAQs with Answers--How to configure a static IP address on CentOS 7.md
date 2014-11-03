Linux有问必答：如何为CentOS 7配置静态IP地址
================================================================================
> **问题**：在CentOS 7上，我想要将我其中一个网络接口从DHCP改为静态IP地址配置，如何才能永久为CentOS或RHEL 7上的网络接口分配静态IP地址？

如果你想要为CentOS 7中的某个网络接口设置静态IP地址，有几种不同的方法，这取决于你是否想要使用网络管理器。

网络管理器（Network Manager）是一个动态网络的控制器与配置系统，它用于当网络设备可用时保持设备和连接开启并激活。默认情况下，CentOS/RHEL 7安装有网络管理器，并处于启用状态。

使用下面的命令来验证网络管理器服务的状态：

    $ systemctl status NetworkManager.service

运行以下命令来检查受网络管理器管理的网络接口：

    $ nmcli dev status 

![](https://farm4.staticflickr.com/3861/15295802711_a102a3574d_z.jpg)

如果某个接口的nmcli的输出结果是“已连接”（如本例中的enp0s3），这就是说该接口受网络管理器管理。你可以轻易地为某个特定接口禁用网络管理器，以便你可以自己为它配置一个静态IP地址。

下面将介绍**在CentOS 7上为网络接口配置静态IP地址的两种方式**，在例子中我们将对名为enp0s3的网络接口进行配置。

### 不使用网络管理配置静态IP地址 ###

进入/etc/sysconfig/network-scripts目录，找到该接口的配置文件（ifcfg-enp0s3）。如果没有，请创建一个。

![](https://farm4.staticflickr.com/3911/15112399977_d3df8e15f5_z.jpg)

打开配置文件并编辑以下变量：

![](https://farm4.staticflickr.com/3880/15112184199_f4cbf269a6.jpg)

在上图中，“NM_CONTROLLED=no”表示该接口将通过该配置文件进行设置，而不是通过网络管理器进行管理。“ONBOOT=yes”告诉我们，系统将在启动时开启该接口。

保存修改并使用以下命令来重启网络服务：

    # systemctl restart network.service

现在验证接口是否配置正确：

    # ip add 

![](https://farm6.staticflickr.com/5593/15112397947_ac69a33fb4_z.jpg)

### 使用网络管理器配置静态IP地址 ###

如果你想要使用网络管理器来管理该接口，你可以使用nmtui（网络管理器文本用户界面），它提供了在终端环境中配置配置网络管理器的方式。

在使用nmtui之前，首先要在/etc/sysconfig/network-scripts/ifcfg-enp0s3中设置“NM_CONTROLLED=yes”。

现在，请按以下方式安装nmtui。

    # yum install NetworkManager-tui

然后继续去编辑enp0s3接口的网络管理器配置：

    # nmtui edit enp0s3 

在下面的屏幕中，我们可以手动输入与/etc/sysconfig/network-scripts/ifcfg-enp0s3中所包含的内容相同的信息。

使用箭头键在屏幕中导航，按回车选择值列表中的内容（或填入想要的内容），最后点击屏幕底部右侧的确定按钮。

![](https://farm4.staticflickr.com/3878/15295804521_4165c97828_z.jpg)

最后，重启网络服务。

    # systemctl restart network.service

好了，现在一切都搞定了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/configure-static-ip-address-centos7.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
