[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Extend the life of your SSD drive with fstrim)
[#]: via: (https://opensource.com/article/20/2/trim-solid-state-storage-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Extend the life of your SSD drive with fstrim
======
A new systemd service to make your life easier.
![Linux keys on the keyboard for a desktop computer][1]

Over the past decade, solid-state drives (SSD) have brought about a new way of managing storage. SSDs have benefits like silent and cooler operation and a faster interface spec, compared to their elder spinning ancestors. Of course, new technology brings with it new methods of maintenance and management. SSDs have a feature called TRIM. This is essentially a method for reclaiming unused blocks on the device, which may have been previously written, but no longer contain valid data and therefore, can be returned to the general storage pool for reuse. Opensource.com’s Don Watkins first wrote about TRIM in his 2017 article ["Solid-state drives in Linux: Enabling TRIM for SSDs."][2]

If you have been using this feature on your Linux system, then you are probably familiar with the two methods described below.

### The old ways

#### Discard

I initially enabled this with the discard option to the mount command. The configuration is placed into the **/etc/fstab** file for each file system.


```
# cat /etc/fstab
UUID=3453g54-6628-2346-8123435f  /home  xfs  defaults,discard   0 0
```

The discard option enables automatic online TRIM. There has recently been debate on whether this is the best method due to possible negative performance impacts. Using this option causes a TRIM to be initiated every time new data is written to the drive. This may introduce additional activity that interferes with storage performance.

#### Cron

I removed the discard option from the **fstab** file. Then I created a cron job to call the command on a scheduled basis.


```
# crontab -l
@midnight /usr/bin/trim
```

This is the method I used most recently on my Ubuntu Linux systems until I learned about another way.

### A new TRIM service

I recently discovered that a systemd service for TRIM exists. Fedora [introduced][3] this into their distribution in version 30, and, although it is not enabled by default in versions 30 and 31, it is planned to be in version 32. If you’re working on Fedora Workstation 31 and you want to begin using this feature, you can enable it very easily. I’ll also show you how to test it below. This service is not unique to Fedora. The existence and status will depend on an individual distribution basis.

#### Test

I like to test first, to better understand what is happening behind the scenes. I do this by opening a terminal and issuing the command that the service is configured to call.


```
`/usr/sbin/fstrim --fstab --verbose --quiet`
```

The **–help** argument to **fstrim** will describe these and other arguments.


```
$ sudo /usr/sbin/fstrim --help

Usage:
 fstrim [options] &lt;mount point&gt;

Discard unused blocks on a mounted filesystem.

Options:
 -a, --all           trim all supported mounted filesystems
 -A, --fstab         trim all supported mounted filesystems from /etc/fstab
 -o, --offset &lt;num&gt;  the offset in bytes to start discarding from
 -l, --length &lt;num&gt;  the number of bytes to discard
 -m, --minimum &lt;num&gt; the minimum extent length to discard
 -v, --verbose       print number of discarded bytes
     --quiet         suppress error messages
 -n, --dry-run       does everything, but trim

 -h, --help          display this help
 -V, --version       display version
```

So, now I can see that the systemd service is configured to run the trim on all supported mounted filesystems in my **/etc/fstab** file **–fstab** and print the number of discarded bytes **–verbose** but suppress any error messages that might occur **–quiet**. Knowing these options is helpful for testing. For instance, I can start with the safest one, which is the dry run. I’ll also leave off the quiet argument so I can determine if any errors will occur with my drive setup.


```
`$ sudo /usr/sbin/fstrim --fstab --verbose --dry-run`
```

This will simply show what the **fstrim** command will do based on the file systems that it finds configured in your **/etc/fstab** file.


```
`$ sudo /usr/sbin/fstrim --fstab --verbose`
```

This will now send the TRIM operation to the drive and report on the number of discarded bytes from each file system. Below is an example after my recent fresh install of Fedora on a new NVME SSD.


```
/home: 291.5 GiB (313011310592 bytes) trimmed on /dev/mapper/wkst-home
/boot/efi: 579.2 MiB (607301632 bytes) trimmed on /dev/nvme0n1p1
/boot: 787.5 MiB (825778176 bytes) trimmed on /dev/nvme0n1p2
/: 60.7 GiB (65154805760 bytes) trimmed on /dev/mapper/wkst-root
```

#### Enable

Fedora Linux implements systemd timer service, scheduled to run on a weekly basis. To check the existence and current status, run **systemctl status**.


```
`$ sudo systemctl status fstrim.timer`
```

Now, enable the service.


```
`$ sudo systemctl enable fstrim.timer`
```

#### Verify

Then you can verify that the timer is enabled by listing all of the timers.


```
`$ sudo systemctl list-timers --all`
```

The following line referring to the **fstrim.timer** will appear. Notice that the timer actually activates **fstrim.service**. This is from where the actual **fstrim** is called. The time-related fields show **n/a** because the service has just been enabled and has not run yet.


```
NEXT   LEFT    LAST   PASSED   UNIT           ACTIVATES
n/a    n/a     n/a    n/a      fstrim.timer   fstrim.service
```

### Conclusion

This service seems like the best way to run TRIM on your drives. It is much simpler than having to create your own crontab entry to call the **fstrim** command. It is also safer not having to edit the **fstab** file. It has been interesting to watch the evolution of solid-state storage technology and nice to know that it appears Linux is moving toward a standard and safe way to implement it.

In this article, learn how solid state drives differ from traditional hard drives and what it means...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/trim-solid-state-storage-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://opensource.com/article/17/1/solid-state-drives-linux-enabling-trim-ssds
[3]: https://fedoraproject.org/wiki/Changes/EnableFSTrimTimer (Fedora Project WIKI: Changes/EnableFSTrimTimer)
