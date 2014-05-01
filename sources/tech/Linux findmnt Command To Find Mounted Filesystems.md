[zzlyzq translating...]
Linux findmnt Command To Find Mounted Filesystems
================================================================================
The command findmnt is used to find mounted filesystems in Linux. This command will look for a particular filesystem in /etc/fstab, /etc/mtab or /proc/self/mountinfo.

### How To Install findmnt ###

The command findmnt comes in the package util-linux-ng, now renamed util-linux. The package comes with several other utilities such as hwclock. To install findmnt [download util-linux][1] from kernel.org ftp page.

### How To Install findmnt In Fedora ###

Fedora users can install the package as follows:

    $ sudo yum install util-linux-ng

### Findmnt Default option ###

This command by default will give you a list of all filesystems mounted if no mountpoint or device is specified.

    $ findmnt

![findmnt default](http://linoxide.com/wp-content/uploads/2014/03/findmnt-default.png)

### Findmnt Polling Mode ###

The command findmnt can be used to monitor changes in /proc/self/mountinfo file. The polling mode can be invoked by tying in your terminal the following command:

    $ findmnt -p

alternatively

    $ findmnt --poll

Any changes made to /proc/self/mountinfo file will automatically be updated on the terminal. At first you will not see any output but if try unplug and plugging your flash drive, the changes are reflected on the terminal as in the following example.

![findmnt poll](http://linoxide.com/wp-content/uploads/2014/03/findmnt-poll.png)

The time which polling mode will block can be restricted by **--timeout** or **--first-only** option.

### Timeout option ###

This option can be used along with --poll to limit the time polling mode will block to the time you explicitly set. **The timeout to be set is in milliseconds**. After the timeout period findmnt will no longer monitor for changes to the /proc/self/mountinfo file.

    $ findmnt --poll --timeout 6000

![findmnt poll timeout](http://linoxide.com/wp-content/uploads/2014/03/findmnt-poll-timeout.png)

### First-only option ###

The first-only option will monitor for changes in the /proc/self/mountinfo file only for the first change and the command will no longer be in polling mode. The first change is displayed on the terminal and the prompt is returned to you. To use this option type on your terminal:

    $ findmnt --poll --first-only

![findmnt poll first-only](http://linoxide.com/wp-content/uploads/2014/03/findmnt-poll-first-only.png)

### Imitating the command df output option ###

The command findmnt can also be used to imitate the output you would get if you used the df command. You can achieve this by running the command findmnt with the **--df** option as shown the following example.

    $ findmnt --df

or

    $ findmnt -D

This will give an almost identical output if you had run the command **df** with the **-h** option.

    $ df -h

![findmnt imitate df](http://linoxide.com/wp-content/uploads/2014/03/findmnt-imitate-df.png)

### Findmnt list option ###

If you do not like the default tree output you can use the **--list** or **-l** option. This will print for you an output in a list format.

    $ findmnt --list

Running this command will give you an output as follows:

![findmnt list](http://linoxide.com/wp-content/uploads/2014/03/findmnt-list.png)

### Findmnt Evaluate Option ###

The evaluate option will convert all tags for example LABEL, UUID, PARTUUID or PARTLABEL to the actual device name. This option can be combined with **--fstab** option to print all the filesystems in /etc/fstab. The **--fstab** option has its output in list format, and therefore there is no need to call the **--list** option when **--fstab** is used.

    $ findmnt --fstab --evaluate

When the two options are combined as follows, the output will look like the example below:

![findmnt fstab evaluate](http://linoxide.com/wp-content/uploads/2014/03/findmnt-fstab-evaluate.png)

### Findmnt type option ###

This option allows you to limit the set of printed filesystems. Multiple filesystems can be specified and separated by a coma. In this example the command will search for ext4, ext3 and vfat filesystems.

    $ findmnt -t ext4,ext3,vfat

![findmnt types](http://linoxide.com/wp-content/uploads/2014/03/findmnt-types.png)

### Conclusion ###

You can try out the different options for findmnt depending on your needs.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/powerful-findmnt-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:ftp://ftp.kernel.org/pub/linux/utils/util-linux/
