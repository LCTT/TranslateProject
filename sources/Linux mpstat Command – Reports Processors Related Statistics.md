Linux mpstat Command – Reports Processors Related Statistics
================================================================================
Generally today computer is using multiple processors. Or maybe 1 physical processor with 4 cores inside. On server side, more processors or cores means more power. But the other side, application also more power consumption. You may find a situation when your cpu utilization is high but you feel that you don’t running anything. On Linux system, you can monitor this activity using **mpstat**.

![linux mpstat command](http://linoxide.com/wp-content/uploads/2013/12/linux-mpstat-command.jpg)

### What is mpstat ###

**mpstat** is used to monitor cpu utilization on your system. It will be more usefull if your system has multiple processors. The first processors will signed as CPU 0. The second one will be signed CPU 1 and so on. From its manual page, mpstat is described as :

> The mpstat command writes to standard output activities for each available processor, processor 0 being the first one. Global average activities among all processors are also reported. The mpstat command can be used both on SMP and UP machines, but in the latter, only global average activities will be printed. If no activity has been selected, then the default report is the CPU utilization report

### How to run mpstat ###

Just type **mpstat** on your console to run mpstat.

    $ mpstat

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    03:29:29 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    03:29:29 PM all 6.30 0.06 1.94 3.75 0.00 0.06 0.00 0.00 87.88

If you found an error such as : **command not found** or similar you may not install mpstat in your system.

If you are using **CentOS, RedHat or Fedora**, run this command to install mpstat

    # yum install sysstat

If you are using **Debian, Ubuntu or its derivative**, run this command to install mpstat

    # apt-get install sysstat

And here’s how to read the information above.

- **03:29:29 PM** : means the time that mpstat was run
- **all** : means All CPUs
- **%usr** : show the percentage of CPU utilization that occurred while executing at the user level (application)
- **%nice** : show the percentage of CPU utilization that occurred while executing at the user level with nice priority
- **%sys** : show the percentage of CPU utilization that occurred while executing at the system level (kernel)
- **%iowait** : show the percentage of time that the CPU or CPUs were idle during which the system had an outstanding disk I/O request
- **%irq** : show the percentage of time spent by the CPU or CPUs to service hardware interrupts
- **%soft** : show the percentage of time spent by the CPU or CPUs to service software interrupts
- **%steal** : show the percentage of time spent in involuntary wait by the virtual CPU or CPUs while the hypervisor was servicing another virtual processor
- **%guest** : show the percentage of time spent by the CPU or CPUs to run a virtual processor
- **%idle** : show the percentage of time that the CPU or CPUs were idle and the system did not have an outstanding disk I/O equest

### Print CPU utilization per processors ###

As you can see above, our system has 2 CPUs. If you want, you can use -P parameter followed by CPU number to see specific CPU utilization.

    $ mpstat -P 0

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    03:54:00 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    03:54:00 PM 0 3.82 0.01 1.16 3.88 0.00 0.06 0.00 0.00 91.06

    $ mpstat -P 1
    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    03:53:58 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    03:53:58 PM 1 16.52 0.20 4.48 0.46 0.00 0.04 0.00 0.00 78.30

### Print all CPU Utilization ###

You can also print every CPU utilization of processors in a single page. Just use **-P ALL** parameter to do it

    $ mpstat -P ALL

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    04:07:36 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    04:07:36 PM all 6.02 0.04 1.72 2.99 0.00 0.05 0.00 0.00 89.17
    04:07:36 PM 0 3.84 0.01 1.15 3.72 0.00 0.06 0.00 0.00 91.21
    04:07:36 PM 1 13.55 0.15 3.66 0.46 0.00 0.03 0.00 0.00 82.15

### Print CPU utilization using intervals ###

You may want to see the CPU utilization movement. To do this, you can use intervals. Here’s an example.

    $ mpstat 3 4

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    04:27:11 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    04:27:14 PM all 0.67 0.00 0.34 0.00 0.00 0.00 0.00 0.00 98.99
    04:27:17 PM all 1.17 0.00 0.33 1.33 0.00 0.00 0.00 0.00 97.17
    04:27:20 PM all 0.84 0.00 0.17 0.00 0.00 0.00 0.00 0.00 98.99
    04:27:23 PM all 1.00 0.00 0.17 1.51 0.00 0.00 0.00 0.00 97.32
    Average: all 0.92 0.00 0.25 0.71 0.00 0.00 0.00 0.00 98.12

The above command is to show you **4 reports** about CPU utilization with **3 seconds intervals**

### Print mpstat version ###

Finally, to print mstat version, use -V parameter

    $ mpstat -V

    sysstat version 10.0.3
    (C) Sebastien Godard (sysstat orange.

That’s a quick usage of mpstat command in Linux system. You may see msptat manual page by typing **man mpstat** to explore more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-mpstat-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出