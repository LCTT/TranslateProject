Linux上如何禁用 USB 存储
======
To secure our infrastructure of data breaches, we use software & hardware firewalls to restrict unauthorized access from outside but data breaches can occur from inside as well. To remove such a possibility, organizations limit & monitor the access to internet & also disable usb storage devices.

In this tutorial, we are going to discuss three different ways to disable USB storage devices on Linux machines. All the three methods have been tested on CentOS 6 & 7 machine & are working as they are supposed to . So let’s discuss all the three methods one by one,

( Also Read : [Ultimate guide to securing SSH sessions][1] )

### Method 1 – Fake install

In this method, we add a line ‘install usb-storage /bin/true’ which causes the ‘/bin/true’ to run instead of installing usb-storage module & that’s why it’s also called ‘Fake Install’ . To do this, create and open a file named ‘block_usb.conf’ (it can be something as well) in the folder ‘/etc/modprobe.d’,

$ sudo vim /etc/modprobe.d/block_usb.conf

& add the below mentioned line,

install usb-storage /bin/true

Now save the file and exit.

### Method 2 – Removing the USB driver

Using this method, we can remove/move the drive for usb-storage (usb_storage.ko) from our machines, thus making it impossible to access a usb-storage device from the mahcine. To move the driver from it’s default location, execute the following command,

$ sudo mv /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko /home/user1

Now the driver is not available on its default location & thus would not be loaded when a usb-storage device is attached to the system & device would not be able to work. But this method has one little issue, that is when the kernel of the system is updated the usb-storage module would again show up in it’s default location.

### Method 3- Blacklisting USB-storage

We can also blacklist usb-storage using the file ‘/etc/modprobe.d/blacklist.conf’. This file is available on RHEL/CentOS 6 but might need to be created on 7\. To blacklist usb-storage, open/create the above mentioned file using vim,

$ sudo vim /etc/modprobe.d/blacklist.conf

& enter the following line to blacklist the usb,

blacklist usb-storage

Save file & exit. USB-storage will now be blocked on the system but this method has one major downside i.e. any privileged user can load the usb-storage module by executing the following command,

$ sudo modprobe usb-storage

This issue makes this method somewhat not desirable but it works well for non-privileged users.

Reboot your system after the changes have been made to implement the changes made for all the above mentioned methods. Do check these methods to disable usb storage & let us know if you face any issue or have a query using the comment box below.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/disable-usb-storage-linux/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/ultimate-guide-to-securing-ssh-sessions/
