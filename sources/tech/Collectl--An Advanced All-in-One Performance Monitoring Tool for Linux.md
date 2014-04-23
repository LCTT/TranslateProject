** Linchenguang is translating this essay
===============================================================================

Collectl: An Advanced All-in-One Performance Monitoring Tool for Linux
================================================================================
The most important duty of a Linux system administrator is to make sure the system he/she is administering is in a very good condition. There are many tools available for a Linux system admins that can help to monitor and display processes in a system such as top and htop, but none of these tools can compete with **collectl**.

![Collectl: Linux Performance Monitoring](http://www.tecmint.com/wp-content/uploads/2014/04/Collectl-Linux-Monitoring.jpg)

**collectl** is a very nice feature rich command-line utility that can be used to collect performance data that describes the current system status. Unlike most of the other monitoring tools, collectl does not focus in a limited number of system metrics, instead it can gather information on many different types of system resources such as cpu, disk, memory, network, sockets, tcp, inodes, infiniband, lustre, memory, nfs, processes, quadrics, slabs and buddyinfo.

A very good thing about using **collectl** is that it can also play the role of utilities that are designed with only a specific purpose such as top, ps, iotop and many others. What are some features that make **colleclt** a useful tool?

After doing a lot of research I have compiled a list with some of the most important features of the collectl command-line utility for you guys.

### Collectl Features ###

- It can run interactively, as a daemon or both.
- It can display the output in many formats.
- It has the ability to monitor almost any subsystem.
- It can play the role of many other utilities such as ps, top, iotop, vmstat.
- It has the ability to record and playback the captured data.
- It can export the data in various file formats. (this is very useful when you want to analyse the data with external tools).
- It can run as a service to monitor remote machines or an entire server cluster.
- It can display the data in the terminal, write to a file or a socket.

### How to Install collectl in Linux ###

The **collectl** utility runs on all Linux distributions, the only thing it requires to run is perl, so make sure that you have **Perl** installed in your machine before installing collectl in your machine.

#### On Debian/Ubuntu/Linux Mint ####

The following command can be used to install the collectl utility in Debian based machines such as Ubuntu.

#### On Debian/Ubuntu/Linux Mint ####

The following command can be used to install the collectl utility in Debian based machines such as Ubuntu.

    $ sudo apt-get install collectl

#### On RHEL/CentOS/Fedora ####

If you are using Red Hat based distro, you can easily grab it from the repos with the yum command.

    # yum install collectl

### Some Practical Examples Of The collectl Utility ###

Once the installation of the collectl tool is finished, you can easily run it from the terminal, even without any option. The following command will display information on cpu, disk and network stats in a very short and human readable format.

    # collectl

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut 
      13   5   790   1322      0      0     92      7      4     13      0       5 
      10   2   719   1186      0      0      0      0      3      9      0       4 
      12   0   753   1188      0      0     52      3      2      5      0       6 
      13   2   733   1063      0      0      0      0      1      1      0       1 
      25   2   834   1375      0      0      0      0      1      1      0       1 
      28   2   870   1424      0      0     36      7      1      1      0       1 
      19   3   949   2271      0      0     44      3      1      1      0       1 
      17   2   809   1384      0      0      0      0      1      6      0       6 
      16   2   732   1348      0      0      0      0      1      1      0       1 
      22   4   993   1615      0      0     56      3      1      2      0       3

As you guys can see from the above output displayed in the terminal screen, it is very easy to work with the system metrics values present in the command output because it appears on a single line.

When the collectl utility is executed without any option it displays information about the following subsystems:

- cpu
- disks
- network

**Note**: In our case, a subsystem is every type of a system resource that can be measured.

You can also display statistics for all subsystems except slabs by combining the command with the **–all** option like shown below.

    # collectl --all

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw Cpu0 Cpu1 Free Buff Cach Inac Slab  Map   Fragments KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut   IP  Tcp  Udp Icmp  Tcp  Udp  Raw Frag Handle Inodes  Reads Writes Meta Comm 
      16   3   817   1542  430  390   1G 175M   1G 683M 193M   1G nsslkjjebbk      0      0     24      3      1      1      0       1    0    0    0    0  623    0    0    0   8160 240829      0      0    0    0 
      11   1   745   1324  316  426   1G 175M   1G 683M 193M   1G nsslkjjebbk      0      0      0      0      0      3      0       2    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      15   2   793   1683  371  424   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0      0      0      1      1      0       1    0    0    0    0  622    0    0    0   8160 240829      0      0    0    0 
      16   2   872   1875  427  446   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0     24      3      1      1      0       1    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      24   2   842   1383  473  368   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0    168      6      1      1      0       1    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      27   3   844   1099  478  365   1G 175M   1G 683M 193M   1G nsslkjjebbk      0      0      0      0      1      6      1       9    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      26   5   823   1238  396  428   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0      0      0      2     11      3       9    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      15   1   753   1276  361  391   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0     40      3      1      2      0       3    0    0    0    0  623    0    0    0   8160 240829      0      0    0    0

But, how do you monitor the cpu usage with the help of the utility? The ‘-s‘ option should be used to controls which subsystem data is to be collected or played back.

For example the following command can be used to monitor the summary of the cpu usage.

    # collectl -sc

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw 
      15   2   749   1155 
      16   3   772   1445 
      14   2   793   1247 
      27   4   887   1292 
      24   1   796   1258 
      16   1   743   1113 
      15   1   743   1179 
      14   1   706   1078 
      15   1   764   1268

What happens when you combine the command with “**scdn**“? The best way to learn how to use command-line tools is to practice as much as possible, so run the following command in your terminal and see what is going to happen.

    # collectl -scdn

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut 
      25   4   943   3333      0      0      0      0      1      1      0       2 
      27   3   825   2910      0      0      0      0      1      1      0       1 
      27   5   886   2531      0      0      0      0      0      0      0       1 
      20   4   872   2406      0      0      0      0      1      1      0       1 
      26   1   854   2091      0      0     20      2      1      1      0       1 
      39   4  1004   3398      0      0      0      0      2      8      3       6 
      41   6   955   2464      0      0     40      3      1      2      0       3 
      25   7   890   1609      0      0      0      0      1      1      0       1 
      16   2   814   1165      0      0    796     43      2      2      0       2 
      14   1   779   1383      0      0     48      6      1      1      0       1 
      11   2   795   1285      0      0      0      0      2     14      1      14

You can easily understand that the default option is “**cdn**“, it stands for cpu, disks and network data. The result of the command is the same with the output of “**collectl -scn**“

If you want to collect data about the memory, use the following command.

    # collectl -sm

    waiting for 1 second sample...
    #
    #Free Buff Cach Inac Slab  Map 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G

The above output is very useful when you want to get some detailed information on your memory usage, free memory and other important stuff for the performance of your system.

How about some data on tcp? Use the following command to do it.

    # collectl -st

    waiting for 1 second sample...
    #
    #  IP  Tcp  Udp Icmp 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0

After you have gained some experience you can easily combine options to get the results you want. For example you can combine the “**t**” for tcp and “**c**” for cpu. The following command does that.

    # collectl -stc

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw   IP  Tcp  Udp Icmp 
      23   8   961   3136    0    0    0    0 
      24   5   916   3662    0    0    0    0 
      21   8   848   2408    0    0    0    0 
      30  10   916   2674    0    0    0    0 
      38   3   826   1752    0    0    0    0 
      31   3   820   1408    0    0    0    0 
      15   5   781   1335    0    0    0    0 
      17   3   802   1314    0    0    0    0 
      17   3   755   1218    0    0    0    0 
      14   2   788   1321    0    0    0    0

It is hard for us humans to remember all the available options so I am posting the summary list of subsystems supported by the tool.

- **b** – buddy info (memory fragmentation)
- **c** – CPU
- **d** – Disk
- **f** – NFS V3 Data
- **i** – Inode and File System
- **j** – Interrupts
- **l** – Lustre
- **m** – Memory
- **n** – Networks
- **s** – Sockets
- **t** – TCP
- **x** – Interconnect
- **y** – Slabs (system object caches)

A very important piece of data for a system administrator or a Linux user is the data collected on disk usage. The following command will help you to monitor the disk usage.

    # collectl -sd

    waiting for 1 second sample...
    #
    #KBRead  Reads KBWrit Writes 
          0      0      0      0 
          0      0      0      0 
          0      0     92      7 
          0      0      0      0 
          0      0     36      3 
          0      0      0      0 
          0      0      0      0 
          0      0    100      7 
          0      0      0      0

You can also use the “**-sD**” option to collect data on individual disks, but you have to know that information on total disks will not be reported.

    # collectl -sD

    waiting for 1 second sample...

    # DISK STATISTICS (/sec)
    #           Pct
    #Name       KBytes Merged  IOs Size  KBytes Merged  IOs Size  RWSize  QLen  Wait SvcTim Util
    sda              0      0    0    0      52     11    2   26      26     1     8      8    1
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0      24      0    2   12      12     0     0      0    0
    sda              0      0    0    0     152      0    4   38      38     0     0      0    0
    sda              0      0    0    0     192     45    3   64      64     1    20     20    5
    sda              0      0    0    0     204      0    2  102     102     0     0      0    0
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0     116     26    3   39      38     1    16     16    4
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0      32      5    3   11      10     1    16     16    4
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0

You can also use other detail subsystems to collect detailed data. The following is a list of the detail subsystems.

- **C** – CPU
- **D** – Disk
- **E** – Environmental data (fan, power, temp), via ipmitool
- **F** – NFS Data
- **J** – Interrupts
- **L** – Lustre OST detail OR client Filesystem detail
- **N** – Networks
- **T** – 65 TCP counters only available in plot format
- **X** – Interconnect
- **Y** – Slabs (system object caches)
- **Z** – Processes

There are many available options in the collectl utility, but there is not enough time and space to cover them all in only one article. However it is worth mentioning and teaching how to use the utility as **top** and **ps**.

It is very easy to make collectl work as the top utility, just run the following command in your terminal and you will see the similar output the **top** tool gives you when it is executed in your Linux system.

    # collectl --top

    # TOP PROCESSES sorted by time (counters are /sec) 13:11:02
    # PID  User     PR  PPID THRD S   VSZ   RSS CP  SysT  UsrT Pct  AccuTime  RKB  WKB MajF MinF Command
    ^COuch!tecmint  20     1   40 R    1G  626M  0  0.01  0.14  15  28:48.24    0    0    0  109 /usr/lib/firefox/firefox 
     3403  tecmint  20     1   40 R    1G  626M  1  0.00  0.20  20  28:48.44    0    0    0  600 /usr/lib/firefox/firefox 
     5851  tecmint  20  4666    0 R   17M   13M  0  0.02  0.06   8  00:01.28    0    0    0    0 /usr/bin/perl 
     1682  root     20  1666    2 R  211M   55M  1  0.02  0.01   3  03:10.24    0    0    0   95 /usr/bin/X 
     3454  tecmint  20  3403    8 S  216M   45M  1  0.01  0.02   3  01:23.32    0    0    0    0 /usr/lib/firefox/plugin-container 
     4658  tecmint  20  4657    3 S  207M   17M  1  0.00  0.02   2  00:08.23    0    0    0  142 gnome-terminal 
     2890  tecmint  20  2571    3 S  340M   68M  0  0.00  0.01   1  01:19.95    0    0    0    0 compiz 
     3521  tecmint  20     1   24 S  710M  148M  1  0.01  0.00   1  01:47.84    0    0    0    0 skype 
        1  root     20     0    0 S    3M    2M  0  0.00  0.00   0  00:02.57    0    0    0    0 /sbin/init 
        2  root     20     0    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kthreadd 
        3  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.60    0    0    0    0 ksoftirqd/0 
        5  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/0:0H 
        7  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/u:0H 
        8  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:04.42    0    0    0    0 migration/0 
        9  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 rcu_bh 
       10  root     20     2    0 R     0     0  0  0.00  0.00   0  00:02.22    0    0    0    0 rcu_sched 
       11  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:00.05    0    0    0    0 watchdog/0 
       12  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:00.07    0    0    0    0 watchdog/1 
       13  root     20     2    0 S     0     0  1  0.00  0.00   0  00:00.73    0    0    0    0 ksoftirqd/1 
       14  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:01.96    0    0    0    0 migration/1 
       16  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kworker/1:0H 
       17  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 cpuset

And now last but not least, to use the collectl utility as the ps tool run the following command in your terminal. You will get information about processes in your system the same way as you do when you run the “**ps**” command in your terminal.

    # collectl -c1 -sZ -i:1

    waiting for 1 second sample...

    ### RECORD    1 >>> tecmint-vgn-z13gn <<< (1397979716.001) (Sun Apr 20 13:11:56 2014) ###

    # PROCESS SUMMARY (counters are /sec)
    # PID  User     PR  PPID THRD S   VSZ   RSS CP  SysT  UsrT Pct  AccuTime  RKB  WKB MajF MinF Command
        1  root     20     0    0 S    3M    2M  0  0.00  0.00   0  00:02.57    0    0    0    0 /sbin/init 
        2  root     20     0    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kthreadd 
        3  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.60    0    0    0    0 ksoftirqd/0 
        5  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/0:0H 
        7  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/u:0H 
        8  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:04.42    0    0    0    0 migration/0 
        9  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 rcu_bh 
       10  root     20     2    0 S     0     0  0  0.00  0.00   0  00:02.24    0    0    0    0 rcu_sched 
       11  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:00.05    0    0    0    0 watchdog/0 
       12  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:00.07    0    0    0    0 watchdog/1 
       13  root     20     2    0 S     0     0  1  0.00  0.00   0  00:00.73    0    0    0    0 ksoftirqd/1 
       14  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:01.96    0    0    0    0 migration/1 
       16  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kworker/1:0H 
       17  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 cpuset 
       18  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 khelper 
       19  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kdevtmpfs 
       20  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 netns 
       21  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 bdi-default 
       22  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kintegrityd

I am very sure that many Linux system administrators will like this tool and will feel its power when using it to the fullest. If you like to advance your knowledge about collectl to the next level refer to its manual pages and keep practicing.

Just type the following command in your terminal and start reading.

    # man collectl

### Reference Links ###

- [collectl Homepage][1]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-performance-monitoring-with-collectl-tool/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://collectl.sourceforge.net/index.html
