如何更改 Linux 的 I/O 调度器
==================================

Linux 的 I/O 调度器是一个从存储卷以块式 I/O 访问的进程，有时也叫磁盘调度器。Linux I/O 调度器的工作机制是控制块设备的请求队列：确定队列中哪些 I/O 的优先级更高以及何时下发 I/O 到块设备，以此来减少磁盘寻道时间，从而提高系统的吞吐量。

目前 Linux 上有如下几种 I/O 调度算法：

1. noop - 通常用于内存存储的设备。
2. cfq - 绝对公平调度器。进程平均使用IO带宽。
3. Deadline - 针对延迟的调度器，每一个 I/O，都有一个最晚执行时间。
4. Anticipatory - 启发式调度，类似 Deadline 算法，但是引入预测机制提高性能。

查看设备当前的 I/O 调度器：

```
# cat /sys/block/<Disk_Name>/queue/scheduler
```

假设磁盘名称是 `/dev/sdc`：

```
# cat /sys/block/sdc/queue/scheduler
noop anticipatory deadline [cfq]
```

### 如何改变硬盘设备 I/O 调度器

使用如下指令：

```
# echo {SCHEDULER-NAME} > /sys/block/<Disk_Name>/queue/scheduler
```

比如设置 noop 调度器:

```
# echo noop > /sys/block/sdc/queue/scheduler
```

以上设置重启后会失效，要想重启后配置仍生效，需要在内核启动参数中将 `elevator=noop` 写入 `/boot/grub/menu.lst`：

#### 1. 备份 menu.lst 文件

```
cp -p /boot/grub/menu.lst /boot/grub/menu.lst-backup
```

#### 2. 更新 /boot/grub/menu.lst

将 `elevator=noop` 添加到文件末尾，比如：

```
kernel /vmlinuz-2.6.16.60-0.91.1-smp root=/dev/sysvg/root splash=silent splash=off showopts elevator=noop
```

--------------------------------------------------------------------------------

via: http://linuxroutes.com/change-io-scheduler-linux/

作者：[UX Techno][a]
译者：[honpey](https://github.com/honpey)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxroutes.com/change-io-scheduler-linux/
