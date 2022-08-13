[#]: subject: "Linux tips for using cron to schedule tasks"
[#]: via: "https://opensource.com/article/21/11/cron-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "Veryzzj"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux tips for using cron to schedule tasks
======
Schedule backups, file cleanups, and other tasks by using this simple
yet powerful Linux command-line tool. Download our new cron cheat sheet.
![Linux keys on the keyboard for a desktop computer][1]

Making things happen on a regular and predictable schedule is important on computers. It's important because, as humans, we can sometimes be bad at remembering to do things reliably because we get distracted, have too much on our minds, or we're on holiday. Computers are really good at doing things on a schedule, but a human has to program the computer before the computer takes action.

In a way, the `cron` system is an easy and rudimentary introduction to programming. You can make your computer do what you want it to do just by editing a file. You don't even have to know where the file is kept. You have only to type in a simple command, enter the "recipe" you want your computer to follow, and save your work. From then on, your computer executes your instructions at the specified time until it is told to stop.

By design, `cron` is not a complex system. Here's what you need to know about it.

### What is cron?

The `cron` command is so ubiquitous in Linux and Unix, and it's been mimicked and reinvented so often that it's almost a generic term for _something that happens on a schedule_. It's a form of automation, and although there are different implementations of it (Dillon's cron, Vixie's cron, chrony, and others), and variations like [`anacron`][2] and [systemd timers][3], the syntax and workflow has remained essentially the same for decades.

Cron works on a "spool" system, much like printers and email. If you didn't know that printers and email use a spool, that's okay because the point of a spool file is that you aren't supposed to think about it much. On a Linux system, the directory `/var/spool` is designed as a central hub for important but low-level files that the user isn't meant to interact with directly. One of the spools managed in `/var/spool` is `cron` tables or "crontab" for short. Every user—yourself included—on a Linux system has a crontab. Users can edit, view, and remove their own crontab. In addition, users can use their crontab to schedule tasks. The `cron` system itself monitors crontabs and ensures that any job listed in a crontab is executed at its specified time.

### Edit cron settings

You can edit your crontab using the `crontab` command along with the `-e` (for _edit_) option. By default, most systems invoke the `vim` text editor. If you, like me, don't use Vim, then you can set a different editor for yourself in your `~/.bashrc` file. I set mine to Emacs, but you might also try [Nano][4], [Kate][5], or whatever your favorite editor happens to be. The **EDITOR** environment variable defines what text editor you use in your terminal, while the **VISUAL** variable defines what editor you use in a graphical mode:


```


export EDITOR=nano
export VISUAL=kate

```

Refresh your shell session with your new settings:


```
`$ source ~/.bashrc`
```

Now you can edit your crontab with your preferred editor:


```
`$ crontab -e`
```

#### Schedule a task

The `cron` system is essentially a calendaring system. You can tell `cron` how frequently you want a job to run by using five different attributes: minute, hour, date, month, weekday. The order of these attributes is strict and not necessarily intuitive, but you can think of them as filters or masks. By default, you might think of everything being set to _always_ or _every_. This entry would run `touch /tmp/hello` at the top of every minute during every hour of every day all year long:


```
`* * * * * touch /tmp/hello`
```

You can restrict this all-encompassing schedule by setting specific definitions for each attribute. To make the job run on the half-hour mark of each hour, set the minutes to **30**:


```
`30 * * * * touch /tmp/hello`
```

You can further constrain this instruction with a specific hour. This job runs at 3:30 AM every morning:


```
`30 3 * * * touch /tmp/hello`
```

You can also make the job run only on the first of each month:


```
`30 3 1 * * touch /tmp/hello`
```

You can set a month using 1 for January up to 12 for December, and you can set a day using 0 for Sunday up to 6 for Saturday. This job runs at 3:15 during the month of April, only on Mondays:


```
`15 3 * 4 1 touch /tmp/hello`
```

### Set increments

All of these settings match a value _exactly_. You can also use `cron` notation to run jobs after a set passage of time. For instance, you can run a job every 15 minutes:


```
`*/15 * * * * touch /tmp/hello`
```

You could run a job at 10 AM every three days:


```
`* 10 */3 * * touch /tmp/hello`
```

You could run a job every six hours:


```
`* */6 * * * touch /tmp/hello`
```

### Cron shorthand

Modern `cron` implementations have added a convenient shorthand for common schedules. These are:

  * `@hourly`
  * `@daily`
  * `@weekly`
  * `@monthly`
  * `@yearly or @annually`



### List cron jobs

Using the `crontab` command, you can see a list of your scheduled `cron` jobs:


```


$ crontab -l
15 3 * 4 1 touch /tmp/hello

```

### Remove a crontab

When you're done with a crontab, you can remove it with the `-r` option:


```
`$ crontab -r -i`
```

The `-i` option stands for _interactive_. It prompts you for confirmation before deleting the file.

### What cron can do

It's one thing to know how to use `cron`, but it's another thing to know what to use it for. The classic use case is a good backup plan. If your computer is on for most of the day or all day and all night, then you can schedule a routine backup of an important partition. I run a backup application called `rdiff-backup` on my primary data partition daily at 3AM:


```


$ crontab -l | grep rdiff
* 3 * * * rdiff-backup /data/ /vault/

```

Another common use is system maintenance. On my Slackware desktop, I update my local repository catalog every Friday afternoon:


```


$ crontab -l | grep slack
* 14 * * 5 sudo slackpkg update

```

I could also run an Ansible script at 15:00 every three days to [tidy up my Downloads folder][6]:


```


$ crontab -l | grep ansible
* 15 */3 * * ansible-playbook /home/seth/Ansible/cleanup.yaml

```

A little investment in the health of your computing environment goes a long way. There are de-duplication scripts, file size and `/tmp` directory monitors, photo resizers, file movers, and many more menial tasks you could schedule to run in the background to help keep your system uncluttered. With `cron`, your computer can take care of itself in ways I only wish my physical apartment would.

### Remember cron settings

Besides coming up with _why_ you need `cron`, the hardest thing about `cron` in my experience has been remembering its syntax. Repeat this to yourself, over and over until you've committed it to memory:

_Minutes, hours, date, month, weekday._

_Minutes, hours, date, month, weekday._

_Minutes, hours, date, month, weekday._

Better yet, go [download our free cheatsheet][7] so you have the key close at hand when you need it the most!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/cron-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://opensource.com/article/21/2/linux-automation
[3]: https://opensource.com/article/20/7/systemd-timers
[4]: https://opensource.com/article/20/12/gnu-nano
[5]: https://opensource.com/article/20/12/kate-text-editor
[6]: https://opensource.com/article/21/9/keep-folders-tidy-ansible
[7]: https://opensource.com/downloads/linux-cron-cheat-sheet
