Linux 检测 IDE / SATA SSD 硬盘的传输速度
======
你知道你的硬盘在 linux 下挂在传输有多快吗？ 打开电脑的机箱活着机柜，你了解你的硬盘类型吗？ 不同类型的传输速度也不同 SATA I (150 MB/s) 、 SATA II (300 MB/s) 、 SATA III (6.0Gb/s) 。

你能够使用 **hdparm 和 dd 命令** 来检测你的硬盘速度。它为常见的 Linux 系统的 ATA / IDE / SATA 设备驱动程序子系统支持的各种硬盘的 ioctl 提供命令行界面。有些选项只能用最新的内核才能正常工作（请确保安装了最新的内核）。我也推荐使用最新的内核源代码中包含的编译的 hdparm 命令。

### 如何使用 hdparm 命令来检测硬盘的传输速度

以 root 管理员权限登录并执行命令:
`$ sudo hdparm -tT /dev/sda`
或者
`$ sudo hdparm -tT /dev/hda`
输出:
```
/dev/sda:
 Timing cached reads: 7864 MB in 2.00 seconds = 3935.41 MB/sec
 Timing buffered disk reads: 204 MB in 3.00 seconds = 67.98 MB/sec
```

为了检测更精准，这个操作应该 **重复2-3次** 。这显示了直接从 Linux 缓冲区缓存中读取的速度，而无需磁盘访问。这个测量实际上是被测系统的处理器，高速缓存和存储器的吞吐量的指示。这里是 [for循环的例子][1]，连续运行测试3次:
`for i in 1 2 3; do hdparm -tT /dev/hda; done`
Where,

  *  **-t** : 执行设备读取时序
  *  **-T** : 执行缓存读取时间
  *  **/dev/sda** : 硬盘设备文件



要 [找出SATA硬盘链接速度][2] ，请输入:
`sudo hdparm -I /dev/sda | grep -i speed`
输出:
```
	 *	Gen1 signaling speed (1.5Gb/s)
	 *	Gen2 signaling speed (3.0Gb/s)
	 *	Gen3 signaling speed (6.0Gb/s)

```

以上输出表明我的硬盘可以使用1.5Gb / s，3.0Gb / s或6.0Gb / s的速度。请注意，您的BIOS /主板必须支持SATA-II / III :
`$ dmesg | grep -i sata | grep 'link up'`
[![Linux Check IDE SATA SSD Hard Disk Transfer Speed][3]][3]

### dd 命令

你使用 dd 发热命令也可以获取到相应的速度信息:
```
dd if=/dev/zero of=/tmp/output.img bs=8k count=256k
rm /tmp/output.img
```

输出:
```
262144+0 records in
262144+0 records out
2147483648 bytes (2.1 GB) copied, 23.6472 seconds, **90.8 MB/s**

```

下面是 [ dd 命令推荐的输入的参数][4]
```
dd if=/dev/input.file  of=/path/to/output.file  bs=block-size  count=number-of-blocks  oflag=dsync
 
## GNU dd syntax ##
dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
 
## OR alternate syntax for GNU/dd ##
dd if=/dev/zero of=/tmp/testALT.img bs=1G count=1 conv=fdatasync
```


这个是上面命令的第三个命令的输出结果:
```
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 4.23889 s, 253 MB/s
```

### 磁盘存储 - GUI 工具

您还可以使用位于系统>管理>磁盘实用程序菜单中的磁盘实用程序。请注意，在最新版本的Gnome中，它简称为磁盘。

#### 如何使用Linux上的磁盘测试我的硬盘的性能？

要测试硬盘的速度:

  1. 从 **活动概览** 中打开 **磁盘**（按键盘上的超级键并键入磁盘）
  2. 从 **左侧窗格** 的列表中选择 **磁盘**
  3. 选择菜单按钮并从菜单中选择 **Benchmark disk** ...
  4. 单击 **开始 benchmark...** 并根据需要调整传输速率和访问时间参数。
  5. 选择 **Start Benchmarking** 来测试从磁盘读取数据的速度。需要管理权限请输入密码。 


以上操作的快速视频演示:

https://www.cyberciti.biz/tips/wp-content/uploads/2007/10/disks-performance.mp4


#### 只读 Benchmark (安全模式下)

然后，选择 > 只读:

![Fig.01: Linux Benchmarking Hard Disk Read Only Test Speed][5]

上述选项不会销毁任何数据。

#### 读写的 Benchmark（所有数据将丢失，所以要小心）

访问系统 > 管理 > 磁盘实用程序菜单 > 单击 benchmark >单击开始读/写 benchmark 按钮:

![Fig.02:Linux Measuring read rate, write rate and access time][6]

### 作者

作者是 nixCraft 的创造者，是经验丰富的系统管理员，也是 Linux 操作系统/ Unix shell 脚本的培训师。他曾与全球客户以及IT，教育，国防和空间研究以及非营利部门等多个行业合作。在Twitter，Facebook和Google+上关注他。

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/how-fast-is-linux-sata-hard-disk.html

作者：[Vivek Gite][a]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[校对者ID](https://github.com/校对者ID)

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
