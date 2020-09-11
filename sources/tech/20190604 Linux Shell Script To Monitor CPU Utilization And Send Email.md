[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Shell Script To Monitor CPU Utilization And Send Email)
[#]: via: (https://www.2daygeek.com/linux-shell-script-to-monitor-cpu-utilization-usage-and-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux Shell Script To Monitor CPU Utilization And Send Email
======

There are many opensource monitoring tools are available to monitor Linux systems performance.

It will send an email alert when the system reaches the given threshold limit.

It monitors everything such as CPU utilization, Memory utilization, swap utilization, disk space utilization and much more.

If you only have few systems and want to monitor them then writing a small shell script can achieve this.

In this tutorial we have added two shell script to monitor CPU utilization on Linux system.

When the system reaches the given threshold then it will trigger a mail to corresponding email id.

### Method-1 : Linux Shell Script To Monitor CPU Utilization And Send an Email

If you want to only get CPU utilization percentage through mail when the system reaches the given threshold, use the following script.

This is very simple and straightforward and one line script.

It will trigger an email when your system reaches `80%` CPU utilization.

```
*/5 * * * * /usr/bin/cat /proc/loadavg | awk '{print $1}' | awk '{ if($1 > 80) printf("Current CPU Utilization is: %.2f%\n"), $0;}' | mail -s "High CPU Alert" [email protected]
```

**Note:** You need to change the email id instead of ours. Also, you can change the CPU utilization threshold value as per your requirement.

**Output:** You will be getting an email alert similar to below.

```
Current CPU Utilization is: 80.40%
```

We had added many useful shell scripts in the past. If you want to check those, navigate to the below link.

  * **[How to automate day to day activities using shell scripts?][1]**



### Method-2 : Linux Shell Script To Monitor CPU Utilization And Send an Email

If you want to get more information about the CPU utilization in the mail alert.

Then use the following script, which includes top CPU utilization process details based on the top Command and ps Command.

This will inconstantly gives you an idea what is going on your system.

It will trigger an email when your system reaches `80%` CPU utilization.

**Note:** You need to change the email id instead of ours. Also, you can change the CPU utilization threshold value as per your requirement.

```
# vi /opt/scripts/cpu-alert.sh

#!/bin/bash
cpuuse=$(cat /proc/loadavg | awk '{print $1}')

if [ "$cpuuse" > 80 ]; then

SUBJECT="ATTENTION: CPU Load Is High on $(hostname) at $(date)"

MESSAGE="/tmp/Mail.out"

TO="[email protected]"

  echo "CPU Current Usage is: $cpuuse%" >> $MESSAGE

  echo "" >> $MESSAGE

  echo "+------------------------------------------------------------------+" >> $MESSAGE

  echo "Top CPU Process Using top command" >> $MESSAGE

  echo "+------------------------------------------------------------------+" >> $MESSAGE

  echo "$(top -bn1 | head -20)" >> $MESSAGE

  echo "" >> $MESSAGE

  echo "+------------------------------------------------------------------+" >> $MESSAGE

  echo "Top CPU Process Using ps command" >> $MESSAGE

  echo "+------------------------------------------------------------------+" >> $MESSAGE

  echo "$(ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10)" >> $MESSAGE

  mail -s "$SUBJECT" "$TO" < $MESSAGE

  rm /tmp/Mail.out

  fi
```

Finally add a **[cronjob][2]** to automate this. It will run every 5 minutes.

```
# crontab -e
*/10 * * * * /bin/bash /opt/scripts/cpu-alert.sh
```

**Note:** You will be getting an email alert 5 mins later since the script has scheduled to run every 5 minutes (But it's not exactly 5 mins and it depends the timing).

Say for example. If your system reaches the limit at 8.25 then you will get an email alert in another 5 mins. Hope it's clear now.

**Output:** You will be getting an email alert similar to below.

```
CPU Current Usage is: 80.51%

+------------------------------------------------------------------+
Top CPU Process Using top command
+------------------------------------------------------------------+
top - 13:23:01 up  1:43,  1 user,  load average: 2.58, 2.58, 1.51
Tasks: 306 total,   3 running, 303 sleeping,   0 stopped,   0 zombie
%Cpu0  :  6.2 us,  6.2 sy,  0.0 ni, 87.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu1  : 18.8 us,  0.0 sy,  0.0 ni, 81.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu2  : 50.0 us, 37.5 sy,  0.0 ni, 12.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  :  5.9 us,  5.9 sy,  0.0 ni, 88.2 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu4  :  0.0 us,  5.9 sy,  0.0 ni, 94.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu5  : 29.4 us, 23.5 sy,  0.0 ni, 47.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu6  :  0.0 us,  5.9 sy,  0.0 ni, 94.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu7  :  5.9 us,  0.0 sy,  0.0 ni, 94.1 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16248588 total,   223436 free,  5816924 used, 10208228 buff/cache
KiB Swap: 17873388 total, 17871340 free,     2048 used.  7440884 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
 8867 daygeek   20     2743884 440420 360952 R 100.0   2.7   1:07.25 /usr/lib/virtualbox/VirtualBoxVM --comment CentOS7 --startvm 002f47b8-2af2-48f5-be1d-67b67e03514c --no-startvm-errormsgbox
 9119 daygeek   20       36136    784        R  46.7   0.0   0:00.07 /usr/bin/CROND -n
 1057 daygeek   20      889808 487692 461692 S  13.3   3.0   4:21.12 /usr/lib/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty -verbose 3
 3098 daygeek   20     1929012 351412 120532 S  13.3   2.2  16:42.51 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -prefsLen 9236 -prefMapSize 184485 -parentBuildID 20190521202118 -greomni /us+
    1 root      20      188820  10144   7708 S   6.7   0.1   0:06.92 /sbin/init
  818 gdm       20      199836  25120  15876 S   6.7   0.2   0:01.85 /usr/lib/Xorg vt1 -displayfd 3 -auth /run/user/120/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty -verbose 3
 1170 daygeek    9 -11 2676516  16516  12520 S   6.7   0.1   1:28.30 /usr/bin/pulseaudio --daemonize=no
 8271 root      20                           I   6.7         0:00.21 [kworker/u16:4-i915]
 9117 daygeek   20       13528   4036   3144 R   6.7   0.0   0:00.01 top -bn1

+------------------------------------------------------------------+
Top CPU Process Using ps command
+------------------------------------------------------------------+
%CPU   PID USER     COMMAND
 8.8  8522 daygeek  /usr/lib/virtualbox/VirtualBox
86.2  8867 daygeek  /usr/lib/virtualbox/VirtualBoxVM --comment CentOS7 --startvm 002f47b8-2af2-48f5-be1d-67b67e03514c --no-startvm-errormsgbox
76.1  8921 daygeek  /usr/lib/virtualbox/VirtualBoxVM --comment Ubuntu-18.04 --startvm e8c32dbb-8b01-41b0-977a-bf28b9db1117 --no-startvm-errormsgbox
 5.5  8080 daygeek  /usr/bin/nautilus --gapplication-service
 4.7  4575 daygeek  /usr/lib/firefox/firefox -contentproc -childID 12 -isForBrowser -prefsLen 9375 -prefMapSize 184485 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1525 true tab
 4.4  3511 daygeek  /usr/lib/firefox/firefox -contentproc -childID 8 -isForBrowser -prefsLen 9308 -prefMapSize 184485 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1525 true tab
 4.4  3190 daygeek  /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 9237 -prefMapSize 184485 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1525 true tab
 4.4  1612 daygeek  /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 184485 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 1525 true tab
 4.2  3565 daygeek  /usr/bin/../lib/notepadqq/notepadqq-bin
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-shell-script-to-monitor-cpu-utilization-usage-and-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
