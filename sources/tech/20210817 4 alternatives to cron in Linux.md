[#]: subject: "4 alternatives to cron in Linux"
[#]: via: "https://opensource.com/article/21/7/alternatives-cron-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "unigeorge"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 alternatives to cron in Linux
======
There are a few other open source projects out there that can be used
either in conjunction with cron or instead of cron.
![Alarm clocks with different time][1]

The [Linux `cron` system][2] is a time-tested and proven technology. However, it's not always the right tool for system automation. There are a few other open source projects out there that can be used either in conjunction with `cron` or instead of `cron`.

### Linux at command

`Cron` is intended for long-term repetition. You schedule a job, and it runs at a regular interval from now until the computer is decommissioned. Sometimes you just want to schedule a one-off command to run at a time you happen not to be at your computer. For that, you can use the `at` command.

The syntax of `at` is far simpler and more flexible than the `cron` syntax, and it has both an interactive and non-interactive method for scheduling (so you could use `at` to create an `at` job if you really wanted to.)


```
`$ echo "rsync -av /home/tux/ me@myserver:/home/tux/" | at 1:30 AM`
```

It feels natural, it's easy to use, and you don't have to clean up old jobs because they're entirely forgotten once they've been run.

Read more about the [at command][3] to get started.

### Systemd

In addition to managing processes on your computer, `systemd` can also help you schedule them. Like traditional `cron` jobs, `systemd` timers can trigger events, such as shell scripts and commands, at specified time intervals. This can be once a day on a specific day of the month (and then, perhaps only if it's a Monday, for example), or every 15 minutes during business hours from 09:00 to 17:00.

Timers can also do some things that `cron` jobs can't.

For example, a timer can trigger a script or program to run a specific amount of time _after_ an event, such as boot, startup, completion of a previous task, or even the prior completion of the service unit called by the timer itself!

If your system runs `systemd`, then you're technically using `systemd` timers already. Default timers perform menial tasks like rotating log files, updating the mlocate database, manage the DNF database, and so on. Creating your own is easy, as demonstrated by David Both in his article [Use systemd timers instead of cronjobs][4].

### Anacron

`Cron` specializes in running a command at a specific time. This works well for a server that's never hibernating or powered down. Still, it's pretty common for laptops and desktop workstations to either intentionally or absent-mindedly turn the computer off from time to time. When the computer's not on, `cron` doesn't run, so important jobs (such as backing up data) get skipped.

The `anacron` system is designed to ensure that jobs are run periodically rather than on a schedule. This means you can leave a computer off for several days and still count on `anacron` to run essential tasks when you boot it up again. `Anacron` works in tandem with `cron`, so it's not strictly an alternative to it, but it's a meaningful alternative way of scheduling tasks. Many a sysadmin has configured a `cron` job to backup data late at night on a remote worker's computer, only to discover that the job's only been run once in the past six months. `Anacron` ensures that important jobs happen _sometime_ when they can rather than _never_ when they were scheduled.

Read more about [using anacron for a better crontab][5].

### Automation

Computers and technology are meant to make lives better and work easier. Linux provides its users with lots of helpful features to ensure important operating system tasks get done. Take a look at what's available, and start using these features for your own tasks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/alternatives-cron-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk (Alarm clocks with different time)
[2]: https://opensource.com/article/21/7/cron-linux
[3]: https://opensource.com/article/21/7/intro-command
[4]: https://opensource.com/article/20/7/systemd-timers
[5]: https://opensource.com/article/21/2/linux-automation
