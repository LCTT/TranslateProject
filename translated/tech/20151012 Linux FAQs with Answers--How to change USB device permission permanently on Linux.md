Linux有问必答 -- 如何在LInux中永久修改USB设备权限
================================================================================
> **提问**：当我尝试在Linux中运行USB GPS接收器时我遇到了下面来自gpsd的错误。
> 
>     gpsd[377]: gpsd:ERROR: read-only device open failed: Permission denied
>     gpsd[377]: gpsd:ERROR: /dev/ttyUSB0: device activation failed.
>     gpsd[377]: gpsd:ERROR: device open failed: Permission denied - retrying read-only 
> 
> 看上去gpsd没有权限访问USB设备（/dev/ttyUSB0）。我该如何永久修改它在Linux上的权限？

当你在运行一个会读取或者写入USB设备的进程时，进程的用户/组必须有权限这么做。当然你可以手动用chmod命令改变USB设备的权限，但是手动的权限改变只是暂时的。USB设备会在下次重启时恢复它的默认权限。

![](https://farm6.staticflickr.com/5741/20848677843_202ff53303_c.jpg)

作为一个永久的方式，你可以创建一个基于udev的USB权限规则，它可以根据你的选择分配任何权限模式。下面是该如何做。

首先，你需要找出USB设备的vendorID和productID。使用lsusb命令。

    $ lsusb -vvv 

![](https://farm1.staticflickr.com/731/20848677743_39f76eb403_c.jpg)

上面lsusb的输出中，找出你的USB设备，并找出"idVendor"和"idProduct"字段。本例中,我们的结果是idVendor (0x067b)和 idProduct (0x2303)

下面创建一个新的udev规则。

    $ sudo vi /etc/udev/rules.d/50-myusb.rules 

----------

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", GROUP="users", MODE="0666"

用你自己的"idVendor"和"idProduct"来替换。**MODE="0666"**表示USB设备的权限。

现在重启电脑并重新加载udev规则：

    $ sudo udevadm control --reload 

Then verify the permission of the USB device.
接着验证USB设备的权限。

![](https://farm1.staticflickr.com/744/21282872179_9a4a05d768_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-usb-device-permission-linux.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
