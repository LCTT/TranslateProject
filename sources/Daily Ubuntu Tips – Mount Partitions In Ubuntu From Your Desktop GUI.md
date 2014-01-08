翻译ing Luox

Daily Ubuntu Tips – Mount Partitions In Ubuntu From Your Desktop GUI
================================================================================
Not very long ago if you had asked a seasoned Linux user how to mount partitions in Ubuntu, they would’ve told you to use the fstab file in the **/etc/** directory. It seemed like this was the only way to mount partitions in Linux systems, including Ubuntu.

Well, not anymore thanks to [GNOME Disk Utility][1]. With Disks, you can now mount partitions easily from the GUI without ever touching the fstab file from the command line. The fstab file is a Linux file that lists available disks and partitions, and indicates how they are mounted.

The mount command looks in the fstab file and determine how and where these devices should be mounted. It’s only accessed by the system administrator or root.

This brief tutorial is going to show you how to easily mount partitions in Ubuntu without touching the fstab file. For new users and those who are just starting out with Ubuntu, they should find this method easy to use when mounting external partitions or drives.

There are some tools that may help you build the fstab file, but few can do it as efficiently as Disks in Ubuntu.

If you open the fstab file in Ubuntu, you’ll see something like what’s below.

    #<File System>  <Mount Point>    <type>   <options>  <dump>  <pass>
    /dev/fd0      /media/floppy0    vfat    rw,user,noauto    0   0       

These line above are just a sample of how partitions are mounted in Ubuntu. Each device gets its own file types and mount points. For those starting out with Ubuntu, this can be intimidating.

For seasoned Linux users, administering the fstab file isn’t difficult. If you’ve done it once, the next should be easy.

So, here you go. To add an entry in the fstab file or mount a partition, go to Unity Dash and open **Disk app**. When it opens, select the drive you wish to mount and format it.  After formatting it, select **Option –> Edit Mount Options**.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/mountguiubuntu.png)

Finally, turn off auto mount options and manually specify your mount options. The Disk will automatically inserts these options in the fstab file so the mount command can read and mount the partition.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/mountguiubuntu1.png)

Save your settings and restart or hit the mount command to mount the partition.

The options above will look like this in the fstab file.

    /dev/sdb /media/richard/ExtPartition ntfs-3g rw,auto,user,fmask=0111,dmask=0000 0 0

Yep, that’s it! The new partition will be mounted every time you start your machine.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-mount-partitions-in-ubuntu-from-your-desktop-gui/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.gnome.org/Design/Apps/Disks
