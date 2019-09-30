[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Generate System Uptime Reports on Linux)
[#]: via: (https://www.2daygeek.com/bash-script-generate-linux-system-uptime-reports/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Generate System Uptime Reports on Linux
======

For some purposes you may need to collect the **[Linux system uptime][1]** report once a month.

If so, you can use one of the following **[bash scripts][2]** based on your requirements.

Why should we collect this report?

Restarting the Linux server after a certain period of time is a good practice to fix some pending issues.

It is advisable to restart once in 180 days. But this period may vary depending on your company’s policy.

If you have been running the server for a long time without restarting.

This can lead to some performance issues or memory problems on the server, which I have noticed on many servers.

These scripts provide all system uptime reports in one place.

### What is Uptime Command

uptime command will tell how long the system has been running. It gives a one line display of the following information.

The current time, how long the system has been running, how many users are currently logged on, and the system load averages for the past 1, 5, and 15 minutes.

### What Is tuptime?

[Tuptime][3] is a tool for report the historical and statistical running time of the system, keeping it between restarts. Like uptime command but with more interesting output.

### 1) Bash Script to Check Linux System Uptime

This bash script will collect all the server uptime and send the report to the given email id.

Please replace your email id instead of ours, otherwise you will not receive mails.

```
# vi /opt/scripts/system-uptime-script.sh

#!/bin/bash
> /tmp/uptime-report.out
for host in cat /tmp/servers.txt
do
echo -n "$host: "
ssh $host uptime | awk '{print $3,$4}' | sed 's/,//'
done | column -t >> /tmp/uptime-report.out
cat /tmp/uptime-report.out | mail -s "Linux Servers Uptime Report" "[email protected]"
```

Set an executable permission to **“system-uptime-script.sh”** file.

```
$ chmod +x /opt/scripts/system-uptime-script.sh
```

Finally run the bash script to get the output.

```
# sh /opt/scripts/system-uptime-script.sh
```

You will receive a report like the one below.

```
# cat /tmp/uptime-report.out

192.168.1.5:          2      days
192.168.1.6:          15     days
192.168.1.7:          30     days
192.168.1.8:          7      days
192.168.1.9:          67     days
192.168.1.10:         130    days
192.168.1.11:         23     days
```

### 2) Bash Script to Check If Linux System is Running Over 30 Days

This bash script collects server running over 30 days and sends the report to the given email id. You can change the days according to your needs.

```
# vi /opt/scripts/system-uptime-script-1.sh

#!/bin/bash
> /tmp/uptime-report-1.out
for host in cat /tmp/servers.txt
do
echo -n "$host: "
ssh $host uptime | awk '{print $3,$4}' | sed 's/,//'
done | column -t >> /tmp/uptime-report-1.out
cat /tmp/uptime-report-1.out | awk ' $2 >= 30' > /tmp/uptime-report-2.out
cat /tmp/uptime-report-2.out | mail -s "Linux Servers Uptime Report" "[email protected]"
```

Set an executable permission to **“system-uptime-script-1.sh”** file.

```
$ chmod +x /opt/scripts/system-uptime-script-1.sh
```

Finally add a **[cronjob][4]** to automate this. It runs daily at 7AM.

```
# crontab -e

0 7 * * * /bin/bash /opt/scripts/system-uptime-script-1.sh
```

**Note:** You will receive an email alert at 7AM every day, which is for yesterday’s date details.

You will receive a report like the one below.

```
# cat /tmp/uptime-report-2.out

192.168.1.7:          30     days
192.168.1.9:          67     days
192.168.1.10:         130    days
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-generate-linux-system-uptime-reports/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-system-server-uptime-check/
[2]: https://www.2daygeek.com/category/shell-script/
[3]: https://www.2daygeek.com/linux-tuptime-check-historical-uptime/
[4]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
