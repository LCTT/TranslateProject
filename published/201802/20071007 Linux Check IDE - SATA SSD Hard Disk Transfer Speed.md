在 Linux 上检测 IDE/SATA SSD 硬盘的传输速度
======

你知道你的硬盘在 Linux 下传输有多快吗？不打开电脑的机箱或者机柜，你知道它运行在 SATA I (150 MB/s) 、 SATA II (300 MB/s) 还是 SATA III (6.0Gb/s) 呢？

你能够使用 `hdparm` 和 `dd` 命令来检测你的硬盘速度。它为各种硬盘的 ioctls 提供了命令行界面，这是由 Linux 系统的 ATA / IDE / SATA 设备驱动程序子系统所支持的。有些选项只能用最新的内核才能正常工作（请确保安装了最新的内核）。我也推荐使用最新的内核源代码的包含头文件来编译 `hdparm` 命令。

### 如何使用 hdparm 命令来检测硬盘的传输速度

以 root 管理员权限登录并执行命令：

```
$ sudo hdparm -tT /dev/sda
```

或者，

```
$ sudo hdparm -tT /dev/hda
```

输出：

```
/dev/sda:
 Timing cached reads: 7864 MB in 2.00 seconds = 3935.41 MB/sec
 Timing buffered disk reads: 204 MB in 3.00 seconds = 67.98 MB/sec
```

为了检测更精准，这个操作应该**重复2-3次** 。这显示了无需访问磁盘，直接从 Linux 缓冲区缓存中读取的速度。这个测量实际上是被测系统的处理器、高速缓存和存储器的吞吐量的指标。这是一个 [for 循环的例子][1]，连续运行测试 3 次：

```
for i in 1 2 3; do hdparm -tT /dev/hda; done
```

这里，

  *  `-t` ：执行设备读取时序
  *  `-T` ：执行缓存读取时间
  *  `/dev/sda` ：硬盘设备文件


要 [找出 SATA 硬盘的连接速度][2] ，请输入：

```
sudo hdparm -I /dev/sda | grep -i speed
```

输出：

```
	 *	Gen1 signaling speed (1.5Gb/s)
	 *	Gen2 signaling speed (3.0Gb/s)
	 *	Gen3 signaling speed (6.0Gb/s)

```

以上输出表明我的硬盘可以使用 1.5Gb/s、3.0Gb/s 或 6.0Gb/s 的速度。请注意，您的 BIOS/主板必须支持 SATA-II/III 才行：

```
$ dmesg | grep -i sata | grep 'link up'
```

[![Linux Check IDE SATA SSD Hard Disk Transfer Speed][3]][3]

### dd 命令

你使用 `dd` 命令也可以获取到相应的速度信息：

```
dd if=/dev/zero of=/tmp/output.img bs=8k count=256k
rm /tmp/output.img
```

输出：

```
262144+0 records in
262144+0 records out
2147483648 bytes (2.1 GB) copied, 23.6472 seconds, `90.8 MB/s`
```

下面是 [推荐的 dd 命令参数][4]：

```
dd if=/dev/input.file  of=/path/to/output.file  bs=block-size  count=number-of-blocks  oflag=dsync
 
## GNU dd syntax ##
dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
 
## OR alternate syntax for GNU/dd ##
dd if=/dev/zero of=/tmp/testALT.img bs=1G count=1 conv=fdatasync
```

这是上面命令的第三个命令的输出结果：

```
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 4.23889 s, 253 MB/s
```

### “磁盘与存储” - GUI 工具

您还可以使用位于“系统>管理>磁盘实用程序”菜单中的磁盘实用程序。请注意，在最新版本的 Gnome 中，它简称为“磁盘”。

#### 如何使用 Linux 上的“磁盘”测试我的硬盘的性能？

要测试硬盘的速度：

  1. 从“活动概览”中打开“磁盘”（按键盘上的 super 键并键入“disks”）
  2. 从“左侧窗格”的列表中选择“磁盘”
  3. 选择菜单按钮并从菜单中选择“测试磁盘性能……”
  4. 单击“开始性能测试……”并根据需要调整传输速率和访问时间参数。
  5. 选择“开始性能测试”来测试从磁盘读取数据的速度。需要管理权限请输入密码。 

以上操作的快速视频演示：

https://www.cyberciti.biz/tips/wp-content/uploads/2007/10/disks-performance.mp4

#### 只读 Benchmark (安全模式下)

然后，选择 > 只读:

![Fig.01: Linux Benchmarking Hard Disk Read Only Test Speed][5]

上述选项不会销毁任何数据。

#### 读写的 Benchmark（所有数据将丢失，所以要小心）

访问“系统>管理>磁盘实用程序菜单>单击性能测试>单击开始读/写性能测试按钮：

![Fig.02:Linux Measuring read rate, write rate and access time][6]

### 作者

作者是 nixCraft 的创造者，是经验丰富的系统管理员，也是 Linux 操作系统/ Unix shell 脚本的培训师。他曾与全球客户以及 IT，教育，国防和空间研究以及非营利部门等多个行业合作。在Twitter，Facebook和Google+上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/how-fast-is-linux-sata-hard-disk.html

作者：[Vivek Gite][a]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/
[1]:https://www.cyberciti.biz/faq/bash-for-loop/
[2]:https://www.cyberciti.biz/faq/linux-command-to-find-sata-harddisk-link-speed/
[3]:https://www.cyberciti.biz/tips/wp-content/uploads/2007/10/Linux-Check-IDE-SATA-SSD-Hard-Disk-Transfer-Speed.jpg
[4]:https://www.cyberciti.biz/faq/howto-linux-unix-test-disk-performance-with-dd-command/
[5]:https://www.cyberciti.biz/media/new/tips/2007/10/Linux-Hard-Disk-Speed-Benchmark.png (Linux Benchmark Hard Disk Speed)
[6]:https://www.cyberciti.biz/media/new/tips/2007/10/Linux-Hard-Disk-Read-Write-Benchmark.png (Linux Hard Disk Benchmark Read / Write Rate and Access Time)
[7]:https://twitter.com/nixcraft
[8]:https://facebook.com/nixcraft
[9]:https://plus.google.com/+CybercitiBiz
