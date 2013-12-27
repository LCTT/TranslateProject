[marked stduolc]
Linux iostat Command to Report CPU Statistics and I/O Statistics
================================================================================
A Central Processing Unit or CPU is the brain of the computer. All of processing command is run here. Input / Ouput or I/O also play critical roles. The disks is used to provide data to processor and keeps the data which has been processed by CPU. One of the methods for measuring processor utilization and I/O utilization is to use **iostat** command. From its utilization we can decide do we need to add more resources or not.

### What is iostat ###

iostat command is a command that used for monitoring system input/output device loading by observing the time the devices are active in relation to their average transfer rates. The iostat create reports that can be used to change system configuration to better balance the input/output between physical disks.

### Installing iostat ###

iostat is included in **sysstat** package. If you don’t have it, you need to install first.

#### On RedHat / CentOS / Fedora ####

    # yum install sysstat

#### On Debian / Ubuntu / Linux Mint ####

    $ sudo apt-get install sysstat

#### How to run iostat ####

To run it, just **type iostat** in your console. Here’s a sample.

    $ iostat

![iostat default report](http://linoxide.com/wp-content/uploads/2013/12/iostat_default.png)

#### Here’s how to read iostat reports ####

#### The first section contains CPU report ####

- **%user** : show the percentage of CPU utilization that occured while executing at the user (application) level
- **%nice** : show the percentage of CPU utilization that occured while executing at the user level with nice priority
- **%system** : show the percentage of CPU utilization that occured while executing at the system (kernel) level
- **%iowait** : show the percentage of the time that the CPU or CPUs were idle during whcih the system had an outstanding disk I/O request
- **%steal** : show the percentage of time spent in involuntary wait by the virtual CPU or CPUs while the hypervisor was servicing another virtual processor
- **%idle** : show the percentage of time that the CPU or CPUs were idle and the system did not have an outstanding disk I/O request

#### The second section contains device utilization report ####

- **Device** : device / partition name as listed in **/dev** directory
- **tps** : show the number of transfers per second that were issued to the device. Higher tps means the processor is busier
- **Blk_read/s** : show the amount of data read from the device expressed in a number of blocks (kilobytes, megabytes) per second
- **Blk_wrtn/s** : show the amount of data written to the device expressed in a number of blocks (kilobytes, megabytes) per second
- **Blk_read** : show the total number of blocks read
- **Blk_wrtn** : show the total number of blocks written

### Capture iostat with kilobytes or megabytes ###

By default iostat measure the I/O system with bytes unit. To make it easier to read, we can convert iostat to show us reports in kilobytes or megabytes unit. Just add **-k parameter** to create reports with **kilobytes unit** and **-m parameter** to create reports with **megabytes unit**.

    $ iostat -k

![iostat with kilobytes](http://linoxide.com/wp-content/uploads/2013/12/iostat_k.png)

    $ iostat -m

![iostat megabytes unit](http://linoxide.com/wp-content/uploads/2013/12/iostat_m.png)

To extend the reports we can use **-x parameter** after iostat command.

    $ iostat -x

![extend iostat report](http://linoxide.com/wp-content/uploads/2013/12/iostat_x.png)

### Using iostat with delay ###

Same with [vmstat][1], as a statistic tool the best way to use it is with delay parameter. With delay, we can see what’s the trend. Here are some samples to run iostat with delay.

#### Run iostat with kilobytes unit, 2 seconds interval with 3 times reports ####

    $ iostat -k 2 3

![iostat reports in kilobytes](http://linoxide.com/wp-content/uploads/2013/12/iostat_k_2_3.png)

#### Show CPU only report with 3 seconds interval and 6 times reports ####

    $ iostat -c 3 6

![iostat cpu only with delay 3 seoncds](http://linoxide.com/wp-content/uploads/2013/12/iostat_c_3_6.png)

#### Show hda2 and hda6 device only report with 2 seconds interval and 4 times reports ####

    $ iostat -d hda2 hda6 2 4

![iostat disk only](http://linoxide.com/wp-content/uploads/2013/12/iostat_d_hda2_hda6_2_4.png)

### Files ###

iostat use these files to create reports.

**/proc/stat** which contains system statistics
**/proc/partitions** which contains disk statistics (for pre 2.5 kernel that have been patched)
**/proc/diskstats** contains disks statistics (for post 2.5 kernel)
**/sys** which contains statistics for block devices (post 2.5 kernel)

### Conclusion ###

With vmstat to monitor memory usage, iostat to monitor CPU usage and I/O system then we have a complete tool to monitor three critical components in your machine. One of the advantage of those tools is you can run them without root privilege. You can dig it deeper by exploring iostat manual page. Just type **man iostat** in your console to bring iostat manual page.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-iostat-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/
