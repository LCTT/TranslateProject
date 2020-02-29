[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing processes on Linux with kill and killall)
[#]: via: (https://opensource.com/article/20/1/linux-kill-killall)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Managing processes on Linux with kill and killall
======
Know how to terminate processes and reclaim system resources with the
ps, kill, and killall commands.
![Penguin with green background][1]

In Linux, every program and daemon is a "process." Most processes represent a single running program. Other programs can fork off other processes, such as processes to listen for certain things to happen and then respond to them. And each process requires a certain amount of memory and processing power. The more processes you have running, the more memory and CPU cycles you'll need. On older systems, like my seven-year-old laptop, or smaller computers, like the Raspberry Pi, you can get the most out of your system if you keep an eye on what processes you have running in the background.

You can get a list of running processes with the **ps** command. You'll usually want to give **ps** some options to show more information in its output. I like to use the **-e** option to see every process running on my system, and the **-f** option to get full details about each process. Here are some examples:


```
$ ps
    PID TTY          TIME CMD
  88000 pts/0    00:00:00 bash
  88052 pts/0    00:00:00 ps
  88053 pts/0    00:00:00 head

[/code] [code]

$ ps -e | head
    PID TTY          TIME CMD
      1 ?        00:00:50 systemd
      2 ?        00:00:00 kthreadd
      3 ?        00:00:00 rcu_gp
      4 ?        00:00:00 rcu_par_gp
      6 ?        00:00:02 kworker/0:0H-events_highpri
      9 ?        00:00:00 mm_percpu_wq
     10 ?        00:00:01 ksoftirqd/0
     11 ?        00:00:12 rcu_sched
     12 ?        00:00:00 migration/0

[/code] [code]

$ ps -ef | head
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 13:51 ?        00:00:50 /usr/lib/systemd/systemd --switched-root --system --deserialize 36
root           2       0  0 13:51 ?        00:00:00 [kthreadd]
root           3       2  0 13:51 ?        00:00:00 [rcu_gp]
root           4       2  0 13:51 ?        00:00:00 [rcu_par_gp]
root           6       2  0 13:51 ?        00:00:02 [kworker/0:0H-kblockd]
root           9       2  0 13:51 ?        00:00:00 [mm_percpu_wq]
root          10       2  0 13:51 ?        00:00:01 [ksoftirqd/0]
root          11       2  0 13:51 ?        00:00:12 [rcu_sched]
root          12       2  0 13:51 ?        00:00:00 [migration/0]
```

The last example shows the most detail. On each line, the UID (user ID) shows the user that owns the process. The PID (process ID) represents the numerical ID of each process, and PPID (parent process ID) shows the ID of the process that spawned this one. In any Unix system, processes count up from PID 1, the first process to run once the kernel starts up. Here, **systemd** is the first process, which spawned **kthreadd**. And **kthreadd** created other processes including **rcu_gp**, **rcu_par_gp**, and a bunch of other ones.

### Process management with the kill command

The system will take care of most background processes on its own, so you don't need to worry about them. You should only have to get involved in managing any processes that you create, usually by running applications. While many applications run one process at a time (think about your music player or terminal emulator or game), other applications might create background processes. Some of these might keep running when you exit the application so they can get back to work quickly the next time you start the application.

Process management is an issue when I run Chromium, the open source base for Google's Chrome browser. Chromium works my laptop pretty hard and fires off a lot of extra processes. Right now, I can see these Chromium processes running with only five tabs open:


```
$ ps -ef | fgrep chromium
jhall      66221   [...]  /usr/lib64/chromium-browser/chromium-browser [...]
jhall      66230   [...]  /usr/lib64/chromium-browser/chromium-browser [...]
[...]
jhall      66861   [...]  /usr/lib64/chromium-browser/chromium-browser [...]
jhall      67329   65132  0 15:45 pts/0    00:00:00 grep -F chromium
```

I've omitted some lines, but there are 20 Chromium processes and one **grep** process that is searching for the string "chromium."


```
$ ps -ef | fgrep chromium | wc -l
21
```

But after I exit Chromium, those processes remain open. How do you shut them down and reclaim the memory and CPU that those processes are taking up?

The **kill** command lets you terminate a process. In the simplest case, you tell **kill** the PID of what you want to stop. For example, to terminate each of these processes, I would need to execute the **kill** command against each of the 20 Chromium process IDs. One way to do that is with a command line that gets the Chromium PIDs and another that runs **kill** against that list:


```
$ ps -ef | fgrep /usr/lib64/chromium-browser/chromium-browser | awk '{print $2}'
66221
66230
66239
66257
66262
66283
66284
66285
66324
66337
66360
66370
66386
66402
66503
66539
66595
66734
66848
66861
69702

$ ps -ef | fgrep /usr/lib64/chromium-browser/chromium-browser | awk '{print $2}' &gt; /tmp/pids
$ kill $( cat /tmp/pids)
```

Those last two lines are the key. The first command line generates a list of process IDs for the Chromium browser. The second command line runs the **kill** command against that list of process IDs.

### Introducing the killall command

A simpler way to stop a bunch of processes all at once is to use the **killall** command. As you might guess by the name, **killall** terminates all processes that match a name. That means we can use this command to stop all of our rogue Chromium processes. This is as simple as:


```
`$ killall /usr/lib64/chromium-browser/chromium-browser`
```

But be careful with **killall**. This command can terminate any process that matches what you give it. That's why I like to first use **ps -ef** to check my running processes, then run **killall** against the exact path to the command that I want to stop.

You might also want to use the **-i** or **\--interactive** option to ask **killall** to prompt you before it stops each process.

**killall** also supports options to select processes that are older than a specific time using the **-o** or **\--older-than** option. This can be helpful if you discover a set of rogue processes that have been running unattended for several days, for example. Or you can select processes that are younger than a specific time, such as runaway processes you recently started. Use the **-y** or **\--younger-than** option to select these processes.

### Other ways to manage processes

Process management can be an important part of system maintenance. In my early career as a Unix and Linux systems administrator, the ability to kill escaped jobs was a useful tool to keep systems running properly. You may not need to kill rogue processes in a modern Linux desktop, but knowing **kill** and **killall** can help you when things eventually go awry.

You can also look for other ways to manage processes. In my case, I didn't really need to use **kill** or **killall** to stop the background Chromium processes after I exited the browser. There's a simple setting in Chromium to control that:

![Chromium background processes setting][2]

Still, it's always a good idea to keep an eye on what processes are running on your system and know how to manage them when needed.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/linux-kill-killall

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://opensource.com/sites/default/files/uploads/chromium-settings-continue-running.png (Chromium background processes setting)
