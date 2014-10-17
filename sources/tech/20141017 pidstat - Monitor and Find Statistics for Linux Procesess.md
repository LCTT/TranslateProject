pidstat - Monitor and Find Statistics for Linux Procesess
================================================================================
The **pidstat** command is used for monitoring individual tasks currently being managed by the Linux kernel. It writes to standard output activities for every task managed by the Linux kernel. The pidstat command can also be used for monitoring the child processes of selected tasks. The interval parameter specifies the amount of time in seconds between each report. A value of 0 (or no parameters at all) indicates that tasks statistics are to be reported for the time since system startup (boot).

### How to Install pidstat ###

pidstat is part of the sysstat suite that contains various system performance tools for Linux, it's available on the repository of most Linux distributions.

To install it on Debian / Ubuntu Linux systems you can use the following command:

    # apt-get install sysstat

If you are using CentOS / Fedora / RHEL Linux you can install the packages like this:

    # yum install sysstat

### Using pidstat ###

Running pidstat without any argument is equivalent to specifying -p ALL but only active tasks (tasks with non-zero statistics values) will appear in the report.

    # pidstat

![pidstat](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat.jpg)

In the output you can see:

- **PID** - The identification number of the task being monitored.
- **%usr** - Percentage of CPU used by the task while executing at the user level (application), with or without nice priority. Note that this field does NOT include time spent running a virtual processor.
- **%system** - Percentage of CPU used by the task while executing at the system level.
- **%guest** - Percentage of CPU spent by the task in virtual machine (running a virtual processor).
- **%CPU** - Total percentage of CPU time used by the task. In an SMP environment, the task's CPU usage will be divided by the total number of CPU's if option -I has been entered on the command line.
- **CPU** - Processor number to which the task is attached.
- **Command** - The command name of the task.

### I/O Statistics ###

We can use pidstat to get I/O statistics about a process using the -d flag. For example:

    # pidstat -d -p 8472

![pidstat io](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat-io.jpg)

The IO output will display a few new columns:

- **kB_rd/s** - Number of kilobytes the task has caused to be read from disk per second.
- **kB_wr/s** - Number of kilobytes the task has caused, or shall cause to be written to disk per second.
- **kB_ccwr/s** - Number of kilobytes whose writing to disk has been cancelled by the task.

### Page faults and memory usage ###

Using the -r flag you can get information about memory usage and page faults.

![pidstat pf mem](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat-pfmem.jpg)

Important columns:

- **minflt/s** - Total number of minor faults the task has made per second, those which have not required loading a memory page from disk.
- **majflt/s** - Total number of major faults the task has made per second, those which have required loading a memory page from disk.
- **VSZ** - Virtual Size: The virtual memory usage of entire task in kilobytes.
- **RSS** - Resident Set Size: The non-swapped physical memory used by the task in kilobytes.

### Examples ###

**1.** You can use pidstat to find a memory leek using the following command:

    # pidstat -r 2 5

This will give you 5 reports, one every 2 seconds, about the current page faults statistics, it should be easy to spot the problem process.

**2.** To show all children of the mysql server you can use the following command

    # pidstat -T CHILD -C mysql

**3.** To combine all statistics in a single report you can use:

    # pidstat -urd -h

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-pidstat-monitor-statistics-procesess/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/