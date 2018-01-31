Linux Check IDE / SATA SSD Hard Disk Transfer Speed
======
So how do you find out how fast is your hard disk under Linux? Is it running at the SATA I (150 MB/s) or SATA II (300 MB/s) or SATA III (6.0Gb/s) speed without opening computer case or chassis?

You can use the **hdparm or dd command** to check hard disk speed. It provides a command line interface to various hard disk ioctls supported by the stock Linux ATA/IDE/SATA device driver subsystem. Some options may work correctly only with the latest kernels (make sure you have cutting edge kernel installed). I also recommend compiling hdparm with the included files from the most recent kernel source code.

### How to measure hard disk data transfer speed using hdparm

Login as the root user and enter the following command:
`$ sudo hdparm -tT /dev/sda`
OR
`$ sudo hdparm -tT /dev/hda`
Sample outputs:
```
/dev/sda:
 Timing cached reads: 7864 MB in 2.00 seconds = 3935.41 MB/sec
 Timing buffered disk reads: 204 MB in 3.00 seconds = 67.98 MB/sec
```

For meaningful results, this operation should be **repeated 2-3 times**. This displays the speed of reading directly from the Linux buffer cache without disk access. This measurement is essentially an indication of the **throughput of the processor, cache, and memory** of the system under test. [Here is a for loop example][1], to run test 3 time in a row:
`for i in 1 2 3; do hdparm -tT /dev/hda; done`
Where,

  *  **-t** :perform device read timings
  *  **-T** : perform cache read timings
  *  **/dev/sda** : Hard disk device file



To [find out SATA hard disk link speed][2], enter:
`sudo hdparm -I /dev/sda | grep -i speed`
Output:
```
	 *	Gen1 signaling speed (1.5Gb/s)
	 *	Gen2 signaling speed (3.0Gb/s)
	 *	Gen3 signaling speed (6.0Gb/s)

```

Above output indicate that my hard disk can use 1.5Gb/s, 3.0Gb/s, or 6.0Gb/s speed. Please note that your BIOS / Motherboard must have support for SATA-II/III:
`$ dmesg | grep -i sata | grep 'link up'`
[![Linux Check IDE SATA SSD Hard Disk Transfer Speed][3]][3]

### dd Command

You can use the dd command as follows to get speed info too:
```
dd if=/dev/zero of=/tmp/output.img bs=8k count=256k
rm /tmp/output.img
```

Sample outputs:
```
262144+0 records in
262144+0 records out
2147483648 bytes (2.1 GB) copied, 23.6472 seconds, **90.8 MB/s**

```

The [recommended syntax for the dd command is as follows][4]
```
dd if=/dev/input.file  of=/path/to/output.file  bs=block-size  count=number-of-blocks  oflag=dsync
 
## GNU dd syntax ##
dd if=/dev/zero of=/tmp/test1.img bs=1G count=1 oflag=dsync
 
## OR alternate syntax for GNU/dd ##
dd if=/dev/zero of=/tmp/testALT.img bs=1G count=1 conv=fdatasync
```


Sample outputs from the last dd command:
```
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 4.23889 s, 253 MB/s
```

### Disks & storage - GUI tool

You can also use disk utility located at System > Administration > Disk utility menu. Please note that in latest version of Gnome it is simply called Disks.

#### How do I test the performance of my hard disk using Disks on Linux?

To test the speed of your hard disk:

  1. Open **Disks** from the **Activities** overview (press the Super key on your keyboard and type Disks)
  2. Choose the **disk** from the list in the **left pane**
  3. Select the menu button and select **Benchmark disk …** from the menu
  4. Click **Start Benchmark …** and adjust the Transfer Rate and Access Time parameters as desired.
  5. Choose **Start Benchmarking** to test how fast data can be read from the disk. Administrative privileges required. Enter your password



A quick video demo of above procedure:

https://www.cyberciti.biz/tips/wp-content/uploads/2007/10/disks-performance.mp4


#### Read Only Benchmark (Safe option)

Then, select > Read only:
![Fig.01: Linux Benchmarking Hard Disk Read Only Test Speed][5]
The above option will not destroy any data.

#### Read and Write Benchmark (All data will be lost so be careful)

Visit System > Administration > Disk utility menu > Click Benchmark > Click Start Read/Write Benchmark button:
![Fig.02:Linux Measuring read rate, write rate and access time][6]

### About the author

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][7], [Facebook][8], [Google+][9].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/how-fast-is-linux-sata-hard-disk.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
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
