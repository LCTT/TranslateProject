WinUSB: Create A Bootable Windows USB In Linux
==========
Hello Guys,

Am not coming to promote the use of Microsoft Windows here. But this about how to create a bootable from Linux as you know, there is one this tools on Windows, Power ISO which does the job very well too.

You might remember at point in college or house when someone needs to create a bootable windows USB either from a DVD or .ISO file but you are not on a Microsoft Windows to do this with either Power ISO, etc.

On Linux you can Unetbootin, but newer Unetbootin versions  no longer support, but you can use older versions and you need to format the USB to NTFS before doing this.  Which is some how complicated to new users.

Today am going to introduce you to the **winusb** tool, if you have never heard about it, no problem just continue reading.

**[WinUSB](http://congelli.eu/prog_info_winusb.html)** is a simple command line tool used to create Windows Installation’s or bootable USB stick under Linux.

First we have to install **winusb** and then we look at how to use it.

Installing **winusb** via PPA:

$ sudo add-apt-repository ppa:colingille/freshlight $ sudo apt-get update $ sudo apt-get install winusb - See more at: http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/#sthash.ZPxLBx2c.dpuf

    $ sudo add-apt-repository ppa:colingille/freshlight
    $ sudo apt-get update
    $ sudo apt-get install winusb

WinUSB also works from the command line (terminal), we can create a Windows 7 or Windows Vista USB installer by running the following commands from the terminal (as a root user):

    $ sudo winusb --format <iso path> <device>

**Example :**

    $ sudo winusb --format Desktop/SETHO/Win7.iso /dev/sdc1

where **Desktop/SETHO/Win7.iso** is the path of the .iso file and **/dev/sdc1** is the device path. (**Note**: to get the device path use the **df** command)

To install a Windows ISO on **NTFS** partition and edit the Master Boot Record (MBR) of the device use the following commands:

    $ sudo winusb --install <iso path> <partition>

**Example :**

    $ sudo winusb --format Desktop/SETHO/Win7.iso /dev/sdd1

where **/dev/sdd1** is the partition path.

**WinUSB** also has the Graphical User Interface (GUI) if you don’t like the command line, but you must try to learn hoe to love the command line now. Which is also simple to understand.

This can be launched from the dash:

**Dash > WinUSB**

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/WinUSB_dash.png)

After launching, you select the .iso and the device, then click on install.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/WinUSB.png)



via:http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://www.linux.cn/
[译者ID]:http://www.linux.cn/space/译者ID
[校对者ID]:http://www.linux.cn/space/校对者ID

[1]:http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/
[2]:http://congelli.eu/prog_info_winusb.html