再来一篇 呦西 Luoxcat
Collectl is a powerful tool to monitor system resources on Linux
================================================================================
### Monitoring system resources ###

Linux system admins often need to monitor system resources like cpu, memory, disk, network etc to make sure that the system is in a good condition. And there are plenty of commands like iotop, top, free, htop, sar etc to do the task. Today we shall take a look at a tool called collectl that can be used to measure, monitor and analyse system performance on linux.

Collectl is a nifty little program that does a lot more than most other tools. It comes with a extensive set of options that allow users to not only measure the values of multiple different system metrics but also save the data for later analysis. Unlike other tools, which are designed to measure only a specific system parameter, collectl can monitor different parameters at the same time and report them in a suitable manner.

From the [project website][1] ...

> Unlike most monitoring tools that either focus on a small set of statistics, format their output in only one way, run either interatively or as a daemon but not both, collectl tries to do it all. You can choose to monitor any of a broad set of subsystems which currently include buddyinfo, cpu, disk, inodes, infiniband, lustre, memory, network, nfs, processes, quadrics, slabs, sockets and tcp.

Take a peek at the command before we start digging deeper.

    $ collectl
    waiting for 1 second sample...
    #<--------CPU--------><----------Disks-----------><----------Network---------->
    #cpu sys inter  ctxsw KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut 
       0   0   864   1772      0      0      0      0      0      1      0       0 
       5   2  1338   2734      0      0      8      2      0      0      0       1 
       1   0  1222   2647      0      0     92      3      0      2      0       1 
       1   0   763   1722      0      0     80      3      0      1      0       2

The cpu usage, disk io, and network activity is being logged every second. The data is not difficult to read for those who understand it. The list keeps growing at a defined time interval and is easily loggable to a file. And collectl provides necessary options to record, search and do other useful things with the data.

### Install collectl ###

Ubuntu/Debian and the likes have Collectl is available in the default repositories, so just apt it.

    $ sudo apt-get install collectl

Fedora/CentOS too have it in the repos, so grab it with yum.

    $ yum install collectl

### Usage ###

#### Essential theory - Collectl subsystems ####

Different types of system resources that can be measured are called subsystems. Like cpu, memory, network bandwidth and so on. If you just run the collectl command, it will show the cpu, disk and network subsystems in a batch mode output. That has already been shown above.

According to the man page, collectl identifies the following subsystems. 

    SUMMARY SUBSYSTEMS

    b - buddy info (memory fragmentation)
    c - CPU
    d - Disk
    f - NFS V3 Data
    i - Inode and File System
    j - Interrupts
    l - Lustre
    m - Memory
    n - Networks
    s - Sockets
    t - TCP
    x - Interconnect
    y - Slabs (system object caches)
   
    DETAIL SUBSYSTEMS
   
    This is the set of detail data from which in most cases the corresponding summary data is derived.  There are currently 2 types that
    do not have corresponding summary data and those are "Environmental" and "Process".  So, if one has 3 disks  and  chooses  -sd,  one
    will  only  see a single total taken across all 3 disks.  If one chooses -sD, individual disk totals will be reported but no totals.
    Choosing -sdD will get you both.

    C - CPU
    D - Disk
    E - Environmental data (fan, power, temp),  via ipmitool
    F - NFS Data
    J - Interrupts
    L - Lustre OST detail OR client Filesystem detail
    M - Memory node data, which is also known as numa data
    N - Networks
    T - 65 TCP counters only available in plot format
    X - Interconnect
    Y - Slabs (system object caches)
    Z - Processes

To monitor and measure a particular subsystem use the "-s" option and add the subsytem identifier to it. Now lets try out a few examples.

##$# 1. Monitor cpu usage ####

To monitor just the summary of cpu usage use "-sc"

    $ collectl -sc
    waiting for 1 second sample...
    #<--------CPU-------->
    #cpu sys inter  ctxsw 
       3   0  1800   3729 
       3   0  1767   3599

To observe each cpu individually, use "C". It will output multiple lines together, one for each cpu.

    $ collectl -sC
    waiting for 1 second sample...
    
    # SINGLE CPU STATISTICS
    #   Cpu  User Nice  Sys Wait IRQ  Soft Steal Idle
          0     3    0    0    0    0    0     0   96
          1     3    0    0    0    0    0     0   96
          2     2    0    0    0    0    0     0   97
          3     1    0    0    0    0    0     0   98
          0     2    0    0    0    0    0     0   97
          1     2    0    2    0    0    0     0   95
          2     1    0    0    0    0    0     0   98
          3     4    0    1    0    0    0     0   95

Using the C and c option together will fetch you both individual measures and the summary stats in a mmore comprehensive manner, if you need.

#### 2. Monitor memory ####

Use the m subsystem to check the memory

    $ collectl -sm
    waiting for 1 second sample...
    #<-----------Memory----------->
    #Free Buff Cach Inac Slab  Map 
       2G 220M   1G   1G 210M   3G 
       2G 220M   1G   1G 210M   3G 
       2G 220M   1G   1G 210M   3G

Should not be difficult to interpret.
The M option would give further details about the memory.

    $ collectl -sM
    waiting for 1 second sample...

    # MEMORY STATISTICS 
    # Node    Total     Used     Free     Slab   Mapped     Anon   Locked    Inact Hit%
         0    7975M    5939M    2036M  215720K  372184K        0    6652K    1434M    0
         0    7975M    5939M    2036M  215720K  372072K        0    6652K    1433M    0

Does that look similar to what free reports ?

#### 3. Check disk usage ####

The d and D options provide the summary and details on disk usage.

    $ collectl -sd
    waiting for 1 second sample...
    #<----------Disks----------->
    #KBRead  Reads KBWrit Writes 
          4      1    136     24 
          0      0     80     13

    $ collectl -sD
    waiting for 1 second sample...

    # DISK STATISTICS (/sec)
    #          <---------reads---------><---------writes---------><--------averages--------> Pct
    #Name       KBytes Merged  IOs Size  KBytes Merged  IOs Size  RWSize  QLen  Wait SvcTim Util
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              1      0    2    1      17      1    5    3       2     2     6      2    1
    sda              0      0    0    0      92     11    5   18      18     1    12     12    5

Another option that provides extended information is the "--verbose" option. It expands the summary to include more information but is not identical to using D.

    $ collectl -sd --verbose

#### 4. Report multiple systems together ####

So lets say you want a report of cpu, memory and disk io together, then use the subsystems together.

    $ collectl -scmd
    waiting for 1 second sample...
    #<--------CPU--------><-----------Memory-----------><----------Disks----------->
    #cpu sys inter  ctxsw Free Buff Cach Inac Slab  Map KBRead  Reads KBWrit Writes 
       4   0  2187   4334   1G 221M   1G   1G 210M   3G      0      0      0      0 
       3   0  1896   4065   1G 221M   1G   1G 210M   3G      0      0     20      5

#### 5. Display time with the stats ####

To display the time in each line along with the measurements, use the T option. And over that, to specify options, you need to use the "-o" switch.

    $ collectl -scmd -oT
    waiting for 1 second sample...
    #         <--------CPU--------><-----------Memory-----------><----------Disks----------->
    #Time     cpu sys inter  ctxsw Free Buff Cach Inac Slab  Map KBRead  Reads KBWrit Writes 
    12:03:05    3   0  1961   4013   1G 225M   1G   1G 212M   3G      0      0      0      0 
    12:03:06    3   0  1884   3810   1G 225M   1G   1G 212M   3G      0      0      0      0 
    12:03:07    3   0  2011   4060   1G 225M   1G   1G 212M   3G      0      0      0      0

You could also display the time in milliseconds with "-oTm".

#### 6. Change sample count ####

Every row the collectl reports is a snapshot or sample. And it takes these snapshots at regular intervals, say 1 second. The i option sets the interval and c option sets the sample count.

    $ collectl -c1 -sm
    waiting for 1 second sample...
    #<-----------Memory----------->
    #Free Buff Cach Inac Slab  Map 
       1G 261M   1G   1G 228M   3G

To change interval use the i options

    $ collectl -sm -i2
    waiting for 2 second sample...
    #<-----------Memory----------->
    #Free Buff Cach Inac Slab  Map 
       1G 261M   1G   1G 229M   3G

The above command would collect memory stats every 2 seconds.

#### 7. Use collectl like iotop ####

Out of the plenty options, the "top" option makes collectl report process-wise statistics much like iostat/top commands. The list is continuously updated and can be sorted on a number of fields.

    $ collectl --top iokb

The output looks like this

    # TOP PROCESSES sorted by iokb (counters are /sec) 09:44:57
    # PID  User     PR  PPID THRD S   VSZ   RSS CP  SysT  UsrT Pct  AccuTime  RKB  WKB MajF MinF Command
     3104  enlighte 20  2683    3 S  938M   33M  0  0.00  0.00   0  00:09.16    0    4    0    0 /usr/bin/ktorrent 
        1  root     20     0    0 S   26M    3M  2  0.00  0.00   0  00:01.30    0    0    0    0 /sbin/init 
        2  root     20     0    0 S     0     0  3  0.00  0.00   0  00:00.00    0    0    0    0 kthreadd 
        3  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.02    0    0    0    0 ksoftirqd/0 
        4  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/0:0 
        5  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/0:0H 
        7  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:00.08    0    0    0    0 migration/0 
        8  root     20     2    0 S     0     0  2  0.00  0.00   0  00:00.00    0    0    0    0 rcu_bh 
        9  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 rcuob/0

The output is very similar to the top command and it sorts the process by the amount of disk io in descending order.

To display only top 5 processes use it as follows

    $ collectl --top iokb,5

To learn about what fields the above list can be sorted, use the following command

    $ collectl --showtopopts
    The following is a list of --top's sort types which apply to either
    process or slab data.  In some cases you may be allowed to sort
    by a field that is not part of the display if you so desire
    
    TOP PROCESS SORT FIELDS
    
    Memory
      vsz    virtual memory
      rss    resident (physical) memory
    
    Time
      syst   system time
      usrt   user time
      time   total time
      accum  accumulated time
    
    I/O
      rkb    KB read
      wkb    KB written
      iokb   total I/O KB
    
      rkbc   KB read from pagecache
      wkbc   KB written to pagecache
      iokbc  total pagecacge I/O
      ioall  total I/O KB (iokb+iokbc)
    
      rsys   read system calls
      wsys   write system calls
      iosys  total system calls
    
      iocncl Cancelled write bytes
    
    Page Faults
      majf   major page faults
      minf   minor page faults
      flt    total page faults
    
    Context Switches
      vctx   volunary context switches
      nctx   non-voluntary context switches
    
    Miscellaneous (best when used with --procfilt)
      cpu    cpu number
      pid    process pid
      thread total process threads (not counting main)
    
    TOP SLAB SORT FIELDS
    
      numobj    total number of slab objects
      actobj    active slab objects
      objsize   sizes of slab objects
      numslab   number of slabs
      objslab   number of objects in a slab
      totsize   total memory sizes taken by slabs
      totchg    change in memory sizes
      totpct    percent change in memory sizes
      name      slab names

#### 8. Use collectl like top ####

To make collectl report like top, we just have to report processes ordered by the cpu usage.

    $ collectl --top

The output should be like this

    # TOP PROCESSES sorted by time (counters are /sec) 14:08:46
    # PID  User     PR  PPID THRD S   VSZ   RSS CP  SysT  UsrT Pct  AccuTime  RKB  WKB MajF MinF Command
     9471  enlighte 20  9102    0 R   63M   22M  3  0.03  0.10  13  00:00.81    0    0    0    3 /usr/bin/perl 
     3076  enlighte 20  2683    2 S  521M   40M  2  0.00  0.03   3  00:55.14    0    0    0    2 /usr/bin/yakuake 
     3877  enlighte 20  3356   41 S    1G  218M  1  0.00  0.03   3  10:10.50    0    0    0    0 /opt/google/chrome/chrome 
     4625  enlighte 20  2895   36 S    1G  241M  2  0.00  0.02   2  08:24.39    0    0    0   12 /usr/lib/firefox/firefox 
     5638  enlighte 20  3356    3 S    1G  265M  1  0.00  0.02   2  09:55.04    0    0    0    2 /opt/google/chrome/chrome 
     1186  root     20  1152    4 S  502M   76M  0  0.00  0.01   1  03:02.96    0    0    0    0 /usr/bin/X 
     1334  www-data 20  1329    0 S   87M    1M  2  0.00  0.01   1  00:00.85    0    0    0    0 nginx:

You can also display sub system information along with the above

    $ collectl --top -scm

#### 9. List processes like ps ####

To just list out the processes like ps command, without updating continously, just set the sample count to 1 with the "c" options

    $ collectl -c1 -sZ -i:1

The above command will list out all the processes much like "ps -e". The 'procfilt' option can be used to filter out specific processes from the process. The 'procopts' option can be used to specify another set of options for fine tune the process list display.

#### 10. Use collectl like vmstat ####

Collectl has got a direct option to make it behave like vmstat

    $ collectl --vmstat
    waiting for 1 second sample...
    #procs ---------------memory (KB)--------------- --swaps-- -----io---- --system-- ----cpu-----
    # r  b   swpd   free   buff  cache  inact active   si   so    bi    bo   in    cs us sy  id wa
      1  0      0  1733M   242M  1922M  1137M   710M    0    0     0   108 1982  3918  2  0  95  1
      1  0      0  1733M   242M  1922M  1137M   710M    0    0     0     0 1906  3886  1  0  98  0
      1  0      0  1733M   242M  1922M  1137M   710M    0    0     0     0 1739  3480  3  0  96  0

#### 11. Detailed information about subsystems ####

The following command would collect "5 samples" of CPU statistics at "1 second" interval and print detailed information (verbose) along with the time.

    $ collectl -sc -c5 -i1 --verbose -oT
    waiting for 1 second sample...

    # CPU SUMMARY (INTR, CTXSW & PROC /sec)
    #Time      User  Nice   Sys  Wait   IRQ  Soft Steal  Idle  CPUs  Intr  Ctxsw  Proc  RunQ   Run   Avg1  Avg5 Avg15 RunT BlkT
    14:22:10     11     0     0     0     0     0     0    87     4  1312   2691     0   866     1   0.78  0.86  0.78    1    0
    14:22:11     15     0     0     0     0     0     0    84     4  1283   2496     0   866     1   0.78  0.86  0.78    1    0
    14:22:12     17     0     0     0     0     0     0    82     4  1342   2658     0   866     0   0.78  0.86  0.78    0    0
    14:22:13     15     0     0     0     0     0     0    84     4  1241   2429     0   866     1   0.78  0.86  0.78    1    0
    14:22:14     11     0     0     0     0     0     0    88     4  1270   2488     0   866     0   0.80  0.87  0.78    0    0

Change the "-s" parameter to view a different subsystem.

### Summary ###

The post so far was just a bird's view of this amazing tool called collectl. It should have given a fair idea of how flexible it is. The discussion however leaves out various other features of collectl which include the ability to record and "playback" the captured data, export data for various file formats and data formats that can be used with external tools for analysis etc.

Another major feature that collectl supports is running as a service that allows for remote monitoring making it a perfect tool for keeping a watch on resources of remote linux machines or an entire server cluster.

Collectl is accompanied with an additional set of tools named [Collectl Utils][2] (colmux, colgui, colplot) that can be used to process and analyse the data collected. May be we shall take a look at those in another post.

Check the man page to learn more about the options. I would also recommend checking out the [FAQs][3] to get a quick idea about collectl. Next, read up the [collectl documentation][4] for more indepth examples to get beyond the basics. There is also a [command equivalence matrix][5] which maps the more common commands like sar, iostat, netstat, top with their collectl equivalents.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/collectl-monitor-system-resources-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://collectl.sourceforge.net/
[2]:http://collectl-utils.sourceforge.net/
[3]:http://collectl.sourceforge.net/FAQ-collectl.html
[4]:http://collectl.sourceforge.net/Documentation.html
[5]:http://collectl.sourceforge.net/Matrix.html
