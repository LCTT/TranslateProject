[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Scheduling tasks on Linux using the at command)
[#]: via: (https://www.networkworld.com/article/3535808/scheduling-tasks-on-linux-using-the-at-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Scheduling tasks on Linux using the at command
======
The at command makes it easy to schedule Linux tasks to be run at any time or date you choose. Check out what it can do for you.
romkaz / Getty Images

When you want commands or scripts to run at some particular time, you don’t have to sit with your fingers hovering over the keyboard waiting to press the enter key or even be at your desk at the right time. Instead, you can set your task to be run through the **at** command. In this post, we’ll look at how tasks are scheduled using **at**, how you can precisely select the time you want your process to run and how to view what’s been scheduled to run using **at**.

### at vs cron

For those who’ve been scheduling tasks on Linux systems using **cron**, the **at** command is something like **cron** in that you can schedule tasks to run at a selected time, but **cron** is used for jobs that are run periodically – even if that means only once a year. Most **cron** jobs are set up to be run daily, weekly or monthly, though you control how often and when.

The **at** command, on the other hand, is used for tasks which are run only once. Want to reboot your system at midnight tonight? No problem, **at** can do that for you assuming you have the proper permissions. If you want the system rebooted every Saturday night at 2 a.m., use **cron** instead.

### Using at

The **at** command is easy to use ,and there are only a few things to remember. A simple use of **at** might look like this:

```
$ at 5:00PM
at> date >> thisfile
at> <EOT>
```

After typing “at” and the time the command should be run, **at** prompts you for the command to be run (in this case, the **date** command). Type **^D** to complete your request.

Assuming we set up this **at** command earlier than 5 p.m., the date and time will be added to the end of a file named “thisfile” later the same day. Otherwise, the command will run at 5 p.m. the following day.

You can enter more than one command when interacting with the **at** command. If you want more than one command to be run at the same time, simply specify more than one command line:

[][1]

```
$ at 6:22
warning: commands will be executed using /bin/sh
at> echo first >> thisfile
at> echo second >> thisfile
at> <EOT>
```

In the commands above, we’re using a regular user account and adding some simple text to a file in that user’s home directory. If it’s after 6:22 a.m. when this command is run, the command will run the following day because 6:22 is taken to mean 6:22 a.m. If you want it to run at 6:22 p.m., either use 6:22 PM or 18:22. “6:22 PM” also works.

You can use **at** to schedule commands to run on specific dates either by specifying the dates or specifying dates and times like “10:00AM April 15 2021” or “noon + 5 days” (run at noon five days from today). Here are some examples:

```
at 6PM tomorrow
at noon April 15 2021
at noon + 5 days
at 9:15 + 1000 days
```

After you specify the command to run and press **^D**, you will notice that the **at** command has assigned a job number to each request. This number will show up in the **at** command's job queue.

```
$ at noon + 1000 days
warning: commands will be executed using /bin/sh
at> date >> thisfile
at> <EOT>
job 36 at Tue Dec 27 12:00:00 2022        <== job # is 36
```

### Checking the queue

You can look at the queue of **at** jobs with the **atq** (at queue) command:

```
$ atq
32      Thu Apr  2 03:06:00 2020 a shs
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
34      Thu Apr  2 18:00:00 2020 a shs
```

If you need to cancel one of the jobs in the queue, use the **atrm** (at remove) command along with the job number.

```
$ atrm 32
$ atq
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
34      Thu Apr  2 18:00:00 2020 a shs
```

You can look into the details of a scheduled task using the **at -c** command. Additional details (the active search path, etc.) are also available, but the bottom lines of the output will show you what command has been scheduled to run.

```
$ at -c 36 | tail -6
cd /home/shs || {
         echo 'Execution directory inaccessible' >&2
         exit 1
}
date >> thisfile
```

Notice that the command shown begins with testing whether the user’s directory can be entered with a **cd** command. The job will exit with an error if this is not the case. Otherwise the command specified when the **at** command was issued will be run. Read the command as "move into /home/shs OR exit with the error shown".

### Running jobs as root

To run **at** jobs as root, simply use **sudo** with your **at** command like this:

```
$ sudo at 8PM
[sudo] password for shs:
warning: commands will be executed using /bin/sh
at> reboot now
at> <EOT>
job 37 at Wed Apr  1 16:00:00 2020
```

Notice that the root task shows up in the queue with **root** as the one to execute it.

```
35      Mon Apr  6 12:00:00 2020 a shs
36      Tue Dec 27 12:00:00 2022 a shs
37      Wed Apr  1 20:00:00 2020 a root         <==
```

### Running scripts

You can also use the **at** command to run scripts. Here's an example:

```
$ at 4:30PM
warning: commands will be executed using /bin/sh
at> bin/tryme
at> <EOT>
```

### Denying use of the at command

The **/etc/at.deny** file provides a way to disallow users from being able to make use of the **at** command. By default, it will probably include a list of disallowed accounts like **ftp** and **nobody**. An **/etc/at.allow** file could be used to do the opposite but, generally, only the **at.deny** file is configured.

**Wrap-Up**

The **at** command is very versatile and easy to use when you want to schedule a one-time task – even if you want it to run this afternoon or years in the future.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3535808/scheduling-tasks-on-linux-using-the-at-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
