translating by lujun9972
What is huge pages in Linux?
======
Learn about huge pages in Linux. Understand what is hugepages, how to configure it, how to check current state and how to disable it.

![Huge Pages in Linux][1]

In this article, we will walk you though details about huge pages so that you will be able to answer : what is huge pages in Linux? How to enable/disable huge pages? How to determine huge page value? in Linux like RHEL6, RHEL7, Ubuntu etc.

Lets start with Huge pages basics.

### What is Huge page in Linux?

Huge pages are helpful in virtual memory management in Linux system. As name suggests, they help is managing huge size pages in memory in addition to standard 4KB page size. You can define as huge as 1GB page size using huge pages.

During system boot, you reserve your memory portion with huge pages for your application. This memory portion i.e. these memory occupied by huge pages is never swapped out of memory. It will stick there until you change your configuration. This increases application performance to great extent like Oracle database with pretty large memory requirement.

### Why use huge page?

In virtual memory management, kernel maintains table in which it has mapping of virtual memory address to physical address. For every page transaction, kernel needs to load related mapping. If you have small size pages then you need to load more numbers of pages resulting kernel to load more mapping tables. This decreases performance.

Using huge pages, means you will need fewer pages. This decreases number of mapping tables to load by kernel to great extent. This increases your kernel level performance which ultimately benefits your application.

In short, by enabling huge pages, system has fewer page tables to deal with and hence less overhead to access / maintain them!

### How to configure huge pages?

Run below command to check current huge pages details.

```
root@kerneltalks # grep Huge /proc/meminfo
AnonHugePages:         0 kB
HugePages_Total:       0
HugePages_Free:        0
HugePages_Rsvd:        0
HugePages_Surp:        0
Hugepagesize:       2048 kB
```

In above output you can see one page size is 2MB `Hugepagesize` and total of 0 pages on system `HugePages_Total`. This huge page size can be increased from 2MB to max 1GB.

Run below script to get how much huge pages your system needs currently . Script is from Oracle and can be found.

```
#!/bin/bash
#
# hugepages_settings.sh
#
# Linux bash script to compute values for the
# recommended HugePages/HugeTLB configuration
#
# Note: This script does calculation for all shared memory
# segments available when the script is run, no matter it
# is an Oracle RDBMS shared memory segment or not.
# Check for the kernel version
KERN=`uname -r | awk -F. '{ printf("%d.%d\n",$1,$2); }'`
# Find out the HugePage size
HPG_SZ=`grep Hugepagesize /proc/meminfo | awk {'print $2'}`
# Start from 1 pages to be on the safe side and guarantee 1 free HugePage
NUM_PG=1
# Cumulative number of pages required to handle the running shared memory segments
for SEG_BYTES in `ipcs -m | awk {'print $5'} | grep "[0-9][0-9]*"`
do
   MIN_PG=`echo "$SEG_BYTES/($HPG_SZ*1024)" | bc -q`
   if [ $MIN_PG -gt 0 ]; then
      NUM_PG=`echo "$NUM_PG+$MIN_PG+1" | bc -q`
   fi
done
# Finish with results
case $KERN in
   '2.4') HUGETLB_POOL=`echo "$NUM_PG*$HPG_SZ/1024" | bc -q`;
          echo "Recommended setting: vm.hugetlb_pool = $HUGETLB_POOL" ;;
   '2.6' | '3.8' | '3.10' | '4.1' ) echo "Recommended setting: vm.nr_hugepages = $NUM_PG" ;;
    *) echo "Unrecognized kernel version $KERN. Exiting." ;;
esac
# End
```
You can save it in `/tmp` as `hugepages_settings.sh` and then run it like below :
```
root@kerneltalks # sh /tmp/hugepages_settings.sh
Recommended setting: vm.nr_hugepages = 124
```

Output will be similar to some number as shown in above sample output.

This means your system needs 124 huge pages of 2MB each! If you have set 4MB as page size then output would have been 62. You got the point, right?

### Configure hugepages in kernel

Now last part is to configure above stated [kernel parameter][2] and reload it. Add below value in `/etc/sysctl.conf` and reload configuration by issuing `sysctl -p` command.

```
vm .nr_hugepages=126
```

Notice that we added 2 extra pages in kernel since we want to keep couple of pages spare than actual required number.

Now, huge pages has been configured in kernel but to allow your application to use them you need to increase memory limits as well. New memory limit should be 126 pages x 2 MB each = 252 MB i.e. 258048 KB.

You need to edit below settings in `/etc/security/limits.conf`

```
soft memlock 258048
hard memlock 258048
```

Sometimes these settings are configured in app specific files like for Oracle DB its in `/etc/security/limits.d/99-grid-oracle-limits.conf`

Thats it! You might want to restart your application to make use of these new huge pages.

### How to disable hugepages?

HugePages are generally enabled by default. Use below command to check current state of hugepages.

```
root@kerneltalks# cat /sys/kernel/mm/transparent_hugepage/enabled
[always] madvise never
```

`[always]` flag in output shows that hugepages are enabled on system.

For RedHat base systems file path is `/sys/kernel/mm/redhat_transparent_hugepage/enabled`

If you want to disable huge pages then add `transparent_hugepage=never` at the end of `kernel` line in `/etc/grub.conf` and reboot the system.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/services/what-is-huge-pages-in-linux/

作者：[Shrikant Lavhate][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://kerneltalks.com
[1]:https://c1.kerneltalks.com/wp-content/uploads/2017/11/hugepages-in-linux.png
[2]:https://kerneltalks.com/linux/how-to-tune-kernel-parameters-in-linux/
