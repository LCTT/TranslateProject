[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Find Out Top Memory Consuming Processes in Linux)
[#]: via: (https://www.2daygeek.com/linux-find-top-memory-consuming-processes/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Find Out Top Memory Consuming Processes in Linux
======

You may have seen your system consumes too much of memory many times.

If that’s the case, what would be the best thing you can do to identify processes that consume too much memory on a Linux machine.

I believe, you may have run one of the below commands to check it out.

If not, what is the other commands you tried?

I would request you to update it in the comment section, it may help other users.

This can be easily identified using the **[top command][1]** and the **[ps command][2]**.

I used to check both commands simultaneously, and both were given the same result.

So i suggest you to use one of the command that you like.

### 1) How to Find Top Memory Consuming Process in Linux Using the ps Command

The ps command is used to report a snapshot of the current processes. The ps command stands for process status.

This is a standard Linux application that looks for information about running processes on a Linux system.

It is used to list the currently running processes and their process ID (PID), process owner name, process priority (PR), and the absolute path of the running command, etc,.

The below ps command format provides you more information about top memory consumption process.

```
# ps aux --sort -rss | head

USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
mysql     1064  3.2  5.4 886076 209988 ?       Ssl  Oct25  62:40 /usr/sbin/mysqld
varnish  23396  0.0  2.9 286492 115616 ?       SLl  Oct25   0:42 /usr/sbin/varnishd -P /var/run/varnish.pid -f /etc/varnish/default.vcl -a :82 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256M
named     1105  0.0  2.7 311712 108204 ?       Ssl  Oct25   0:16 /usr/sbin/named -u named -c /etc/named.conf
nobody   23377  0.2  2.3 153096 89432 ?        S    Oct25   4:35 nginx: worker process
nobody   23376  0.1  2.1 147096 83316 ?        S    Oct25   2:18 nginx: worker process
root     23375  0.0  1.7 131028 66764 ?        Ss   Oct25   0:01 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
nobody   23378  0.0  1.6 130988 64592 ?        S    Oct25   0:00 nginx: cache manager process
root      1135  0.0  0.9  86708 37572 ?        S    05:37   0:20 cwpsrv: worker process
root      1133  0.0  0.9  86708 37544 ?        S    05:37   0:05 cwpsrv: worker process
```

Use the below ps command format to include only specific information about the process of memory consumption in the output.

```
# ps -eo pid,ppid,%mem,%cpu,cmd --sort=-%mem | head

  PID  PPID %MEM %CPU CMD
 1064     1  5.4  3.2 /usr/sbin/mysqld
23396 23386  2.9  0.0 /usr/sbin/varnishd -P /var/run/varnish.pid -f /etc/varnish/default.vcl -a :82 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256M
 1105     1  2.7  0.0 /usr/sbin/named -u named -c /etc/named.conf
23377 23375  2.3  0.2 nginx: worker process
23376 23375  2.1  0.1 nginx: worker process
 3625   977  1.9  0.0 /usr/local/bin/php-cgi /home/daygeekc/public_html/index.php
23375     1  1.7  0.0 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
23378 23375  1.6  0.0 nginx: cache manager process
 1135  3034  0.9  0.0 cwpsrv: worker process
```

If you want to see only the command name instead of the absolute path of the command, use the ps command format below.

```
# ps -eo pid,ppid,%mem,%cpu,comm --sort=-%mem | head

  PID  PPID %MEM %CPU COMMAND
 1064     1  5.4  3.2 mysqld
23396 23386  2.9  0.0 cache-main
 1105     1  2.7  0.0 named
23377 23375  2.3  0.2 nginx
23376 23375  2.1  0.1 nginx
23375     1  1.7  0.0 nginx
23378 23375  1.6  0.0 nginx
 1135  3034  0.9  0.0 cwpsrv
 1133  3034  0.9  0.0 cwpsrv
```

### 2) How to Find Out Top Memory Consuming Process in Linux Using the top Command

The Linux top command is the best and most well known command that everyone uses to monitor Linux system performance.

It displays a real-time view of the system process running on the interactive interface.

But if you want to find top memory consuming process then **[use the top command in the batch mode][3]**.

You should properly **[understand the top command output][4]** to fix the performance issue in system.

```
# top -c -b -o +%MEM | head -n 20 | tail -15

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1064 mysql     20   0  886076 209740   8388 S   0.0  5.4  62:41.20 /usr/sbin/mysqld
23396 varnish   20   0  286492 115616  83572 S   0.0  3.0   0:42.24 /usr/sbin/varnishd -P /var/run/varnish.pid -f /etc/varnish/default.vcl -a :82 -T 127.0.0.1:6082 -S /etc/varnish/secret -s malloc,256M
 1105 named     20   0  311712 108204   2424 S   0.0  2.8   0:16.41 /usr/sbin/named -u named -c /etc/named.conf
23377 nobody    20   0  153240  89432   2432 S   0.0  2.3   4:35.74 nginx: worker process
23376 nobody    20   0  147096  83316   2416 S   0.0  2.1   2:18.09 nginx: worker process
23375 root      20   0  131028  66764   1616 S   0.0  1.7   0:01.07 nginx: master process /usr/sbin/nginx -c /etc/nginx/nginx.conf
23378 nobody    20   0  130988  64592    592 S   0.0  1.7   0:00.51 nginx: cache manager process
 1135 root      20   0   86708  37572   2252 S   0.0  1.0   0:20.18 cwpsrv: worker process
 1133 root      20   0   86708  37544   2212 S   0.0  1.0   0:05.94 cwpsrv: worker process
 3034 root      20   0   86704  36740   1452 S   0.0  0.9   0:00.09 cwpsrv: master process /usr/local/cwpsrv/bin/cwpsrv
 1067 nobody    20   0 1356200  31588   2352 S   0.0  0.8   0:56.06 /usr/local/apache/bin/httpd -k start
  977 nobody    20   0 1356088  31268   2372 S   0.0  0.8   0:30.44 /usr/local/apache/bin/httpd -k start
  968 nobody    20   0 1356216  30544   2348 S   0.0  0.8   0:19.95 /usr/local/apache/bin/httpd -k start
```

If you only want to see the command name instead of the absolute path of the command, use the below top command format.

```
# top -b -o +%MEM | head -n 20 | tail -15

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
 1064 mysql     20   0  886076 210340   8388 S   6.7  5.4  62:40.93 mysqld
23396 varnish   20   0  286492 115616  83572 S   0.0  3.0   0:42.24 cache-main
 1105 named     20   0  311712 108204   2424 S   0.0  2.8   0:16.41 named
23377 nobody    20   0  153240  89432   2432 S  13.3  2.3   4:35.74 nginx
23376 nobody    20   0  147096  83316   2416 S   0.0  2.1   2:18.09 nginx
23375 root      20   0  131028  66764   1616 S   0.0  1.7   0:01.07 nginx
23378 nobody    20   0  130988  64592    592 S   0.0  1.7   0:00.51 nginx
 1135 root      20   0   86708  37572   2252 S   0.0  1.0   0:20.18 cwpsrv
 1133 root      20   0   86708  37544   2212 S   0.0  1.0   0:05.94 cwpsrv
 3034 root      20   0   86704  36740   1452 S   0.0  0.9   0:00.09 cwpsrv
 1067 nobody    20   0 1356200  31588   2352 S   0.0  0.8   0:56.04 httpd
  977 nobody    20   0 1356088  31268   2372 S   0.0  0.8   0:30.44 httpd
  968 nobody    20   0 1356216  30544   2348 S   0.0  0.8   0:19.95 httpd
```

### 3) Bonus Tips: How to Find Out Top Memory Consuming Process in Linux Using the ps_mem Command

The **[ps_mem utility][5]** is used to display the core memory used per program (not per process).

This utility allows you to check how much memory is used per program.

It calculates the amount of private and shared memory against a program and returns the total used memory in the most appropriate way.

It uses the following logic to calculate RAM usage. Total RAM = sum (private RAM for program processes) + sum (shared RAM for program processes)

```
# ps_mem

 Private  +   Shared  =  RAM used    Program
128.0 KiB +  27.5 KiB = 155.5 KiB    agetty
228.0 KiB +  47.0 KiB = 275.0 KiB    atd
284.0 KiB +  53.0 KiB = 337.0 KiB    irqbalance
380.0 KiB +  81.5 KiB = 461.5 KiB    dovecot
364.0 KiB + 121.5 KiB = 485.5 KiB    log
520.0 KiB +  65.5 KiB = 585.5 KiB    auditd
556.0 KiB +  60.5 KiB = 616.5 KiB    systemd-udevd
732.0 KiB +  48.0 KiB = 780.0 KiB    crond
296.0 KiB + 524.0 KiB = 820.0 KiB    avahi-daemon (2)
772.0 KiB +  51.5 KiB = 823.5 KiB    systemd-logind
940.0 KiB + 162.5 KiB =   1.1 MiB    dbus-daemon
  1.1 MiB +  99.0 KiB =   1.2 MiB    pure-ftpd
  1.2 MiB + 100.5 KiB =   1.3 MiB    master
  1.3 MiB + 198.5 KiB =   1.5 MiB    pickup
  1.3 MiB + 198.5 KiB =   1.5 MiB    bounce
  1.3 MiB + 198.5 KiB =   1.5 MiB    pipe
  1.3 MiB + 207.5 KiB =   1.5 MiB    qmgr
  1.4 MiB + 198.5 KiB =   1.6 MiB    cleanup
  1.3 MiB + 299.5 KiB =   1.6 MiB    trivial-rewrite
  1.5 MiB + 145.0 KiB =   1.6 MiB    config
  1.4 MiB + 291.5 KiB =   1.6 MiB    tlsmgr
  1.4 MiB + 308.5 KiB =   1.7 MiB    local
  1.4 MiB + 323.0 KiB =   1.8 MiB    anvil (2)
  1.3 MiB + 559.0 KiB =   1.9 MiB    systemd-journald
  1.8 MiB + 240.5 KiB =   2.1 MiB    proxymap
  1.9 MiB + 322.5 KiB =   2.2 MiB    auth
  2.4 MiB +  88.5 KiB =   2.5 MiB    systemd
  2.8 MiB + 458.5 KiB =   3.2 MiB    smtpd
  2.9 MiB + 892.0 KiB =   3.8 MiB    bash (2)
  3.3 MiB + 555.5 KiB =   3.8 MiB    NetworkManager
  4.1 MiB + 233.5 KiB =   4.3 MiB    varnishd
  4.0 MiB + 662.0 KiB =   4.7 MiB    dhclient (2)
  4.3 MiB + 623.5 KiB =   4.9 MiB    rsyslogd
  3.6 MiB +   1.8 MiB =   5.5 MiB    sshd (3)
  5.6 MiB + 431.0 KiB =   6.0 MiB    polkitd
 13.0 MiB + 546.5 KiB =  13.6 MiB    tuned
 22.5 MiB +  76.0 KiB =  22.6 MiB    lfd - sleeping
 30.0 MiB +   6.2 MiB =  36.2 MiB    php-fpm (6)
  5.7 MiB +  33.5 MiB =  39.2 MiB    cwpsrv (3)
 20.1 MiB +  25.3 MiB =  45.4 MiB    httpd (5)
104.7 MiB + 156.0 KiB = 104.9 MiB    named
112.2 MiB + 479.5 KiB = 112.7 MiB    cache-main
 69.4 MiB +  58.6 MiB = 128.0 MiB    nginx (4)
203.4 MiB + 309.5 KiB = 203.7 MiB    mysqld
---------------------------------
                        775.8 MiB
=================================
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-find-top-memory-consuming-processes/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-top-command-linux-system-performance-monitoring-tool/
[2]: https://www.2daygeek.com/linux-ps-command-find-running-process-monitoring/
[3]: https://www.2daygeek.com/linux-run-execute-top-command-in-batch-mode/
[4]: https://www.2daygeek.com/understanding-linux-top-command-output-usage/
[5]: https://www.2daygeek.com/ps_mem-report-core-memory-usage-accurately-in-linux/
