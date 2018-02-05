How to use Fio (Flexible I/O Tester) to Measure Disk Performance in Linux
======
![](https://wpmojo.com/wp-content/uploads/2017/08/wpmojo.com-how-to-use-fio-to-measure-disk-performance-in-linux-dotlayer.com-how-to-use-fio-to-measure-disk-performance-in-linux-816x457.jpeg)

Fio which stands for Flexible I/O Tester [is a free and open source][1] disk I/O tool used both for benchmark and stress/hardware verification developed by Jens Axboe.

It has support for 19 different types of I/O engines (sync, mmap, libaio, posixaio, SG v3, splice, null, network, syslet, guasi, solarisaio, and more), I/O priorities (for newer Linux kernels), rate I/O, forked or threaded jobs, and much more. It can work on block devices as well as files.

Fio accepts job descriptions in a simple-to-understand text format. Several example job files are included. Fio displays all sorts of I/O performance information, including complete IO latencies and percentiles.

It is in wide use in many places, for both benchmarking, QA, and verification purposes. It supports Linux, FreeBSD, NetBSD, OpenBSD, OS X, OpenSolaris, AIX, HP-UX, Android, and Windows.

In this tutorial, we will be using Ubuntu 16 and you are required to have sudo or root privileges to the computer. We will go over the installation and use of fio.

### Installing fio from Source

We are going to clone the repo on GitHub. Install the prerequisites, and then we will build the packages from the source code. Lets' start by making sure we have git installed.
```

sudo apt-get install git


```

For centOS users you can use:
```

sudo yum install git


```

Now we change directory to /opt and clone the repo from Github:
```

cd /opt
git clone https://github.com/axboe/fio


```

You should see the output below:
```

Cloning into 'fio'...
remote: Counting objects: 24819, done.
remote: Compressing objects: 100% (44/44), done.
remote: Total 24819 (delta 39), reused 62 (delta 32), pack-reused 24743
Receiving objects: 100% (24819/24819), 16.07 MiB | 0 bytes/s, done.
Resolving deltas: 100% (16251/16251), done.
Checking connectivity... done.


```

Now, we change directory into the fio codebase by typing the command below inside the opt folder:
```

cd fio


```

We can finally build fio from source using the `make` build utility bu using the commands below:
```

# ./configure
# make
# make install


```

### Installing fio on Ubuntu

For Ubuntu and Debian, fio is available on the main repository. You can easily install fio using the standard package managers such as yum and apt-get.

For Ubuntu and Debian you can simple use:
```

sudo apt-get install fio


```

For CentOS/Redhat you can simple use:
On CentOS, you might need to install EPEL repository to your system before you can have access to fio. You can install it by running the following command:
```

sudo yum install epel-release -y


```

You can then install fio using the command below:
```

sudo yum install fio -y


```

### Disk Performace testing with Fio

With Fio is installed on your system. It's time to see how to use Fio with some examples below. We are going to perform a random write, read and read and write test.

### Performing a Random Write Test

Let's start by running the following command. This command will write a total 4GB file [4 jobs x 512 MB = 2GB] running 2 processes at a time:
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

### Performing a Random Read Test

We are going to perform a random read test now, we will be trying to read a random 2Gb file
```

sudo fio --name=randread --ioengine=libaio --iodepth=16 --rw=randread --bs=4k --direct=0 --size=512M --numjobs=4 --runtime=240 --group_reporting


```

You should see the output below:
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

Finally, we want to show a sample read-write test to see how the kind out output that fio returns.

### Read Write Performance Test

The command below will measure random read/write performance of USB Pen drive (/dev/sdc1):
```

sudo fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75


```

Below is the outout we get from the command above.
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

We hope you enjoyed this tutorial and enjoyed following along, Fio is a very useful tool and we hope you can use it in your next debugging activity. If you enjoyed reading this post feel free to leave a comment of questions. Go ahead and clone the repo and play around with the code.


--------------------------------------------------------------------------------

via: https://wpmojo.com/how-to-use-fio-to-measure-disk-performance-in-linux/

作者：[Alex Pearson][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://wpmojo.com/author/wpmojo/
[1]:https://github.com/axboe/fio
