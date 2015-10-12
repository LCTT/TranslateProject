Linux FAQs with Answers--How to change USB device permission permanently on Linux
================================================================================
> **Question**: I am trying to run gpsd on my Linux with a USB GPS receiver. However, I am getting the following errors from gpsd.
> 
>     gpsd[377]: gpsd:ERROR: read-only device open failed: Permission denied
>     gpsd[377]: gpsd:ERROR: /dev/ttyUSB0: device activation failed.
>     gpsd[377]: gpsd:ERROR: device open failed: Permission denied - retrying read-only 
> 
> Looks like gpsd does not have permission to access the USB device (/dev/ttyUSB0). How can I change its default permission mode permanently on Linux? 

When you run a process that wants to read or write to a USB device, the user/group of the process must have appropriate permission to do so. Of course you can change the permission of your USB device manually with chmod command, but such manual permission change will be temporary. The USB device will revert to its default permission mode when you reboot your Linux machine.

![](https://farm6.staticflickr.com/5741/20848677843_202ff53303_c.jpg)

As a permanent solution, you can create a udev-based USB permission rule which assigns any custom permission mode of your choice. Here is how to do it.

First, you need to identify the vendorID and productID of your USB device. For that, use lsusb command.

    $ lsusb -vvv 

![](https://farm1.staticflickr.com/731/20848677743_39f76eb403_c.jpg)

From the lsusb output, find your USB device's entry, and look for "idVendor" and "idProduct" fields. In this example, we have idVendor (0x067b) and idProduct (0x2303).

Next, create a new udev rule as follows.

    $ sudo vi /etc/udev/rules.d/50-myusb.rules 

----------

    SUBSYSTEMS=="usb", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", GROUP="users", MODE="0666"

Replace "idVendor" and "idProduct" values with your own. **MODE="0666"** indicates the preferred permission of the USB device.

Now reboot your machine or reload udev rules:

    $ sudo udevadm control --reload 

Then verify the permission of the USB device.

![](https://farm1.staticflickr.com/744/21282872179_9a4a05d768_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-usb-device-permission-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni