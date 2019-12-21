[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Monitor Disk Space Usage on Multiple Remote Linux Systems With eMail Alert)
[#]: via: (https://www.2daygeek.com/linux-bash-script-to-monitor-disk-space-usage-on-multiple-remote-linux-systems-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Monitor Disk Space Usage on Multiple Remote Linux Systems With eMail Alert
======

Some time ago, we had wrote **[Bash script to monitor disk space usage on a Linux][1]** system with an email alert.

That script works on a single machine, and you have to put the script on the corresponding machine.

If you want to set disk space usage alerts on multiple computers at the same time, that script does not help you.

So we have written this new **[shell script][2]** to achieve this.

To do so, you need a JUMP server (centralized server) that can communicate with any other computer without a password.

This means that password-less authentication must be set as a prerequisite.

When the prerequisite is complete, run the script on the JUMP server.

Finally add a **[cronjob][3]** to completely automate this process.

Three shell scripts are included in this article, and choose the one you like.

### 1) Bash Script-1: Bash Script to Check Disk Space Usage on Multiple Remote Linux Systems and Print Output on Terminal

This **[bash script][4]** checks the disk space usage on a given remote machine and print the output to the terminal if the system reaches the specified threshold.

In this example, we set the threshold limit to 80% for testing purpose and you can adjust this limit to suit your needs.

Also, replace your email id instead of us to receive this alert.

```
# vi /opt/scripts/disk-usage-multiple.sh

#!/bin/sh
output1=/tmp/disk-usage.out
echo "---------------------------------------------------------------------------"
echo "HostName            Filesystem                Size Used Avail Use% Mounted on"
echo "---------------------------------------------------------------------------"
for server in `more /opt/scripts/servers.txt`
do
output=`ssh $server df -Ph | tail -n +2 | sed s/%//g | awk '{ if($5 > 80) print $0;}'`
echo "$server: $output" >> $output1
done
cat $output1 | grep G | column -t
rm $output1
```

Run the script file once you have added the above script to a file.

```
# sh /opt/scripts/disk-usage-multiple.sh
```

You get an output like the one below.

```
------------------------------------------------------------------------------------------------
HostName           Filesystem                         Size  Used  Avail  Use%     Mounted on
------------------------------------------------------------------------------------------------
server01:         /dev/mapper/vg_root-lv_red          5.0G  4.3G  784M   85       /var/log/httpd
server02:         /dev/mapper/vg_root-lv_var          5.8G  4.5G  1.1G   81       /var
server03:         /dev/mapper/vg01-LogVol01           5.7G  4.5G  1003M  82       /usr
server04:         /dev/mapper/vg01-LogVol04           4.9G  3.9G  711M   85       /usr
server05:         /dev/mapper/vg_root-lv_u01          74G   56G   15G    80       /u01
```

### 2) Shell Script-2: Shell Script to Monitor Disk Space Usage on Multiple Remote Linux Systems With eMail Alerts

This shell script checks the disk space usage on a given remote machine and sends the output via a mail in a simple text once the system reaches the specified threshold.

```
# vi /opt/scripts/disk-usage-multiple-1.sh

#!/bin/sh
SUBJECT="Disk Usage Report on "`date`""
MESSAGE="/tmp/disk-usage.out"
MESSAGE1="/tmp/disk-usage-1.out"
TO="[email protected]"
echo "---------------------------------------------------------------------------------------------------" >> $MESSAGE1
echo "HostName            Filesystem                Size Used Avail Use% Mounted on" >> $MESSAGE1
echo "---------------------------------------------------------------------------------------------------" >> $MESSAGE1
for server in `more /opt/scripts/servers.txt`
do
output=`ssh $server df -Ph | tail -n +2 | sed s/%//g | awk '{ if($5 > 80) print $0;}'`
echo "$server: $output" >> $MESSAGE
done
cat $MESSAGE | grep G | column -t >> $MESSAGE1
mail -s "$SUBJECT" "$TO" < $MESSAGE1
rm $MESSAGE
rm $MESSAGE1
```

Run the script file once you have added the above script to a file.

```
# sh /opt/scripts/disk-usage-multiple-1.sh
```

You get an output like the one below.

```
------------------------------------------------------------------------------------------------
HostName           Filesystem                         Size  Used  Avail  Use%     Mounted on
------------------------------------------------------------------------------------------------
server01:         /dev/mapper/vg_root-lv_red          5.0G  4.3G  784M   85       /var/log/httpd
server02:         /dev/mapper/vg_root-lv_var          5.8G  4.5G  1.1G   81       /var
server03:         /dev/mapper/vg01-LogVol01           5.7G  4.5G  1003M  82       /usr
server04:         /dev/mapper/vg01-LogVol04           4.9G  3.9G  711M   85       /usr
server05:         /dev/mapper/vg_root-lv_u01          74G   56G   15G    80       /u01
```

Finally add a cronjob to automate this. It will run every 10 minutes.

```
# crontab -e

*/10 * * * * /bin/bash /opt/scripts/disk-usage-multiple-1.sh
```

### 3) Bash Script-3: Bash Script to Monitor Disk Space Usage on Multiple Remote Linux Systems With eMail Alerts

This shell script checks the disk space usage on a given remote machine and sends the output via the mail with a CSV file if the system reaches the specified threshold.

```
# vi /opt/scripts/disk-usage-multiple-2.sh

#!/bin/sh
MESSAGE="/tmp/disk-usage.out"
MESSAGE2="/tmp/disk-usage-1.csv"
echo "Server Name, Filesystem, Size, Used, Avail, Use%, Mounted on" > $MESSAGE2
for server in thvtstrhl7 thvrhel6
for server in `more /opt/scripts/servers-disk-usage.txt`
do
output1=`ssh $server df -Ph | tail -n +2 | sed s/%//g | awk '{ if($5 > 80) print $0;}'`
echo "$server $output1" >> $MESSAGE
done
cat $MESSAGE | grep G | column -t | while read output;
do
Sname=$(echo $output | awk '{print $1}')
Fsystem=$(echo $output | awk '{print $2}')
Size=$(echo $output | awk '{print $3}')
Used=$(echo $output | awk '{print $4}')
Avail=$(echo $output | awk '{print $5}')
Use=$(echo $output | awk '{print $6}')
Mnt=$(echo $output | awk '{print $7}')
echo "$Sname,$Fsystem,$Size,$Used,$Avail,$Use,$Mnt" >> $MESSAGE2
done
echo "Disk Usage Report for `date +"%B %Y"`" | mailx -s "Disk Usage Report on `date`" -a /tmp/disk-usage-1.csv [email protected]
rm $MESSAGE
rm $MESSAGE2
```

Run the script file once you have added the above script to a file.

```
# sh /opt/scripts/disk-usage-multiple-2.sh
```

You get an output like the one below.

![][5]

Finally add a cronjob to automate this. It will run every 10 minutes.

```
# crontab -e

*/10 * * * * /bin/bash /opt/scripts/disk-usage-multiple-1.sh
```

**Note:** Because the script is scheduled to run once every 10 minutes, you will receive an email alert every 10 minutes.

If your system reaches a given limit after 18 minutes, you will receive an email alert on the second cycle, such as after 20 minutes (2nd 10 minute cycle).

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-to-monitor-disk-space-usage-on-multiple-remote-linux-systems-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-shell-script-to-monitor-disk-space-usage-and-send-email/
[2]: https://www.2daygeek.com/category/shell-script/
[3]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
[4]: https://www.2daygeek.com/category/bash-script/
[5]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
