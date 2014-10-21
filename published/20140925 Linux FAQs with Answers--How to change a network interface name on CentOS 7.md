Linux有问必答：如何在CentOS7上改变网络接口名
================================================================================
> **提问**: 在CentOS7，我想将分配的网络接口名更改为别的名字。有什么合适的方法来来重命名CentOS或RHEL7的网络接口？

传统上，Linux的网络接口被枚举为eth[0123...]，但这些名称并不一定符合实际的硬件插槽，PCI位置，USB接口数量等，这引入了一个不可预知的命名问题（例如，由于不确定的设备探测行为），这可能会导致不同的网络配置错误（例如，由无意的接口改名引起的禁止接口或者防火墙旁路）。基于MAC地址的udev规则在虚拟化的环境中并不有用，这里的MAC地址如端口数量一样无常。

CentOS/RHEL6引入了[一致和可预测的网络设备命名][1]网络接口的方法。这些特性可以唯一地确定网络接口的名称以使定位和区分设备更容易，并且在这样一种方式下，无论是否重启机器、过了多少时间、或者改变硬件，其名字都是持久不变的。然而，这种命名规则并不是默认在CentOS/RHEL6上开启。

从CentOS/RHEL7起，这种可预见的命名规则变成了默认。根据这一规则，接口名称被自动基于固件，拓扑结构和位置信息来确定。现在，即使添加或移除网络设备，接口名称仍然保持固定，而无需重新枚举，和坏掉的硬件可以无缝替换。

    * 基于接口类型的两个字母前缀:
    *   en -- 以太网
    *   sl -- 串行线路IP (slip)
    *   wl -- wlan
    *   ww -- wwan
    *
    * 名字类型:
    *   b<number>                             -- BCMA总线和新书
    *   ccw<name>                             -- CCW总线组名
    *   o<index>                              -- 车载设备的索引号
    *   s<slot>[f<function>][d<dev_port>]     -- 热插拔插槽索引号
    *   x<MAC>                                -- MAC 地址
    *   [P<domain>]p<bus>s<slot>[f<function>][d<dev_port>]
    *                                         -- PCI 位置
    *   [P<domain>]p<bus>s<slot>[f<function>][u<port>][..]1[i<interface>]
    *                                         -- USB端口号链

新的命名方案的一个小的缺点是接口名称相比传统名称有点难以阅读。例如，你可能会发现像enp0s3名字。再者，你再也无法来控制接口名了。

![](https://farm4.staticflickr.com/3854/15294996451_fa731ce12c_z.jpg)

如果由于某种原因，你喜欢旧的方式，并希望能够选择任意名称分配给CentOS/ RHEL7的设备，你需要重写默认的可预测的命名规则，定义基于MAC地址udev规则。

**下面是如何在CentOS或RHEL7命名网络接口。**

首先，让我们来禁用该可预测命名规则。对于这一点，你可以在启动时传递“net.ifnames=0”的内核参数。这是通过编辑/etc/default/grub并加入“net.ifnames=0”到GRUB_CMDLINE_LINUX变量来实现的。

![](https://farm4.staticflickr.com/3898/15315687725_c82fbef5bc_z.jpg)

然后运行这条命令来重新生成GRUB配置并更新内核参数。

    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg 

![](https://farm4.staticflickr.com/3909/15128981250_72f45633c1_z.jpg)

接下来，编辑（或创建）一个udev的网络命名规则文件（/etc/udev/rules.d/70-persistent-net.rules），并添加下面一行。更换成你自己的MAC地址（08:00:27:a9:7a:e1）和接口（sushi）。

     $ sudo vi /etc/udev/rules.d/70-persistent-net.rules 

----------

    SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="08:00:27:a9:7a:e1", ATTR{type}=="1", KERNEL=="eth*", NAME="sushi"

最后，重启电脑并验证新的接口名。

![](https://farm4.staticflickr.com/3861/15111594847_14e0c5a00d_z.jpg)

请注意，配置重命名后的接口仍然是你的责任。如果网络配置（例如，IPv4设置，防火墙规则）是基于旧名称（变更前）的，则需要更新的网络配置以反映更改的名称。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-network-interface-name-centos7.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Deployment_Guide/appe-Consistent_Network_Device_Naming.html