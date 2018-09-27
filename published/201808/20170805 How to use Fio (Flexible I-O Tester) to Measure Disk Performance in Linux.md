如何在 Linux 中使用 Fio 来测评硬盘性能
======

![](https://wpmojo.com/wp-content/uploads/2017/08/wpmojo.com-how-to-use-fio-to-measure-disk-performance-in-linux-dotlayer.com-how-to-use-fio-to-measure-disk-performance-in-linux-816x457.jpeg)

Fio（Flexible I/O Tester） 是一款由 Jens Axboe 开发的用于测评和压力/硬件验证的[自由开源][1]的软件。

它支持 19 种不同类型的 I/O 引擎 (sync、mmap、libaio、posixaio、SG v3、splice、null、network、 syslet、guasi、solarisaio，以及更多)， I/O 优先级（针对较新的 Linux 内核），I/O 速度，fork 的任务或线程任务等等。它能够在块设备和文件上工作。

Fio 接受一种非常简单易于理解的文本格式的任务描述。软件默认包含了几个示例任务文件。 Fio 展示了所有类型的 I/O 性能信息，包括完整的 IO 延迟和百分比。

它被广泛的应用在非常多的地方，包括测评、QA，以及验证用途。它支持 Linux 、FreeBSD 、NetBSD、 OpenBSD、 OS X、 OpenSolaris、 AIX、 HP-UX、 Android 以及 Windows。

在这个教程，我们将使用 Ubuntu 16 ，你需要拥有这台电脑的 `sudo` 或 root 权限。我们将完整的进行安装和 Fio 的使用。

### 使用源码安装 Fio

我们要去克隆 GitHub 上的仓库。安装所需的依赖，然后我们将会从源码构建应用。首先，确保我们安装了 Git 。

```
sudo apt-get install git
```

CentOS 用户可以执行下述命令：

```
sudo yum install git
```

现在，我们切换到 `/opt` 目录，并从 Github 上克隆仓库：

```
cd /opt
git clone https://github.com/axboe/fio
```

你应该会看到下面这样的输出：

```
Cloning into 'fio'...
remote: Counting objects: 24819, done.
remote: Compressing objects: 100% (44/44), done.
remote: Total 24819 (delta 39), reused 62 (delta 32), pack-reused 24743
Receiving objects: 100% (24819/24819), 16.07 MiB | 0 bytes/s, done.
Resolving deltas: 100% (16251/16251), done.
Checking connectivity... done.
```

现在，我们通过在 `/opt` 目录下输入下方的命令切换到 Fio 的代码目录：

```
cd fio
```

最后，我们可以使用下面的命令来使用 `make` 从源码构建软件：

```
# ./configure
# make
# make install
```

### 在 Ubuntu 上安装 Fio

对于 Ubuntu 和 Debian 来说， Fio 已经在主仓库内。你可以很容易的使用类似 `yum` 和 `apt-get` 的标准包管理器来安装 Fio。

对于 Ubuntu 和 Debian ，你只需要简单的执行下述命令：

```
sudo apt-get install fio
```

对于 CentOS/Redhat 你只需要简单执行下述命令。

在 CentOS ，你可能在你能安装 Fio 前需要去安装 EPEL 仓库到你的系统中。你可以通过执行下述命令来安装它：

```
sudo yum install epel-release -y
```

你可以执行下述命令来安装 Fio：

```
sudo yum install fio -y
```

###  使用 Fio 进行磁盘性能测试


现在 Fio 已经安装到了你的系统中。现在是时候看一些如何使用 Fio 的例子了。我们将进行随机写、读和读写测试。

### 执行随机写测试

执行下面的命令来开始。这个命令将要同一时间执行两个进程，写入共计 4GB（ 4 个任务 x 512MB = 2GB） 文件：

```
sudo fio --name=randwrite --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=512M --numjobs=2 --runtime=240 --group_reporting
```

```
...
fio-2.2.10
Starting 2 processes

randwrite: (groupid=0, jobs=2): err= 0: pid=7271: Sat Aug 5 13:28:44 2017
 write: io=1024.0MB, bw=2485.5MB/s, iops=636271, runt= 412msec
 slat (usec): min=1, max=268, avg= 1.79, stdev= 1.01
 clat (usec): min=0, max=13, avg= 0.20, stdev= 0.40
 lat (usec): min=1, max=268, avg= 2.03, stdev= 1.01
 clat percentiles (usec):
 | 1.00th=[ 0], 5.00th=[ 0], 10.00th=[ 0], 20.00th=[ 0],
 | 30.00th=[ 0], 40.00th=[ 0], 50.00th=[ 0], 60.00th=[ 0],
 | 70.00th=[ 0], 80.00th=[ 1], 90.00th=[ 1], 95.00th=[ 1],
 | 99.00th=[ 1], 99.50th=[ 1], 99.90th=[ 1], 99.95th=[ 1],
 | 99.99th=[ 1]
 lat (usec) : 2=99.99%, 4=0.01%, 10=0.01%, 20=0.01%
 cpu : usr=15.14%, sys=84.00%, ctx=8, majf=0, minf=26
 IO depths : 1=100.0%, 2=0.0%, 4=0.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
 submit : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 complete : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 issued : total=r=0/w=262144/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
 latency : target=0, window=0, percentile=100.00%, depth=1

Run status group 0 (all jobs):
 WRITE: io=1024.0MB, aggrb=2485.5MB/s, minb=2485.5MB/s, maxb=2485.5MB/s, mint=412msec, maxt=412msec

Disk stats (read/write):
 sda: ios=0/0, merge=0/0, ticks=0/0, in_queue=0, util=0.00%
```

### 执行随机读测试

我们将要执行一个随机读测试，我们将会尝试读取一个随机的 2GB 文件。

```

sudo fio --name=randread --ioengine=libaio --iodepth=16 --rw=randread --bs=4k --direct=0 --size=512M --numjobs=4 --runtime=240 --group_reporting
```

你应该会看到下面这样的输出：

```
...
fio-2.2.10
Starting 4 processes
randread: Laying out IO file(s) (1 file(s) / 512MB)
randread: Laying out IO file(s) (1 file(s) / 512MB)
randread: Laying out IO file(s) (1 file(s) / 512MB)
randread: Laying out IO file(s) (1 file(s) / 512MB)
Jobs: 4 (f=4): [r(4)] [100.0% done] [71800KB/0KB/0KB /s] [17.1K/0/0 iops] [eta 00m:00s]
randread: (groupid=0, jobs=4): err= 0: pid=7586: Sat Aug 5 13:30:52 2017
 read : io=2048.0MB, bw=80719KB/s, iops=20179, runt= 25981msec
 slat (usec): min=72, max=10008, avg=195.79, stdev=94.72
 clat (usec): min=2, max=28811, avg=2971.96, stdev=760.33
 lat (usec): min=185, max=29080, avg=3167.96, stdev=798.91
 clat percentiles (usec):
 | 1.00th=[ 2192], 5.00th=[ 2448], 10.00th=[ 2576], 20.00th=[ 2736],
 | 30.00th=[ 2800], 40.00th=[ 2832], 50.00th=[ 2928], 60.00th=[ 3024],
 | 70.00th=[ 3120], 80.00th=[ 3184], 90.00th=[ 3248], 95.00th=[ 3312],
 | 99.00th=[ 3536], 99.50th=[ 6304], 99.90th=[15168], 99.95th=[18816],
 | 99.99th=[22912]
 bw (KB /s): min=17360, max=25144, per=25.05%, avg=20216.90, stdev=1605.65
 lat (usec) : 4=0.01%, 10=0.01%, 250=0.01%, 500=0.01%, 750=0.01%
 lat (usec) : 1000=0.01%
 lat (msec) : 2=0.01%, 4=99.27%, 10=0.44%, 20=0.24%, 50=0.04%
 cpu : usr=1.35%, sys=5.18%, ctx=524309, majf=0, minf=98
 IO depths : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
 submit : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 complete : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
 issued : total=r=524288/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
 latency : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
 READ: io=2048.0MB, aggrb=80718KB/s, minb=80718KB/s, maxb=80718KB/s, mint=25981msec, maxt=25981msec

Disk stats (read/write):
 sda: ios=521587/871, merge=0/1142, ticks=96664/612, in_queue=97284, util=99.85%
```

最后，我们想要展示一个简单的随机读-写测试来看一看 Fio 返回的输出类型。

### 读写性能测试

下述命令将会测试 USB Pen 驱动器 (`/dev/sdc1`) 的随机读写性能：

```
sudo fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75
```

下面的内容是我们从上面的命令得到的输出：
```
fio-2.2.10
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [217.8MB/74452KB/0KB /s] [55.8K/18.7K/0 iops] [eta 00m:00s]
test: (groupid=0, jobs=1): err= 0: pid=8475: Sat Aug 5 13:36:04 2017
 read : io=3071.7MB, bw=219374KB/s, iops=54843, runt= 14338msec
 write: io=1024.4MB, bw=73156KB/s, iops=18289, runt= 14338msec
 cpu : usr=6.78%, sys=20.81%, ctx=1007218, majf=0, minf=9
 IO depths : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
 submit : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 complete : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
 issued : total=r=786347/w=262229/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
 latency : target=0, window=0, percentile=100.00%, depth=64

Run status group 0 (all jobs):
 READ: io=3071.7MB, aggrb=219374KB/s, minb=219374KB/s, maxb=219374KB/s, mint=14338msec, maxt=14338msec
 WRITE: io=1024.4MB, aggrb=73156KB/s, minb=73156KB/s, maxb=73156KB/s, mint=14338msec, maxt=14338msec

Disk stats (read/write):
 sda: ios=774141/258944, merge=1463/899, ticks=748800/150316, in_queue=900720, util=99.35%
```

我们希望你能喜欢这个教程并且享受接下来的内容，Fio 是一个非常有用的工具，并且我们希望你能在你下一次 Debugging 活动中使用到它。如果你喜欢这个文章，欢迎留下评论和问题。


--------------------------------------------------------------------------------

via: https://wpmojo.com/how-to-use-fio-to-measure-disk-performance-in-linux/

作者：[Alex Pearson][a]
译者：[Bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://wpmojo.com/author/wpmojo/
[1]:https://github.com/axboe/fio
