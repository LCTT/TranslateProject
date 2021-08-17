[#]: subject: "Schedule a task with the Linux at command"
[#]: via: "https://opensource.com/article/21/8/linux-at-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Schedule a task with the Linux at command
======
The at command is the Linux terminal's method of allowing you to
schedule one-time jobs for a specific time and date.
![Team checklist][1]

Computers are good at [automation][2], but not everyone knows how to make automation work. It's a real luxury, though, to be able to schedule a task for a computer at a specific time and then forget about it. Maybe you have a file to upload or download at a specific time, or you need to process a batch of files that don't yet exist but are guaranteed to exist by a certain time or a setting that needs monitoring, or maybe you just need a friendly reminder to pick up bread and butter on the way home from work.

That's what the `at` command is for.

### What is the Linux at command?

The `at` command is the Linux terminal's method of allowing you to schedule one-time jobs for a specific time and date. It's spontaneous automation made easy from the terminal.

### Installing at

On Linux, the `at` command is probably already installed. You can verify that it's installed using the `at -V` command. As long as a version is returned, you have `at` installed:


```
$ at -V
at version x.y.z
```

Should you try to use `at` and the command isn't found, most modern Linux distributions offer to install the missing `at` package for you.

### Scheduling a job interactively with at

When you use the `at` command along with the time you want a task to run, you open an interactive `at` prompt. You can enter commands you want to run at the time you specified.

If it helps, you can think of this process as a calendaring app, like the one you probably use on your mobile phone—first, you create an event on a day at some time, and then you specify what you want to happen.

For example, try scheduling a memo to yourself by creating a task for a few minutes in the future. Make the task simple to reduce the likelihood of failure. To exit the `at` prompt, press **Ctrl+D** on your keyboard.


```
$ at 11:20 AM
warning: commands will be executed using /bin/sh
at&gt; echo "hello world" &gt; ~/at-test.txt
at&gt; &lt;EOT&gt;
job 3 at Mon Jul 26 11:20:00 2021
```

As you can see, `at` uses intuitive and natural time definitions. You don't need to know the 24-hour clock or translate times to UTC or a specific ISO format. Generally, you can use whatever notation comes naturally to you, such as _noon_, _1:30 PM_, _13:37_, and so on, to describe when you want a task to happen.

Wait a few minutes and then verify that your task has run by running the `cat` or the `tac` command on the file you created:


```
$ cat ~/at-test.txt
hello world
```

### Scheduling a job with at

You don't have to use the interactive prompt to schedule jobs with `at`. You can instead pipe commands to it using `echo` or `printf`. In this example, I use the notation _now_ and how many minutes from now I want the task to be delayed:


```
`$ echo "echo 'hello again' >> ~/at-test.txt" | at now +1 minute`
```

After a minute, verify that the new command has been executed:


```
$ cat ~/at-test.txt
hello world
hello again
```

### Time expressions

The `at` command is pretty forgiving when interpreting times. You can choose between many formats, depending on which is most convenient for you:

  * `YYMMDDhhmm`[.ss]
(abbreviated year, month, day, hour, minute, and optionally seconds)
  * `CCYYMMDDhhmm`[.ss]
(full year, month, day, hour, minute, and optionally seconds)
  * `now`
  * `midnight`
  * `noon`
  * `teatime` (4 PM)
  * `AM`
  * `PM`



Times and dates can be absolute or add a plus sign (_+_) to make them relative to _now_. When specifying relative times, you can use words you probably already use:

  * `minutes`
  * `hours`
  * `days`
  * `weeks`
  * `months`
  * `years`



### Time and date syntax

The `at` command is less forgiving in telling times from dates. The time must come first, followed by the day, although the day defaults to the current day and is only required when scheduling a task for someday in the future.

These are examples of just a few valid expressions:


```
$ echo "rsync -av /home/tux me@myserver:/home/tux/" | at 3:30 AM tomorrow
$ echo "/opt/batch.sh ~/Pictures" | at 3:30 AM 08/01/2022
$ echo "echo hello" | at now + 3 days
```

### Viewing your at queue

Once you've embraced `at` and are scheduling tasks instead of scribbling notes to yourself on scraps of paper lying around your desk, you may want to review whether you've got jobs still in the queue.

To view your `at` queue, use the `atq` command:


```
$ atq
10 Thu Jul 29 12:19:00 2021 a tux
9  Tue Jul 27 03:30:00 2021 a tux
7  Tue Jul 27 00:00:00 2021 a tux
```

To remove a task from your queue, use the `atrm` command along with the job number. To remove job 7, for instance:


```
$ atrm 7
$ atq
10 Thu Jul 29 12:19:00 2021 a tux
9  Tue Jul 27 03:30:00 2021 a tux
```

To see what's actually in a scheduled job, you have to look at the `at` spool. Only the root user can view the `at` spool, so you must use `sudo` to view the spool or to `cat` the contents of any job.

### Schedule with Linux at

The `at` system is an excellent way to avoid forgetting to run a job later in the day or to have your computer run a job for you when you're away. Unlike `cron`, it's free from the expectation that a job must run on a regular schedule from now until perpetuity, and its syntax is consequently a lot simpler than the `cron` syntax.

Next time you have a small job you want your computer to remember and manage, try the `at` command.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-at-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/article/20/11/orchestration-vs-automation
