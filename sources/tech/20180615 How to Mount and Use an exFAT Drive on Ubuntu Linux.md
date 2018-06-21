translating----geekpi

How to Mount and Use an exFAT Drive on Ubuntu Linux
======
**Brief: This quick tutorial shows you how to enable exFAT file system support on Ubuntu and other Ubuntu-based Linux distributions. This way you won’t see any error while mounting exFAT drives on your system.**

### Problem mounting exFAT disk on Ubuntu

The other day, I tried to use an external USB key formatted in exFAT format that contained a file of around 10 GB in size. As soon as I plugged the USB key, my Ubuntu 16.04 throw an error complaining that it **cannot mount unknown filesystem type ‘exfat’**.

![Fix exfat drive mount error on Ubuntu Linux][1]

The exact error message was this:
**Error mounting /dev/sdb1 at /media/abhishek/SHADI DATA: Command-line `mount -t “exfat” -o “uhelper=udisks2,nodev,nosuid,uid=1001,gid=1001,iocharset=utf8,namecase=0,errors=remount-ro,umask=0077” “/dev/sdb1” “/media/abhishek/SHADI DATA”‘ exited with non-zero exit status 32: mount: unknown filesystem type ‘exfat’**

### The reason behind this exFAT mount error

Microsoft’s favorite [FAT file system][2] is limited to files up to 4GB in size. You cannot transfer a file bigger than 4 GB in size to a FAT drive. To overcome the limitations of the FAT filesystem, Microsoft introduced [exFAT][3] file system in 2006.

As most of the Microsoft related stuff are proprietary, exFAT file format is no exception to that. Ubuntu and many other Linux distributions don’t provide the proprietary exFAT file support by default. This is the reason why you see the mount error with exFAT files.

### How to mount exFAT drive on Ubuntu Linux

![Fix exFAT mount error on Ubuntu Linux][4]

The solution to this problem is simple. All you need to do is to enable exFAT support.

I am going to show the commands for Ubuntu but this should be applicable to other Ubuntu-based distributions such as [Linux Mint][5], elementary OS etc.

Open a terminal (Ctrl+Alt+T shortcut in Ubuntu) and use the following command:
```
sudo apt install exfat-fuse exfat-utils

```

Once you have installed these packages, go to file manager and click on the USB disk again to mount it. There is no need to replug the USB. It should be mounted straightaway.

#### Did it help you?

I hope this quick tip helped you to fix the exFAT mount error for your Linux distribution. If you have any further questions, suggestions or a simple thanks, please use the comment box below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/mount-exfat/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/exfat-mount-error-linux.jpeg
[2]:http://www.ntfs.com/fat-systems.htm
[3]:https://en.wikipedia.org/wiki/ExFAT
[4]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/06/exfat-mount-error-featured-800x450.jpeg
[5]:https://linuxmint.com/
