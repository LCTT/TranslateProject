Translating by GOLinux ...
How to use logrotate to manage log files in Linux
================================================================================
Log files contain useful information about what is going on within the system. They are often inspected during troubleshooting processes or server performance analysis. For a busy server, log files may grow quickly into very large sizes. This becomes a problem as the server will soon run out of space. Besides, working with a single large log file can often be tricky.

logrotate is a very useful tool that can automate the process of breaking up (or rotating), compressing, and deleting old log files. For example, you can set up logrotate such that the log file /var/log/foo is rotated every 30 days, and logs older than 6 months are deleted. Once configured, the process is fully automated using logrotate without any further need for human interaction. Optionally, old logs can be emailed as well, but that option is beyond the scope of this tutorial.

The logrotate package is typically installed by default on major Linux distros. If, for some reason, logrotate is not present, you can install it using apt-get or yum command.

On Debian or Ubuntu:

    # apt-get install logrotate cron 

On Fedora, CentOS or RHEL:

    # yum install logrotate crontabs 

The configuration file for logrotate is /etc/logrotate.conf. Generally no modification is needed here. The log files to be rotated are defined in separate configuration file(s) placed under /etc/logrotate.d/ directory.

### Example One ###

In the first example, we will create a 10 MB log file /var/log/log-file. We will see how we can use logrotate to manage this log file.

We start by creating a log file, and populating it with a 10 MB worth of random bit stream.

    # touch /var/log/log-file
    # head -c 10M < /dev/urandom > /var/log/log-file 

Now that the log file is ready, we will configure logrotate to rotate this log file. Let's create a configuration file for this.

    # vim /etc/logrotate.d/log-file 

----------

    /var/log/log-file {
        monthly
        rotate 5
        compress
        delaycompress
        missingok
        notifempty
        create 644 root root
        postrotate
            /usr/bin/killall -HUP rsyslogd
        endscript
    }

Where:

- **monthly**: The log file will now be rotated monthly. Other possible values are 'daily', 'weekly' or 'yearly'.
- **rotate 5**: A total of 5 archived logs will be stored at a time. For the 6th archive, the oldest stored archive will be deleted.
- **compress**: The rotated archive will be compressed using gzip, after the rotation task is complete.
- **delaycompress**: Always used together with compress option, the delaycompress parameter instructs logrotate to not run compression on the most recent archive. Compression will be performed during the next rotation cycle. This is useful if you or any software still needs to access the fresh archive.
- **missingok**: During log rotation, any errors will be ignored, e.g., "file not found".
- **notifempty**: Rotation will not be performed if the log file is empty.
- **create 644 root root**: A fresh log file will be created with specified permissions as logrotate may rename the original log file.
- **postrotate/endscript**: The command(s) specified between postrotate and endscript will be carried out after all other instructions are completed. In this case, the process rsyslogd will re-read its configuration on the fly and continue running. 

The above template is generic, and the configuration parameters may vary based on your requirements. Not all the parameters may be necessary.

### Example Two ###

In this example, we want to rotate a log file only when the size of the log file grows over 50 MB.

    # vim /etc/logrotate.d/log-file 

----------

    /var/log/log-file {
        size=50M
        rotate 5
        create 644 root root
        postrotate
            /usr/bin/killall -HUP rsyslogd
        endscript
    }

### Example Three ###

We want old log files to be named with the date of creation. This can be achieved by adding dateext parameter.

    # vim /etc/logrotate.d/log-file 

----------

    /var/log/log-file {
        monthly
        rotate 5
        dateext
        create 644 root root
        postrotate
            /usr/bin/killall -HUP rsyslogd
        endscript
    }

This will cause the archived files to contain the date in their name.

### Troubleshooting ###

Here are a few troubleshooting tips for logrotate setup.

#### 1. Running logrotate manually ####

**logrotate** can be invoked manually from the command line at any time.

To invoke **logrotate on** all logs as configured in /etc/logrotate.d/*:

    # logrotate /etc/logrotate.conf 

To invoke logrotate for a particular configuration:

    # logrotate /etc/logrotate.d/log-file 

#### 2. Dry run ####

The best option during troubleshooting is to run logrotate as a dry run using '-d' option. For verification, a dry run simulates log rotation and displays its output without actually rotating any log files.

    # logrotate -d /etc/logrotate.d/log-file 

![](https://farm6.staticflickr.com/5561/15096836737_33d3cd1ccb_z.jpg)

As we can see from the above output, logrotate decided that rotation is not necessary. This can happen if the age of the file is less than one day.

#### 3. Force run ####

We can force logrotate to rotate log files even when rotation conditions are not met, by using '-f' option. The '-v' parameter provides verbose output.

    # logrotate -vf /etc/logrotate.d/log-file 

----------

    reading config file /etc/logrotate.d/log-file
    reading config info for /var/log/log-file
    
    Handling 1 logs
    
    rotating pattern: /var/log/log-file  forced from command line (5 rotations)
    empty log files are rotated, old logs are removed
    considering log /var/log/log-file
      log needs rotating
    rotating log /var/log/log-file, log->rotateCount is 5
    dateext suffix '-20140916'
    glob pattern '-[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    renaming /var/log/log-file.5.gz to /var/log/log-file.6.gz (rotatecount 5, logstart 1, i 5),
    old log /var/log/log-file.5.gz does not exist
    renaming /var/log/log-file.4.gz to /var/log/log-file.5.gz (rotatecount 5, logstart 1, i 4),
    old log /var/log/log-file.4.gz does not exist
    . . .
    renaming /var/log/log-file.0.gz to /var/log/log-file.1.gz (rotatecount 5, logstart 1, i 0),
    old log /var/log/log-file.0.gz does not exist
    log /var/log/log-file.6.gz doesn't exist -- won't try to dispose of it
    renaming /var/log/log-file to /var/log/log-file.1
    creating new /var/log/log-file mode = 0644 uid = 0 gid = 0
    running postrotate script
    compressing log with: /bin/gzip

#### 4. Logrotate logging ####

Logs for logrotate itself are usually stored in the directory /var/lib/logrotate/status. If we want logrotate to log to any specific file for troubleshooting purposes, we can specify that from the command line as follows.

    # logrotate -vf –s /var/log/logrotate-status /etc/logrotate.d/log-file

#### 5. Logrotate cron job ####

The **cron** jobs needed for logrotate should automatically be created during installation. I am posting the contents of the cron file for reference.

    # cat /etc/cron.daily/logrotate 

----------

    #!/bin/sh
     
    # Clean non existent log file entries from status file
    cd /var/lib/logrotate
    test -e status || touch status
    head -1 status > status.clean
    sed 's/"//g' status | while read logfile date
    do
        [ -e "$logfile" ] && echo "\"$logfile\" $date"
    done >> status.clean
    mv status.clean status
     
    test -x /usr/sbin/logrotate || exit 0
    /usr/sbin/logrotate /etc/logrotate.conf

To sum up, logrotate is a very useful tool for preventing gigantic log files from using up storage space. Once configured, the process is fully automated, and can run without human intervention for a long time. This tutorial focused on several basic examples of how to use logrotate. You can customize it even further to match your requirements.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/logrotate-manage-log-files-linux.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
