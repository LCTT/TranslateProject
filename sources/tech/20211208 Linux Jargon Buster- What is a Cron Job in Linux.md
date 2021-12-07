[#]: subject: "Linux Jargon Buster: What is a Cron Job in Linux?"
[#]: via: "https://itsfoss.com/cron-job/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Jargon Buster: What is a Cron Job in Linux?
======

In this part of our Linux Jargon Buster series, you’ll learn about cron in Linux. You’ll also learn the basics of creating cron jobs by editing crontab.

### What is a cron job in Linux?

Cron is a command line utility to run small and quick commands on a scheduled basis. This is a handy, classic sysadmin tool for automating various tasks by combining it with othe tools. For example, some people combine rsync and cron to automatically create a daily or weekly backup at a certain time. Some people use it to analyze server logs and combine it with mail function to send an email if there is certain kind of error detected in the logs.

Cron is like the Swiss army knife. It can be used for a variety of use cases. It’s really up to your imagination on what to use it for.

Getting started with cron is super easy, and only takes a matter of seconds to get started. But before I show you that, I’ll discuss something else that often confuses Linux users.

### Cron vs cron job vs crontab

You are likely to come across three terms that sound similar to each other: cron, cron job and crontab. Let me quickly tell you what are those:

cron: This is the actual program you install on your system and run as a [daemon][1].

cron job: A job in Linux is a program that is up and running. Cron can handle multiple tasks and run them at their scheduled time. Each of these tasks are referred to as ‘cron jobs’.

[crontab][2]: This is the file (and command) where you define what task to run and how often to run it. A crontab can have multiple cron jobs in it in a tabular form where each row is a cron job.

Let me share a sample cron job example that runs every hour and prints “Linux is cool!” to a file name crontab_log.txt.

```

    0 * * * *  echo "Linux is Cool!" >> ~/crontab_log.txt

```

Even the simplest of the cron job may look scary and intimidating. This is because you need to know how to read a cron job properly.

I’ll take this theoretical knowledge of cron to the next level in the next section.

### Getting started with Cron

Let’s start with (another) simple example of how Cron works.

To create Cron jobs, or the commands that cron will execute, you simply run:

```

    crontab -e

```

It will pull up a file to edit cron jobs with:

![Crontab default view][3]

All the lines that start with `#` (that being all the lines) only serve to help guide you on how to use cron, and can be removed if you don’t need them.

We’ll be using the following as our first Cron job though:

```

    * * * * * touch ~/crontab_test

```

Let’s go through what that will do real quick:

Cron jobs come in the form `minute hour day month week command`.

  * **minute** in this context simply means what minutes of an hour the job will run. So specifying `0` would run at the very beginning of an hour, and specifying `5` would run on the fifth minute of an hour.
  * Next, the **hour** declaration specified what hours of a day a job can run, ranging from values 0-23. The reason there isn’t a 24th hour option here is that `23` goes to the very end of what would be 11:59, at which point your at midnight, or hour `0` of the next day. This same logic applies to the `minute` declaration mentioned previously.
  * **day** specifies what day of a month a job can run on, that being 1-31 (unlike the previous examples which started on `0`).
  * **month** specifies which months of the year a job can run on, and takes values ranging from 1-12.
  * Lastly, **week** specifies which days of the week a job runs on, starting on Sunday, with values from 0-6, unlike the last two.



You then specify **command** which is just the command you want to run.

![][4]

If you want more help understanding the minute hour day month week part, I’d highly recommend the [Crontab guru][5] website, which can greatly help break down what exactly is going on:

Following the previous example of *** * * * * touch ~/crontab_test** though, you’ll simply be running touch ~/crontab_test every minute.

Let’s put that into the crontab and then see it in action:

![][6]

If you then wait until the next minute, you’ll see the crontab_test file located in your home directory:

![][7]

And that’s the basics to using cron!

### A useful example of cron job

That was far too simple (and useless probably).

Say you want to do something a bit more complex, say a backup script that needs to copy files from multiple directories on your system into a single folder, and then archives that backup into a single file.

This can be easily done by simply putting our commands into a script, which can then in turn be called by cron.

Let’s use the following script as an example:

```

    #!/usr/bin/bash
    echo "Backing up..."
    mkdir -p ~/.local/tmp/
    tar -Pc ~/Documents/ -f ~/.local/tmp/backup.gz

```

This script does the following things:

  1. Makes sure the ~/.local/tmp/backup_dir directory exists on the system.
  2. Puts everything from ~/Documents/ into an archive located at ~/.local/tmp/backup.gz.



Let’s run the script manually first so we can see that it actually works.

First, let’s put the script at ~/backup_script like so:

![][8]

Then just copy the script contents that were shown above into the file.

You then need to tell the system that our script is allowed to be executed by simply running chmod +x ~/backup_script:

![][9]

You can then test run our script by running ~/backup_script.sh, which simply tells our system the path to our script:

![][10]

You could then restore this backup by just running tar -xf ~/.local/tmp/backup.gz -C output_dir, where output_dir is the directory to save the files to.

This script can now run on a scheduled basis by using Cron!

For example, if you wanted the script to run daily at 3 a.m., you could use the following syntax in cron:

And then you’d have backups being created on a daily basis.

### Wrapping Up

And that’s just the introduction to cron jobs. It is widely used by the sysadmins though I am not sure of many usecases for desktop Linux users. If you do, please suggest some in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/cron-job/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-daemons/
[2]: https://linuxhandbook.com/crontab/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/crontab-file.webp?resize=800%2C673&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/crontab-explanation.webp?resize=800%2C450&ssl=1
[5]: https://crontab.guru/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/cron-example-1.webp?resize=557%2C241&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/result-of-cron-job.webp?resize=557%2C241&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/complex-cron-example.webp?resize=548%2C295&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/complex-cron-example-1.webp?resize=548%2C385&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/complex-cron-result.png?resize=800%2C220&ssl=1
