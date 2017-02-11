Ultimate guide to configure logrotate utility
============================================================


Generally speaking Logs are very much important part of any troubleshooting activity, However these logs grows in size with time. In this case we need to perform log cleanup manually in order to reclaim the space and its tedious task to administer these logs. To overcome this we can configure logrotate utility available in Linux which automatically does rotation, compression , removal and mailing of logfile.

We can configure logrotate utility so that each log file may be handled daily, weekly, monthly,or when it grows too large.

How logrotate utility works:

By default, the logrotate command runs as a cron job once a day from `/etc/cron.daily`, and it helps you set a policy where log-files that grow beyond a certain age or size are rotated.

Command: `/usr/sbin/logrotate`

Configuration File : `/etc/logrotate.conf`

This is main configuration file for logrotate utility.The logrotate configuration files are also stored for specific services in the directory “`/etc/logrotate.d/`”.  Make sure below code exists in `/etc/logrotate.conf` for reading out service specific log rotation configuration.

` include  /etc/logrotate.d`

Logrotate History: `/var/lib/logrotate.status`

Important logrotate utility options:


```
compress             --> Compresses all noncurrent versions of the log file
daily,weekly,monthly -->Rotating log files on the specified schedule
delaycompress        -->Compresses all versions but current and next-most-recent
endscript            --> Marks the end of a prerotate or postrotate script
errors "emailid"     --> Email error notification to specified emailaddr
missingok            --> Do not complain if log file is missing
notifempty           -->  Does not rotate the log file if it is empty
olddir "dir"         --> Specifies that older verions of the log file be placed in "dir"
postrotate           --> Introduce a script to be run after log has been rotated
prerotate            -->Introduce a script to be run before any changes are made
rotate 'n'           -->Include 'n' versions of the log in the rotation scheme
sharedscripts        -->Runs scripts only once for the entire log group
size='logsize'       -->Rotates if log file size > 'logsize (eg 100K, 4M)
```

Let’s configure logrotate utility for our own sample log file “`/tmp/sample_output.log`”.

Step1: Add below lines of code in the “`/etc/logrotate.conf`” file.

```
/tmp/sample_output.log {
size 1k
create 700 root root
rotate 4
compress
}
```

In the above configuration code:

*   size 1k – logrotate runs only if the file size is equal to (or greater than) this size.
*   create – rotate the original file and create the new file with specified permission, user and group.
*   rotate – limits the number of log file rotation. So, this would keep only the recent 4 rotated log files.
*   compress– This will compress the file.

Step 2: Normally, you would have to wait a day until logrotate is started from `/etc/cron.daily`. As an alternative, you can run it from the command line using the following command:

```
/usr/sbin/logrotate  /etc/logrotate.conf
```

Output Before execution of logrotate command:

```
[root@rhel1 tmp]# ls -l /tmp/
total 28
-rw-------. 1 root root 20000 Jan 1 05:23 sample_output.log
```

Output After execution of logrotate command:

```
[root@rhel1 tmp]# ls -l /tmp
total 12
-rwx------. 1 root root 0 Jan 1 05:24 sample_output.log
-rw-------. 1 root root 599 Jan 1 05:24 sample_output.log-20170101.gz
[root@rhel1 tmp]#
```

So this confirms successful implementation of logrotate utility.

--------------------------------------------------------------------------------

作者简介：

Hi there! I am Manmohan Mirkar. I'm so happy you're here! I began this journey in Linux over 10 years ago and I would have never dreamed that I'd be where I am today. My passion is to help you get Knowledge on Linux.Thank you for being here!

--------------------------------------------------------------------------------

via: http://www.linuxroutes.com/configure-logrotate/

作者：[Manmohan Mirkar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxroutes.com/author/admin/
[1]:http://www.linuxroutes.com/configure-logrotate/#
[2]:http://www.linuxroutes.com/configure-logrotate/#
[3]:http://www.linuxroutes.com/configure-logrotate/#
[4]:http://www.linuxroutes.com/configure-logrotate/#
[5]:http://www.linuxroutes.com/configure-logrotate/#
[6]:http://www.linuxroutes.com/configure-logrotate/#
[7]:http://www.linuxroutes.com/configure-logrotate/#
[8]:http://www.linuxroutes.com/configure-logrotate/#
[9]:http://www.linuxroutes.com/configure-logrotate/#
[10]:http://www.linuxroutes.com/configure-logrotate/#
[11]:http://www.linuxroutes.com/configure-logrotate/#
[12]:http://www.linuxroutes.com/author/admin/
[13]:http://www.linuxroutes.com/configure-logrotate/#respond
[14]:http://www.linuxroutes.com/configure-logrotate/#
