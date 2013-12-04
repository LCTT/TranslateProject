translating-----------------geekpi


10 basic examples of Linux ps command
================================================================================
### Linux ps command ###

The ps command on linux is one of the most basic commands for viewing the processes running on the system. It provides a snapshot of the current processes along with detailed information like user id, cpu usage, memory usage, command name etc. It does not display data in real time like top or htop commands. But even though being simpler in features and output it is still an essential process management/monitoring tool that every linux newbie should know about and learn well.

In this post we are going to revise the basics of using the ps command to check the processes and filter and sort them in different ways to suit better.

### Note on syntax ###

The ps command comes with an unusual set of 2 syntax styles. That is BSD and UNIX both. New users are often confused with and mis-interpret the two styles. So here is some basic info to get it clear before moving on.

> Note : "ps aux" is not the same as "ps -aux". For example "-u" is used to show process of that user. But "u" means show detailed information.

BSD style - The options in bsd style syntax are not preceded with a dash.

    ps aux

UNIX/LINUX style - The options in linux style syntax are preceded by a dash as usual.

    ps -ef

It is okay to mix both the syntax styles on linux systems. For example "ps ax -f".
But in this post we shall mostly focus on the unix style syntax.

### How to use ps command ###

#### 1. Display all processes ####

The following command will give a full list of processes

    $ ps ax
    $ ps -ef

Pipe the output to "less" to make it scrollable.

Use the "u" option or "-f" option to display detailed information about the processes

    $ ps aux
    $ ps -ef -f

> Why is the USER column not displaying my username, but showing others like root, www-data etc ?

For all usernames (including yours) if the length is greater than 8 characters then ps will fall back to show only the UID instead of username.

#### 2. Display process by user ####

To filter the processes by the owning user use the "-u" option followed by the username. Multiple usernames can be provided separated by a comma.

    $ ps -f -u www-data
    UID        PID  PPID  C STIME TTY          TIME CMD
    www-data  1329  1328  0 09:32 ?        00:00:00 nginx: worker process
    www-data  1330  1328  0 09:32 ?        00:00:00 nginx: worker process
    www-data  1332  1328  0 09:32 ?        00:00:00 nginx: worker process
    www-data  1377  1372  0 09:32 ?        00:00:00 php-fpm: pool a.localhost                                               
    www-data  1378  1372  0 09:32 ?        00:00:00 php-fpm: pool a.localhost                                               
    www-data  4524  2359  0 10:03 ?        00:00:00 /usr/sbin/apache2 -k start
    www-data  4527  2359  0 10:03 ?        00:00:00 /usr/sbin/apache2 -k start
    www-data  4528  2359  0 10:03 ?        00:00:00 /usr/sbin/apache2 -k start

#### 3. Show process by name or process id ####

To search the processes by their name or command use the "-C" option followed by the search term.

    $ ps -C apache2
      PID TTY          TIME CMD
     2359 ?        00:00:00 apache2
     4524 ?        00:00:00 apache2
     4525 ?        00:00:00 apache2
    ...

To display processes by process id, use the "-p" option and provides the process ids separated by comma.

    $ ps -f  -p 3150,7298,6544

The "-C" must be provided with the exact process name and it cannot actually search with a partial name or wildcard. To search the process list more flexibly, the usual grep command has to be used

    $ ps -ef | grep apache

#### 4. Sort process by cpu or memory usage ####

System administrators often want to find out processes that are consuming lots of memory or CPU. The sort option will sort the process list based on a particular field or parameter.

Multiple fields can be specified with the "--sort" option separated by a comma. Additionally the fields can be prefixed with a "-" or "+" symbol indicating descending or ascending sort respectively. There are lots of parameters on which the process list can be sorted. Check the man page for the complete list.

    $ ps aux --sort=-pcpu,+pmem

Display the top 5 processes consuming most of the cpu.

    $ ps aux --sort=-pcpu | head -5
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root         1  2.6  0.7  51396  7644 ?        Ss   02:02   0:03 /usr/lib/systemd/systemd --switched-root --system --deserialize 23
    root      1249  2.6  3.0 355800 30896 tty1     Rsl+ 02:02   0:02 /usr/bin/X -background none :0 vt01 -nolisten tcp
    root       508  2.4  1.6 248488 16776 ?        Ss   02:02   0:03 /usr/bin/python /usr/sbin/firewalld --nofork
    silver    1525  2.1  2.3 448568 24392 ?        S    02:03   0:01 /usr/bin/python /usr/share/system-config-printer/applet.py

#### 5. Display process hierarchy in a tree style ####

Many processes are actually forked out of some parent process, and knowing this parent child relationship is often helpful. The '--forest' option will construct an ascii art style tree view of the process hierarchy.

The following command will search for processes by the name apache2 and construct a tree and display detailed information.

    $ ps -f --forest -C apache2
    UID        PID  PPID  C STIME TTY          TIME CMD
    root      2359     1  0 09:32 ?        00:00:00 /usr/sbin/apache2 -k start
    www-data  4524  2359  0 10:03 ?        00:00:00  \_ /usr/sbin/apache2 -k start
    www-data  4525  2359  0 10:03 ?        00:00:00  \_ /usr/sbin/apache2 -k start
    www-data  4526  2359  0 10:03 ?        00:00:00  \_ /usr/sbin/apache2 -k start
    www-data  4527  2359  0 10:03 ?        00:00:00  \_ /usr/sbin/apache2 -k start
    www-data  4528  2359  0 10:03 ?        00:00:00  \_ /usr/sbin/apache2 -k start

> Try not to use any sorting with the tree style display, as they both effect the order of display in different ways.

#### 6. Display child processes of a parent process ####

Here is an example of finding all forked apache processes.

    $ ps -o pid,uname,comm -C apache2
      PID USER     COMMAND
     2359 root     apache2
     4524 www-data apache2
     4525 www-data apache2
     4526 www-data apache2
     4527 www-data apache2
     4528 www-data apache2
    [term]

    The first process that is owned by root is the main apache2 process and all other apache2 processes have been forked out of this main process. The next command lists all child apache2 processes using the pid of the main apache2 process

    [term]
    $ ps --ppid 2359
      PID TTY          TIME CMD
     4524 ?        00:00:00 apache2
     4525 ?        00:00:00 apache2
     4526 ?        00:00:00 apache2
     4527 ?        00:00:00 apache2
     4528 ?        00:00:00 apache2

#### 7. Display threads of a process ####

The "-L" option will display the threads along with the processes. It can be used to display all threads of a particular process or all processes.

The following command shall display all the threads owned by the process with id 3150.

    $ ps -p 3150 -L

#### 8. Change the columns to display ####

The ps command can be configured to show a selected list of columns only. There are a large number of columns to to show and the full list is available in the man pages.

The following command shows only the pid, username, cpu, memory and command columns.

    $ ps -e -o pid,uname,pcpu,pmem,comm

It is possible to rename the column labels

    $ ps -e -o pid,uname=USERNAME,pcpu=CPU_USAGE,pmem,comm
      PID USERNAME CPU_USAGE %MEM COMMAND
        1 root           0.0  0.0 init
        2 root           0.0  0.0 kthreadd
        3 root           0.0  0.0 ksoftirqd/0
        4 root           0.0  0.0 kworker/0:0
        5 root           0.0  0.0 kworker/0:0H
        7 root           0.0  0.0 migration/0
        8 root           0.0  0.0 rcu_bh
        9 root           0.0  0.0 rcuob/0
       10 root           0.0  0.0 rcuob/1

Quite flexible.

#### 9. Display elapsed time of processes ####

The elapsed time indicates, how long the process has been running for. The column for elapsed time is not shown by default, and has to be brought in using the "-o" option

    $ ps -e -o pid,comm,etime

#### 10. Turn ps into an realtime process viewer ####

As usual, the watch command can be used to turn ps into a realtime process reporter. Simple example is like this

    $ watch -n 1 'ps -e -o pid,uname,cmd,pmem,pcpu --sort=-pmem,-pcpu | head -15'

The output on my desktop is something like this.

    Every 1.0s: ps -e -o pid,uname,cmd,pmem,pcpu --...  Sun Dec  1 18:16:08 2013

      PID USER     CMD                         %MEM %CPU
     3800 1000     /opt/google/chrome/chrome -  4.6  1.4
     7492 1000     /opt/google/chrome/chrome -  2.7  1.4
     3150 1000     /opt/google/chrome/chrome    2.7  2.5
     3824 1000     /opt/google/chrome/chrome -  2.6  0.6
     3936 1000     /opt/google/chrome/chrome -  2.4  1.6
     2936 1000     /usr/bin/plasma-desktop      2.3  0.2
     9666 1000     /opt/google/chrome/chrome -  2.1  0.8
     3842 1000     /opt/google/chrome/chrome -  2.1  0.8
     4739 1000     /opt/google/chrome/chrome -  1.8  1.0
     3930 1000     /opt/google/chrome/chrome -  1.7  1.0
     3911 1000     /opt/google/chrome/chrome -  1.6  0.6
     3645 1000     /opt/google/chrome/chrome -  1.5  0.4
     3677 1000     /opt/google/chrome/chrome -  1.5  0.4
     3639 1000     /opt/google/chrome/chrome -  1.4  0.4

The output would be updated every 1 second to refresh the stats. However do not think that this is similar to top.

You would notice that the output of top/htop command changes much more frequently compared to the above ps command.

This is because the top output sorts on a value that is a mix of cpu usage and memory usage. But the above ps command sorts in a more simpler manner, taking 1 column at a time (like school maths). So it would not update rapidly like top.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-ps-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出