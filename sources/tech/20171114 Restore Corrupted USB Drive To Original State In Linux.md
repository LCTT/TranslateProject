Restore Corrupted USB Drive To Original State In Linux
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/restore-corrupted-usb-drive-to-original-state-in-linux_orig.jpg)
Many times our storage devices like sd cards and Pen drives get corrupted and unusable due to one or other reasons.

It may be because of making a bootable media with that device , formatting via wrong platforms or creating partitions in that device.

### Restore Corrupted USB Drive to Original state

 [![linux system disk manager](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/usb.png?1510665746)][1] 

Warning : The following procedure will format all your data from your device

Whatever the reason, the final outcome is that we are not able to use that device.

So here is a solution to restoring a corrupted usb drive or sd card to its original working state.

Most of the times a simple format via the file browser solves the problem, But for extreme cases where the file manager isn’t helpful and you need your device working, you can follow this guide.

We will be using a small tool called mkusb for this purpose. The installation is easy.

Add the repository tor mkusb.

sudo apt add repository ppa:mkusb/ppa

Now, Update your package lists.

sudo apt-get update

Install mkusb

sudo apt-get install mkusb

Now launch mkusb. You will get this prompt, click ‘Yes’.

 [![run mkusb dus](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/run-mkusb.png?1510498592)][2] 

Now mkusb will ask you one last time if you wish to proceed with the formatting of the data, ‘Stop’ will be selected by default. You now select ‘Go’ and click ‘OK’.

 [![linux mkusb](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/final-checkpoint_1.png?1510499627)][3] 

​The window will close and your terminal will look like this.

 [![mkusb usb console](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/mkusb.png?1510499982)][4] 

In a few seconds, the process will be completed and you will get a window popup like this.

 [![restore corrupted usb drive](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/usb_1.png?1510500412)][5] 

You need to now remove the device from the system and plug it back in. Your device is Restored to a normal device and it will function properly like before.

 [![linux disk manager](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/editor/usb_2.png?1510500457)][6] 

Now I know all of these could have been done via terminal commands, gparted or some other software etc. But that would require some level of knowledge about partition management.

​So it’s always good to have a small tool like this to automate the boring work for you.

### Conclusion

**mkusb**

is a fairly easy to use program that can help you repair your usb storage devices and sd cards. It is available through the mkusb ppa as mkusb. All operations on mkusb will require superuser permissions and all your data on that device will be formatted.

​

Once the operation is completed You will have to reattach the device to make it work. ​

​If you have any queries feel free to post them in the comments section below.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/restore-corrupted-usb-drive-to-original-state-in-linux

作者：[LINUXANDUBUNTU][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/usb.png
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/run-mkusb.png
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/final-checkpoint_1.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/mkusb.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/usb_1.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/usb_2.png
