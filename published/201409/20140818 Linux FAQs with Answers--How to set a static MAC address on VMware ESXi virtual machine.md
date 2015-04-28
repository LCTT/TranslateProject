Linux有问必答：如何在VMware ESXi虚拟机上设置静态MAC地址
================================================================================
> **问题**:我想给VMware ESXi上的一台虚拟机分配一个静态的MAC地址。然而当我开始这么做的时候，虚拟机就不能启动了，并且抛出了一个这样一个错误"00:0c:29:1f:4a:ab is not an allowed static Ethernet address. It conflicts with VMware reserved MACs"（00:0c:29:1f:4a:ab不是一个合法的静态以太网地址。它与VMWare的保留MAC地址冲突）。我该如何在VMware ESXi虚拟机上设置静态MAC地址？

当你在VMware ESXi上创建虚拟机时，虚拟机的每个网络接口就被分配了一个动态的NAC地址。如果你想要改变默认的行为并给你的虚拟机分配一个静态MAC地址时就这样做

![](https://farm6.staticflickr.com/5592/14726591627_64c1dc67ce_z.jpg)

如你上图所见，VMWare的vSphere的GUI客户端已经有一个为虚拟机分配静态MAC地址的菜单。然而，基于GUI的方法只允许你在**00:50:56:xx:xx:xx**的范围里选择一个静态MAC地址，这是VMWare保留的MAC地址范围。如果你尝试设置任何超出这个范围的MAC地址，你就会无法启动VM，接着就会看到下面的错误。

![](https://farm6.staticflickr.com/5591/14890165456_a82ded21b9_z.jpg)

那么如果我想要给虚拟机设置任意的MAC地址怎么办？

幸运地，这里有一个对于这个限制的临时方案。方法就是，不使用vSphere GUI客户端编辑。在登录ESXi主机后直接编辑你虚拟机的.vmx文件。

首先关闭你想要分配静态MAC地址的虚拟机。

[对你的ESXi主机启用SSH访问][1]，如果你还没这么做的话。接着通过SSH登录ESXi主机。

移到你虚拟机的.vmx文件所在目录。

    # cd vmfs/volumes/datastore1/[name-of-vm] 

用文本编辑器打开.vmx文件，接着在加入下面这几行。把MAC地址替换成你自己的MAC地址。

    ethernet0.addressType = "static"
    ethernet0.checkMACAddress = "false"
    ethernet0.address = "00:0c:29:1f:4b:ac"

现在你应该可以使用你定义在.vmx文件中的静态MAC地址启动虚拟机了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/static-mac-address-vmware-esxi-virtual-machine.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/enable-ssh-remote-access-vmware-esxi5.html