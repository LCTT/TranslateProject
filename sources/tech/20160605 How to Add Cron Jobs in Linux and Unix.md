 Vic020

How to Add Cron Jobs in Linux and Unix
======================================


![](https://www.unixmen.com/wp-content/uploads/2016/05/HOW-TO-ADD-CRON-JOBS-IN-LINUX-AND-UNIX-696x334.png)

### Introduction

![](http://www.unixmen.com/wp-content/uploads/2016/05/cronjob.gif)

Cron job are used to schedule commands to be executed periodically. You can setup commands or scripts, which will repeatedly run at a set time. Cron is one of the most useful tool in Linux or UNIX like operating systems. The cron service (daemon) runs in the background and constantly checks the /etc/crontab file, and /etc/cron.*/ directories. It also checks the /var/spool/cron/ directory.

### Command of crontab

crontab is the command used to install, deinstall or list the tables (cron configuration file) used to drive the [cron(8)][1] daemon in Vixie Cron. Each user can have their own crontab file, and though these are files in /var/spool/cron/crontabs, they are not intended to be edited directly. You need to use crontab command for editing or setting up your own cron jobs.

### Types of cron configuration files

There are different types of configuration files:

- **The UNIX / Linux system crontab** : Usually, used by system services and critical jobs that requires root like privileges. The sixth field (see below for field description) is the name of a user for the command to run as. This gives the system crontab the ability to run commands as any user.

- **The user crontabs**: User can install their own cron jobs using the crontab command. The sixth field is the command to run, and all commands run as the user who created the crontab

**Note**: This faq features cron implementations written by Paul Vixie and included in many [Linux][2] distributions and Unix like systems such as in the popular 4th BSD edition. The syntax is [compatible][3] with various implementations of crond.

How Do I install or create or edit my own cron jobs?

To edit your crontab file, type the following command at the UNIX / Linux shell prompt:

```
$ crontab -e
```

Syntax of crontab (field description)

The syntax is:

```
1 2 3 4 5 /path/to/command arg1 arg2
```

OR

```
1 2 3 4 5 /root/ntp_sync.sh
```

Where,

- 1: Minute (0-59)
- 2: Hours (0-23)
- 3: Day (0-31)
- 4: Month (0-12 [12 == December])
- 5: Day of the week(0-7 [7 or 0 == sunday])
- /path/to/command – Script or command name to schedule

Easy to remember format:

```
* * * * * command to be executed
– – – – –
| | | | |
| | | | —– Day of week (0 – 7) (Sunday=0 or 7)
| | | ——- Month (1 – 12)
| | ——— Day of month (1 – 31)
| ———– Hour (0 – 23)
————- Minute (0 – 59)
```

Example simple crontab.
 
````
## run backupscript 5 minutes 1 time ##
*/5 * * * * /root/backupscript.sh

## Run backupscript daily on 1:00 am ##

0 1 * * * /root/backupscript.sh

## Run backup script monthly on the 1st of month 3:15 am ##

15 3 1 * * /root/backupscript.sh
```

### How do I use operators?

An operator allows you to specifying multiple values in a field. There are three operators:

- **The asterisk (*)** : This operator specifies all possible values for a field. For example, an asterisk in the hour time field would be equivalent to every hour or an asterisk in the month field would be equivalent to every month

- **The comma (,)** : This operator specifies a list of values, for example: “1,5,10,15,20, 25”.

- **The dash (–)** : This operator specifies a range of values, for example: “5-15” days , which is equivalent to typing “5,6,7,8,9,….,13,14,15” using the comma operator.

- **The separator (/)** : This operator specifies a step value, for example: “0-23/” can be used in the hours field to specify command execution every other hour. Steps are also permitted after an asterisk, so if you want to say every two hours, just use */2.


### Use special string to save time

Instead of the first five fields, you can use any one of eight special strings. It will not just save your time but it will improve readability.

Special string  |	Meaning
|:--            |:--
@reboot	        | Run once, at startup.
@yearly	        | Run once a year, “0 0 1 1 *”.
@annually	      | (same as @yearly)
@monthly	      | Run once a month, “0 0 1 * *”.
@weekly	        | Run once a week, “0 0 * * 0”.
@daily	        | Run once a day, “0 0 * * *”.
@midnight	      | (same as @daily)
@hourly	        | Run once an hour, “0 * * * *”.
 

Examples

```
#### Run ntpdate command every hour ####

@hourly /path/to/ntpdate
```
 

### More about /etc/crontab file and /etc/cron.d/* directories

/etc/crontab is system crontabs file. Usually only used by root user or daemons to configure system wide jobs. All individual user must must use crontab command to install and edit their jobs as described above. /var/spool/cron/ or /var/cron/tabs/ is directory for personal user crontab files. It must be backup with users home directory.

Understanding Default /etc/crontab

Typical /etc/crontab file entries:

```
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root
HOME=/
# run-parts
01 * * * * root run-parts /etc/cron.hourly
02 4 * * * root run-parts /etc/cron.daily
22 4 * * 0 root run-parts /etc/cron.weekly
42 4 1 * * root run-parts /etc/cron.monthly
```

First, the environment must be defined. If the shell line is omitted, cron will use the default, which is sh. If the PATH variable is omitted, no default will be used and file locations will need to be absolute. If HOME is omitted, cron will use the invoking users home directory.

Additionally, cron reads the files in /etc/cron.d/ directory. Usually system daemon such as sa-update or sysstat places their cronjob here. As a root user or superuser you can use following directories to configure cron jobs. You can directly drop your scripts here. The run-parts command run scripts or programs in a directory via /etc/crontab file:

Directory	          |Description
|:--                |:--
/etc/cron.d/	      | Put all scripts here and call them from /etc/crontab file.
/etc/cron.daily/	  | Run all scripts once a day
/etc/cron.hourly/	  | Run all scripts once an hour
/etc/cron.monthly/	| Run all scripts once a month
/etc/cron.weekly/	  | Run all scripts once a week
 

### Backup cronjob

```
# crontab -l > /path/to/file

# crontab -u user -l > /path/to/file
```

--------------------------------------------------------------------------------

via: https://www.unixmen.com/add-cron-jobs-linux-unix/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+unixmenhowtos+%28Unixmen+Howtos+%26+Tutorials%29

作者：[Duy NguyenViet][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.unixmen.com/author/duynv/
[1]: http://www.manpager.com/linux/man8/cron.8.html
[2]: http://www.linuxsecrets.com/
[3]: http://www.linuxsecrets.com/linux-hardware/
