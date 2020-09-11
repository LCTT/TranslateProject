[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Automatically Start a Services When it Goes Down on Linux)
[#]: via: (https://www.2daygeek.com/linux-bash-script-auto-restart-services-when-down/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Automatically Start a Services When it Goes Down on Linux
======

There are many open source monitoring tools are currently available in market to monitor Linux systems performance.

Those are send an email alert when the system reaches the specified threshold limit for CPU, Memory, and Disk space or any service is down.

But, it doesn’t have an intelligence to auto start the services, if it crash/goes down.

There are various reasons for the process to crash, which you can investigate and fix the issue but it may take a while.

If you don’t want to make your service down for a while and if you would like to bring them up immediately whenever it goes down?

If so, what to do in this situation? How to mitigate this?

We can write our own bash script to start a service whenever it goes down. Writing a shell script is not a big deal and you have to understand few things to achieve this.

Once you familiar on this, you can write your own shell script to automate the day to day activities, which will save lots of time.

We had added many useful shell scripts in the past. If you want to check those, navigate to the below link.

  * **[How to automate day to day activities using shell scripts?][1]**



I have added totally six shell scripts for this usage and you can choose which one is suitable for you.

I had applied different commands and methodology in each shell script.

**`Note:`**` ` You need to change the email id instead of ours.

### 1) How to Automatically Start a Service When it Goes Down on SysVinit Linux System?

Use the following bash script, if you would like to start a single service in SysVinit Linux System.

I have added **`httpd`**` ` service in this script but you can add the service, which you want to monitor.

```
# vi /opt/scripts/service-monitor.sh

#!/bin/bash

serv=httpd

sstat=stopped

service $serv status | grep -i 'running\|stopped' | awk '{print $3}' | while read output;

do

echo $output

if [ "$output" == "$sstat" ]; then

    service $serv start

    echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

    else

    echo "$serv service is running"

    fi

done
```

Set an executable permission to **`service-monitor.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor.sh
```

Alternatively, you can use the following script.

```
# vi /opt/scripts/service-monitor-1.sh

#!/bin/bash

serv=httpd

sstat=$(pidof $serv | wc -l )

if [ $sstat -gt 0 ]

then

echo "$serv is running fine!!!"

else

echo "$serv is down/dead"

service $serv start

echo "$serv service is UP now!!!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

fi
```

Set an executable permission to **`service-monitor-1.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-1.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-1.sh
```

### 2) How to Automatically Start a Service When it Goes Down on systemd Linux System?

Use the following bash script, if you would like to start a single service in systemd Linux System.

I have added **`httpd`**` ` service in this script but you can add the service, which you want to monitor.

```
# vi /opt/scripts/service-monitor-2.sh

#!/bin/bash

serv=httpd

sstat=dead

systemctl status $serv | grep -i 'running\|dead' | awk '{print $3}' | sed 's/[()]//g' | while read output;

do

echo $output

if [ "$output" == "$sstat" ]; then

    systemctl start $serv

    echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

    else

    echo "$serv service is running"

    fi

done
```

Set an executable permission to **`service-monitor-2.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-2.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-2.sh
```

Alternatively, you can use the following script.

```
# vi /opt/scripts/service-monitor-3.sh

#!/bin/bash

serv=httpd

sstat=$(pidof $serv | wc -l )

if [ $sstat -gt 0 ]

then

echo "$serv is running fine!!!"

else

echo "$serv is down/dead"

systemctl start $serv

echo "$serv service is UP now!!!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

fi
```

Set an executable permission to **`service-monitor-3.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-3.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-3.sh
```

### 3) How to Automatically Start Multiple Services When it Goes Down on SysVinit Linux System?

Use the following bash script, if you would like to start multiple service in SysVinit Linux System.

I have added **`httpd`**` ` and **`rsyslog`**` ` services in this script but you can add the service, which you want to monitor.

```
# vi /opt/scripts/service-monitor-4.sh

#!/bin/bash

sstat=stopped

for serv in httpd rsyslog

do

service $serv status | grep -i 'running\|stopped' | awk '{print $3}' | while read output;

do

echo $output

if [ "$output" == "$sstat" ]; then

    service $serv start

    echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

    else

    echo "$serv service is running"

    fi

done
done
```

Set an executable permission to **`service-monitor-4.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-4.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-4.sh
```

Alternatively, you can use the following script.

```
# vi /opt/scripts/service-monitor-5.sh

#!/bin/bash

for serv in rsyslog httpd

do

sstat=$(pgrep $serv | wc -l )

if [ $sstat -gt 0 ]

then

echo "$serv is running!!!"

else

echo "$serv is down/dead"

service $serv start

echo "$serv serv is UP now!!!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

fi

done
```

Set an executable permission to **`service-monitor-5.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-5.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-5.sh
```

### 4) How to Automatically Start Multiple Service When it Goes Down on systemd Linux System?

Use the following bash script, if you would like to start multiple services in systemd Linux System.

I have added **`httpd`**` ` and **`rsyslog`**` ` services in this script but you can add the service, which you want to monitor.

```
# vi /opt/scripts/service-monitor-6.sh

#!/bin/bash

sstat=dead

for serv in httpd rsyslog

do

systemctl status $serv | grep -i 'running\|dead' | awk '{print $3}' | sed 's/[()]//g' | while read output;

do

echo $output

if [ "$output" == "$sstat" ]; then

    systemctl start $serv

    echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

    else

    echo "$serv service is running"

    fi

done

done
```

Set an executable permission to **`service-monitor-6.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-6.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-6.sh
```

Alternatively, you can use the following script.

```
# vi /opt/scripts/service-monitor-7.sh

#!/bin/bash

for serv in rsyslog httpd

do

sstat=$(pgrep $serv | wc -l )

if [ $sstat -gt 0 ]

then

echo "$serv is running!!!"

else

echo "$serv is down/dead"

systemctl start $serv

echo "$serv serv is UP now!!!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

fi

done
```

Set an executable permission to **`service-monitor-7.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-7.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-7.sh
```

### 5) How to Automatically Start a Service When it Goes Down on systemd and SysVinit Linux System?

Use the following bash script, if you would like to start a service in systemd and SysVinit Linux System.

I have added **`httpd`**` ` service in this script but you can add the service, which you want to monitor.

```
# vi /opt/scripts/service-monitor-8.sh

#!/bin/bash

smanager=$(ps -p1 | grep "init\|systemd" | awk '{print $4}')

serv=httpd

if (( $(pidof $serv | wc -l) > 0 ))

then

echo "$serv is running!!!"

elif [ "$smanager" == "init" ]

then

service $serv start

echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

else

systemctl start $serv

echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

fi
```

Set an executable permission to **`service-monitor-8.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-8.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-8.sh
```

### 6) How to Automatically Start Multiple Services When it Goes Down on systemd and SysVinit Linux System?

Use the following bash script, if you would like to start multiple services in systemd and SysVinit Linux System.

I have added **`httpd`**` ` and **`rsyslog`**` ` services in this script but you can add the service, which you want to monitor.

```
# vi /opt/scripts/service-monitor-9.sh

#!/bin/bash

smanager=$(ps -p1 | grep "init\|systemd" | awk '{print $4}')

for serv in rsyslog httpd

do

if (( $(pgrep $serv | wc -l) > 0 ))

then

echo "$serv is running!!!"

elif [ "$smanager" == "init" ]

then

service $serv start

echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

else

systemctl start $serv

echo "$serv service is UP now.!" | mail -s "$serv service is DOWN and restarted now On $(hostname)" [email protected]

fi

done
```

Set an executable permission to **`service-monitor-9.sh`**` ` file.

```
$ chmod +x /opt/scripts/service-monitor-9.sh
```

Finally add a cronjob to automate this. It will run every 5 minutes.

```
# crontab -e

*/5 * * * * /bin/bash /opt/scripts/service-monitor-9.sh
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-auto-restart-services-when-down/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/shell-script/
