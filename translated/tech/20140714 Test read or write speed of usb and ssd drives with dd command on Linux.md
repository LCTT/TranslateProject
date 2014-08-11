Linux系统中使用 DD 命令测试 USB 和 SSD 硬盘的读写速度
================================================================================
### 磁盘驱动器速度 ###

磁盘驱动器的速度是以在一个单位时间内能读写数据量的多少来衡量的。DD 命令是一个简单的命令行工具，它可用对磁盘进行任意数据块的读取和写入，同时可以度量读取写入的速度。

在这篇文章中，我们将会使用 DD 命令来测试 USB 和 SSD 磁盘的读取和写入速度。

数据传输速度不但取决于驱动盘本身，而且还与连接的接口有关。比如， USB 2.0 端口的最大传输速度是 35 兆字节/秒，所以如果您把一个支持高速传输的 USB 3.0 驱动盘插入 USB 2.0 端口的话，它实际的传输速度将是 2.0 端口的上下限。

这对于 SSD 也是一样的。 SSD 连接的 SATA 端口有不同的类型。平均是 375 兆字节/秒的 SATA 2.0 端口理论上最大传输速度是 3 Gbit/秒，而 SATA 3.0 是这个速度的两倍。

### 测试方法 ###

Mount the drive and navigate into it from the terminal. Then use the dd command to first write a file using fixed sized blocks. Then read the same file out using the same block site.

The general syntax of the dd command looks like this

    dd if=path/to/input_file of=/path/to/output_file bs=block_size count=number_of_blocks

When writing to the drive, we simply read from /dev/zero which is a source of infinite useless bytes. And when read from the drive, we read the file written earlier and send it to /dev/null which is nowhere. In the whole process, dd keeps track of the speed with which the transfer takes place and reports it.

### SSD ###

The SSD that we are using is a "Samsung Evo 120GB" ssd. It is a beginner level ssd that comes within a decent budget and is also my first SSD. It is also one of the best performing ssds, in the market.

In this test the ssd is connected to a sata 2.0 port.

#### Write speed ####

Lets first write to the ssd

    $ dd if=/dev/zero of=./largefile bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB) copied, 4.82364 s, 223 MB/s

Block size is actually quite large. You can try with smaller sizes like 64k or even 4k.

#### Read speed ####

Now read back the same file. However, first clear the memory cache to ensure that the file is actually read from drive.

Run the following command to clear the memory cache

    $ sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"

Now read the file

    $ dd if=./largefile of=/dev/null bs=4k
    165118+0 records in
    165118+0 records out
    676323328 bytes (676 MB) copied, 3.0114 s, 225 MB/s

The Arch Linux wiki has a page full of information about the read/write speed of various SSDs from different vendors like Intel, Samsung, Sandisk etc. Check it out at the following url.

[https://wiki.archlinux.org/index.php/SSD_Benchmarking][1]

### USB ###

In this test we shall measure the read and write speed of ordinary usb/pen drives. The drives are plugged to standard usb 2 ports. The first one is a sony 4gb usb drive and the second is a strontium 16gb drive.

First plug the drive into the port and mount it, so that it is readable. Then navigate into the mount directory from the command line.

#### Sony 4GB - Write ####

In this test, the dd command is used to write 10,000 chunks of 8 Kbyte each to a single file on the drive.

    # dd if=/dev/zero of=./largefile bs=8k count=10000
    10000+0 records in
    10000+0 records out
    81920000 bytes (82 MB) copied, 11.0626 s, 7.4 MB/s

So the write speed is around 7.5 MBytes/s. This is a low figure.

#### Sony 4GB - Read ####

The same file is read back to test the read speed. Run the following command to clear the memory cache

    $ sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"

Now read the file using the dd command

    # dd if=./largefile of=/dev/null bs=8k
    8000+0 records in
    8000+0 records out
    65536000 bytes (66 MB) copied, 2.65218 s, 24.7 MB/s

The read speed comes out around 25 Mbytes/s which is a more or less the standard for cheap usb drives.

> USB 2.0 has a theoretical maximum signaling rate of 480 Mbits/s or 60 Mbytes/s. However due to various constraints the maximum throughput is restricted to around 280 Mbit/s or 35 Mbytes/s. Beyond this the actual speed achieved depends on the quality of the pen drives and other factors too.

And the above usb drive was plugged inside a USB 2.0 port and it achieved a read speed of 24.7 Mbytes/s which is not very bad. But the write speed lags much behind

Now lets do the same test with a Strontium 16gb drive. Strontium is another very cheapy brand, although usb drives are reliable.

#### Strontium 16gb write speed ####

    # dd if=/dev/zero of=./largefile bs=64k count=1000
    1000+0 records in
    1000+0 records out
    65536000 bytes (66 MB) copied, 8.3834 s, 7.8 MB/s

Strontium 16gb read speed

    # sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
    
    # dd if=./largefile of=/dev/null bs=8k
    8000+0 records in
    8000+0 records out
    65536000 bytes (66 MB) copied, 2.90366 s, 22.6 MB/s

The read speed is lower than the Sony drive.

### Resources ###

- [http://en.wikipedia.org/wiki/USB][2]
- [https://wiki.archlinux.org/index.php/SSD_Benchmarking][1]

----------

![](http://0.gravatar.com/avatar/e23f2767e6907e798da5b28694a2bf28?s=64&d=&r=G)

About Silver Moon

Php developer, blogger and Linux enthusiast. He can be reached at [m00n.silv3r@gmail.com][e]. Or find him on [Google+][g]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-test-drive-speed/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wiki.archlinux.org/index.php/SSD_Benchmarking
[2]:http://en.wikipedia.org/wiki/USB
[e]:m00n.silv3r@gmail.com
[g]:http://plus.google.com/117145272367995638274/posts