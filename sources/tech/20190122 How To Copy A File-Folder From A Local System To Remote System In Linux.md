[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Copy A File/Folder From A Local System To Remote System In Linux?)
[#]: via: (https://www.2daygeek.com/linux-scp-rsync-pscp-command-copy-files-folders-in-multiple-servers-using-shell-script/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

How To Copy A File/Folder From A Local System To Remote System In Linux?
======

Copying a file from one server to another server or local to remote is one of the routine task for Linux administrator.

If anyone says no, i won’t accept because this is one of the regular activity wherever you go.

It can be done in many ways and we are trying to cover all the possible options.

You can choose the one which you would prefer. Also, check other commands as well that may help you for some other purpose.

I have tested all these commands and script in my test environment so, you can use this for your routine work.

By default every one go with SCP because it’s one of the native command that everyone use for file copy. But commands which is listed in this article are be smart so, give a try if you would like to try new things.

This can be done in below four ways easily.

  * **`SCP:`** scp copies files between hosts on a network. It uses ssh for data transfer, and uses the same authentication and provides the same security as ssh.
  * **`RSYNC:`** rsync is a fast and extraordinarily versatile file copying tool. It can copy locally, to/from another host over any remote shell, or to/from a remote rsync daemon.
  * **`PSCP:`** pscp is a program for copying files in parallel to a number of hosts. It provides features such as passing a password to scp, saving output to files, and timing out.
  * **`PRSYNC:`** prsync is a program for copying files in parallel to a number of hosts. It provides features such as passing a password to ssh, saving output to files, and timing out.



### Method-1: Copy Files/Folders From A Local System To Remote System In Linux Using SCP Command?

scp command allow us to copy files/folders from a local system to remote system.

We are going to copy the `output.txt` file from my local system to `2g.CentOS.com` remote system under `/opt/backup` directory.

```
# scp output.txt root@2g.CentOS.com:/opt/backup

output.txt                                                                                              100% 2468     2.4KB/s   00:00
```

We are going to copy two files `output.txt` and `passwd-up.sh` files from my local system to `2g.CentOS.com` remote system under `/opt/backup` directory.

```
# scp output.txt passwd-up.sh root@2g.CentOS.com:/opt/backup

output.txt 100% 2468 2.4KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
```

We are going to copy the `shell-script` directory from my local system to `2g.CentOS.com` remote system under `/opt/backup` directory.

This will copy the `shell-script` directory and associated files under `/opt/backup` directory.

```
# scp -r /home/daygeek/2g/shell-script/ [email protected]:/opt/backup/

output.txt 100% 2468 2.4KB/s 00:00
ovh.sh      100% 76 0.1KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
passwd-up1.sh 100% 7 0.0KB/s 00:00
server-list.txt 100% 23 0.0KB/s 00:00
```

### Method-2: Copy Files/Folders From A Local System To Multiple Remote System In Linux Using Shell Script with scp Command?

If you would like to copy the same file into multiple remote servers then create the following small shell script to achieve this.

To do so, get the servers list and add those into `server-list.txt` file. Make sure you have to update the servers list into `server-list.txt` file. Each server should be in separate line.

Finally mention the file location which you want to copy like below.

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
 scp /home/daygeek/2g/shell-script/output.txt [email protected]$server:/opt/backup
done
```

Once you done, set an executable permission to password-update.sh file.

```
# chmod +x file-copy.sh
```

Finally run the script to achieve this.

```
# ./file-copy.sh

output.txt 100% 2468 2.4KB/s 00:00
output.txt 100% 2468 2.4KB/s 00:00
```

Use the following script to copy the multiple files into multiple remote servers.

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
 scp /home/daygeek/2g/shell-script/output.txt passwd-up.sh [email protected]$server:/opt/backup
done
```

The below output shows all the files twice as this copied into two servers.

```
# ./file-cp.sh

output.txt 100% 2468 2.4KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
output.txt 100% 2468 2.4KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
```

Use the following script to copy the directory recursively into multiple remote servers.

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
 scp -r /home/daygeek/2g/shell-script/ [email protected]$server:/opt/backup
done
```

Output for the above script.

```
# ./file-cp.sh

output.txt 100% 2468 2.4KB/s 00:00
ovh.sh      100% 76 0.1KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
passwd-up1.sh 100% 7 0.0KB/s 00:00
server-list.txt 100% 23 0.0KB/s 00:00

output.txt 100% 2468 2.4KB/s 00:00
ovh.sh      100% 76 0.1KB/s 00:00
passwd-up.sh 100% 877 0.9KB/s 00:00
passwd-up1.sh 100% 7 0.0KB/s 00:00
server-list.txt 100% 23 0.0KB/s 00:00
```

### Method-3: Copy Files/Folders From A Local System To Multiple Remote System In Linux Using PSCP Command?

pscp command directly allow us to perform the copy to multiple remote servers.

Use the following pscp command to copy a single file to remote server.

```
# pscp.pssh -H 2g.CentOS.com /home/daygeek/2g/shell-script/output.txt /opt/backup

[1] 18:46:11 [SUCCESS] 2g.CentOS.com
```

Use the following pscp command to copy a multiple files to remote server.

```
# pscp.pssh -H 2g.CentOS.com /home/daygeek/2g/shell-script/output.txt ovh.sh /opt/backup

[1] 18:47:48 [SUCCESS] 2g.CentOS.com
```

Use the following pscp command to copy a directory recursively to remote server.

```
# pscp.pssh -H 2g.CentOS.com -r /home/daygeek/2g/shell-script/ /opt/backup

[1] 18:48:46 [SUCCESS] 2g.CentOS.com
```

Use the following pscp command to copy a single file to multiple remote servers.

```
# pscp.pssh -h server-list.txt /home/daygeek/2g/shell-script/output.txt /opt/backup

[1] 18:49:48 [SUCCESS] 2g.CentOS.com
[2] 18:49:48 [SUCCESS] 2g.Debian.com
```

Use the following pscp command to copy a multiple files to multiple remote servers.

```
# pscp.pssh -h server-list.txt /home/daygeek/2g/shell-script/output.txt passwd-up.sh /opt/backup

[1] 18:50:30 [SUCCESS] 2g.Debian.com
[2] 18:50:30 [SUCCESS] 2g.CentOS.com
```

Use the following pscp command to copy a directory recursively to multiple remote servers.

```
# pscp.pssh -h server-list.txt -r /home/daygeek/2g/shell-script/ /opt/backup

[1] 18:51:31 [SUCCESS] 2g.Debian.com
[2] 18:51:31 [SUCCESS] 2g.CentOS.com
```

### Method-4: Copy Files/Folders From A Local System To Multiple Remote System In Linux Using rsync Command?

Rsync is a fast and extraordinarily versatile file copying tool. It can copy locally, to/from another host over any remote shell, or to/from a remote rsync daemon.

Use the following rsync command to copy a single file to remote server.

```
# rsync -avz /home/daygeek/2g/shell-script/output.txt [email protected]:/opt/backup

sending incremental file list
output.txt

sent 598 bytes received 31 bytes 1258.00 bytes/sec
total size is 2468 speedup is 3.92
```

Use the following pscp command to copy a multiple files to remote server.

```
# rsync -avz /home/daygeek/2g/shell-script/output.txt passwd-up.sh root@2g.CentOS.com:/opt/backup

sending incremental file list
output.txt
passwd-up.sh

sent 737 bytes received 50 bytes 1574.00 bytes/sec
total size is 2537 speedup is 3.22
```

Use the following rsync command to copy a single file to remote server overh ssh.

```
# rsync -avzhe ssh /home/daygeek/2g/shell-script/output.txt root@2g.CentOS.com:/opt/backup

sending incremental file list
output.txt

sent 598 bytes received 31 bytes 419.33 bytes/sec
total size is 2.47K speedup is 3.92
```

Use the following pscp command to copy a directory recursively to remote server over ssh. This will copy only files not the base directory.

```
# rsync -avzhe ssh /home/daygeek/2g/shell-script/ root@2g.CentOS.com:/opt/backup

sending incremental file list
./
output.txt
ovh.sh
passwd-up.sh
passwd-up1.sh
server-list.txt

sent 3.85K bytes received 281 bytes 8.26K bytes/sec
total size is 9.12K speedup is 2.21
```

### Method-5: Copy Files/Folders From A Local System To Multiple Remote System In Linux Using Shell Script with rsync Command?

If you would like to copy the same file into multiple remote servers then create the following small shell script to achieve this.

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
 rsync -avzhe ssh /home/daygeek/2g/shell-script/ root@2g.CentOS.com$server:/opt/backup
done
```

Output for the above shell script.

```
# ./file-copy.sh

sending incremental file list
./
output.txt
ovh.sh
passwd-up.sh
passwd-up1.sh
server-list.txt

sent 3.86K bytes received 281 bytes 8.28K bytes/sec
total size is 9.13K speedup is 2.21

sending incremental file list
./
output.txt
ovh.sh
passwd-up.sh
passwd-up1.sh
server-list.txt

sent 3.86K bytes received 281 bytes 2.76K bytes/sec
total size is 9.13K speedup is 2.21
```

### Method-6: Copy Files/Folders From A Local System To Multiple Remote System In Linux Using Shell Script with scp Command?

In the above two shell script, we need to mention the file and folder location as a prerequiesties but here i did a small modification that allow the script to get a file or folder as a input. It could be very useful when you want to perform the copy multiple times in a day.

```
# file-copy.sh

#!/bin/sh
for server in `more server-list.txt`
do
scp -r $1 root@2g.CentOS.com$server:/opt/backup
done
```

Run the shell script and give the file name as a input.

```
# ./file-copy.sh output1.txt

output1.txt 100% 3558 3.5KB/s 00:00
output1.txt 100% 3558 3.5KB/s 00:00
```

### Method-7: Copy Files/Folders From A Local System To Multiple Remote System In Linux With Non-Standard Port Number?

Use the below shell script to copy a file or folder if you are using Non-Standard port.

If you are using `Non-Standard` port, make sure you have to mention the port number as follow for SCP command.

```
# file-copy-scp.sh

#!/bin/sh
for server in `more server-list.txt`
do
scp -P 2222 -r $1 root@2g.CentOS.com$server:/opt/backup
done
```

Run the shell script and give the file name as a input.

```
# ./file-copy.sh ovh.sh

ovh.sh 100% 3558 3.5KB/s 00:00
ovh.sh 100% 3558 3.5KB/s 00:00
```

If you are using `Non-Standard` port, make sure you have to mention the port number as follow for rsync command.

```
# file-copy-rsync.sh

#!/bin/sh
for server in `more server-list.txt`
do
rsync -avzhe 'ssh -p 2222' $1 root@2g.CentOS.com$server:/opt/backup
done
```

Run the shell script and give the file name as a input.

```
# ./file-copy-rsync.sh passwd-up.sh
sending incremental file list
passwd-up.sh

sent 238 bytes received 35 bytes 26.00 bytes/sec
total size is 159 speedup is 0.58

sending incremental file list
passwd-up.sh

sent 238 bytes received 35 bytes 26.00 bytes/sec
total size is 159 speedup is 0.58
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-scp-rsync-pscp-command-copy-files-folders-in-multiple-servers-using-shell-script/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
