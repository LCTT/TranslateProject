Translating by MjSeven


How to display data in a human-friendly way on Linux
======

![](https://images.idgesg.net/images/article/2018/08/smile-face-on-hand-100767756-large.jpg)

Not everyone thinks in binary or wants to mentally insert commas into large numbers to come to grips with the sizes of their files. So, it's not surprising that Linux commands have evolved over several decades to incorporate more human-friendly ways of displaying information to its users. In today’s post, we look at some of the options provided by various commands that make digesting data just a little easier.

### Why not default to friendly?

If you’re wondering why human-friendliness isn’t the default –- we humans are, after all, the default users of computers — you might be asking yourself, “Why do we have to go out of our way to get command responses that will make sense to everyone?” The answer is primarily that changing the default output of commands would likely interfere with numerous other processes that were built to expect the default responses. Other tools, as well as scripts, that have been developed over the decades might break in some very ugly ways if they were suddenly fed output in a very different format than what they were built to expect.

It’s probably also true that some of us might prefer to see all of the digits in our file sizes — 1338277310 instead of 1.3G. In any case, switching defaults could be very disruptive, while promoting some easy options for more human-friendly responses only involves us learning some command options.

### Commands for displaying human-friendly data

What are some of the easy options for making the output of Unix commands a little easier to parse? Let's check some command by command.

#### top

You may not have noticed this, but you can change the display of overall memory usage in top by typing " **E** " (i.e., capital E) once top is running. Successive presses will change the numeric display from KiB to MiB to GiB to TiB to PiB to EiB and back to KiB.

OK with those units? These and a couple more are defined here:
```
2**10 = 1,024 = 1 KiB (kibibyte)
2**20 = 1,048,576 = 1 MiB (mebibyte)
2**30 = 1,073,741,824 = 1 GiB (gibibyte)
2**40 = 1,099,511,627,776 = 1 TiB (tebibyte)
2**50 = 1,125,899,906,842,624 = PiB (pebibyte)
2**60 = 1,152,921,504,606,846,976 = EiB (exbibyte)
2**70 = 1,180,591,620,717,411,303,424 = 1 ZiB (zebibyte)
2**80 = 1,208,925,819,614,629,174,706,176 = 1 YiB (yobibyte)

```

These units are closely related to kilobytes, megabytes, and gigabytes, etc. But, while close, there's still a significant difference between them. One set is based on powers of 10 and the other powers of 2. Comparing kilobytes and kibibytes, for example, we can see how they diverge:
```
KB = 1000 = 10**3
KiB = 1024 = 2**10

```

Here's an example of top output using the default display in KiB:
```
top - 10:49:06 up 5 days, 35 min, 1 user, load average: 0.05, 0.04, 0.01
Tasks: 158 total, 1 running, 118 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.0 us, 0.2 sy, 0.0 ni, 99.8 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
KiB Mem : 6102680 total, 4634980 free, 392244 used, 1075456 buff/cache
KiB Swap: 2097148 total, 2097148 free, 0 used. 5407432 avail Mem

```

After one press of an E, it changes to MiB:
```
top - 10:49:31 up 5 days, 36 min, 1 user, load average: 0.03, 0.04, 0.01
Tasks: 158 total, 2 running, 118 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.0 us, 0.6 sy, 0.0 ni, 99.4 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
MiB Mem : 5959.648 total, 4526.348 free, 383.055 used, 1050.246 buff/cache
MiB Swap: 2047.996 total, 2047.996 free, 0.000 used. 5280.684 avail Mem

```

After a second E, we get GiB:
```
top - 10:49:49 up 5 days, 36 min, 1 user, load average: 0.02, 0.03, 0.01
Tasks: 158 total, 1 running, 118 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.0 us, 0.0 sy, 0.0 ni,100.0 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
GiB Mem : 5.820 total, 4.420 free, 0.374 used, 1.026 buff/cache
GiB Swap: 2.000 total, 2.000 free, 0.000 used. 5.157 avail Mem

```

You can also change the numbers displaying per-process memory usage by pressing the letter “ **e** ”. It will change from the default of KiB to MiB to GiB to TiB to PiB (expect to see LOTS of zeroes!) and back. Here's some top output after one press of an " **e** ":
```
top - 08:45:28 up 4 days, 22:32, 1 user, load average: 0.02, 0.03, 0.00
Tasks: 167 total, 1 running, 118 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.2 us, 0.0 sy, 0.0 ni, 99.8 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
KiB Mem : 6102680 total, 4641836 free, 393348 used, 1067496 buff/cache
KiB Swap: 2097148 total, 2097148 free, 0 used. 5406396 avail Mem

 PID USER PR NI VIRT RES SHR S %CPU %MEM TIME+ COMMAND
 784 root 20 0 543.2m 26.8m 16.1m S 0.9 0.5 0:22.20 snapd
 733 root 20 0 107.8m 2.0m 1.8m S 0.4 0.0 0:18.49 irqbalance
22574 shs 20 0 107.5m 5.5m 4.6m S 0.4 0.1 0:00.09 sshd
 1 root 20 0 156.4m 9.3m 6.7m S 0.0 0.2 0:05.59 systemd

```

#### du

The du command, which shows how much disk space files or directories use, adjusts the sizes to the most appropriate measurement if the **-h** option is used. By default, it reports in kilobytes.
```
$ du camper*
360 camper_10.jpg
5684 camper.jpg
240 camper_small.jpg
$ du -h camper*
360K camper_10.jpg
5.6M camper.jpg
240K camper_small.jpg

```

#### df

The df command also offers a -h option. Note in the example below how sizes are reported in both gigabytes and megabytes.
```
$ df -h | grep -v loop
Filesystem Size Used Avail Use% Mounted on
udev 2.9G 0 2.9G 0% /dev
tmpfs 596M 1.7M 595M 1% /run
/dev/sda1 110G 9.0G 95G 9% /
tmpfs 3.0G 0 3.0G 0% /dev/shm
tmpfs 5.0M 4.0K 5.0M 1% /run/lock
tmpfs 3.0G 0 3.0G 0% /sys/fs/cgroup
tmpfs 596M 16K 596M 1% /run/user/121
/dev/sdb2 457G 73M 434G 1% /apps
tmpfs 596M 0 596M 0% /run/user/1000

```

The command below uses the **-h** option, but also includes **-T** to display the type of file system we are looking at.
```
$ df -hT /mnt2
Filesystem Type Size Used Avail Use% Mounted on
/dev/sdb2 ext4 457G 73M 434G 1% /apps

```

#### ls

Even ls gives us the option of adjusting size displays to the measurements that are the most reasonable.
```
$ ls -l camper*
-rw-rw-r-- 1 shs shs 365091 Jul 14 19:42 camper_10.jpg
-rw-rw-r-- 1 shs shs 5818597 Jul 14 19:41 camper.jpg
-rw-rw-r-- 1 shs shs 241844 Jul 14 19:45 camper_small.jpg
$ ls -lh camper*
-rw-rw-r-- 1 shs shs 357K Jul 14 19:42 camper_10.jpg
-rw-rw-r-- 1 shs shs 5.6M Jul 14 19:41 camper.jpg
-rw-rw-r-- 1 shs shs 237K Jul 14 19:45 camper_small.jpg

```

#### free

The free command allows you to report memory usage in bytes, kilobytes, megabytes, and gigabytes.
```
$ free -b
 total used free shared buff/cache available
Mem: 6249144320 393076736 4851625984 1654784 1004441600 5561253888
Swap: 2147479552 0 2147479552
$ free -k
 total used free shared buff/cache available
Mem: 6102680 383836 4737924 1616 980920 5430932
Swap: 2097148 0 2097148
$ free -m
 total used free shared buff/cache available
Mem: 5959 374 4627 1 957 5303
Swap: 2047 0 2047
$ free -g
 total used free shared buff/cache available
Mem: 5 0 4 0 0 5
Swap: 1 0 1

```

#### tree

While not related to file or memory measurements, the tree command also provides very human-friendly view of files by displaying them in a hierarchical display to illustrate how the files are organized. This kind of display can be very useful when trying to get an idea for how the contents of a directory are arranged.
```
$ tree
.g to
├── 123
├── appended.png
├── appts
├── arrow.jpg
├── arrow.png
├── bin
│ ├── append
│ ├── cpuhog1
│ ├── cpuhog2
│ ├── loop
│ ├── mkhome
│ ├── runme

```

#### stat

The stat command is another that displays information in a very human-friendly format. It provides a lot more metadata on files, including the file sizes in bytes and blocks, the file types, device and inode, owner and group (names and numeric IDs), file permissions in both numeric and rwx format and the dates the file was last accessed and modified. In some circumstances, it might also display when the file was initially created.
```
$ stat camper*
 File: camper_10.jpg
 Size: 365091 Blocks: 720 IO Block: 4096 regular file
Device: 801h/2049d Inode: 796059 Links: 1
Access: (0664/-rw-rw-r--) Uid: ( 1000/ shs) Gid: ( 1000/ shs)
Access: 2018-07-19 18:56:31.841013385 -0400
Modify: 2018-07-14 19:42:25.230519509 -0400
Change: 2018-07-14 19:42:25.230519509 -0400
 Birth: -
 File: camper.jpg
 Size: 5818597 Blocks: 11368 IO Block: 4096 regular file
Device: 801h/2049d Inode: 796058 Links: 1
Access: (0664/-rw-rw-r--) Uid: ( 1000/ shs) Gid: ( 1000/ shs)
Access: 2018-07-19 18:56:31.845013872 -0400
Modify: 2018-07-14 19:41:46.882024039 -0400
Change: 2018-07-14 19:41:46.882024039 -0400
 Birth: -

```

### Wrap-up

Linux provides many command options that can make their output easier for users to understand or compare. For many commands, the **-h** option brings up the friendlier output format. For others, you might have to specify how you'd prefer to see your output by using some specific option or pressing a key as with **top**. I hope that some of these choices will make your Linux systems seem just a little friendlier.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3296631/linux/displaying-data-in-a-human-friendly-way-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
