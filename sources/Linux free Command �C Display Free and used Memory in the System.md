Translating---------------------geekpi



Linux free Command – Display Free and used Memory in the System
================================================================================
System administrator must maintain the health of their server. One of the critical component is memory. When server memory is full utilized, it can slow down the server performance. To monitor memory utilization, Linux have another command that called free.

### What is free command ###

**Free** command is a tool that can display amount of free and used memory in the system. The output of free command is similar with top command. Most of Linux distribution already have free command.

### How to run it ###

To run it, just type **free** on your console. Running it without an option will show you a default view with kilobyte units.

    $ free

![Free default view](http://linoxide.com/wp-content/uploads/2013/12/free_default.png)

From the above screenshot we can read :

#### Memory (in kilobytes units) ####

- Total : 1026740
- Used : 843396
- Free : 183344
- Shared : 0
- Buffers : 52704
- Cached : 376384

#### Swap (in kilobytes units) ####

- Total : 1045500
- Used : 3376
- Free : 1042124

When you see the buffers/cache free memory is low or you see that the swap free is low, then a memory upgrade is needed. This mean that memory utilization is high. Please notice that the **shared memory column should be ignored** because it is obsolete.

### Display memory information in another units ###

As we mentioned before, by default free will show information in kilobytes unit. Free also provide us **-b (bytes), -k (kilobytes), -m (megabytes), -g (gigabytes) and –tera (terabytes)**. To show the information in the unit we want, just pick one of them and put the option behind free command. Here’s a sample output in megabytes unit.

    $ free -m

![Free with megabytes unit](http://linoxide.com/wp-content/uploads/2013/12/free_m.png)

This trick is also applied to **-b, -k, -g** and **–tera** option.

### Display memory information in human readable ###

Free also provide us with **-h** option which mean human readable. So what is the difference with previous option, such as **-m** (megabytes) option? The most visible difference is that **-h** option will add human readable unit after the numbers. Let’s take a look a sample of it.

    $ free -h

![Human readable free](http://linoxide.com/wp-content/uploads/2013/12/free_h.png)

As we can see together, there is **G (gigabyte)** letter behind 1,0 number. When the number is not reach gigabtye, free is smart enough to know it and put the appropriate unit behind each numbers. **M** letter behind – let say – 929 number tell us its 969 Megabytes.

### Display free with delay ###

As one of statistic tool, the best way to capture memory utilization is using a delay. To do this, we can use **-s** option followed by N seconds that we want. We can always combine more than 1 options to make the output is fit with our needs. Let say we want to capture memory utilization every 3 seconds and human readable. So the command will be like this :

    $ free -hs 3

![Free with 3 seconds delay](http://linoxide.com/wp-content/uploads/2013/12/free_hs3.png)

### Display low and high memory utilization ###

If we want to show low and high memory statistics, we can use -l option. Here’s a sample.

    $ free -l

![Free low-high statistics](http://linoxide.com/wp-content/uploads/2013/12/free_l.png)

### Display Linux total memory ###

When we need the information of total for every column, we can add -t option behind free command. This will add 1 more row at the bottom which display it.

    $ free -t

![Free with total memory](http://linoxide.com/wp-content/uploads/2013/12/free_t.png)

### Conclusion ###

Besides [vmstat][1], Free command is another simple statistic tool for capturing memory utilization. With this you can grab a quick information about what happen in your Linux memory. Free is using /proc/meminfo as a base for showing memory utilization information. As usual, you can always type man free on your console to explore more detail about free.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-free-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/