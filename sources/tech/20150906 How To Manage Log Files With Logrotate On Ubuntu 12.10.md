How To Manage Log Files With Logrotate On Ubuntu 12.10
================================================================================
#### About Logrotate ####

Logrotate is a utility/tool that manages activities like automatic rotation, removal and compression of log files in a system. This is an excellent tool to manage your logs conserve precious disk space. By having a simple yet powerful configuration file, different parameters of logrotation can be controlled. This gives complete control over the way logs can be automatically managed and need not necessitate manual intervention.

### Prerequisites ###

As a prerequisite, we are assuming that you have gone through the article on how to set up your droplet or VPS. If not, you can find the article [here][1]. This tutorial requires you to have a VPS up and running and have you log into it.

#### Setup Logrotate ####

### Step 1—Update System and System Packages ###

Run the following command to update the package lists from apt-get and get the information on the newest versions of packages and their dependencies.

    sudo apt-get update

### Step 2—Install Logrotate ###

If logrotate is not already on your VPS, install it now through apt-get.

    sudo apt-get install logrotate

### Step 3 — Confirmation ###

To verify that logrotate was successfully installed, run this in the command prompt.

    logrotate

Since the logrotate utility is based on configuration files, the above command will not rotate any files and will show you a brief overview of the usage and the switch options available.

### Step 4—Configure Logrotate ###

Configurations and default options for the logrotate utility are present in:

    /etc/logrotate.conf

Some of the important configuration settings are : rotation-interval, log-file-size, rotation-count and compression.

Application-specific log file information (to override the defaults) are kept at:

    /etc/logrotate.d/

We will have a look at a few examples to understand the concept better.

### Step 5—Example ###

An example application configuration setting would be the dpkg (Debian package management system), that is stored in /etc/logrotate.d/dpkg. One of the entries in this file would be:

    /var/log/dpkg.log {
    	monthly
    	rotate 12
    	compress
    	delaycompress
    	missingok
    	notifempty
    	create 644 root root
    }

What this means is that:

- the logrotation for dpkg monitors the /var/log/dpkg.log file and does this on a monthly basis this is the rotation interval.
- 'rotate 12' signifies that 12 days worth of logs would be kept.
- logfiles can be compressed using the gzip format by specifying 'compress' and 'delaycompress' delays the compression process till the next log rotation. 'delaycompress' will work only if 'compress' option is specified.
- 'missingok' avoids halting on any error and carries on with the next log file.
- 'notifempty' avoid log rotation if the logfile is empty.
- 'create <mode> <owner> <group>' creates a new empty file with the specified properties after log-rotation.

Though missing in the above example, 'size' is also an important setting if you want to control the sizing of the logs growing in the system.

A configuration setting of around 100MB would look like:

    size 100M

Note that If both size and rotation interval are set, then size is taken as a higher priority. That is, if a configuration file has the following settings:

    monthly
    size 100M

then the logs are rotated once the file size reaches 100M and this need not wait for the monthly cycle.

### Step 6—Cron Job ###

You can also set the logrotation as a cron so that the manual process can be avoided and this is taken care of automatically. By specifying an entry in /etc/cron.daily/logrotate , the rotation is triggered daily.

### Step 7—Status Check and Verification ###

To verify if a particular log is indeed rotating or not and to check the last date and time of its rotation, check the /var/lib/logrotate/status file. This is a neatly formatted file that contains the log file name and the date on which it was last rotated.

    cat /var/lib/logrotate/status 

A few entries from this file, for example:

    "/var/log/lpr.log" 2013-4-11
    "/var/log/dpkg.log" 2013-4-11
    "/var/log/pm-suspend.log" 2013-4-11
    "/var/log/syslog" 2013-4-11
    "/var/log/mail.info" 2013-4-11
    "/var/log/daemon.log" 2013-4-11
    "/var/log/apport.log" 2013-4-11

Congratulations! You have logrotate installed in your system. Now, change the configuration settings as per your requirements.

Try 'man logrotate' or 'logrotate -?' for more details.

--------------------------------------------------------------------------------

via: https://www.digitalocean.com/community/tutorials/how-to-manage-log-files-with-logrotate-on-ubuntu-12-10

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.digitalocean.com/community/articles/initial-server-setup-with-ubuntu-12-04