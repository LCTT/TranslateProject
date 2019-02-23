[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check CPU, Memory And Swap Utilization Percentage In Linux?)
[#]: via: (https://www.2daygeek.com/linux-check-cpu-memory-swap-utilization-percentage/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

How To Check CPU, Memory And Swap Utilization Percentage In Linux?
======

There is a lot of commands and options are available in Linux to check memory utilization but i don’t see much information to check about memory utilization percentage.

Most of the times we are checking memory utilization alone and we won’t think about how much percentage is used.

If you want to know those information then you are in the right page.

We are here to help you out on this in details.

This tutorial will help you to identify the memory utilization when you are facing high memory utilization frequently in Linux server.

But the same time, you won’t be getting the clear utilization if you are using `free -m` or `free -g`.

These format commands fall under Linux advanced commands. It will be very useful for Linux Experts and Middle Level Linux Users.

### Method-1: How To Check Memory Utilization Percentage In Linux?

We can use the following combination of commands to get this done. In this method, we are using combination of free and awk command to get the memory utilization percentage.

If you are looking for other articles which is related to memory then navigate to the following link. Those are **[free Command][1]** , **[smem Command][2]** , **[ps_mem Command][3]** , **[vmstat Command][4]** and **[Multiple ways to check size of physical memory][5]**.

For `Memory` Utilization Percentage without Percent Symbol:

```
$ free -t | awk 'NR == 2 {print "Current Memory Utilization is : " $3/$2*100}'
or
$ free -t | awk 'FNR == 2 {print "Current Memory Utilization is : " $3/$2*100}'

Current Memory Utilization is : 20.4194
```

For `Swap` Utilization Percentage without Percent Symbol:

```
$ free -t | awk 'NR == 3 {print "Current Swap Utilization is : " $3/$2*100}'
or
$ free -t | awk 'FNR == 3 {print "Current Swap Utilization is : " $3/$2*100}'

Current Swap Utilization is : 0
```

For `Memory` Utilization Percentage with Percent Symbol and two decimal places:

```
$ free -t | awk 'NR == 2 {printf("Current Memory Utilization is : %.2f%"), $3/$2*100}'
or
$ free -t | awk 'FNR == 2 {printf("Current Memory Utilization is : %.2f%"), $3/$2*100}'

Current Memory Utilization is : 20.42%
```

For `Swap` Utilization Percentage with Percent Symbol and two decimal places:

```
$ free -t | awk 'NR == 3 {printf("Current Swap Utilization is : %.2f%"), $3/$2*100}'
or
$ free -t | awk 'FNR == 3 {printf("Current Swap Utilization is : %.2f%"), $3/$2*100}'

Current Swap Utilization is : 0.00%
```

If you are looking for other articles which is related to memory then navigate to the following link. Those are **[Create/Extend Swap Partition using LVM][6]** , **[Multiple Ways To Create Or Extend Swap Space][7]** and **[Shell Script to automatically Create/Remove and Mount Swap File][8]**.

free command output for better clarification:

```
$ free
 total used free shared buff/cache available
Mem: 15867 3730 9868 1189 2269 10640
Swap: 17454 0 17454
Total: 33322 3730 27322
```

Details are follow:

  * **`free:`** free is a standard command to check memory utilization in Linux.
  * **`awk:`** awk is a powerful command which is specialized for textual data manipulation.
  * **`FNR == 2:`** It gives the total number of records for each input file. Basically it’s used to select the given line (Here, it chooses the line number 2).
  * **`NR == 2:`** It gives the total number of records processed. Basically it’s used to filter the given line (Here, it chooses the line number 2)..
  * **`$3/$2*100:`** It divides column 2 with column 3 and it’s multiply the results with 100.
  * **`printf:`** It used to format and print data.
  * **`%.2f%:`** By default it prints floating point numbers with 6 decimal places. Use the following format to limit a decimal places.



### Method-2: How To Check Memory Utilization Percentage In Linux?

We can use the following combination of commands to get this done. In this method, we are using combination of free, grep and awk command to get the memory utilization percentage.

For `Memory` Utilization Percentage without Percent Symbol:

```
$ free -t | grep Mem | awk '{print "Current Memory Utilization is : " $3/$2*100}'
Current Memory Utilization is : 20.4228
```

For `Swap` Utilization Percentage without Percent Symbol:

```
$ free -t | grep Swap | awk '{print "Current Swap Utilization is : " $3/$2*100}'
Current Swap Utilization is : 0
```

For `Memory` Utilization Percentage with Percent Symbol and two decimal places:

```
$ free -t | grep Mem | awk '{printf("Current Memory Utilization is : %.2f%"), $3/$2*100}'
Current Memory Utilization is : 20.43%
```

For `Swap` Utilization Percentage with Percent Symbol and two decimal places:

```
$ free -t | grep Swap | awk '{printf("Current Swap Utilization is : %.2f%"), $3/$2*100}'
Current Swap Utilization is : 0.00%
```

### Method-1: How To Check CPU Utilization Percentage In Linux?

We can use the following combination of commands to get this done. In this method, we are using combination of top, print and awk command to get the CPU utilization percentage.

If you are looking for other articles which is related to memory then navigate to the following link. Those are **[top Command][9]** , **[htop Command][10]** , **[atop Command][11]** and **[Glances Command][12]**.

If it shows multiple CPU in the output then you need to use the following method.

```
$ top -b -n1 | grep ^%Cpu
%Cpu0 : 5.3 us, 0.0 sy, 0.0 ni, 94.7 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
%Cpu1 : 0.0 us, 0.0 sy, 0.0 ni,100.0 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
%Cpu2 : 0.0 us, 0.0 sy, 0.0 ni, 94.7 id, 0.0 wa, 0.0 hi, 5.3 si, 0.0 st
%Cpu3 : 5.3 us, 0.0 sy, 0.0 ni, 94.7 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
%Cpu4 : 10.5 us, 15.8 sy, 0.0 ni, 73.7 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
%Cpu5 : 0.0 us, 5.0 sy, 0.0 ni, 95.0 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
%Cpu6 : 5.3 us, 0.0 sy, 0.0 ni, 94.7 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
%Cpu7 : 5.3 us, 0.0 sy, 0.0 ni, 94.7 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
```

For `CPU` Utilization Percentage without Percent Symbol:

```
$ top -b -n1 | grep ^%Cpu | awk '{cpu+=$9}END{print "Current CPU Utilization is : " 100-cpu/NR}'
Current CPU Utilization is : 21.05
```

For `CPU` Utilization Percentage with Percent Symbol and two decimal places:

```
$ top -b -n1 | grep ^%Cpu | awk '{cpu+=$9}END{printf("Current CPU Utilization is : %.2f%"), 100-cpu/NR}'
Current CPU Utilization is : 14.81%
```

### Method-2: How To Check CPU Utilization Percentage In Linux?

We can use the following combination of commands to get this done. In this method, we are using combination of top, print/printf and awk command to get the CPU utilization percentage.

If it shows all together CPU(s) in the single output then you need to use the following method.

```
$ top -b -n1 | grep ^%Cpu
%Cpu(s): 15.3 us, 7.2 sy, 0.8 ni, 69.0 id, 6.7 wa, 0.0 hi, 1.0 si, 0.0 st
```

For `CPU` Utilization Percentage without Percent Symbol:

```
$ top -b -n1 | grep ^%Cpu | awk '{print "Current CPU Utilization is : " 100-$8}'
Current CPU Utilization is : 5.6
```

For `CPU` Utilization Percentage with Percent Symbol and two decimal places:

```
$ top -b -n1 | grep ^%Cpu | awk '{printf("Current CPU Utilization is : %.2f%"), 100-$8}'
Current CPU Utilization is : 5.40%
```

Details are follow:

  * **`top:`** top is one of the best command to check currently running process on Linux system.
  * **`-b:`** -b option, allow the top command to switch in batch mode. It is useful when you run the top command from local system to remote system.
  * **`-n1:`** Number-of-iterations
  * **`^%Cpu:`** Filter the lines which starts with %Cpu
  * **`awk:`** awk is a powerful command which is specialized for textual data manipulation.
  * **`cpu+=$9:`** For each line, add column 9 to a variable ‘cpu’.
  * **`printf:`** It used to format and print data.
  * **`%.2f%:`** By default it prints floating point numbers with 6 decimal places. Use the following format to limit a decimal places.
  * **`100-cpu/NR:`** Finally print the ‘CPU Average’ by subtracting 100, divided by the number of records.



--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-check-cpu-memory-swap-utilization-percentage/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[2]: https://www.2daygeek.com/smem-linux-memory-usage-statistics-reporting-tool/
[3]: https://www.2daygeek.com/ps_mem-report-core-memory-usage-accurately-in-linux/
[4]: https://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/
[5]: https://www.2daygeek.com/easy-ways-to-check-size-of-physical-memory-ram-in-linux/
[6]: https://www.2daygeek.com/how-to-create-extend-swap-partition-in-linux-using-lvm/
[7]: https://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/
[8]: https://www.2daygeek.com/shell-script-create-add-extend-swap-space-linux/
[9]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[10]: https://www.2daygeek.com/linux-htop-command-linux-system-performance-resource-monitoring-tool/
[11]: https://www.2daygeek.com/atop-system-process-performance-monitoring-tool/
[12]: https://www.2daygeek.com/install-glances-advanced-real-time-linux-system-performance-monitoring-tool-on-centos-fedora-ubuntu-debian-opensuse-arch-linux/
