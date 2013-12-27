Translating----------------geekpi


Linux vmstat Command – Tool to Report Virtual Memory Statistics
================================================================================
As we already know that computer must have memory which called RAM to make the computer works. RAM is refer to a physical memory that planted into the computer mainboard. This RAM is used to load applications such as browser, word processor and so on. So actually, programs that you are using are running on the memory.

Let say you have 2 GB of memory. When you are running an operating system, it may that your available memory is only 1,5 GB. Then you actively using a lot of applications. When the usage of the memory is full, you can load more applications anymore. In plain English, the computer may say “Sorry, you can not run more applications, please close some programs if you would like to run more applications”

To solve this problem, operating system including Linux use a method named Virtual Memory. This method will search the area of memory which not used recently by any applications, then copy it into computer harddisk. This can give some free memory area and give you chance to run more applications.

To monitor this virtual memory activities, we can use **vmstat** tool.

### What is vmstat ###

Vmstat is a tool that provide reporting virtual memory statistics. It covers system’s memory, swap and processors utilizations in real time.

### How to run vmstat ###

Same with [mpstat][1], vmstat is included inside sysstat package. If you don’t have it, please install sysstat package.

To run vmstat, just type vmstat in your console. Running vmstat without parameter will show you a default result of vmstat.

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_default.png)

Let’s see how to read the information provided by vmstat :

### Procs ###

Procs have **r** column and **b** column. **r** columns means the total number of processes that waiting access fot the processor. While b column means the total no processes in a sleep state. Below those columns, there are values. From the above screenshot, we have 2 processes that waiting access to the processor and 0 for sleep processes.

### Memory ###

Memory have **swpd, free, buff** and **cache** columns. This information is the same with **free -m** command. The **swpd column** show you about how much memory has been swapped to a swap file or disk. The **free column** show you the unallocated memory available. **Buff column** means how much in use memory. And **cache column** show you about how much memory that can be swapped into swap file or disk if there are some application is needed by them.

### Swap ###

Swap show us how much memory is sent or retrieved from the swap system. The **si** column tell us how much memory is moved **from swap to real memory** per second. The so column tell us how much memory that is moved **from real memory to swap**.

### I/O ###

The **io** show us the amount of input and output activity per second in terms of blocks read and blocks written. The **bi** column tell us about the number of blocks received and the **bo** tell us about the number of blocks sent.

### System ###

System show us the number of system operations per second. The **in** column tell us about the number system interrupts per second. The **cs** column tell us the number of context switches that the system makes in order to process all tasks.

### CPU ###

CPU show us the use of CPU’s resources. The **us column** tell us how much time that processor spends on non-kernel processes. The **sy column** tell us about how much time that processor spends on kernel related tasks. The **id column** tell us about how long the processor are idle. The **wa column** tell us how much time that the processor has been waiting for I/O operations to complete before being able to continue processing tasks.

### Using vmstat with delay ###

As a tool for statistics, the best way of using vmstat is using a **delay**. So you can capture the activity periodically. Let say we want to run vmstat with 5 second delay. Just type **vmstat 5** on your console to do it.

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_delay_5.png)

The command will run every 5 seconds **until** you press Ctrl-C to stop it.
You can use **count** to limit how many times vmstat will running.

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_count_7.png)

The above command will run **vmstat with 5 seconds delay for 7 times**.

### Show active and inactive memory ###

To do it, you can add **-a** parameter to vmstat. Here’s a sample.

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_a.png)

### Show summarize disk statistics ###

vmstat can print your system disk statistics if you want. Use **-D** parameter to print it.

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_disk_sum.png)

### Show display unit ###

You can choose what unit character you want to print. Use **-S followed by k (1000), K (1024), m (1000000), M (1048576)** bytes. If you don’t choose the unit, vmstat will use K (1024).

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_define_unit.png)

### Print detail statistics for specific partition ###

To do it, you can use **-p parameter followed by device name**. Here’s an example of it.

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_partition.png)

### Files ###

vmstat is using these files to works.

    /proc/meminfo
    /proc/stat
    /proc/*/stat 

### Conclusion ###

If you feel your system is running out memory, before you add some physical memory, this tool can help you to determine the root cause of the problem. As usual, you can explore more detail about vmstat command by typing **man vmstat** on your console. It will bring you to vmstat manual page.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-mpstat-command/