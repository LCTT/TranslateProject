Linux系统中使用 DD 命令测试 USB 和 SSD 硬盘的读写速度
================================================================================
### 磁盘驱动器速度 ###

磁盘驱动器的速度是以一个单位时间内读写数据量的多少来衡量的。DD 命令是一个简单的命令行工具，它可用对磁盘进行任意数据块的读取和写入，同时可以度量读取写入的速度。

在这篇文章中，我们将会使用 DD 命令来测试 USB 和 SSD 磁盘的读取和写入速度。

数据传输速度不但取决于驱动盘本身，而且还与连接的接口有关。比如， USB 2.0 端口的最大传输速度是 35 兆字节/秒，所以如果您把一个支持高速传输的 USB 3.0 驱动盘插入 USB 2.0 端口的话，它实际的传输速度将是 2.0 端口的下限。

这对于 SSD 也是一样的。 SSD 连接的 SATA 端口有不同的类型。平均是 375 兆字节/秒的 SATA 2.0 端口理论上最大传输速度是 3 Gbit/秒，而 SATA 3.0 是这个速度的两倍。

### 测试方法 ###

挂载上驱动盘，从终端进入此盘目录下。然后使用 DD 命令，首先写入固定大小块的一个文件，接着读取这个文件。

DD 命令通用语法格式如下：

    dd if=path/to/input_file of=/path/to/output_file bs=block_size count=number_of_blocks

当写入到驱动盘的时候，我们简单的从无穷无用字节的源 /dev/zero 读取，当从驱动盘读取的时候，我们读取的是刚才的文件，并把输出结果发送到无用的 /dev/null。在整个操作过程中， DD 命令会跟踪数据传输的速度并且报告出结果。

### 固态硬盘 ###

我们使用的是一块“三星 Evo 120G” 的固态硬盘。它性价比很高，很适合刚开始用固态硬盘的用户，也是我的第一块固态硬盘，并且也是市场上效果最好的固态硬盘之一。

这次实验中，我们把硬盘接在 SATA 2.0 端口上。
 
#### 写入速度 #### 

首先让我们写入固态硬盘

    $ dd if=/dev/zero of=./largefile bs=1M count=1024
    1024+0 records in
    1024+0 records out
    1073741824 bytes (1.1 GB) copied, 4.82364 s, 223 MB/s

的大小实际上是相当大的。你可以尝试用更小的尺寸如 64K 甚至是 4K 的。

#### 读取速度 ####

现在读回这个文件。但是，得首先清除内存的缓存，以确保这个文件确实是从驱动盘读取的。

运行下面的命令来清除内存缓存

    $ sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"

现在读取此文件

    $ dd if=./largefile of=/dev/null bs=4k
    165118+0 records in
    165118+0 records out
    676323328 bytes (676 MB) copied, 3.0114 s, 225 MB/s

在 Arch Linux 的维基页上有一整页的关于不同的厂商，如英特尔、三星、Sandisk 等提供的各类固态硬盘 读/写速度的信息。点击如下的 url 可以查看相关信息。

[https://wiki.archlinux.org/index.php/SSD_Benchmarking][1]

### USB ###

此次实验我们会测量普通的 USB/随身笔的读写速度。驱动盘都是接入标准的 USB 2.0 端口的。首先用的是一个 4GB 大小的 sony USB 驱动盘，随后用的是一个 16GB 大小的 strontium 驱动盘。

首先把驱动盘插入端口，并挂载上，使其可读。然后从命令行下面进入挂载的文件目录下。

#### Sony 4GB - 写入 ####

这个实验中，用 DD 命令向驱动盘写入一个有 10000 块，每块 8K 字节的文件。

    # dd if=/dev/zero of=./largefile bs=8k count=10000
    10000+0 records in
    10000+0 records out
    81920000 bytes (82 MB) copied, 11.0626 s, 7.4 MB/s

因此，写入速度约为7.5兆字节/秒。这是一个很低的数字。

#### Sony 4GB - 读取 ####

把相同的文件读取回来，测试速度。首先运行如下命令清除内存缓存。

    $ sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"

现在就可以使用 DD 命令来读取文件了。

    # dd if=./largefile of=/dev/null bs=8k
    8000+0 records in
    8000+0 records out
    65536000 bytes (66 MB) copied, 2.65218 s, 24.7 MB/s

读取速度出来大约是25兆字节/秒，这大致跟廉价 USB 驱动盘的标准相匹配吧。

> USB2.0 理论上最大信号传输速率为480兆比特/秒，最小为60兆字节/秒。然而，由于各种限制实际传输速率大约280兆比特/秒和35兆字节/秒之间。除了这个，实际的速度还取决于驱动盘本身的质量好坏以及其他的因素。

上面实验中， USB 驱动盘插入USB 2.0 端口，读取的速度达到了 24.7兆字节/秒，这是很不错的读速度。但写入速度就不敢恭维了。

下面让我们用 16GB 的 Strontium 驱动盘来做相同的实验。虽然 Strontium 的 USB 驱动盘很稳定，但它也是一款很便宜的品牌。

#### Strontium 16gb 盘写入速度 ####

    # dd if=/dev/zero of=./largefile bs=64k count=1000
    1000+0 records in
    1000+0 records out
    65536000 bytes (66 MB) copied, 8.3834 s, 7.8 MB/s

#### Strontium 16gb 盘读取速度 ####

    # sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
    
    # dd if=./largefile of=/dev/null bs=8k
    8000+0 records in
    8000+0 records out
    65536000 bytes (66 MB) copied, 2.90366 s, 22.6 MB/s

它的读取速度就要比 Sony 的低了。

### 参考资料 ###

- [http://en.wikipedia.org/wiki/USB][2]
- [https://wiki.archlinux.org/index.php/SSD_Benchmarking][1]

----------

![](http://0.gravatar.com/avatar/e23f2767e6907e798da5b28694a2bf28?s=64&d=&r=G)

关于 Silver Moon

Php 开发者, 博主 和 Linux 爱好者. 通过 [m00n.silv3r@gmail.com][e] 或者 [Google+][g] 可联系到他。

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-test-drive-speed/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wiki.archlinux.org/index.php/SSD_Benchmarking
[2]:http://en.wikipedia.org/wiki/USB
[e]:m00n.silv3r@gmail.com
[g]:http://plus.google.com/117145272367995638274/posts 
