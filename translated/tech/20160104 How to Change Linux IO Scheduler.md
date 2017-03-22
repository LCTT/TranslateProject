如何更改IO调度器
==================================

Linux IO 调度器，IO调度器也叫磁盘调度器。Linux IO调度器的机制主要是控制块设备的请求队列：确定队列中哪些IO的优先级更高以及何时下发IO，以此来减少磁盘寻道时间，从而提高系统的吞吐量。

目前Linux上有如下几种IO调度算法：

1. noop - 通常用于内存存储的设备.
2. cfq - 绝对公平调度器. 进程平均使用IO带宽.
3. Deadline - 每一个IO，都有一个最晚执行时间.
4. Anticipatory - 启发式调度，类似Deadline算法，但是引入预测机制提高性能.

查看设备当前的IO调度器：

```
# cat /sys/block/<Disk_Name>/queue/scheduler
```

假设磁盘名称是 /dev/sdc:

```
# cat /sys/block/sdc/queue/scheduler
noop anticipatory deadline [cfq]
```

### 如何改变硬盘设备I/O调度器

使用如下指令：

```
# echo {SCHEDULER-NAME} > /sys/block/<Disk_Name>/queue/scheduler
```

比如设置 noop 调度器:

```
# echo noop > /sys/block/sdc/queue/scheduler
```

以上设置重启后会失效，要想重启后配置仍生效，需要在内核启动参数中将 "elevator=noop" 写入 /boot/grub/menu.lst:

#### 1. 备份 menu.lst 文件

```
cp -p /boot/grub/menu.lst /boot/grub/menu.lst-backup
```

#### 2. 更新 /boot/grub/menu.lst

将 "elevator=noop" 添加到文件末尾，比如:

```
kernel /vmlinuz-2.6.16.60-0.91.1-smp root=/dev/sysvg/root splash=silent splash=off showopts elevator=noop
```

--------------------------------------------------------------------------------

via: http://linuxroutes.com/change-io-scheduler-linux/

作者：[UX  Techno][a]
译者：[honpey](https://github.com/honpey)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxroutes.com/change-io-scheduler-linux/
