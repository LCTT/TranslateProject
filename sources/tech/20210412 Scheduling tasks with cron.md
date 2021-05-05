[#]: subject: (Scheduling tasks with cron)
[#]: via: (https://fedoramagazine.org/scheduling-tasks-with-cron/)
[#]: author: (Darshna Das https://fedoramagazine.org/author/climoiselle/)
[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Scheduling tasks with cron
======

![][1]

Photo by [Yomex Owo][2] on [Unsplash][3]

Cron is a scheduling daemon that executes tasks at specified intervals. These tasks are called _cron_ jobs and are mostly used to automate system maintenance or administration tasks. For example, you could set a _cron_ job to automate repetitive tasks such as backing up database or data, updating the system with the latest security patches, checking the disk space usage, sending emails, and so on. The _cron_ jobs can be scheduled to run by the minute, hour, day of the month, month, day of the week, or any combination of these.

### **Some advantages of cron**

These are a few of the advantages of using _cron_ jobs:

  * You have much more control over when your job runs i.e. you can control the minute, the hour, the day, etc. when it will execute.
  * It eliminates the need to write the code for the looping and logic of the task and you can shut it off when you no longer need to execute the job.
  * Jobs do not occupy your memory when not executing so you are able to save the memory allocation.
  * If a job fails to execute and exits for some reason it will run again when the proper time comes.



### Installing the cron daemon

Luckily Fedora Linux is pre-configured to run important system tasks to keep the system updated. There are several utilities that can run tasks such as _cron_, _anacron_, _at_ and _batch_. This article will focus on the installation of the _cron_ utility only. Cron is installed with the _cronie_ package that also provides the _cron_ services.

To determine if the package is already present or not, use the rpm command:

```
$ rpm -q cronie
 Cronie-1.5.2-4.el8.x86_64
```

If the _cronie_ package is installed it will return the full name of the _cronie_ package. If you do not have the package present in your system it will say the package is not installed.
To install type this:

```
$ dnf install cronie
```

### Running the cron daemon

A _cron_ job is executed by the _crond_ service based on information from a configuration file. Before adding a job to the configuration file, however, it is necessary to start the _crond_ service, or in some cases install it. What is _crond_? _Crond_ is the compressed name of cron daemon (crond). To determine if the _crond_ service is running or not, type in the following command:

```
$ systemctl status crond.service
● crond.service - Command Scheduler
      Loaded: loaded (/usr/lib/systemd/system/crond.service; enabled; vendor pre>
      Active: active (running) since Sat 2021-03-20 14:12:35 PDT; 1 day 21h ago
    Main PID: 1110 (crond)
```

If you do not see something similar including the line “Active: active (running) since…”, you will have to start the _crond_ daemon. To run the _crond_ service in the current session, enter the following command:

```
$ systemctl run crond.service
```

To configure the service to start automatically at boot time, type the following:

```
$ systemctl enable crond.service
```

If, for some reason, you wish to stop the _crond_ service from running, use the _stop_ command as follows:

```
$ systemctl stop crond.service
```

To restart it, simply use the _restart_ command:

```
$ systemctl restart crond.service
```

### Defining a cron job

#### The cron configuration

Here is an example of the configuration details for a _cron_ job. This defines a simple _cron_ job to pull the latest changes of a _git_ master branch into a cloned repository:

```
*/59 * * * * username cd /home/username/project/design && git pull origin master
```

There are two main parts:

  * The first part is “*/59 * * * *”. This is where the timer is set to every 59 minutes.
  * The rest of the line is the command as it would run from the command line.
The command itself in this example has three parts:
    * The job will run as the user “username”
    * It will change to the directory /home/username/project/design
    * The git command runs to pull the latest changes in the master branch.



#### **Timing syntax**

The timing information is the first part of the _cron_ job string, as mentioned above. This determines how often and when the cron job is going to run. It consists of 5 parts in this order:

  * minute
  * hour
  * day of the month
  * month
  * day of the week



Here is a more graphic way to explain the syntax may be seen here:

```
.---------------- minute (0 - 59)
 |  .------------- hour (0 - 23)
 |  |  .---------- day of month (1 - 31)
 |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr …
 |  |  |  |  .---- day of week (0-6) (Sunday=0 or 7)
 |  |  |  |  |            OR sun,mon,tue,wed,thr,fri,sat
 |  |  |  |  |
 *  *  *  * user-name  command-to-be-executed
```

#### Use of the **asterisk**

An asterisk (*) may be used in place of a number to represents all possible values for that position. For example, an asterisk in the minute position would make it run every minute. The following examples may help to better understand the syntax.

This cron job will run every minute, all the time:

```
* * * * [command]
```

A slash (/) indicates a multiple number of minutes The following example will run 12 times per hour, i.e., every 5 minutes:

```
*/5 * * * * [command]
```

The next example will run once a month, on the second day of the month at midnight (e.g. January 2nd 12:00am, February 2nd 12:00am, etc.):

```
0 0 2 * * [command]
```

#### Using crontab to create a cron job

Cron jobs run in the background and constantly check the _/etc/crontab_ file, and the _/etc/cron.*/_ and _/var/spool/cron/_ directories. Each user has a unique crontab file in _/var/spool/cron/_ .

These _cron_ files are not supposed to be edited directly. The _crontab_ command is the method you use to create, edit, install, uninstall, and list cron jobs.

The same _crontab_ command is used for creating and editing cron jobs. And what’s even cooler is that you don’t need to restart cron after creating new files or editing existing ones.

```
$ crontab -e
```

This opens your existing _crontab_ file or creates one if necessary. The _vi_ editor opens by default when calling _crontab -e_. Note: To edit the _crontab_ file using Nano editor, you can optionally set the **EDITOR**=nano environment variable.

List all your _cron_ jobs using the option _-l_ and specify a user using the _-u_ option, if desired.

```
$ crontab -l
$ crontab -u username -l
```

Remove or erase all your _cron_ jobs using the following command:

```
$ crontab -r
```

To remove jobs for a specific user you must run the following command as the _root user_:

```
$ crontab -r -u username
```

Thank you for reading. _cron_ jobs may seem like a tool just for system admins, but they are actually relevant to many kinds of web applications and user tasks.

#### Reference

Fedora Linux documentation for [Automated Tasks][4]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/scheduling-tasks-with-cron/

作者：[Darshna Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/climoiselle/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/03/schedule_with_cron-816x345.jpg
[2]: https://unsplash.com/@yomex4life?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/clock?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.fedoraproject.org/en-US/Fedora/12/html/Deployment_Guide/ch-autotasks.html
