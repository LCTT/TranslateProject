How to Change Linux I/O Scheduler
==================================


Linux I/O Scheduler is a process of accessing the block I/O from storage volumes. I/O scheduling is sometimes called disk scheduling. Linux I/O scheduler works by managing a block device’s request queue. It selects the order of requests in the queue and at what time each request is sent to the block device. Linux I/O Scheduler manages the request queue with the goal of reducing seeks, which results in great extent for global throughput.

There are following I/O Scheduler present on Linux:

1. noop – is often the best choice for memory-backed block devices
2. cfq – A fairness-oriented scheduler. It tries to maintain system-wide fairness of I/O bandwidth.
3. Deadline – A latency-oriented I/O scheduler. Each I/O request has got a deadline assigned.
4. Anticipatory – conceptually similar to deadline, but with more heuristics to improve performance.

To View Current Disk scheduler:

```
# cat /sys/block/<Disk_Name>/queue/scheduler
```

Let’s assume that , disk name is /dev/sdc, type:

```
# cat /sys/block/sdc/queue/scheduler
noop anticipatory deadline [cfq]
```

### To change Linux I/O Scheduler For A Hard Disk:

To set a specific scheduler, simply type below command:

```
# echo {SCHEDULER-NAME} > /sys/block/<Disk_Name>/queue/scheduler
```

For example,to set noop scheduler, enter:

```
# echo noop > /sys/block/sdc/queue/scheduler
```

The above change is valid till reboot of the server , to make this change permanent across reboot follow below procedure:

Implement permanent setting by adding “elevator=noop” to the default para in the /boot/grub/menu.lst file

#### 1. Create backup of menu.lst file

```
cp -p /boot/grub/menu.lst /boot/grub/menu.lst-backup
```

### 2. Update /boot/grub/menu.lst

Now add “elevator=noop” at the end of the line as below:
 
Example

```
kernel /vmlinuz-2.6.16.60-0.91.1-smp root=/dev/sysvg/root splash=silent splash=off showopts elevator=noop
```

--------------------------------------------------------------------------------

via: http://linuxroutes.com/change-io-scheduler-linux/

作者：[UX  Techno][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxroutes.com/change-io-scheduler-linux/
