[#]: subject: (How to use cron on Linux)
[#]: via: (https://opensource.com/article/21/7/cron-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to use cron on Linux
======
The cron system is a method to automatically run commands on a schedule.
![Cron expression][1]

The cron system is a method to automatically run commands on a schedule. A scheduled job is called a _cronjob_, and it’s created in a file called a _crontab_. It’s the easiest and oldest way for a computer user to automate their computer.

### Writing a cronjob

To create a cronjob, you edit your `crontab` using the `-e` option:


```
`$ crontab -e`
```

This opens your crontab your default text editor. To set the text editor explicitly, use the `EDITOR` [environment variable][2]:


```
`$ EDITOR=nano crontab -e`
```

### Cron syntax

To schedule a cronjob, you provide the command you want your computer to execute, followed by a cron expression. The cron expression schedules when the command gets run:

  * minute (0 to 59)

  * hour (0 to 23, with 0 being midnight)

  * day of month (1 to 31)

  * month (1 to 12)

  * day of week (0 to 6, with Sunday being 0)




An asterisk (`*`) in a field translates to "every." For example, this expression runs a backup script at the 0th minute of _every_ hour on _every_ day of _every_ month:


```
`/opt/backup.sh 0 * * * *`
```

This expression runs a backup script at 3:30 AM on Sunday:


```
`/opt/backup.sh 30 3 * * 0`
```

### Simplified syntax

Modern cron implementations accept simplified macros instead of a cron expression:

  * `@hourly` runs at the 0th minute of every hour of every day

  * `@daily` runs at the 0th minute of the 0th hour of every day

  * `@weekly` runs at the 0th minute of the 0th hour on Sunday

  * `@monthly` runs at the 0th minute of the 0th hour on the first day of the month




For example, this crontab line runs a backup script every day at midnight:


```
`/opt/backup.sh @daily`
```

### How to stop a cronjob

Once you've started a cronjob, it's designed to run on schedule forever. To stop a cronjob once you've started it, you must edit your crontab, remove the line that triggers the job, and then save the file.


```
`$ EDITOR=nano crontab -e`
```

To stop a job that's actively running, [use standard Linux process commands][3] to stop a running process.

### It’s automated

Once you’ve written your crontab, save the file and exit your editor. Your cronjob has been scheduled, so cron does the rest.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/cron-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/cron-splash.png?itok=AoBigzts (Cron expression)
[2]: https://opensource.com/article/19/8/what-are-environment-variables
[3]: https://opensource.com/article/18/5/how-kill-process-stop-program-linux
