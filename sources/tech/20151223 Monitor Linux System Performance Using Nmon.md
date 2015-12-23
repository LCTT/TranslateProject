Monitor Linux System Performance Using Nmon
================================================================================
Nmon (also known as Nigel’s Monitor) is a computer performance system monitor tool for the AIX and Linux operating systems developed by IBM employee Nigel Griffiths. The tool displays onscreen or saves to a data file the operating system statistics to aid in the understanding of computer resource use, tuning options and bottlenecks. This system benchmark tool gives you a huge amount of important performance information in one go with a single command. You can easily monitor your system’s CPU, memory, network, disks, file systems, NFS, top processes, resources and power micro-partition information using Nmon.

### Installing Nmon ###

By default nmon is available in the Ubuntu repository. You can easily install nmon by running the following command:

    sudo apt-get install nmon

How to Use Nmon to Monitor Linux Performance

Once the installation has been finished, you can launch it by typing the `nmon` command in the terminal.

    nmon

You wI’ll see the following output:

![nmon-output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon-output.png)

You can see from the above screenshot that the nmon command-line utility runs completely in interactive mode, and you can easily toggle statistics using shortcut keys.

You can use the following nmon keyboard shortcuts to display different system stats:

- `q` : to stop and exit Nmon
- `h` : to see help screen
- `c` : see CPU stats
- `m` : see memory stats
- `d` : see disk stats
- `k` : see kernel stats
- `n` : see network stats
- `N` : see NFS stats
- `j` : see file system stats
- `t` : see top process
- `V` : see virtual memory stats
- `v` : verbose mode

### Check CPU by Processor ###

If you would like to collect some statistics on CPU performance, you should hit the c key on the keyboard.

After hitting the c key you wI’ll see the following output.

![nmon_cpu_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_cpu_output.png)

### Check Top Process Statistics ###

To get stats on top processes that are running on your system, press the t key on your keyboard.

You will see the following output.

![nmon_process_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_process_output.jpg)

### Check Network Statistics ###

To get the network stats of your Linux system, just press the n key on your keyboard.

You wI’ll see the following output:

![n_network_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_network_output.png)

### Disk I/O Graphs ###

Use the `d` key to get information about disks.

You wI’ll see the following output:

![nmon_disk_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_disk_output.png)

### Check Kernel Information ###

A most important key to use with this tool is `k;` it is used to display some brief information on the kernel of your system.

You will see the following output after hitting the `k` key on your keyboard.

![nmon_kernel_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_kernel_output.png)

### Get System Information ###

A very useful key for every system admin is the `r` key which is used to give information on different resources such as machine architecture, operating system version, Linux version and CPU.

You will see the following output by hitting the `r` key.

![nmon_system_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_system_output.png)

### Conclusion ###

There are many other tools that can do the same job of the Nmon, but Nmon is so usee friendly for a Linux beginner. Please feel free to comment if you have any questions.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/monitor-linux-system-performance/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/
