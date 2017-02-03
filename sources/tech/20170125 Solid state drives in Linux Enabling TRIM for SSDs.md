Solid state drives in Linux: Enabling TRIM for SSDs
============================================================

 ![Solid state drives in Linux: Enabling TRIM for SSDs](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/BUSINESS_robots.png?itok=6eqf2Wjv "Solid state drives in Linux: Enabling TRIM for SSDs") 
Image by : opensource.com

After installing my first solid state drive (SSD) in a computer that was running Linux, I have begun to explore how to take care of them. Solid state drives are different than traditional magnetic drives in the way that they operate, and they require different care from the software side in order to function optimally.

On traditional magnetic drives, deleted files are not completely removed from the disk at the time of deletion. This is why you can recover deleted files. Essentially, the filesystem just references the location of a file on the disk, and when a file is deleted, that reference is erased, allowing you to write new data over old data in these blank spaces. However, with SSDs, new data can only be written on completely new or erased cells of the drive. Because the space must be cleared prior to a write, if enough free space is not already available at the time a file is being written, it must be erased first. This can negatively affect performance.

If the operating system were to erase unused space before writing new data, at a time when the device is not simultaneously trying to write, file saving performance could be improved. Enter [TRIM][1]. A TRIM command essentially allows your operating system to tell the drive which areas of data are no longer being used so that it come wipe them, speeding up the drive for future writes, and providing users of SSDs with a more optimum experience.

In Linux, **fstrim** provides this functionality, readying the drive for new data to be written and extends the life of the drive over the long term. Since trimming SSDs is not automatic on the Linux distributions that I have used, it is imperative that it be scheduled or the performance of the SSD will degrade over time.

In order to run fstrim on a drive, the drive itself, as well as the file system sitting on top of it, must support TRIM. Enabling TRIM can be done during the filesystem mounting process. For example, in order to mount the device **/dev/sda2** to **/mnt** with TRIM enabled, you would run:

```
mount -t ext4 -o discard /dev/sda2 /mnt
```

TOnce enabled, the TRIM process itself is rather simple. Trimming your SSD can also be accomplished manually on the command line or in a cron job. As a super user (using su or sudo), run **fstrim / -v** to accomplish manual trimming, or set up a cron job to run this command for you on a regular basis when your computer is not in use. And for a complete list of fstrim, options refer to its [man page][3].

Hardware support varies depending on the type of drive interface used whether PCI, [ATA][4], [SCSI][5] or [SD/MMC][6]. It's also worth consulting with your Linux vendor to learn more about how your particular distribution may support TRIM.

For example, Red Hat offers the following the [SSD disk guidelines][7]. "Performance degrades as the number of used blocks approaches the disk capacity. The degree of performance impact varies greatly by vendor. However, all devices experience some degradation. To address the degradation issue, the host system (for example, the Linux kernel) may use discard requests to inform the storage that a given range of blocks is no longer in use."

The [Debian wiki ][8]offers some basic cautions for SSD use: Use a Linux kernel 3.2 or newer, use the latest firmware for the SSD, use the EXT4 file system, and "have enough DRAM required to operate without swap space under normal workloads."

--------------------------------------------------------------------------------

作者简介：

Don Watkins - Educator, education technology specialist,  entrepreneur, open source advocate. M.A. in Educational Psychology, MSED in Educational Leadership, Linux system administrator, CCNA, virtualization using Virtual Box. Follow me at @Don_Watkins .

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds

作者：[Don Watkins][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://en.wikipedia.org/wiki/Trim_(computing)
[2]:https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds?rate=7ZBblixmfl2icbl8HWXjIfzUr3-EUjlgkOGyEhI1DK8
[3]:http://man7.org/linux/man-pages/man8/fstrim.8.html
[4]:https://en.wikipedia.org/wiki/Trim_(computing)#ATA
[5]:https://en.wikipedia.org/wiki/Trim_(computing)#SCSI
[6]:https://en.wikipedia.org/wiki/Trim_(computing)#SD.2FMMC
[7]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Storage_Administration_Guide/ch-ssd.html
[8]:https://wiki.debian.org/SSDOptimization
[9]:https://opensource.com/user/15542/feed
[10]:https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds#comments
[11]:https://opensource.com/users/don-watkins
