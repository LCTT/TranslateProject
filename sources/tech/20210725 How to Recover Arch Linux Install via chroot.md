[#]: subject: "How to Recover Arch Linux Install via chroot"
[#]: via: "https://www.debugpoint.com/2021/07/recover-arch-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Recover Arch Linux Install via chroot
======
This quick guide explains some of the steps which may come in handy to recover an Arch Linux Install.

Being a rolling release, sometimes things breaks in [Arch Linux][1]. Not because of your own actions, but hundreds of other reasons such as new Kernel vs your hardware, or software compatibility. But still, Arch Linux is still better and provides the latest packages and applications.

But sometimes, it gives you trouble and you end up with a blinking cursor and nothing else.

So, in those scenarios, instead of re-formatting or reinstalling, you may want to try to recover the installation including the data before giving up your hope. This guide outlines some steps in that direction.

### Recover Arch Linux Installation

* First step is to create a bootable LIVE USB with Arch Linux. Download the .ISO from this link and create a bootable .ISO. You can check out this guide on [how to create bootable .ISO using Etcher][2]. Remember this step require another working stable system obviously as your current system is not usable.

[download arch linux][3]

* You need to know on which partition your Arch Linux is installed. This is a very important step. If you don’t know, you can use GParted to find out. Or check in your Grub menu, Or you can run the below command to find out. This will list all of your disk partitions with their size, labels.

```
sudo lsblk -o name,mountpoint,label,size,uuid
```

* Once done, plug-in the USB stick and boot from it. And you should see the Arch Linux prompt in the LIVE medium.

* Now, mount to the Arch Linux partition using below. Change the /dev/sda3 to your respective partition.

```
/dev/sda3
```

```
mount /dev/sda3 /mntarch-chroot /mnt
```

* The arch-chroot command will mount your Arch Linux partition in the terminal, so login using your Arch credentials. Now, at this stage, you have the following options, based on what you want.

* You can take backups of your data by going through /home folders. In case, troubleshooter doesn’t work. You may copy the files to external USB or another partition.

* Verify the log files, specially the pacman logs. Because, unstable system may be caused by upgrading some packages such graphics driver or any other driver. Based on the log, you may want to downgrade any specific package if you want.
* You may use the below command to view last 200 lines of the pacman log file to find out any failing items or dependency removal.

```
tail -n 200 /var/log/pacman.log | less
```

* The above command gives you the 200 lines from the end of the pacman.log file to verify. Now, carefully check which of the packages were updates since your successful boot.

* And note down the package name and version somewhere. And you may try to downgrade packages one-by-one or if you think a specific package created a problem. Use the -U switch of pacman command to downgrade.

```
pacman -U <package name>
```

* You can run the following to start your Arch system after downgrading, if any.

```
exec /sbin/init
```

* Check the status of your display manager, whether if there are any errors. Sometimes, display manager creates a problem which can’t communicate with X Server. For example, if you are using lightdm, then you can check its status via below.

```
systemctl status lightdm
```

* Or, may want to start it via below command and check what is the error.

```
lightdm --test-mode --debug
```

* Here is an example of lightdm failure which caused an unstable Arch system.

![lightdm - test mode][4]

* Or check via kicking off the X server using startx.

```
startx
```

* In my experience, if you see errors in the above command, try to install another display manager such as sddm and enable it. It may eliminate the error.

* Try the above steps, based on the state of your system, and troubleshoot. For errors specific to display manager lightdm, we have a [guide][5] which you may want to check out.
* If you are using sddm, then check out [these troubleshooting steps][6] if something works.

### Closing Notes

Every installation is different. And above steps may/may not work for you. But it is worth a try and as per experience, it works. If it works, well, good for you. Either way, do let me know in the comment box below, how it goes.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/recover-arch-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/arch-linux
[2]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[3]: https://archlinux.org/download/
[4]: https://www.debugpoint.com/wp-content/uploads/2021/03/lightdm-test-mode.jpg
[5]: https://www.debugpoint.com/2021/03/failed-to-start-lightdm/
[6]: https://wiki.archlinux.org/title/SDDM#Troubleshooting
