KevinSJ Translating
A Beginners Guide To Cron Jobs
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/cron-jobs1-720x340.jpg)
**Cron** is one of the most useful utility that you can find in any Unix-like operating system. It is used to schedule commands at a specific time. These scheduled commands or tasks are known as “Cron Jobs”. Cron is generally used for running scheduled backups, monitoring disk space, deleting files (for example log files) periodically which are no longer required, running system maintenance tasks and a lot more. In this brief guide, we will see the basic usage of Cron Jobs in Linux.

### The Beginners Guide To Cron Jobs

The typical format of a cron job is:
```
Minute(0-59) Hour(0-24) Day_of_month(1-31) Month(1-12) Day_of_week(0-6) Command_to_execute

```

Just memorize the cron job format or print the following illustration and keep it in your desk.

![][2]

In the above picture, the asterisks refers the specific blocks of time.

To display the contents of the **crontab** file of the currently logged in user:
```
$ crontab -l

```

To edit the current user’s cron jobs, do:
```
$ crontab -e

```

If it is the first time, you will be asked to editor to edit the jobs.
```
no crontab for sk - using an empty one

Select an editor. To change later, run 'select-editor'.
 1. /bin/nano <---- easiest
 2. /usr/bin/vim.basic
 3. /usr/bin/vim.tiny
 4. /bin/ed

Choose 1-4 [1]:

```

Choose any one that suits you. Here it is how a sample crontab file looks like.

![][3]

In this file, you need to add your cron jobs.

To edit the crontab of a different user, for example ostechnix, do:
```
$ crontab -u ostechnix -e

```

Let us see some examples.

To run a cron job **every minute** , the format should be like below.
```
* * * * * <command-to-execute>

```

To run cron job every 5 minute, add the following in your crontab file.
```
*/5 * * * * <command-to-execute>

```

To run a cron job at every quarter hour (every 15th minute), add this:
```
*/15 * * * * <command-to-execute>

```

To run a cron job every hour at 30 minutes, run:
```
30 * * * * <command-to-execute>

```

You can also define multiple time intervals separated by commas. For example, the following cron job will run three times every hour, at minutes 0, 5 and 10:
```
0,5,10 * * * * <command-to-execute>

```

Run a cron job every half hour:
```
*/30 * * * * <command-to-execute>

```

Run a job every hour:
```
0 * * * * <command-to-execute>

```

Run a job every 2 hours:
```
0 */2 * * * <command-to-execute>

```

Run a job every day (It will run at 00:00):
```
0 0 * * * <command-to-execute>

```

Run a job every day at 3am:
```
0 3 * * * <command-to-execute>

```

Run a job every sunday:
```
0 0 * * SUN <command-to-execute>

```

Or,
```
0 0 * * 0 <command-to-execute>

```

It will run at exactly at 00:00 on Sunday.

Run a job on every day-of-week from Monday through Friday i.e every weekday:
```
0 0 * * 1-5 <command-to-execute>

```

The job will start at 00:00.

Run a job every month:
```
0 0 1 * * <command-to-execute>

```

Run a job at 16:15 on day-of-month 1:
```
15 16 1 * * <command-to-execute>

```

Run a job at every quarter i.e on day-of-month 1 in every 3rd month:
```
0 0 1 */3 * <command-to-execute>

```

Run a job on a specific month at a specific time:
```
5 0 * 4 * <command-to-execute>

```

The job will start at 00:05 in April.

Run a job every 6 months:
```
0 0 1 */6 * <command-to-execute>

```

This cron job will start at 00:00 on day-of-month 1 in every 6th month.

Run a job every year:
```
0 0 1 1 * <command-to-execute>

```

This cron job will start at 00:00 on day-of-month 1 in January.

We can also use the following strings to define job.

@reboot Run once, at startup. @yearly Run once a year. @annually (same as @yearly). @monthly Run once a month. @weekly Run once a week. @daily Run once a day. @midnight (same as @daily). @hourly Run once an hour.

For example, to run a job every time the server is rebooted, add this line in your crontab file.
```
@reboot <command-to-execute>

```

To remove all cron jobs for the current user:
```
$ crontab -r

```

There is also a dedicated website named [**crontab.guru**][4] for learning cron jobs examples. This site provides a lot of cron job examples.

For more details, check man pages.
```
$ man crontab

```

And, that’s all for now. At this point, you might have a basic understanding of cron jobs and how to use them in real time. More good stuffs to come. Stay tuned!!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/05/cron-job-format-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2018/05/cron-jobs-1.png
[4]:https://crontab.guru/
