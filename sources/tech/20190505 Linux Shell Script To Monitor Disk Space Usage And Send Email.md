[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Shell Script To Monitor Disk Space Usage And Send Email)
[#]: via: (https://www.2daygeek.com/linux-shell-script-to-monitor-disk-space-usage-and-send-email/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Linux Shell Script To Monitor Disk Space Usage And Send Email
======

There are numerous monitoring tools are available in market to monitor Linux systems and it will send an email when the system reaches the threshold limit.

It monitors everything such as CPU utilization, Memory utilization, swap utilization, disk space utilization and much more.

However, it’s suitable for small and big environment.

Think about if you have only few systems then what will be the best approach on this.

Yup, we want to write a **[shell script][1]** to achieve this.

In this tutorial we are going to write a shell script to monitor disk space usage on system.

When the system reaches the given threshold then it will trigger a mail to corresponding email id.

We have added totally four shell scripts in this article and each has been used for different purpose.

Later, we will come up with other shell scripts to monitor CPU, Memory and Swap utilization.

Before step into that, i would like to clarify one thing which i noticed regarding the disk space usage shell script.

Most of the users were commented in multiple blogs saying they were getting the following error message when they are running the disk space usage script.

```
# sh /opt/script/disk-usage-alert-old.sh

/dev/mapper/vg_2g-lv_root
test-script.sh: line 7: [: /dev/mapper/vg_2g-lv_root: integer expression expected
/ 9.8G
```

Yes that’s right. Even, i had faced the same issue when i ran the script first time. Later, i had found the root causes.

When you use “df -h” or “df -H” in shell script for disk space alert on RHEL 5 & RHEL 6 based system, you will be end up with the above error message because the output is not in the proper format, see the below output.

To overcome this issue, we need to use “df -Ph” (POSIX output format) but by default “df -h” is working fine on RHEL 7 based systems.

```
# df -h

Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/vg_2g-lv_root
                       10G  6.7G  3.4G  67% /
tmpfs                 7.8G     0  7.8G   0% /dev/shm
/dev/sda1             976M   95M  830M  11% /boot
/dev/mapper/vg_2g-lv_home
                      5.0G  4.3G  784M  85% /home
/dev/mapper/vg_2g-lv_tmp
                      4.8G   14M  4.6G   1% /tmp
```

### Method-1 : Linux Shell Script To Monitor Disk Space Usage And Send Email

You can use the following shell script to monitor disk space usage on Linux system.

It will send an email when the system reaches the given threshold limit. In this example, we set threshold limit at 60% for testing purpose and you can change this limit as per your requirements.

It will send multiple mails if more than one file systems get reached the given threshold limit because the script is using loop.

Also, replace your email id instead of us to get this alert.

```
# vi /opt/script/disk-usage-alert.sh

#!/bin/sh
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read output;
do
  echo $output
  used=$(echo $output | awk '{print $1}' | sed s/%//g)
  partition=$(echo $output | awk '{print $2}')
  if [ $used -ge 60 ]; then
  echo "The partition \"$partition\" on $(hostname) has used $used% at $(date)" | mail -s "Disk Space Alert: $used% Used On $(hostname)" [email protected]
  fi
done
```

**Output:** I got the following two email alerts.

```
The partition "/dev/mapper/vg_2g-lv_home" on 2g.CentOS7 has used 85% at Mon Apr 29 06:16:14 IST 2019

The partition "/dev/mapper/vg_2g-lv_root" on 2g.CentOS7 has used 67% at Mon Apr 29 06:16:14 IST 2019
```

Finally add a **[cronjob][2]** to automate this. It will run every 10 minutes.

```
# crontab -e
*/10 * * * * /bin/bash /opt/script/disk-usage-alert.sh
```

### Method-2 : Linux Shell Script To Monitor Disk Space Usage And Send Email

Alternatively, you can use the following shell script. We have made few changes in this compared with above script.

```
# vi /opt/script/disk-usage-alert-1.sh

#!/bin/sh
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read output;
do
  max=60%
  echo $output
  used=$(echo $output | awk '{print $1}')
  partition=$(echo $output | awk '{print $2}')
  if [ ${used%?} -ge ${max%?} ]; then
  echo "The partition \"$partition\" on $(hostname) has used $used at $(date)" | mail -s "Disk Space Alert: $used Used On $(hostname)" [email protected]
  fi
done
```

**Output:** I got the following two email alerts.

```
The partition "/dev/mapper/vg_2g-lv_home" on 2g.CentOS7 has used 85% at Mon Apr 29 06:16:14 IST 2019

The partition "/dev/mapper/vg_2g-lv_root" on 2g.CentOS7 has used 67% at Mon Apr 29 06:16:14 IST 2019
```

Finally add a **[cronjob][2]** to automate this. It will run every 10 minutes.

```
# crontab -e
*/10 * * * * /bin/bash /opt/script/disk-usage-alert-1.sh
```

### Method-3 : Linux Shell Script To Monitor Disk Space Usage And Send Email

I would like to go with this method. Since, it work like a charm and you will be getting single email for everything.

This is very simple and straightforward.

```
*/10 * * * * df -Ph | sed s/%//g | awk '{ if($5 > 60) print $0;}' | mail -s "Disk Space Alert On $(hostname)" [email protected]
```

**Output:** I got a single mail for all alerts.

```
Filesystem                            Size  Used Avail Use Mounted on
/dev/mapper/vg_2g-lv_root              10G  6.7G  3.4G  67 /
/dev/mapper/vg_2g-lv_home             5.0G  4.3G  784M  85 /home
```

### Method-4 : Linux Shell Script To Monitor Disk Space Usage Of Particular Partition And Send Email

If anybody wants to monitor the particular partition then you can use the following shell script. Simply replace your filesystem name instead of us.

```
# vi /opt/script/disk-usage-alert-2.sh

#!/bin/bash
used=$(df -Ph | grep '/dev/mapper/vg_2g-lv_dbs' | awk {'print $5'})
max=80%
if [ ${used%?} -ge ${max%?} ]; then
echo "The Mount Point "/DB" on $(hostname) has used $used at $(date)" | mail -s "Disk space alert on $(hostname): $used used" [email protected]
fi
```

**Output:** I got the following email alerts.

```
The partition /dev/mapper/vg_2g-lv_dbs on 2g.CentOS6 has used 82% at Mon Apr 29 06:16:14 IST 2019
```

Finally add a **[cronjob][2]** to automate this. It will run every 10 minutes.

```
# crontab -e
*/10 * * * * /bin/bash /opt/script/disk-usage-alert-2.sh
```

**Note:** You will be getting an email alert 10 mins later since the script has scheduled to run every 10 minutes (But it’s not exactly 10 mins and it depends the timing).

Say for example. If your system reaches the limit at 8.25 then you will get an email alert in another 5 mins. Hope it’s clear now.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-shell-script-to-monitor-disk-space-usage-and-send-email/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
[2]: https://www.2daygeek.com/crontab-cronjob-to-schedule-jobs-in-linux/
