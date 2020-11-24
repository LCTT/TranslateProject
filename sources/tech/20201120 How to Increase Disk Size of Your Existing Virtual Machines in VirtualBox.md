[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Increase Disk Size of Your Existing Virtual Machines in VirtualBox)
[#]: via: (https://itsfoss.com/increase-disk-size-virtualbox/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Increase Disk Size of Your Existing Virtual Machines in VirtualBox
======

Here’s the scenario you may come across sooner or later.

You installed one or more operating systems in [VirtualBox][1]. While creating those virtual operating systems, you also created virtual hard disks for them in VirtualBox.

You specified the maximum size of the virtual disk to say 15 or 20 GB but now after using it for some time, you realize that your virtual machine is running out of space.

While [there are ways to free up disk space on Ubuntu][2] and other operating systems, a more robust way of handling the situation is to increase the disk size of your virtual machines created in VirtualBox.

Yes, you can enlarge the virtual hard disk in VirtualBox even after creation. Although this is a safe and tested procedure, it is highly recommended to create a backup of your virtual machine before you perform such an action.

### How to enlarge VirtualBox disk size

![][3]

I will show you how to resize disk in VirtualBox graphically and via command line (for Linux geeks). Both methods are easy and straightforward.

#### Method 1: Using the Virtual Media Manager in VirtualBox

VirtualBox 6 added a graphical option for resizing virtual disks. You can find it at the file tab of VirtualBox home page.

Go to _**File-&gt;Virtual Media Manager**_:

![][4]

Select one of your virtual machines in the list and use the “Size” slider or type the size value that you need. Once done click “Apply”.

![][5]

Keep in mind that though you increased the size of your virtual disk, the **actual partition size remains the same if your space is dynamically allocated**.

#### Method 2: Increase VirtualBox disk space using Linux command line

If you are using a Linux operating system as a host, open the terminal and type the following command to resize VDI:

```
VBoxManage modifymedium "/path_to_vdi_file" --resize <megabytes>
```

The resize process should finish right after you click the enter button to execute the command.

Note

The commands **modifyvdi** and **modifyhd** of earlier versions of VirtualBox commands are also supported and mapped internally to the **modifymedium** command.

![][6]

If you are not sure where your virtual machines are saved, you can find the default location from the VirtualBox home page by clicking on **Files -&gt; Preferences** or by using the keyboard shortcut **Ctrl+G**.

![][7]

#### Conclusion

Personally, I prefer to use the terminal on every Linux distribution that I use for expanding disk, the graphical option is a very handy addition to the latest VirtualBox release.

This is an easy and quick tip but a great addition to VirtualBox fundamentals. If you find this tip useful, check out a few features of [VirtualBox guest additions][8].

--------------------------------------------------------------------------------

via: https://itsfoss.com/increase-disk-size-virtualbox/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.virtualbox.org/
[2]: https://itsfoss.com/free-up-space-ubuntu-linux/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/enlarge-disk-size-virtualbox.png?resize=800%2C450&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/1-virtual-box-media-manager.png?resize=800%2C600&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/2-virtual-box-increase-disc-space.png?resize=800%2C505&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/3-virtual-box-increase-disc-space-terminal.png?resize=800%2C600&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/4-virtual-box-preferences.png?resize=800%2C450&ssl=1
[8]: https://itsfoss.com/install-fedora-in-virtualbox/
