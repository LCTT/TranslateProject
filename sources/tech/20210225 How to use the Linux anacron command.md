[#]: subject: (How to use the Linux anacron command)
[#]: via: (https://opensource.com/article/21/2/linux-automation)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to use the Linux anacron command
======
Instead of manually performing repetitive tasks, let Linux do them for
you.
![Command line prompt][1]

In 2021, there are more reasons why people love Linux than ever before. In this series, I'll share 21 different reasons to use Linux. Automation is one of the best reasons to use Linux.

One of my favorite things about Linux is its willingness to do work for me. Instead of performing repetitive tasks that eat up my time, or are prone to error, or that I'm likely to forget, I schedule Linux to do them for me.

### Preparing for automation

The term "automation" can be as intimidating as it is appealing. I find it helps to approach it modularly.

#### 1\. What do you want to make happen?

First, know what outcome you want to produce. Are you watermarking images? Removing files from a cluttered directory? Performing a backup of important data? Define the task clearly for yourself so that you know what to aim for. If there's any task you find yourself doing every day, much less more than once a day, then it could be a candidate for automation.

#### 2\. Learn the applications you need

Break down big tasks into small components and learn how to produce each result manually but in a repeatable and predictable way. Much of what can be done on Linux can be scripted, but it's important to recognize your current limitations. There's a world of difference between learning how to automate resizing several images so that they can be emailed conveniently vs. using machine learning to generate elaborate artwork for your weekly newsletter. One of these things you can learn in an afternoon and the other could take years. However, we all have to start somewhere, so just start small and always be on the lookout for ways to improve.

#### 3\. Automate it

Use an automation tool on Linux to make it happen on a regular basis. This is the step this article covers!

To automate something, you need a script that automates a task. When testing, it's best to keep things simple, so the task this article automates is the creation of a file called `hello` in the `/tmp` directory:


```
#!/bin/sh

touch /tmp/hello
```

Copy and paste that simple script into a text file and name it `example`.

### Cron

The built-in automation solution that every Linux install comes with is the cron system. Linux users tend to refer to cron generically as the method you use to schedule a task (usually called a "cron job"), but there are multiple applications that provide cron's functionality. The most versatile is [cronie][2]; its advantage is that it does _not_ assume that your computer is always on, the way historical cron applications designed for system administrators do.

Verify which cron system your Linux distribution provides. If it's anything other than cronie, you can probably install cronie from your distro's software repository. If your distribution doesn't have a package for cronie, you can use the old `anacron` package instead. The `anacron` command is included with cronie, so regardless of how you acquire it, you want to ensure that you have the `anacron` command available on your system before continuing. Anacron may require administrative root privileges, depending on your setup.


```
$ which anacron
/usr/sbin/anacron
```

Anacron's job is to ensure that your automation jobs are executed on a regular basis. To do this, anacron checks to find out when the last time a job ran and then checks how often you have told it to run jobs.

Suppose you set anacron to run a script once every five days. Every time you turn your computer on or wake it from sleep, anacron scans its logs to determine whether it needs to run the job. If a job ran five or more days ago, then anacron runs the job.

### Cron jobs

Many Linux systems come bundled with a few maintenance jobs for cron to perform. I like to keep my jobs separate from the system jobs, so I create a directory in my home directory. Specifically, there's a hidden folder called `~/.local` ("local" in the sense that it's customized for your user account rather than for your "global" computer system), so I create the subdirectory `etc/cron.daily` to mirror cron's usual home on my system. You must also create a spool directory to keep track of the last time jobs were run.


```
`$ mkdir -p ~/.local/etc/cron.daily ~/.var/spool/anacron`
```

You can place any script you want to run regularly into the `~/.local/etc/cron.daily` directory. Copy the `example` script into the directory now, and [mark it executable using the chmod command][3].


```
$ cp example ~/.local/etc/cron.daily
# chmod +x ~/.local/etc/cron.daily/example
```

Next, set up anacron to run whatever scripts are located in the `~/.local/etc/cron.daily` directory.

### Anacron

By default, much of the cron system is considered the systems administrator's domain because it's often used for important low-level tasks, like rotating log files and updating certificates. The configuration demonstrated in this article is designed for a regular user setting up personal automation tasks.

To configure anacron to run your cron jobs, create a configuration file at `/.local/etc/anacrontab`:


```
SHELL=/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin
1  0  cron.mine    run-parts /home/tux/.local/etc/cron.daily/
```

This file tells anacron to run all executable scripts (`run-parts`) found in `~/.local/etc/cron.daily` every one day (that is, daily), with a zero-minute delay. Sometimes, a few minutes' delay is used so that your computer isn't hit with all the possible tasks right after you log in. These settings are suitable for testing, though.

The `cron.mine` value is an arbitrary name for the process. I call it `cron.mine` but you could call it `cron.personal` or `penguin` or anything you want.

Verify your `anacrontab` file's syntax:


```
$ anacron -T -t ~/.local/etc/anacrontab \
-S /home/tux/.var/spool/anacron
```

Silence means success.

### Adding anacron to .profile

Finally, you must ensure that anacron runs with your local configuration. Because you're running anacron as a regular user and not as the root user, you must direct it to your local configurations —the `anacrontab` file telling anacron what to do, and the spool directory helping anacron keep track of how many days it's been since each job was last executed:


```
anacron -fn -t /home/tux/.local/etc/anacrontab \
-S /home/tux/.var/spool/anacron
```

The `-fn` options tell anacron to _ignore_ timestamps, meaning that you're forcing it to run your cron job no matter what. This is exclusively for testing purposes.

### Testing your cron job

Now that everything's set up, you can test the job. You can technically test this without rebooting, but it makes the most sense to reboot because that's what this is designed to handle: interrupted and irregular login sessions. Take a moment to reboot your computer, log in, and then look for the test file:


```
$ ls /tmp/hello
/tmp/hello
```

Assuming the file exists, your example script has executed successfully. You can now remove the test options from `~/.profile`, leaving this as your final configuration:


```
anacron -t /home/tux/.local/etc/anacrontab \
-S /home/tux/.var/spool/anacron
```

### Using anacron

You have your personal automation infrastructure configured, so you can place any script you want your computer to manage for you into the `~/.local/etc/cron.daily` directory and it will run as scheduled.

It's up to you how often you want jobs to run. Your example script is executed once a day. Obviously, that depends on whether your computer is powered on and awake on any given day. If you use your computer on Friday but set it aside for the weekend, the script won't run on Saturday and Sunday. However, on Monday the script will execute because anacron will know that at least one day has passed. You can add weekly, fortnightly, or even monthly directories to `~/.local/etc` to schedule a wide variety of intervals.

To add a new interval:

  1. Add a directory to `~/.local/etc` (for instance, `cron.weekly`).
  2. Add a line to `~/.local/etc/anacrontab` to run scripts in the new directory. For a weekly interval, the configuration would be: [code]`7 0 cron.mine run-parts /home/tux/.local/etc/cron.weekly/`[/code] (with the `0` value optionally being some number of minutes to politely delay the start of the script).
  3. Place your scripts in the `cron.weekly` directory.



Welcome to the automated lifestyle. It won't feel like it, but you're about to become a lot more productive.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/linux-automation

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://github.com/cronie-crond/cronie
[3]: https://opensource.com/article/19/8/linux-chmod-command
