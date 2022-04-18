[#]: collector: (lujun9972)
[#]: translator: (Starryi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Watching activity on Linux with watch and tail commands)
[#]: via: (https://www.networkworld.com/article/3529891/watching-activity-on-linux-with-watch-and-tail-commands.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Watching activity on Linux with watch and tail commands
======
The watch and tail commands can help monitor activity on Linux systems. This post looks at some helpful ways to use these commands.
Loops7 / Getty Images

The **watch** and **tail** commands provide some interesting options for examining activity on a Linux system in an ongoing manner.

That is, instead of just asking a question and getting an answer (like asking **who** and getting a list of currently logged in users), you can get **watch** to provide you with a display showing who is logged in along with updates as users come and go.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

With **tail**, you can display the bottoms of files and see content as it is added. This kind of monitoring is often very helpful and requires less effort than running commands periodically.

### Using watch

One of the simplest examples of using **watch** is to use the command **watch who**. You should see a list showing who is logged in along with when they logged in and where they logged in from. Notice that the default is to update the display every two seconds (top left) and that the date and time (upper right) updates itself at that interval. The list of users will grow and shrink as users log in and out.

### $ watch who

This command will dissplay a list of logins like this:

```
Every 2.0s: who                              dragonfly: Thu Feb 27 10:52:00 2020

nemo     pts/0        2020-02-27 08:07 (192.168.0.11)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
```

You can change the interval to get less frequent updates by adding a **-n** option (e.g., -n 10) to select a different number of seconds between updates.

### $ watch -n 10 who

The new interval will be displayed and the time shown will change less frequently, aligning itself with the selected interval.

[][2]

```
Every 10.0s: who                             dragonfly: Thu Feb 27 11:05:47 2020

nemo     pts/0        2020-02-27 08:07 (192.168.0.11)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
```

If you prefer to see only the command's output and not the heading (the top 2 lines), you can omit those lines by adding the **-t** (no title) option.

### $ watch -t who

Your display will then look like this:

```
nemo     pts/0        2020-02-27 08:07 (192.168.0.11)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
```

If every time the watched command runs, its output is the same, only the title line (if not omitted) will change. The rest of the displayed information will stay the same.

If you want your **watch** command to exit as soon as the output of the command that it is watching changes, you can use a **-g** (think of this as the "go away") option. You might choose to do this if, for example, you are simply waiting for others to start logging into the system.

You can also highlight changes in the displayed output using the **-d** (differences) option. The highlighting will only last for one interval (2 seconds by default), but can help to draw your attention to the changes.

Here's a more complex example of using the **watch** command to display services that are listening for connections and the ports they are using. While the output isn't likely to change, it would alert you to any new service starting up or one going down.

```
$ watch 'sudo lsof -i -P -n | grep LISTEN'
```

Notice that the command being run needs to be enclosed in quotes to ensure that the **watch** command doesn't send its output to the grep command.

Using the **watch -h** command will provide you with a list of the command's options.

```
$ watch -h

Usage:
 watch [options] command

Options:
  -b, --beep             beep if command has a non-zero exit
  -c, --color            interpret ANSI color and style sequences
  -d, --differences[=<permanent>]
                         highlight changes between updates
  -e, --errexit          exit if command has a non-zero exit
  -g, --chgexit          exit when output from command changes
  -n, --interval <secs>  seconds to wait between updates
  -p, --precise          attempt run command in precise intervals
  -t, --no-title         turn off header
  -x, --exec             pass command to exec instead of "sh -c"

 -h, --help     display this help and exit
 -v, --version  output version information and exit
```

### Using tail -f

The **tail -f** command has something in common with **watch**. It will both display the bottom of a file and additional content as it is added. Instead of having to run a "tail" command again and again, you run one command and get a repeatedly updated view of its output. For example, you could watch a system log with a command like this:

```
$ tail -f /var/log/syslog
```

Some files, like **/var/log/wtmp**, don't lend themselves to this type of handling because they're not formatted as normal text files, but you could get a similar result by combining **watch** and **tail** like this:

```
watch 'who /var/log/wtmp | tail -20'
```

This command will display the most recent 5 logins regardless of how many of the users are still logged in. If another login occurs, a line will be added and the top line removed.

```
Every 60.0s: who /var/log/wtmp | tail -5    dragonfly: Thu Feb 27 12:46:07 2020

shs      pts/0        2020-02-27 08:07 (192.168.0.5)
nemo     pts/1        2020-02-27 08:26 (192.168.0.5)
shs      pts/1        2020-02-27 10:58 (192.168.0.5)
nemo     pts/1        2020-02-27 11:34 (192.168.0.5)
dory     pts/1        2020-02-27 12:14 (192.168.0.5)
```

Both the **watch** and **tail -f** commands can provide auto-updating views of information that you might at times want to monitor, making the task of monitoring quite a bit easier whether you're monitoring processes, logins or system resources.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3529891/watching-activity-on-linux-with-watch-and-tail-commands.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
