Translating----geekpi

Linux FAQs with Answers--How to mount an LVM partition on Linux
================================================================================
> **Question**: I have an external USB drive which contains several LVM partitions on it. I want to access some of those LVM partitions on my Linux. How can I mount an LVM partition on Linux? 

LVM is a logical volume management tool which allows you to manage disk space using the notion of logical volumes and volume groups. The biggest benefit of using LVM over classic partitions is the flexibility in allocating storage for users and applications without being constrained by the size of individual physical disks. 

In LVM, the physical storage, on which logical volumes are created, is traditional partitions (e.g., /dev/sda2, /dev/sdb1). These partitions must be initialized as "physical volumes" and labeled so (e.g., "Linux LVM") in order for them to be used in LVM. Once the partitions are labeled as LVM volumes, you cannot mount them directly with mount command.

If you attempt to mount an LVM partition (e.g., /dev/sdb2), you will get the following error.

    $ mount /dev/sdb2 /mnt

----------

    mount: unknown filesystem type 'LVM2_member'

![](https://farm8.staticflickr.com/7696/17749902190_0a6d36821f_b.jpg)

If you want to mount an LVM partition properly, you must instead mount "logical volumes" created inside the partition. Here is how to to it.

First, examine a list of available volume groups by running:

    $ sudo pvs 

----------
  
    PV         VG                           Fmt  Attr PSize   PFree
    /dev/sdb2  vg_ezsetupsystem40a8f02fadd0 lvm2 a--  237.60g    0 

![](https://farm8.staticflickr.com/7657/17938136831_d9320b7bfc_b.jpg)

The names of available physical volumes and volume groups are listed under PV and VG columns, respectively. In this example, there is a single volume group named "vg_ezsetupsystem40a8f02fadd0" created on /dev/sdb2.

Next, let's check what logical volumes exist inside this volume group. For that, use lvdisplay command:

    $ sudo lvdisplay <volume-group-name>

Running lvdisplay shows information about available logical volumes (e.g., device name, volume name, volume size, etc) as shown below.

    $ sudo lvdisplay /dev/vg_ezsetupsystem40a8f02fadd0 

----------

      --- Logical volume ---
      LV Path                /dev/vg_ezsetupsystem40a8f02fadd0/lv_root
      LV Name                lv_root
      VG Name                vg_ezsetupsystem40a8f02fadd0
      LV UUID                imygta-P2rv-2SMU-5ugQ-g99D-A0Cb-m31eet
      LV Write Access        read/write
      LV Creation host, time livecd.centos, 2015-03-16 18:38:18 -0400
      LV Status              available
      # open                 0
      LV Size                50.00 GiB
      Current LE             12800
      Segments               1
      Allocation             inherit
      Read ahead sectors     auto
      - currently set to     256
      Block device           252:0

![](https://farm8.staticflickr.com/7707/17938137591_cdb4cbfb43_b.jpg)

If you want to mount a particular logical volume, use its device name shown in "LV Path" (e.g., /dev/vg_ezsetupsystem40a8f02fadd0/lv_home) as follows.

    $ sudo mount /dev/vg_ezsetupsystem40a8f02fadd0/lv_home /mnt 

You can check the mount status by running mount command without any argument, which will show you a list of all mounted filesystems.

    $ mount 

![](https://farm6.staticflickr.com/5449/17749903670_2ee617445d_c.jpg)

If you want to have a logical volume to be mounted automatically on boot, add the following line in /etc/fstab. You need to specify the file system type (e.g., EXT4) of the volume, which you can find out from the output of mount command above.

    /dev/vg_ezsetupsystem40a8f02fadd0/lv_home /mnt ext4 defaults 0 0

Now the logical volume will be automatically mounted at /mnt upon boot.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/mount-lvm-partition-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni