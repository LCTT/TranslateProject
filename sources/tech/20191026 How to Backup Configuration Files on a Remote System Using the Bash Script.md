[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Backup Configuration Files on a Remote System Using the Bash Script)
[#]: via: (https://www.2daygeek.com/linux-bash-script-backup-configuration-files-remote-linux-system-server/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Backup Configuration Files on a Remote System Using the Bash Script
======

It is a good practice to backup configuration files before performing any activity on a Linux system.

You can use this script if you are restarting the server after several days.

If you are really concerned about the backup of your configuration files, it is advisable to use this script at least once a month.

If something goes wrong, you can restore the system to normal by comparing configuration files based on the error message.

Three **[bash scripts][1]** are included in this article, and each **[shell script][2]** is used for specific purposes.

You can choose one based on your requirements.

Everything in Linux is a file. If you make some wrong changes in the configuration file, it will cause the associated service to crash.

So it is a good idea to take a backup of configuration files, and you do not have to worry about disk usage as this not consume much space.

### What does this script do?

This script backs up specific configuration files, moves them to another server, and finally deletes the backup on the remote machine.

This script has six parts, and the details are below.

  * **Part-1:** Backup a General Configuration Files
  * **Part-2:** Backup a wwn/wwpn number if the server is physical.
  * **Part-3:** Backup an oracle related files if the system has an oracle user account.
  * **Part-4:** Create a tar archive of backup configuration files.
  * **Part-5:** Copy the tar archive to other server.
  * **Part-6:** Remove Backup of configuration files on the remote system.



**System details are as follows:**

  * **Server-A:** Local System/ JUMP System (local.2daygeek.com)
  * **Server-B:** Remote System-1 (CentOS6.2daygeek.com)
  * **Server-C:** Remote System-2 (CentOS7.2daygeek.com)



### 1) Bash Script to Backup Configuration files on Remote Server

Two scripts are included in this example, which allow you to back up important configurations files from one server to another (that is, from a remote server to a local server).

For example, if you want to back up important configuration files from **“Server-B”** to **“Server-A”**. Use the following script.

This is a real bash script that takes backup of configuration files on the remote server.

```
# vi /home/daygeek/shell-script/config-file.sh

#!/bin/bash
mkdir /tmp/conf-bk-$(date +%Y%m%d)
cd /tmp/conf-bk-$(date +%Y%m%d)

For General Configuration Files
hostname > hostname.out
uname -a > uname.out
uptime > uptime.out
cat /etc/hosts > hosts.out
/bin/df -h>df-h.out
pvs > pvs.out
vgs > vgs.out
lvs > lvs.out
/bin/ls -ltr /dev/mapper>mapper.out
fdisk -l > fdisk.out
cat /etc/fstab > fstab.out
cat /etc/exports > exports.out
cat /etc/crontab > crontab.out
cat /etc/passwd > passwd.out
ip link show > ip.out
/bin/netstat -in>netstat-in.out
/bin/netstat -rn>netstat-rn.out
/sbin/ifconfig -a>ifconfig-a.out
cat /etc/sysctl.conf > sysctl.out
sleep 10s

#For Physical Server
vserver=$(lscpu | grep vendor | wc -l)
if [ $vserver -gt 0 ]
then
echo "$(hostname) is a VM"
else
systool -c fc_host -v | egrep "(Class Device path | port_name |port_state)" > systool.out
fi
sleep 10s

#For Oracle DB Servers
if id oracle >/dev/null 2>&1; then
/usr/sbin/oracleasm listdisks>asm.out
/sbin/multipath -ll > mpath.out
/bin/ps -ef|grep pmon > pmon.out
else
echo "oracle user does not exist on server"
fi
sleep 10s

#Create a tar archive
tar -cvf /tmp/$(hostname)-date +%Y%m%d.tar /tmp/conf-bk-$(date +%Y%m%d)
sleep 10s

#Copy a tar archive to other server
sshpass -p 'password' scp /tmp/$(hostname)-date +%Y%m%d.tar Server-A:/home/daygeek/backup/

#Remove the backup config folder
cd ..
rm -Rf conf-bk-$(date +%Y%m%d)
rm $(hostname)-date +%Y%m%d.tar
rm config-file.sh
exit
```

This is a sub-script that pushes the above script to the target server.

```
# vi /home/daygeek/shell-script/conf-remote.sh

#!/bin/bash
echo -e "Enter the Remote Server Name: \c"
read server
scp /home/daygeek/shell-script/config-file.sh $server:/tmp/
ssh [email protected]${server} sh /home/daygeek/shell-script/config-file.sh
sleep 10s
exit
```

Finally run the bash script to achieve this.

```
# sh /home/daygeek/shell-script/conf-remote.sh

Enter the Remote Server Name: CentOS6.2daygeek.com
config-file.sh                                                                                                                                                                   100% 1446   647.8KB/s   00:00
CentOS6.2daygeek.com is a VM
oracle user does not exist on server
tar: Removing leading `/' from member names
/tmp/conf-bk-20191024/
/tmp/conf-bk-20191024/pvs.out
/tmp/conf-bk-20191024/vgs.out
/tmp/conf-bk-20191024/ip.out
/tmp/conf-bk-20191024/netstat-in.out
/tmp/conf-bk-20191024/fstab.out
/tmp/conf-bk-20191024/ifconfig-a.out
/tmp/conf-bk-20191024/hostname.out
/tmp/conf-bk-20191024/crontab.out
/tmp/conf-bk-20191024/netstat-rn.out
/tmp/conf-bk-20191024/uptime.out
/tmp/conf-bk-20191024/uname.out
/tmp/conf-bk-20191024/mapper.out
/tmp/conf-bk-20191024/lvs.out
/tmp/conf-bk-20191024/exports.out
/tmp/conf-bk-20191024/df-h.out
/tmp/conf-bk-20191024/sysctl.out
/tmp/conf-bk-20191024/hosts.out
/tmp/conf-bk-20191024/passwd.out
/tmp/conf-bk-20191024/fdisk.out
```

Once you run the above script, use the ls command to check the copied tar archive file.

```
# ls -ltrh /home/daygeek/backup/*.tar

-rw-r--r-- 1 daygeek daygeek 30K Oct 25 11:01 /home/daygeek/backup/CentOS6.2daygeek.com-20191024.tar
```

If it is moved successfully, you can find the contents of it without extracting it using the following tar command.

```
# tar -tvf /home/daygeek/backup/CentOS6.2daygeek.com-20191024.tar

drwxr-xr-x root/root         0 2019-10-25 11:00 tmp/conf-bk-20191024/
-rw-r--r-- root/root        96 2019-10-25 11:00 tmp/conf-bk-20191024/pvs.out
-rw-r--r-- root/root        92 2019-10-25 11:00 tmp/conf-bk-20191024/vgs.out
-rw-r--r-- root/root       413 2019-10-25 11:00 tmp/conf-bk-20191024/ip.out
-rw-r--r-- root/root       361 2019-10-25 11:00 tmp/conf-bk-20191024/netstat-in.out
-rw-r--r-- root/root       785 2019-10-25 11:00 tmp/conf-bk-20191024/fstab.out
-rw-r--r-- root/root      1375 2019-10-25 11:00 tmp/conf-bk-20191024/ifconfig-a.out
-rw-r--r-- root/root        21 2019-10-25 11:00 tmp/conf-bk-20191024/hostname.out
-rw-r--r-- root/root       457 2019-10-25 11:00 tmp/conf-bk-20191024/crontab.out
-rw-r--r-- root/root       337 2019-10-25 11:00 tmp/conf-bk-20191024/netstat-rn.out
-rw-r--r-- root/root        62 2019-10-25 11:00 tmp/conf-bk-20191024/uptime.out
-rw-r--r-- root/root       116 2019-10-25 11:00 tmp/conf-bk-20191024/uname.out
-rw-r--r-- root/root       210 2019-10-25 11:00 tmp/conf-bk-20191024/mapper.out
-rw-r--r-- root/root       276 2019-10-25 11:00 tmp/conf-bk-20191024/lvs.out
-rw-r--r-- root/root         0 2019-10-25 11:00 tmp/conf-bk-20191024/exports.out
-rw-r--r-- root/root       236 2019-10-25 11:00 tmp/conf-bk-20191024/df-h.out
-rw-r--r-- root/root      1057 2019-10-25 11:00 tmp/conf-bk-20191024/sysctl.out
-rw-r--r-- root/root       115 2019-10-25 11:00 tmp/conf-bk-20191024/hosts.out
-rw-r--r-- root/root      2194 2019-10-25 11:00 tmp/conf-bk-20191024/passwd.out
-rw-r--r-- root/root      1089 2019-10-25 11:00 tmp/conf-bk-20191024/fdisk.out
```

### 2) Bash Script to Backup Configuration files on Remote Server

There are two scripts added in this example, which do the same as the above script, but this can be very useful if you have a JUMP server in your environment.

This script allows you to copy important configuration files from your client system into the JUMP box

For example, since we have already set up a password-less login, you have ten clients that can be accessed from the JUMP server. If so, use this script.

This is a real bash script that takes backup of configuration files on the remote server.

```
# vi /home/daygeek/shell-script/config-file-1.sh

#!/bin/bash
mkdir /tmp/conf-bk-$(date +%Y%m%d)
cd /tmp/conf-bk-$(date +%Y%m%d)

For General Configuration Files
hostname > hostname.out
uname -a > uname.out
uptime > uptime.out
cat /etc/hosts > hosts.out
/bin/df -h>df-h.out
pvs > pvs.out
vgs > vgs.out
lvs > lvs.out
/bin/ls -ltr /dev/mapper>mapper.out
fdisk -l > fdisk.out
cat /etc/fstab > fstab.out
cat /etc/exports > exports.out
cat /etc/crontab > crontab.out
cat /etc/passwd > passwd.out
ip link show > ip.out
/bin/netstat -in>netstat-in.out
/bin/netstat -rn>netstat-rn.out
/sbin/ifconfig -a>ifconfig-a.out
cat /etc/sysctl.conf > sysctl.out
sleep 10s

#For Physical Server
vserver=$(lscpu | grep vendor | wc -l)
if [ $vserver -gt 0 ]
then
echo "$(hostname) is a VM"
else
systool -c fc_host -v | egrep "(Class Device path | port_name |port_state)" > systool.out
fi
sleep 10s

#For Oracle DB Servers
if id oracle >/dev/null 2>&1; then
/usr/sbin/oracleasm listdisks>asm.out
/sbin/multipath -ll > mpath.out
/bin/ps -ef|grep pmon > pmon.out
else
echo "oracle user does not exist on server"
fi
sleep 10s

#Create a tar archieve
tar -cvf /tmp/$(hostname)-date +%Y%m%d.tar /tmp/conf-bk-$(date +%Y%m%d)
sleep 10s

#Remove the backup config folder
cd ..
rm -Rf conf-bk-$(date +%Y%m%d)
rm config-file.sh
exit
```

This is a sub-script that pushes the above script to the target server.

```
# vi /home/daygeek/shell-script/conf-remote-1.sh

#!/bin/bash
echo -e "Enter the Remote Server Name: \c"
read server
scp /home/daygeek/shell-script/config-file-1.sh $server:/tmp/
ssh [email protected]${server} sh /home/daygeek/shell-script/config-file-1.sh
sleep 10s
echo -e "Re-Enter the Remote Server Name: \c"
read server
scp $server:/tmp/$server-date +%Y%m%d.tar /home/daygeek/backup/
exit
```

Finally run the bash script to achieve this.

```
# sh /home/daygeek/shell-script/conf-remote-1.sh

Enter the Remote Server Name: CentOS6.2daygeek.com
config-file.sh                                                                                                                                                                   100% 1446   647.8KB/s   00:00
CentOS6.2daygeek.com is a VM
oracle user does not exist on server
tar: Removing leading `/' from member names
/tmp/conf-bk-20191025/
/tmp/conf-bk-20191025/pvs.out
/tmp/conf-bk-20191025/vgs.out
/tmp/conf-bk-20191025/ip.out
/tmp/conf-bk-20191025/netstat-in.out
/tmp/conf-bk-20191025/fstab.out
/tmp/conf-bk-20191025/ifconfig-a.out
/tmp/conf-bk-20191025/hostname.out
/tmp/conf-bk-20191025/crontab.out
/tmp/conf-bk-20191025/netstat-rn.out
/tmp/conf-bk-20191025/uptime.out
/tmp/conf-bk-20191025/uname.out
/tmp/conf-bk-20191025/mapper.out
/tmp/conf-bk-20191025/lvs.out
/tmp/conf-bk-20191025/exports.out
/tmp/conf-bk-20191025/df-h.out
/tmp/conf-bk-20191025/sysctl.out
/tmp/conf-bk-20191025/hosts.out
/tmp/conf-bk-20191025/passwd.out
/tmp/conf-bk-20191025/fdisk.out
Enter the Server Name Once Again: CentOS6.2daygeek.com
CentOS6.2daygeek.com-20191025.tar
```

Once you run the above script, use the ls command to check the copied tar archive file.

```
# ls -ltrh /home/daygeek/backup/*.tar

-rw-r--r-- 1 daygeek daygeek 30K Oct 25 11:44 /home/daygeek/backup/CentOS6.2daygeek.com-20191025.tar
```

If it is moved successfully, you can find the contents of it without extracting it using the following tar command.

```
# tar -tvf /home/daygeek/backup/CentOS6.2daygeek.com-20191025.tar

drwxr-xr-x root/root         0 2019-10-25 11:43 tmp/conf-bk-20191025/
-rw-r--r-- root/root        96 2019-10-25 11:43 tmp/conf-bk-20191025/pvs.out
-rw-r--r-- root/root        92 2019-10-25 11:43 tmp/conf-bk-20191025/vgs.out
-rw-r--r-- root/root       413 2019-10-25 11:43 tmp/conf-bk-20191025/ip.out
-rw-r--r-- root/root       361 2019-10-25 11:43 tmp/conf-bk-20191025/netstat-in.out
-rw-r--r-- root/root       785 2019-10-25 11:43 tmp/conf-bk-20191025/fstab.out
-rw-r--r-- root/root      1375 2019-10-25 11:43 tmp/conf-bk-20191025/ifconfig-a.out
-rw-r--r-- root/root        21 2019-10-25 11:43 tmp/conf-bk-20191025/hostname.out
-rw-r--r-- root/root       457 2019-10-25 11:43 tmp/conf-bk-20191025/crontab.out
-rw-r--r-- root/root       337 2019-10-25 11:43 tmp/conf-bk-20191025/netstat-rn.out
-rw-r--r-- root/root        61 2019-10-25 11:43 tmp/conf-bk-20191025/uptime.out
-rw-r--r-- root/root       116 2019-10-25 11:43 tmp/conf-bk-20191025/uname.out
-rw-r--r-- root/root       210 2019-10-25 11:43 tmp/conf-bk-20191025/mapper.out
-rw-r--r-- root/root       276 2019-10-25 11:43 tmp/conf-bk-20191025/lvs.out
-rw-r--r-- root/root         0 2019-10-25 11:43 tmp/conf-bk-20191025/exports.out
-rw-r--r-- root/root       236 2019-10-25 11:43 tmp/conf-bk-20191025/df-h.out
-rw-r--r-- root/root      1057 2019-10-25 11:43 tmp/conf-bk-20191025/sysctl.out
-rw-r--r-- root/root       115 2019-10-25 11:43 tmp/conf-bk-20191025/hosts.out
-rw-r--r-- root/root      2194 2019-10-25 11:43 tmp/conf-bk-20191025/passwd.out
-rw-r--r-- root/root      1089 2019-10-25 11:43 tmp/conf-bk-20191025/fdisk.out
```

### 3) Bash Script to Backup Configuration files on Multiple Linux Remote Systems

This script allows you to copy important configuration files from multiple remote Linux systems into the JUMP box at the same time.

This is a real bash script that takes backup of configuration files on the remote server.

```
# vi /home/daygeek/shell-script/config-file-2.sh

#!/bin/bash
mkdir /tmp/conf-bk-$(date +%Y%m%d)
cd /tmp/conf-bk-$(date +%Y%m%d)

For General Configuration Files
hostname > hostname.out
uname -a > uname.out
uptime > uptime.out
cat /etc/hosts > hosts.out
/bin/df -h>df-h.out
pvs > pvs.out
vgs > vgs.out
lvs > lvs.out
/bin/ls -ltr /dev/mapper>mapper.out
fdisk -l > fdisk.out
cat /etc/fstab > fstab.out
cat /etc/exports > exports.out
cat /etc/crontab > crontab.out
cat /etc/passwd > passwd.out
ip link show > ip.out
/bin/netstat -in>netstat-in.out
/bin/netstat -rn>netstat-rn.out
/sbin/ifconfig -a>ifconfig-a.out
cat /etc/sysctl.conf > sysctl.out
sleep 10s

#For Physical Server
vserver=$(lscpu | grep vendor | wc -l)
if [ $vserver -gt 0 ]
then
echo "$(hostname) is a VM"
else
systool -c fc_host -v | egrep "(Class Device path | port_name |port_state)" > systool.out
fi
sleep 10s

#For Oracle DB Servers
if id oracle >/dev/null 2>&1; then
/usr/sbin/oracleasm listdisks>asm.out
/sbin/multipath -ll > mpath.out
/bin/ps -ef|grep pmon > pmon.out
else
echo "oracle user does not exist on server"
fi
sleep 10s

#Create a tar archieve
tar -cvf /tmp/$(hostname)-date +%Y%m%d.tar /tmp/conf-bk-$(date +%Y%m%d)
sleep 10s

#Remove the backup config folder
cd ..
rm -Rf conf-bk-$(date +%Y%m%d)
rm config-file.sh
exit
```

This is a sub-script that pushes the above script to the target servers.

```
# vi /home/daygeek/shell-script/conf-remote-2.sh

#!/bin/bash
for server in CentOS6.2daygeek.com CentOS7.2daygeek.com
do
scp /home/daygeek/shell-script/config-file-2.sh $server:/tmp/
ssh [email protected]${server} sh /tmp/config-file-2.sh
sleep 10s
scp $server:/tmp/$server-date +%Y%m%d.tar /home/daygeek/backup/
done
exit
```

Finally run the bash script to achieve this.

```
# sh /home/daygeek/shell-script/conf-remote-2.sh

config-file-1.sh                                                                                                                                                                 100% 1444   416.5KB/s   00:00
CentOS6.2daygeek.com is a VM
oracle user does not exist on server
tar: Removing leading `/' from member names
/tmp/conf-bk-20191025/
/tmp/conf-bk-20191025/pvs.out
/tmp/conf-bk-20191025/vgs.out
/tmp/conf-bk-20191025/ip.out
/tmp/conf-bk-20191025/netstat-in.out
/tmp/conf-bk-20191025/fstab.out
/tmp/conf-bk-20191025/ifconfig-a.out
/tmp/conf-bk-20191025/hostname.out
/tmp/conf-bk-20191025/crontab.out
/tmp/conf-bk-20191025/netstat-rn.out
/tmp/conf-bk-20191025/uptime.out
/tmp/conf-bk-20191025/uname.out
/tmp/conf-bk-20191025/mapper.out
/tmp/conf-bk-20191025/lvs.out
/tmp/conf-bk-20191025/exports.out
/tmp/conf-bk-20191025/df-h.out
/tmp/conf-bk-20191025/sysctl.out
/tmp/conf-bk-20191025/hosts.out
/tmp/conf-bk-20191025/passwd.out
/tmp/conf-bk-20191025/fdisk.out
CentOS6.2daygeek.com-20191025.tar
config-file-1.sh                                                                                                                                                                 100% 1444   386.2KB/s   00:00
CentOS7.2daygeek.com is a VM
oracle user does not exist on server
/tmp/conf-bk-20191025/
/tmp/conf-bk-20191025/hostname.out
/tmp/conf-bk-20191025/uname.out
/tmp/conf-bk-20191025/uptime.out
/tmp/conf-bk-20191025/hosts.out
/tmp/conf-bk-20191025/df-h.out
/tmp/conf-bk-20191025/pvs.out
/tmp/conf-bk-20191025/vgs.out
/tmp/conf-bk-20191025/lvs.out
/tmp/conf-bk-20191025/mapper.out
/tmp/conf-bk-20191025/fdisk.out
/tmp/conf-bk-20191025/fstab.out
/tmp/conf-bk-20191025/exports.out
/tmp/conf-bk-20191025/crontab.out
/tmp/conf-bk-20191025/passwd.out
/tmp/conf-bk-20191025/ip.out
/tmp/conf-bk-20191025/netstat-in.out
/tmp/conf-bk-20191025/netstat-rn.out
/tmp/conf-bk-20191025/ifconfig-a.out
/tmp/conf-bk-20191025/sysctl.out
tar: Removing leading `/' from member names
CentOS7.2daygeek.com-20191025.tar
```

Once you run the above script, use the ls command to check the copied tar archive file.

```
# ls -ltrh /home/daygeek/backup/*.tar

-rw-r--r-- 1 daygeek daygeek 30K Oct 25 12:37 /home/daygeek/backup/CentOS6.2daygeek.com-20191025.tar
-rw-r--r-- 1 daygeek daygeek 30K Oct 25 12:38 /home/daygeek/backup/CentOS7.2daygeek.com-20191025.tar
```

If it is moved successfully, you can find the contents of it without extracting it using the following tar command.

```
# tar -tvf /home/daygeek/backup/CentOS7.2daygeek.com-20191025.tar

drwxr-xr-x root/root         0 2019-10-25 12:23 tmp/conf-bk-20191025/
-rw-r--r-- root/root        21 2019-10-25 12:23 tmp/conf-bk-20191025/hostname.out
-rw-r--r-- root/root       115 2019-10-25 12:23 tmp/conf-bk-20191025/uname.out
-rw-r--r-- root/root        62 2019-10-25 12:23 tmp/conf-bk-20191025/uptime.out
-rw-r--r-- root/root       228 2019-10-25 12:23 tmp/conf-bk-20191025/hosts.out
-rw-r--r-- root/root       501 2019-10-25 12:23 tmp/conf-bk-20191025/df-h.out
-rw-r--r-- root/root        88 2019-10-25 12:23 tmp/conf-bk-20191025/pvs.out
-rw-r--r-- root/root        84 2019-10-25 12:23 tmp/conf-bk-20191025/vgs.out
-rw-r--r-- root/root       252 2019-10-25 12:23 tmp/conf-bk-20191025/lvs.out
-rw-r--r-- root/root       197 2019-10-25 12:23 tmp/conf-bk-20191025/mapper.out
-rw-r--r-- root/root      1088 2019-10-25 12:23 tmp/conf-bk-20191025/fdisk.out
-rw-r--r-- root/root       465 2019-10-25 12:23 tmp/conf-bk-20191025/fstab.out
-rw-r--r-- root/root         0 2019-10-25 12:23 tmp/conf-bk-20191025/exports.out
-rw-r--r-- root/root       451 2019-10-25 12:23 tmp/conf-bk-20191025/crontab.out
-rw-r--r-- root/root      2748 2019-10-25 12:23 tmp/conf-bk-20191025/passwd.out
-rw-r--r-- root/root       861 2019-10-25 12:23 tmp/conf-bk-20191025/ip.out
-rw-r--r-- root/root       455 2019-10-25 12:23 tmp/conf-bk-20191025/netstat-in.out
-rw-r--r-- root/root       505 2019-10-25 12:23 tmp/conf-bk-20191025/netstat-rn.out
-rw-r--r-- root/root      2072 2019-10-25 12:23 tmp/conf-bk-20191025/ifconfig-a.out
-rw-r--r-- root/root       449 2019-10-25 12:23 tmp/conf-bk-20191025/sysctl.out
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-bash-script-backup-configuration-files-remote-linux-system-server/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/bash-script/
[2]: https://www.2daygeek.com/category/shell-script/
