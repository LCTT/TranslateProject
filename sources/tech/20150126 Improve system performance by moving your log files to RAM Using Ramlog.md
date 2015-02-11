translating by soooogreen
Improve system performance by moving your log files to RAM Using Ramlog
================================================================================
Ramlog act as a system daemon. On startup it creates ramdisk, it copies files from /var/log into ramdisk and mounts ramdisk as /var/log. All logs after that will be updated on ramdisk. Logs on harddrive are kept in folder /var/log.hdd which is updated when ramlog is restarted or stopped. On shutdown it saves log files back to harddisk so logs are consistent. Ramlog 2.x is using tmpfs by default, ramfs and kernel ramdisk are suppored as well. Program rsync is used for log synchronization.

Note: Logs not saved to harddrive are lost in case of power outage or kernel panic.

Install ramlog if you have enough of free memory and you want to keep your logs on ramdisk. It is good for notebook users, for systems with UPS or for systems running from flash -- to save some write cycles.

How it works and what it does:

1.Ramlog starts among the first daemons (it depends on other daemons you have installed).

2.Directory /var/log.hdd is created and hardlinked to /var/log.

3.In case tmpfs (default) or ramfs is used, it is mounted over /var/log

If kernel ramdisk is used, ramdisk created in /dev/ram9 and it is mounted to /var/log, by default ramlog takes all ramdisk memory specified by kernel argument "ramdisk_size".

5.All other daemons are started and all logs are updated in ramdisk. Logrotate works on ramdisk as well.

6.In case ramlog is restarted (by default it is one time per day), directory /var/log.hdd is synchronized with /var/log using rsync. Frequency of the automatic log saves can be controller via cron, by default, the ramlog file is placed into /etc/cron.daily

7.On shutdown ramlog shuts among the last daemons.

8. During ramlog stop phase files from /var/log.hdd are synchronized with /var/log
Then /var/log is unmounted, /var/log.hdd is unmounted as well and empty directory /var/log.hdd is deleted. 

**Note:- This article is for advanced users only**

### Install Ramlog in Ubuntu ###

First you need to download the .deb package from [here][1] using the following command

    wget http://www.tremende.com/ramlog/download/ramlog_2.0.0_all.deb

Now you should be having ramlog_2.0.0_all.deb package install this package using the following command

    sudo dpkg -i ramlog_2.0.0_all.deb

This will complete the installation now you need to run the following commands

    sudo update-rc.d ramlog start 2 2 3 4 5 . stop 99 0 1 6 .

#Now update sysklogd in init levels, so it is stopped properly before ramlog is stopped:

    sudo update-rc.d -f sysklogd remove

    sudo update-rc.d sysklogd start 10 2 3 4 5 . stop 90 0 1 6 .

Now you need to restart your system

    sudo reboot

After rebooting you need to run ‘ramlog getlogsize' to determine the size of your actual /var/log.Add about 40% to that number to ensure your ramdisk has sufficient size -- this will be the ramdisk size

Edit your boot manager config file such as /etc/grub.conf, /boot/grub/menu.lst or /etc/lilo.conf and add update the actual kernel by adding kernel paramter ‘ramdisk_size=xxx' where xxx is calculated ramdisk size

### Configuring Ramlog ###

Ramlog configuration file is located in /etc/default/ramlog on deb based systems and you can set there below variables:

Variable (with default value):

Description: 

    RAMDISKTYPE=0
    # Values:
    # 0 -- tmpfs (can be swapped) -- default
    # 1 -- ramfs (no max size in older kernels,
    # cannot be swapped, not SELinux friendly)
    # 2 -- old kernel ramdisk
    TMPFS_RAMFS_SIZE=
    #Maximum size of memory to be used by tmpfs or ramfs.
    # The value can be percentage of total RAM or size in megabytes -- for example:
    # TMPFS_RAMFS_SIZE=40%
    # TMPFS_RAMFS_SIZE=100m
    # Empty value means default tmpfs/ramfs size which is 50% of total RAM.
    # For more options please check ‘man mount', section ‘Mount options for tmpfs'
    # (btw -- ramfs supports size limit in newer kernels
    # as well despite man says there are no mount options)
    # It has only effect if RAMDISKTYPE=0 or 1
    KERNEL_RAMDISK_SIZE=MAX
    #Kernel ramdisk size in kilobytes or MAX to use entire ramdisk.
    #It has only effect if RAMDISKTYPE=2
    LOGGING=1
    # 0=off, 1=on Logs can be found in /var/log/ramdisk
    LOGNAME=ramlog
    # name of the ramlog log file (makes sense if LOGGING=1)
    VERBOSE=1
    # 0=off, 1=on (if 1, teststartstop puts detials
    # to the logs and it is called after start or stop fails) 

### How to uninstall Ubuntu ###

Open the terminal and run the following command

    sudo dpkg -P ramlog

Note: If ramlog was running before you uninstalled it, you should reboot your box to finish uninstallation procedure.

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/improve-system-performance-by-moving-your-log-files-to-ram-using-ramlog.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.tremende.com/ramlog/download/ramlog_2.0.0_all.deb
