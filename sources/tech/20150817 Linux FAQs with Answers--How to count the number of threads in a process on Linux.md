Linux FAQs with Answers--How to count the number of threads in a process on Linux
================================================================================
> **Question**: I have an application running, which forks a number of threads at run-time. I want to know how many threads are actively running in the program. What is the easiest way to check the thread count of a process on Linux? 

If you want to see the number of threads per process in Linux environments, there are several ways to do it.

### Method One: /proc ###

The proc pseudo filesystem, which resides in /proc directory, is the easiest way to see the thread count of any active process. The /proc directory exports in the form of readable text files a wealth of information related to existing processes and system hardware such as CPU, interrupts, memory, disk, etc.

    $ cat /proc/<pid>/status

The above command will show detailed information about the process with <pid>, which includes process state (e.g., sleeping, running), parent PID, UID, GID, the number of file descriptors used, and the number of context switches. The output also indicates **the total number of threads created in a process** as follows.

    Threads: <N>

For example, to check the thread count of a process with PID 20571:

    $ cat /proc/20571/status

![](https://farm6.staticflickr.com/5649/20341236279_f4a4d809d2_b.jpg)

The output indicates that the process has 28 threads in it.

Alternatively, you could simply count the number of directories found in /proc/<pid>/task, as shown below.

    $ ls /proc/<pid>/task | wc

This is because, for every thread created within a process, there is a corresponding directory created in /proc/<pid>/task, named with its thread ID. Thus the total number of directories in /proc/<pid>/task represents the number of threads in the process.

### Method Two: ps ###

If you are an avid user of the versatile ps command, this command can also show you individual threads of a process (with "H" option). The following command will print the thread count of a process. The "h" option is needed to hide the header in the top output.

    $ ps hH p <pid> | wc -l

If you want to monitor the hardware resources (CPU & memory) consumed by different threads of a process, refer to [this tutorial][1].(注：此文我们翻译过)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/number-of-threads-process-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/view-threads-process-linux.html