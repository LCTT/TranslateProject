[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bash Script to Generate Patching Compliance Report on CentOS/RHEL Systems)
[#]: via: (https://www.2daygeek.com/bash-script-to-generate-patching-compliance-report-on-centos-rhel-systems/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Bash Script to Generate Patching Compliance Report on CentOS/RHEL Systems
======

If you are running a large Linux environment you may have already integrated your Red Hat systems with the Satellite.

If yes, there is a way to export this from the Satellite Server so you don’t have to worry about patching compliance reports.

But if you are running a small Red Hat environment without satellite integration, or if it is CentOS systems, this script will help you to create a report.

The patching compliance report is usually created monthly once or three months once, depending on the company’s needs.

Add a cronjob based on your needs to automate this.

This **[bash script][1]** is generally good to run with less than 50 systems, but there is no limit.

Keeping the system up-to-date is an important task for Linux administrators, keeping your computer very stable and secure.

The following articles may help you to learn more about installing security patches on Red Hat (RHEL) and CentOS systems.

  * **[How to check available security updates on Red Hat (RHEL) and CentOS system][2]**
  * **[Four ways to install security updates on Red Hat (RHEL) &amp; CentOS systems][3]**
  * **[Two methods to check or list out installed security updates on Red Hat (RHEL) &amp; CentOS system][4]**



Four **[shell scripts][5]** are included in this tutorial and pick the suitable one for you.

### Method-1: Bash Script to Generate Patching Compliance Report for Security Errata on CentOS/RHEL Systems

This script allows you to create a security errata patch compliance report only. It sends the output via a mail in a plain text.

```
# vi /opt/scripts/small-scripts/sec-errata.sh

#!/bin/sh
/tmp/sec-up.txt
SUBJECT="Patching Reports on "date""
MESSAGE="/tmp/sec-up.txt"
TO="[email protected]"
echo "+---------------+-----------------------------+" >> $MESSAGE
echo "| Server_Name   |  Security Errata            |" >> $MESSAGE
echo "+---------------+-----------------------------+" >> $MESSAGE
for server in `more /opt/scripts/server.txt`
do
sec=`ssh $server yum updateinfo summary | grep 'Security' | grep -v 'Important|Moderate' | tail -1 | awk '{print $1}'`
echo "$server                $sec" >> $MESSAGE
done
echo "+---------------------------------------------+" >> $MESSAGE
mail -s "$SUBJECT" "$TO" < $MESSAGE
```

Run the script file once you have added the above script.

```
# sh /opt/scripts/small-scripts/sec-errata.sh
```

You get an output like the one below.

```
# cat /tmp/sec-up.txt

+---------------+-------------------+
| Server_Name   |  Security Errata  |
+---------------+-------------------+
server1
server2
server3                21
server4
+-----------------------------------+
```

Add the following cronjob to get the patching compliance report once a month.

```
# crontab -e

@monthly /bin/bash /opt/scripts/system-uptime-script-1.sh
```

### Method-1a: Bash Script to Generate Patching Compliance Report for Security Errata on CentOS/RHEL Systems

This script allows you to generate a security errata patch compliance report. It sends the output through a mail with the CSV file.

```
# vi /opt/scripts/small-scripts/sec-errata-1.sh

#!/bin/sh
echo "Server Name, Security Errata" > /tmp/sec-up.csv
for server in `more /opt/scripts/server.txt`
do
sec=`ssh $server yum updateinfo summary | grep 'Security' | grep -v 'Important|Moderate' | tail -1 | awk '{print $1}'`
echo "$server,  $sec" >> /tmp/sec-up.csv
done
echo "Patching Report for `date +"%B %Y"`" | mailx -s "Patching Report on `date`" -a /tmp/sec-up.csv [email protected]
rm /tmp/sec-up.csv
```

Run the script file once you have added the above script.

```
# sh /opt/scripts/small-scripts/sec-errata-1.sh
```

You get an output like the one below.

![][6]

### Method-2: Bash Script to Generate Patching Compliance Report for Security Errata, Bugfix, and Enhancement on CentOS/RHEL Systems

This script allows you to generate patching compliance reports for Security Errata, Bugfix, and Enhancement. It sends the output via a mail in a plain text.

```
# vi /opt/scripts/small-scripts/sec-errata-bugfix-enhancement.sh

#!/bin/sh
/tmp/sec-up.txt
SUBJECT="Patching Reports on "`date`""
MESSAGE="/tmp/sec-up.txt"
TO="[email protected]"
echo "+---------------+-------------------+--------+---------------------+" >> $MESSAGE
echo "| Server_Name   |  Security Errata  | Bugfix |  Enhancement        |" >> $MESSAGE
echo "+---------------+-------------------+--------+---------------------+" >> $MESSAGE
for server in `more /opt/scripts/server.txt`
do
sec=`ssh $server yum updateinfo summary | grep 'Security' | grep -v 'Important|Moderate' | tail -1 | awk '{print $1}'`
bug=`ssh $server yum updateinfo summary | grep 'Bugfix' | tail -1 | awk '{print $1}'`
enhance=`ssh $server yum updateinfo summary | grep 'Enhancement' | tail -1 | awk '{print $1}'`
echo "$server                $sec               $bug             $enhance" >> $MESSAGE
done
echo "+------------------------------------------------------------------+" >> $MESSAGE
mail -s "$SUBJECT" "$TO" < $MESSAGE
```

Run the script file once you have added the above script.

```
# sh /opt/scripts/small-scripts/sec-errata-bugfix-enhancement.sh
```

You get an output like the one below.

```
# cat /tmp/sec-up.txt

+---------------+-------------------+--------+---------------------+
| Server_Name   |  Security Errata  | Bugfix |  Enhancement        |
+---------------+-------------------+--------+---------------------+
server01                                16
server02                  5             16
server03                  21           266             20
server04                                16
+------------------------------------------------------------------+
```

Add the following cronjob to get the patching compliance report once every three months. This script is scheduled to run on the 1’st of January, April, July and October months.

```
# crontab -e

0 0 01 */3 * /bin/bash /opt/scripts/system-uptime-script-1.sh
```

### Method-2a: Bash Script to Generate Patching Compliance Report for Security Errata, Bugfix, and Enhancement on CentOS/RHEL Systems

This script allows you to generate patching compliance reports for Security Errata, Bugfix, and Enhancement. It sends the output through a mail with the CSV file.

```
# vi /opt/scripts/small-scripts/sec-errata-bugfix-enhancement-1.sh

#!/bin/sh
echo "Server Name, Security Errata,Bugfix,Enhancement" > /tmp/sec-up.csv
for server in `more /opt/scripts/server.txt`
do
sec=`ssh $server yum updateinfo summary | grep 'Security' | grep -v 'Important|Moderate' | tail -1 | awk '{print $1}'`
bug=`ssh $server yum updateinfo summary | grep 'Bugfix' | tail -1 | awk '{print $1}'`
enhance=`ssh $server yum updateinfo summary | grep 'Enhancement' | tail -1 | awk '{print $1}'`
echo "$server,$sec,$bug,$enhance" >> /tmp/sec-up.csv
done
echo "Patching Report for `date +"%B %Y"`" | mailx -s "Patching Report on `date`" -a /tmp/sec-up.csv [email protected]
rm /tmp/sec-up.csv
```

Run the script file once you have added the above script.

```
# sh /opt/scripts/small-scripts/sec-errata-bugfix-enhancement-1.sh
```

You get an output like the one below.

![][6]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/bash-script-to-generate-patching-compliance-report-on-centos-rhel-systems/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/bash-script/
[2]: https://www.2daygeek.com/check-list-view-find-available-security-updates-on-redhat-rhel-centos-system/
[3]: https://www.2daygeek.com/install-security-updates-on-redhat-rhel-centos-system/
[4]: https://www.2daygeek.com/check-installed-security-updates-on-redhat-rhel-and-centos-system/
[5]: https://www.2daygeek.com/category/shell-script/
[6]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
