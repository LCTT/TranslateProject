翻译中 by TImeszoro

Daily Ubuntu Tips — Windows Disk Management Equivalent In Ubuntu
================================================================================
For new users just starting out with Ubuntu who have some knowledge of Microsoft Windows, one question keeps coming up in most Ubuntu forums online. One of our readers asked us the same questions few days ago.

> What is Windows Disk Management Equivalent in Ubuntu?

For those who don’t know about Disk Management, here’s a brief summary.

Disk Management is a tool that comes with Windows by default beginning with Windows XP. It performs disk-related task such as creating and formatting volumes, initializing disks, resizing partitions, assigning drive letters and deleting partitions.

It uses the DiskPart command along with related command-line tools to perform disk management task from the command-line in Windows. It is a very powerful tool in Windows.

The question is, is there a Ubuntu equivalent? The answer is Yes.

Ubuntu comes with similar tool called GNOME Disk Utility. It’s a tool to view / manage disk drives, modify partitions, create and restore disk images and more. You can also use it to format and create partitions, mount and unmount volumes, and other disk related tasks.

Although it similar to Disk Management in Windows, it doesn’t allow you to resize partitions and volumes. Since Ubuntu doesn’t support drive letters, it doesn’t do that as well.

So, for disk management equivalent in Ubuntu, look at GNOME Disk Utility.

To access it, open Unity Dash and search for Disks. When it opens, it should automatically recognize external drives or additional hard drives that are attached to your machine.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/dropboxubuntumissingfolder3.png)

Once the drive is selected, you can then perform disk-related tasks such as formatting, creating partitions and managing your drives. Other settings you can configure is standby mode for your disk where it puts the drive in standby mode after timeouts.

Something to remember is when you’re formatting a drive to use on both Ubuntu and Windows, use NTFS file system.

So, use Disks to configure you drives in Ubuntu.

Enjoy! And Happy New Year!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-windows-disk-management-equivalent-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
