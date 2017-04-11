Cpustat – Monitors CPU Utilization by Running Processes in Linux
============================================================

Cpustat is a powerful system performance measure program for Linux, written using [Go programming language][3]. It attempts to reveal CPU utilization and saturation in an effective way, using The Utilization Saturation and Errors (USE) Method (a methodology for analyzing the performance of any system).

It extracts higher frequency samples of every process being executed on the system and then summarizes these samples at a lower frequency. For instance, it can measure every process every 200ms and summarize these samples every 5 seconds, including min/average/max values for certain metrics.

**Suggested Read:** [20 Command Line Tools to Monitor Linux Performance][4]

Cpustat outputs data in two possible ways: a pure text list of the summary interval and a colorful scrolling dashboard of each sample.

### How to Install Cpustat in Linux

You must have Go (GoLang) installed on your Linux system in order to use cpustat, click on the link below to follow the GoLang installation steps that is if you do not have it installed:

1.  [Install GoLang (Go Programming Language) in Linux][1]

Once you have installed Go, type the go get command below to install it, this command will install the cpustat binary in your GOBIN variable:

```
# go get github.com/uber-common/cpustat
```

### How to Use Cpustat in Linux

When the installation process completes, run cpustat as follows with root privileges using the sudo command that is if your controlling the system as a non-root user, otherwise you’ll get the error as shown:

```
$ $GOBIN/cpustat
This program uses the netlink taskstats interface, so it must be run as root.
```

Note: To run cpustat as well as all other Go programs you have installed on your system like any other commands, include GOBIN variable in your PATH environment variable. Open the link below to learn how to set the PATH variable in Linux.

1.  [Learn How to Set Your $PATH Variables Permanently in Linux][2]

This is how cpustat works; the `/proc` directory is queried to get the current [list of process IDs][5] for every interval, and:

*   for each PID, read /proc/pid/stat, then compute difference from previous sample.
*   in case it’s a new PID, read /proc/pid/cmdline.
*   for each PID, send a netlink message to fetch the taskstats, compute difference from previous sample.
*   fetch /proc/stat to get the overall system stats.

Again, each sleep interval is adjusted to account for the amount of time consumed fetching all of these stats. Furthermore, each sample also records the time it took to scale each measurement by the actual elapsed time between samples. This attempts to account for delays in cpustat itself.

When run without any arguments, cpustat will display the following by default: sampling interval: 200ms, summary interval: 2s (10 samples), [showing top 10 procs][6], user filter: all, pid filter: all as shown in the screenshot below:

```
$ sudo $GOBIN/cpustat 
```
[
 ![Cpustat - Monitor Linux CPU Usage](http://www.tecmint.com/wp-content/uploads/2017/03/Cpustat-Monitor-Linux-CPU-Usage.png) 
][7]

Cpustat – Monitor Linux CPU Usage

From the output above, the following are the meanings of the system-wide summary metrics displayed before the fields:

*   usr – min/avg/max user mode run time as a percentage of a CPU.
*   sys – min/avg/max system mode run time as a percentage of a CPU.
*   nice – min/avg/max user mode low priority run time as a percentage of a CPU.
*   idle – min/avg/max user mode run time as a percentage of a CPU.
*   iowait – min/avg/max delay time waiting for disk IO.
*   prun – min/avg/max count of processes in a runnable state (same as load average).
*   pblock – min/avg/max count of processes blocked on disk IO.
*   pstart – number of processes/threads started in this summary interval.

Still from the output above, for a given process, the different columns mean:

*   name – common process name from /proc/pid/stat or /proc/pid/cmdline.
*   pid – process id, also referred to as “tgid”.
*   min – lowest sample of user+system time for the pid, measured from /proc/pid/stat. Scale is a percentage of a CPU.
*   max – highest sample of user+system time for this pid, also measured from /proc/pid/stat.
*   usr – average user time for the pid over the summary period, measured from /proc/pid/stat.
*   sys – average system time for the pid over the summary period, measured from /proc/pid/stat.
*   nice – indicates current “nice” value for the process, measured from /proc/pid/stat. Higher means “nicer”.
*   runq – time the process and all of its threads spent runnable but waiting to run, measured from taskstats via netlink. Scale is a percentage of a CPU.
*   iow – time the process and all of its threads spent blocked by disk IO, measured from taskstats via netlink. Scale is a percentage of a CPU, averaged over the summary interval.
*   swap – time the process and all of its threads spent waiting to be swapped in, measured from taskstats via netlink. Scale is a percentage of a CPU, averaged over the summary interval.
*   vcx and icx – total number of voluntary context switches by the process and all of its threads over the summary interval, measured from taskstats via netlink.
*   rss – current RSS value fetched from /proc/pid/stat. It is the amount of memory this process is using.
*   ctime – sum of user+sys CPU time consumed by waited for children that exited during this summary interval, measured from /proc/pid/stat.

Note that long running child processes can often confuse this measurement, because the time is reported only when the child process exits. However, this is useful for measuring the impact of frequent cron jobs and health checks where the CPU time is often consumed by many child processes.

*   thrd – number of threads at the end of the summary interval, measured from /proc/pid/stat.
*   sam – number of samples for this process included in the summary interval. Processes that have recently started or exited may have been visible for fewer samples than the summary interval.

The following command displays the top 10 root user processes running on the system:

```
$ sudo $GOBIN/cpustat -u root
```
[
 ![Find Root User Running Processes](http://www.tecmint.com/wp-content/uploads/2017/03/show-root-user-processes.png) 
][8]

Find Root User Running Processes

To display output in a fancy terminal mode, use the `-t` flag as follows:

```
$ sudo $GOBIN/cpustat -u roo -t
```
[
 ![Running Process Usage of Root User](http://www.tecmint.com/wp-content/uploads/2017/03/Root-User-Runnng-Processes.png) 
][9]

Running Process Usage of Root User

To view the [top x number of processes][10] (the default is 10), you can use the `-n` flag, the following command shows the [top 20 Linux processes running][11] on the system:

```
$ sudo $GOBIN/cpustat -n 20 
```

You can also write CPU profile to a file using the `-cpuprofile` option as follows and then use the [cat command][12] to view the file:

```
$ sudo $GOBIN/cpustat -cpuprofile cpuprof.txt
$ cat cpuprof.txt
```

To display help info, use the `-h` flag as follows:

```
$ sudo $GOBIN/cpustat -h
```

Find additional info from the cpustat Github Repository: [https://github.com/uber-common/cpustat][13]

That’s all! In this article, we showed you how to install and use cpustat, a useful system performance measure tool for Linux. Share your thoughts with us via the comment section below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/cpustat-monitors-cpu-utilization-by-processes-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-go-in-linux/
[2]:http://www.tecmint.com/set-path-variable-linux-permanently/
[3]:http://www.tecmint.com/install-go-in-linux/
[4]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[5]:http://www.tecmint.com/find-process-name-pid-number-linux/
[6]:http://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Cpustat-Monitor-Linux-CPU-Usage.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/show-root-user-processes.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Root-User-Runnng-Processes.png
[10]:http://www.tecmint.com/find-processes-by-memory-usage-top-batch-mode/
[11]:http://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
[12]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[13]:https://github.com/uber-common/cpustat
[14]:http://www.tecmint.com/author/aaronkili/
[15]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[16]:http://www.tecmint.com/free-linux-shell-scripting-books/
