[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Monitor Memory Usage on Linux)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-memory-utilization-usage-and-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Monitor Memory Usage on Linux
======

There are many open source monitoring tools are currently available in market to monitor Linux systems performance.

It will send an email alert when the system reaches the specified threshold limit.

It monitors everything such as CPU utilization, Memory utilization, swap utilization, disk space utilization and much more.

If you only have few systems and want to monitor them then writing a small shell script can make your task very easy.

In this tutorial we have added two shell script to monitor Memory utilization on Linux system.

When the system reaches the given threshold then it will trigger a mail to given email id.

### Method-1 : Linux Bash Script To Monitor Memory Utilization And Send an Email

If you want to only get current Memory utilization percentage through mail when the system reaches the given threshold, use the following script.

This is very simple, straightforward and one line script. I preferred to go with this method in most of the time.

It will trigger an email when your system reaches `80%` of Memory utilization.

```
*/5 * * * * /usr/bin/free | awk '/Mem/{printf("RAM Usage: %.2f%\n"), $3/$2*100}' |  awk '{print $3}' | awk '{ if($1 > 80) print $0;}' | mail -s "High Memory Alert" [email protected]
```

**Note:** You need to change the email id instead of ours. Also, you can change the Memory utilization threshold value as per your requirement.

**Output:** You will be getting an email alert similar to below.

```
High Memory Alert: 80.40%
```

We had added many useful shell scripts in the past. If you want to check those, navigate to the below link.

  * **[How to automate day to day activities using shell scripts?][1]**



### Method-2 : Linux Bash Script To Monitor Memory Utilization And Send an Email

If you want to get more information about the Memory utilization in the mail alert.

Then use the following script, which includes top Memory utilization process details based on the top Command and ps Command.

This will instantly gives you an idea what is going on your system.

It will trigger an email when your system reaches `80%` of Memory utilization.

**Note:** You need to change the email id instead of ours. Also, you can change the Memory utilization threshold value as per your requirement.

```
# vi /opt/scripts/memory-alert.sh

#!/bin/sh
ramusage=$(free | awk '/Mem/{printf("RAM Usage: %.2f\n"), $3/$2*100}'| awk '{print $3}')

if [ "$ramusage" > 20 ]; then

SUBJECT="ATTENTION: Memory Utilization is High on $(hostname) at $(date)"

MESSAGE="/tmp/Mail.out"

TO="[email protected]"

  echo "Memory Current Usage is: $ramusage%" >> $MESSAGE

  echo "" >> $MESSAGE

  echo "------------------------------------------------------------------" >> $MESSAGE

  echo "Top Memory Consuming Process Using top command" >> $MESSAGE

  echo "------------------------------------------------------------------" >> $MESSAGE

  echo "$(top -b -o +%MEM | head -n 20)" >> $MESSAGE

  echo "" >> $MESSAGE

  echo "------------------------------------------------------------------" >> $MESSAGE

  echo "Top Memory Consuming Process Using ps command" >> $MESSAGE

  echo "------------------------------------------------------------------" >> $MESSAGE

  echo "$(ps -eo pid,ppid,%mem,%Memory,cmd --sort=-%mem | head)" >> $MESSAGE

  mail -s "$SUBJECT" "$TO" < $MESSAGE

  rm /tmp/Mail.out

  fi
```

Finally add a **[cronjob][2]** to automate this. It will run every 5 minutes.

```
# crontab -e
*/5 * * * * /bin/bash /opt/scripts/memory-alert.sh
```

**Note:** You will be getting an email alert 5 mins later since the script has scheduled to run every 5 minutes (But it’s not exactly 5 mins and it depends the timing).

Say for example. If your system reaches the given limit at 8.25 then you will be getting an email alert in another 5 mins. Hope it’s clear now.

**Output:** You will be getting an email alert similar to below.

```
Memory Current Usage is: 80.71%

+------------------------------------------------------------------+
Top Memory Consuming Process Using top command
+------------------------------------------------------------------+
top - 12:00:58 up 5 days,  9:03,  1 user,  load average: 1.82, 2.60, 2.83
Tasks: 314 total,   1 running, 313 sleeping,   0 stopped,   0 zombie
%Cpu0  :  8.3 us, 12.5 sy,  0.0 ni, 75.0 id,  0.0 wa,  0.0 hi,  4.2 si,  0.0 st
%Cpu1  : 13.6 us,  4.5 sy,  0.0 ni, 81.8 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu2  : 21.7 us, 21.7 sy,  0.0 ni, 56.5 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu3  : 13.6 us,  9.1 sy,  0.0 ni, 77.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu4  : 17.4 us,  8.7 sy,  0.0 ni, 73.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu5  : 20.8 us,  4.2 sy,  0.0 ni, 70.8 id,  0.0 wa,  0.0 hi,  4.2 si,  0.0 st
%Cpu6  :  9.1 us,  0.0 sy,  0.0 ni, 90.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
%Cpu7  : 17.4 us,  4.3 sy,  0.0 ni, 78.3 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16248588 total,  5015964 free,  6453404 used,  4779220 buff/cache
KiB Swap: 17873388 total, 16928620 free,   944768 used.  6423008 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
17163 daygeek   20     2033204 487736 282888 S  10.0   3.0   8:26.07 /usr/lib/firefox/firefox -contentproc -childID 15 -isForBrowser -prefsLen 9408 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /u+
 1121 daygeek   20     4191388 419180 100552 S   5.0   2.6 126:02.84 /usr/bin/gnome-shell
 1902 daygeek   20     1701644 327216  82536 S  20.0   2.0 153:27.92 /opt/google/chrome/chrome
 2969 daygeek   20     1051116 324656  92388 S  15.0   2.0 149:38.09 /opt/google/chrome/chrome --type=renderer --field-trial-handle=10346122902703263820,11905758137655502112,131072 --service-pipe-token=1339861+
 1068 daygeek   20     1104856 309552 278072 S   5.0   1.9 143:47.42 /usr/lib/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -nolisten tcp -background none -noreset -keeptty -verbose 3
27246 daygeek   20      907344 265600 108276 S  30.0   1.6  10:42.80 /opt/google/chrome/chrome --type=renderer --field-trial-handle=10346122902703263820,11905758137655502112,131072 --service-pipe-token=8587368+

+------------------------------------------------------------------+
Top Memory Consuming Process Using ps command
+------------------------------------------------------------------+
  PID  PPID %MEM %CPU CMD
 8223     1  6.4  6.8 /usr/lib/firefox/firefox --new-window
13948  1121  6.3  1.2 /usr/bin/../lib/notepadqq/notepadqq-bin
 8671  8223  4.4  7.5 /usr/lib/firefox/firefox -contentproc -childID 5 -isForBrowser -prefsLen 6999 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
17163  8223  3.0  0.6 /usr/lib/firefox/firefox -contentproc -childID 15 -isForBrowser -prefsLen 9408 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 1121  1078  2.5  1.6 /usr/bin/gnome-shell
17937  8223  2.5  0.8 /usr/lib/firefox/firefox -contentproc -childID 16 -isForBrowser -prefsLen 9410 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 8499  8223  2.2  0.6 /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -prefsLen 6635 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 8306  8223  2.2  0.8 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -prefsLen 1 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
 9198  8223  2.1  0.6 /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -prefsLen 8604 -prefMapSize 184979 -parentBuildID 20190521202118 -greomni /usr/lib/firefox/omni.ja -appomni /usr/lib/firefox/browser/omni.ja -appdir /usr/lib/firefox/browser 8223 true tab
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-to-monitor-memory-utilization-usage-and-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
