[su-kaiyao]translating

10 ‘free’ Commands to Check Memory Usage in Linux
================================================================================
**Linux** is one of the most popular open source operating system and comes with huge set of commands. The most important and single way of determining the total available space of the **physical memory** and **swap memory** is by using “**free**” command.

The Linux “**free**” command gives information about total used and available space of **physical memory** and **swap memory** with **buffers** used by kernel in **Linux/Unix** like operating systems.

![10 Linux Free Command Examples](http://www.tecmint.com/wp-content/uploads/2012/09/Linux-Free-commands.png)

This article provides some useful examples of “**free**” commands with options, that might be useful for you to better utilize memory that you have.

### 1. Display System Memory ###

Free command used to check the used and available space of **physical memory** and **swap memory** in **KB**. See the command in action below.

    # free
    
                 total       used       free     shared    buffers     cached
    Mem:       1021628     912548     109080          0     120368     655548
    -/+ buffers/cache:     136632     884996
    Swap:      4194296          0    4194296

### 2. Display Memory in Bytes ###

Free command with option **-b**, display the size of memory in **Bytes**.

    # free -b
    
                 total       used       free     shared    buffers     cached
    Mem:    1046147072  934420480  111726592          0  123256832  671281152
    -/+ buffers/cache:  139882496  906264576
    Swap:   4294959104          0 4294959104

### 3. Display Memory in Kilo Bytes ###

Free command with option **-k**, display the size of memory in (KB) **Kilobytes**.

    # free -k
    
                 total       used       free     shared    buffers     cached
    Mem:       1021628     912520     109108          0     120368     655548
    -/+ buffers/cache:     136604     885024
    Swap:      4194296          0    4194296

### 4. Display Memory in Megabytes ###

To see the size of the memory in **(MB) Megabytes** use option as **-m**.

    # free -m
    
                 total       used       free     shared    buffers     cached
    Mem:           997        891        106          0        117        640
    -/+ buffers/cache:        133        864
    Swap:         4095          0       4095

### 5. Display Memory in Gigabytes ###

Using **-g** option with free command, would display the size of the memory in **GB(Gigabytes)**.

    # free -g
                 total       used       free     shared    buffers     cached
    Mem:             0          0          0          0          0          0
    -/+ buffers/cache:          0          0
    Swap:            3          0          3

### 6. Display Total Line ###

Free command with -t option, will list the total line at the end.

    # free -t
    
                total       used       free     shared    buffers     cached
    Mem:       1021628     912520     109108          0     120368     655548
    -/+ buffers/cache:     136604     885024
    Swap:      4194296          0    4194296
    Total: 5215924 912520 4303404

### 7. Disable Display of Buffer Adjusted Line ###

By default the free command display “**buffer adjusted**” line, to disable this line use option as -o.

    # free -o
    
                total       used       free     shared    buffers     cached
    Mem:       1021628     912520     109108          0     120368     655548
    Swap:      4194296          0    4194296

### 8. Dispaly Memory Status for Regular Intervals ###

The -s option with number, used to update free command at regular intervals. For example, the below command will update free command every 5 seconds.

    # free -s 5
    
                 total       used       free     shared    buffers     cached
    Mem:       1021628     912368     109260          0     120368     655548
    -/+ buffers/cache:     136452     885176
    Swap:      4194296          0    4194296

### 9. Show Low and High Memory Statistics ###

The -l switch displays detailed high and low memory size statistics.

    # free -l
    
                 total       used       free     shared    buffers     cached
    Mem:       1021628     912368     109260          0     120368     655548
    Low:        890036     789064     100972
    High:       131592     123304       8288
    -/+ buffers/cache:     136452     885176
    Swap:      4194296          0    4194296

### 10. Check Free Version ###

The -V option, display free command version information.

    # free -V
    
    procps version 3.2.8

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-memory-usage-in-linux/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
