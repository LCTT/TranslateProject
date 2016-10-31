yangmingming translating
# How to Start Linux Command in Background and Detach Process in Terminal

In this guide, we shall bring to light a simple yet important concept in [process handling in a Linux system][8], that is how to completely detach a process from its controlling terminal.

When a process is associated with a terminal, two problems might occur:

1.  your controlling terminal is filled with so much output data and error/diagnostic messages.
2.  in the event that the terminal is closed, the process together with its child processes will be terminated.

To deal with these two issues, you need to totally detach a process from a controlling terminal. Before we actually move to solve the problem, let us briefly cover how to run processes in the background.

### How to Start a Linux Process or Command in Background

If a process is already in execution, such as the [tar command example][7] below, simply press `Ctrl+Z` to stop it then enter the command `bg` to continue with its execution in the background as a job.

You can view all your background jobs by typing `jobs`. However, its stdin, stdout, stderr are still joined to the terminal.

```
$ tar -czf home.tar.gz .
$ bg
$ jobs

```

[![Run Linux Command in Background](http://www.tecmint.com/wp-content/uploads/2016/10/Run-Linux-Command-in-Background.png)][6]

Run Linux Command in Background

You can as well run a process directly from the background using the ampersand, `&` sign.

```
$ tar -czf home.tar.gz . &
$ jobs

```

[![Start Linux Process in Background](http://www.tecmint.com/wp-content/uploads/2016/10/Start-Linux-Process-in-Background.png)][5]

Start Linux Process in Background

Take a look at the example below, although the [tar command][4] was started as a background job, an error message was still sent to the terminal meaning the process is still connected to the controlling terminal.

```
$ tar -czf home.tar.gz . &
$ jobs

```

[![Linux Process Running in Background Message](http://www.tecmint.com/wp-content/uploads/2016/10/Linux-Process-Running-in-Background-Message.png)][3]

Linux Process Running in Background Message

### Keep Linux Processes Running After Exiting Terminal

We will use disown command, it is used after the a process has been launched and put in the background, it’s work is to remove a shell job from the shell’s active list jobs, therefore you will not use `fg`, `bg` commands on that particular job anymore.

In addition, when you close the controlling terminal, the job will not hang or send a SIGHUP to any child jobs.

Let’s take a look at the below example of using diswon bash built-in function.

```
$ sudo rsync Templates/* /var/www/html/files/ &
$ jobs
$ disown  -h  %1
$ jobs

```

[![Keep Linux Process Running After Closing Terminal](http://www.tecmint.com/wp-content/uploads/2016/10/Keep-Linux-Processes-Running.png)][2]

Keep Linux Process Running After Closing Terminal

You can also use `nohup` command, which also enables a process to continue running in the background when a user exits a shell.

```
$ nohup tar -czf iso.tar.gz Templates/* &
$ jobs

```

[![Put Linux Process in Background After Closing Shell](http://www.tecmint.com/wp-content/uploads/2016/10/Put-Linux-Process-in-Background.png)][1]

Put Linux Process in Background After Closing Shell

### Detach a Linux Processes From Controlling Terminal

Therefore, to completely detach a process from a controlling terminal, use the command format below, this is more effective for graphical user interface (GUI) applications such as firefox:

```
$ firefox </dev/null &>/dev/null &

```

In Linux, /dev/null is a special device file which writes-off (gets rid of) all data written to it, in the command above, input is read from, and output is sent to /dev/null.

As a concluding remark, provided a process is connected to a controlling terminal, as a user, you will see several output lines of the process data as well as error messages on your terminal. Again, when you close the a controlling terminal, your process and child processes will be terminated.

Importantly, for any questions or remarks on the subject, reach us by using the comment form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/run-linux-command-process-in-background-detach-process/#

作者：[Aaron Kili][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Put-Linux-Process-in-Background.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Keep-Linux-Processes-Running.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Linux-Process-Running-in-Background-Message.png
[4]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Start-Linux-Process-in-Background.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/10/Run-Linux-Command-in-Background.png
[7]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[8]:http://www.tecmint.com/monitor-linux-processes-and-set-process-limits-per-user/
