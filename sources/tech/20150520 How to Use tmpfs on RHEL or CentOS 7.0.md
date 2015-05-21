How to Use tmpfs on RHEL / CentOS 7.0
================================================================================
Today we will talk about tmpfs CentOS 7 a file system that will keep all files and folders in the virtual memory of the operating system as opposed to actually writing them to the disk. This means that all the content in tmpfs is temporary in the sense that it’s not permanently written to the disk and in case the tmpfs is unmounted, the system is rebooted or the power is cut all content will be lost. From a technical point of view tmpfs puts everything in the kernel internal cache and then grows or shrinks to accommodate the files it contains ans is able to swap unneeded pages out of swap space.

By default CentOS uses tmpfs for various things as you can see from the output of the df –h command:

    # df –h

![df](http://blog.linoxide.com/wp-content/uploads/2015/05/tmpfs1.jpg)

/dev - directory contains the special device files for all the devices.
/dev/shm – contains shared memory allocation
/run - used for system logs
/sys/fs/cgroup - used for cgroups, a kernel feature to limit, police and account the resource usage of certain processes

One use of tmpfs is to obviously use it as a /tmp folder, you can do this in 2 ways:

### Using systemctl to enable tmpfs in /tmp ###

You can use the systemctl command to enable tmpfs in the /tmp folder, first use the following command to check if this feature is not already enabled:

    # systemctl is-enabled tmp.mount

Will show the current status of settings you can use the following command to enable it:

    # systemctl enable tmp.mount

![systemctl](http://blog.linoxide.com/wp-content/uploads/2015/05/tmpfs3.jpg)

This will have the system controlling the /tmp folder and mount a tmpfs in it.

### Manually mounting a /tmp/fs ###

You can also manually add a tmpfs in /tmp by adding the following line to /etc/fstab:

    tmpfs /tmp tmpfs size=512m 0 0

And then running the mount command like this:

    # mount –a

![df](http://blog.linoxide.com/wp-content/uploads/2015/05/tmpfs2.jpg)

This should make the tmpfs show in df –h, also it will automatically mount it the next time you reboot.

### Creating a tmpfs on the fly ###

If for some reason you wish to create a tmpfs in a folder on the fly you can always use the following command:

    # mount -t tmpfs -o size=1G tmpfs /mnt/mytmpfs

Of course you can specify any size you wish in the size option and any mount point you wish, just remember it must be a valid directory.

--------------------------------------------------------------------------------

via: http://linoxide.com/file-system/use-tmpfs-rhel-centos-7-0/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/