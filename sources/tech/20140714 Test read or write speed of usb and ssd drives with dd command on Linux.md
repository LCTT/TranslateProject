Test read/write speed of usb and ssd drives with dd command on Linux
================================================================================
### Drive speed ###

The speed of a drive is measured in terms of how much data it can read or write in unit time. The dd command is a simple command line tool that can be used to read and write arbitrary blocks of data to a drive and measure the speed at which the data transfer took place. 

In this post we shall use the dd command to test and read and write speed of usb and ssd drives using the dd command.

The data transfer speed does not depend solely on the drive, but also on the interface it is connected to. For example a usb 2.0 port has a maximum operational speed limit of 35 Mbytes/s, so even if you were to plug a high speed usb 3 pen drive into a usb 2 port, the speed would be capped to the lower limit.

The same applies to SSD. SSD connect via SATA ports which have different versions. Sata 2.0 has a maximum theoretical speed limit of 3Gbits/s which is roughly 375 Mbytes/s. Whereas Sata 3.0 supports twice that speed.

### Test Method ###

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

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wiki.archlinux.org/index.php/SSD_Benchmarking
[2]:http://en.wikipedia.org/wiki/USB
[e]:m00n.silv3r@gmail.com
[g]:http://plus.google.com/117145272367995638274/posts