translating---geekpi

Cron Vs Anacron: How to Schedule Jobs Using Anacron on Linux
============================================================

In this article, we will explain cron and anacron and also shows you how to setup anacron on Linux. We will as well cover a comparison of these two utilities.

To [schedule a task on given or later time][1], you can use the ‘at’ or ‘batch’ commands and to set up commands to run repeatedly, you can employ the cron and anacron facilities.

[Cron][2] – is a daemon used to run scheduled tasks such as system backups, updates and many more. It is suitable for running scheduled tasks on machines that will run continuously 24X7 such as servers.

The commands/tasks are scripted into cron jobs which are scheduled in crontab files. The default system crontab file is /etc/crontab, but each user can also create their own crontab file that can launch commands at times that the user defines.

To create a personal crontab file, simply type the following:

```
$ crontab -e
```

### How to Setup Anacron in Linux

Anacron is used to run commands periodically with a frequency defined in days. It works a little different from cron; assumes that a machine will not be powered on all the time.

It is appropriate for running daily, weekly, and monthly scheduled jobs normally run by cron, on machines that will not run 24-7 such as laptops and desktops machines.

Assuming you have a scheduled task (such as a backup script) to be run using cron every midnight, possibly when your asleep, and your desktop/laptop is off by that time. Your backup script will not be executed.

However, if you use anacron, you can be assured that the next time you power on the desktop/laptop again, the backup script will be executed.

### How Anacron Works in Linux

anacron jobs are listed in /etc/anacrontab and jobs can be scheduled using the format below (comments inside anacrontab file must start with #).

```
period   delay   job-identifier   command
```

From the above format:

*   period – this is the frequency of job execution specified in days or as @daily, @weekly, or @monthly for once per day, week, or month. You can as well use numbers: 1 – daily, 7 – weekly, 30 – monthly and N – number of days.

*   delay – it’s the number of minutes to wait before executing a job.

*   job-id – it’s the distinctive name for the job written in log files.

To view example files, type:

```
$ ls -l /var/spool/anacron/
total 12
-rw------- 1 root root 9 Jun  1 10:25 cron.daily
-rw------- 1 root root 9 May 27 11:01 cron.monthly
-rw------- 1 root root 9 May 30 10:28 cron.weekly
```

*   command – it’s the command or shell script to be executed.

##### This is what practically happens:

*   Anacron will check if a job has been executed within the specified period in the period field. If not, it executes the command specified in the command field after waiting the number of minutes specified in the delay field.

*   Once the job has been executed, it records the date in a timestamp file in the /var/spool/anacrondirectory with the name specified in the job-id (timestamp file name) field.

Let’s now look at an example. This will run the /home/aaronkilik/bin/backup.sh script everyday:

```
@daily    10    example.daily   /bin/bash /home/aaronkilik/bin/backup.sh
```

If the machine is off when the backup.sh job is expected to run, anacron will run it 10 minutes after the machine is powered on without having to wait for another 7 days.

There are two important variables in the anacrontab file that you should understand:

*   START_HOURS_RANGE – this sets time range in which jobs will be started (i.e execute jobs during the following hours only).

*   RANDOM_DELAY – this defines the maximum random delay added to the user defined delay of a job (by default it’s 45).

This is how your anacrontab file would possibly look like.

Anacron – /etc/anacrontab File
```
# /etc/anacrontab: configuration file for anacron
# See anacron(8) and anacrontab(5) for details.
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
HOME=/root
LOGNAME=root
# These replace cron's entries
1       5       cron.daily      run-parts --report /etc/cron.daily
7       10      cron.weekly     run-parts --report /etc/cron.weekly
@monthly        15      cron.monthly    run-parts --report /etc/cron.monthly
@daily    10    example.daily   /bin/bash /home/aaronkilik/bin/backup.sh                                                                      
```

The following is a comparison of cron and anacron to help you understand when to use either of them.

| Cron | Anacron |
| It’s a daemon | It’s not a daemon |
| Appropriate for server machines | Appropriate for desktop/laptop machines |
| Enables you to run scheduled jobs every minute | Only enables you to run scheduled jobs on daily basis |
| Doesn’t executed a scheduled job when the machine if off | If the machine if off when a scheduled job is due, it will execute a scheduled job when the machine is powered on the next time |
| Can be used by both normal users and root | Can only be used by root unless otherwise (enabled for normal users with specific configs) |

The major difference between cron and anacron is that cron works effectively on machines that will run continuously while anacron is intended for machines that will be powered off in a day or week.

If you know any other way, do share with us using the comment form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.


------

via: https://www.tecmint.com/cron-vs-anacron-schedule-jobs-using-anacron-on-linux/

作者：[Aaron Kili | ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/linux-cron-alternative-at-command-to-schedule-tasks/
[2]:https://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[3]:https://www.tecmint.com/author/aaronkili/
[4]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[5]:https://www.tecmint.com/free-linux-shell-scripting-books/
