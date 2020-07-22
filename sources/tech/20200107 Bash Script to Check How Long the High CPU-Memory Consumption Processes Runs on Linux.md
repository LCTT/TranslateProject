[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Check How Long the High CPU/Memory Consumption Processes Runs on Linux)
[#]: via: (https://www.2daygeek.com/bash-script-to-check-how-long-the-high-cpu-memory-consumption-processes-runs-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Check How Long the High CPU/Memory Consumption Processes Runs on Linux
======

In the past, we have written three different articles to identify this using Linux commands.

You can access them immediately by going to the relevant URLs below.

  * **[How to Find High CPU Consumption Processes in Linux][1]**
  * **[How to Find Out Top Memory Consuming Processes in Linux][2]**
  * **[Five Ways to Check How Long a Process Has Been Running in Linux][3]**



Two scripts are included in this tutorial, which helps you to identify how long the high CPU/memory consumption processes are running on Linux.

The script will show you the process ID, the owner of the process, the name of the process and how long the processes are running.

This will help you identify which jobs are running overtime (which must be completed beforehand).

This can be achieved using the ps command.

### What’s ps Command

ps stands for processes status, it display the information about the active/running processes on the system.

It provides a snapshot of the current processes along with detailed information like username, user id, cpu usage, memory usage, process start date and time command name etc.

### 1) Bash Script to Check How Long the High CPU Consumption Processes Runs on Linux

This script will help you to identify how long the high CPU consumption processes has been running on Linux.

```
# vi /opt/scripts/long-running-cpu-proc.sh

#!/bin/bash
ps -eo pid,user,ppid,%mem,%cpu,cmd --sort=-%cpu | head | tail -n +2 | awk '{print $1}' > /tmp/long-running-processes.txt
echo "--------------------------------------------------"
echo "UName     PID  CMD            Process_Running_Time"
echo "--------------------------------------------------"
for userid in `cat /tmp/long-running-processes.txt`
do
username=$(ps -u -p $userid | tail -1 | awk '{print $1}')
pruntime=$(ps -p $userid -o etime | tail -1)
ocmd=$(ps -p $userid | tail -1 | awk '{print $4}')
echo "$username $userid $ocmd $pruntime"
done | column -t
echo "--------------------------------------------------"
```

Set an executable **[Linux file permission][4]** to **“long-running-cpu-proc.sh”** file.

```
# chmod +x /opt/scripts/long-running-cpu-proc.sh
```

When you run this script, you will get an output like the one below.

```
# sh /opt/scripts/long-running-cpu-proc.sh

----------------------------------------------------
UName     PID  CMD       Process_Running_Time
----------------------------------------------------
daygeek  5214  Web       01:18:48
daygeek  5748  Web       01:08:20
daygeek  8043  inkscape  22:11
daygeek  5269  Web       01:18:31
daygeek  1712  Web       10:44:50
daygeek  5335  RDD       01:17:54
daygeek  1639  firefox   10:44:51
daygeek  7793  nautilus  24:14
daygeek  6301  Web       57:40
----------------------------------------------------
```

### 2) Bash Script to Check How Long the High Memory Consumption Processes Runs on Linux

This script will help you to identify how long the top memory consumption processes has been running on Linux.

```
# sh /opt/scripts/long-running-memory-proc.sh

#!/bin/bash
ps -eo pid,user,ppid,%mem,%cpu,cmd --sort=-%mem | head | tail -n +2 | awk '{print $1}' > /tmp/long-running-processes-1.txt
echo "--------------------------------------------------"
echo "UName     PID  CMD          Process_Running_Time"
echo "--------------------------------------------------"
for userid in `cat /tmp/long-running-processes-1.txt`
do
username=$(ps -u -p $userid | tail -1 | awk '{print $1}')
pruntime=$(ps -p $userid -o etime | tail -1)
ocmd=$(ps -p $userid | tail -1 | awk '{print $4}')
echo "$username $userid $ocmd $pruntime"
done | column -t
echo "--------------------------------------------------"
```

Set an executable Linux file permission to **“long-running-memory-proc.sh”** file.

```
# chmod +x /opt/scripts/long-running-memory-proc.sh
```

When you run this script, you will get an output like the one below.

```
# sh /opt/scripts/long-running-memory-proc.sh

----------------------------------------------------
UName    PID   CMD       Process_Running_Time
----------------------------------------------------
daygeek  1639  firefox   10:44:56
daygeek  2997  Web       10:39:54
daygeek  5269  Web       01:18:37
daygeek  1712  Web       10:44:55
daygeek  8043  inkscape  22:17
daygeek  5214  Web       01:18:54
daygeek  1898  Web       10:44:48
daygeek  1129  Xorg      10:45:07
daygeek  6301  Web       57:45
----------------------------------------------------
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-check-how-long-the-high-cpu-memory-consumption-processes-runs-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-find-high-cpu-consumption-processes-in-linux/
[2]: https://www.2daygeek.com/linux-find-top-memory-consuming-processes/
[3]: https://www.2daygeek.com/how-to-check-how-long-a-process-has-been-running-in-linux/
[4]: https://www.2daygeek.com/understanding-linux-file-permissions/
