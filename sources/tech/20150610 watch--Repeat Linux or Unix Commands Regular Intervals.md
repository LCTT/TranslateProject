watch - Repeat Linux / Unix Commands Regular Intervals
================================================================================
A server administrator needs to maintain the system and keep it updated and safe. A number of intrusion attempts may happen every day. There are some other activities that maintain their log. These logs are updated regularly. In order to check these updates, the commands are executed repeatedly. For example, for simply reading a file, commands like head, tail, cat etc are used. These commands need to be executed repeatedly. The watch command can be used to repeat a command at regular intervals.

### Watch Command ###

Watch is a simple command, with a few options. The basic syntax of watch command is:

    watch [-dhvt] [-n <seconds>] [--differences[=cumulative]] [--help] [--interval=<seconds>] [--no-title] [--version] <command>

Watch command runs the command specified to it after every 2 seconds by default. This time is counted between the completion of command and beginning of next execution. As a simple example, watch command can be used to watch the log updates, The updates are appended at the end of the file, so tail command can be used with watch to see the updates to the file. This command continues to run until you hit CTRL + C to return to the prompt.

### Examples ###

> Keep an eye on errors/notices/warning being generated at run time every couple of seconds.

    watch tail /var/log/messages

![tail messages](http://blog.linoxide.com/wp-content/uploads/2015/06/1.png)

> Keep an eye on disk usage after specified time interval.

    watch df -h

![df -h](http://blog.linoxide.com/wp-content/uploads/2015/06/2.png)

> It is very important for administrators to keep an eye on high I/O wait causing disk operations especially the Mysql transactions.

    watch mysqladmin processlist

![processlist](http://blog.linoxide.com/wp-content/uploads/2015/06/3.png)

> Keep an eye on server load and uptime at runtime.

    watch uptime

![uptime](http://blog.linoxide.com/wp-content/uploads/2015/06/10.png)

> Keep an eye on queue size for Exim at the time a cron is run to send notices to subscribers.

    watch exim -bpc

![exim -bpc](http://blog.linoxide.com/wp-content/uploads/2015/06/9.png)

### 1) Iteration delay ###

    watch [-n <seconds>] <command>

The default interval between the commands can be changed with -n switch. The following command will run the tail command after 5 seconds:

    watch -n 5 date

![date 5 seconds](http://blog.linoxide.com/wp-content/uploads/2015/06/4b.png)

### 2) Successive output comparison ###

If you use -d option with watch command, it will highlight the differences between the first command output to every next command output cumulatively.

    watch [-d or --differences[=cumulative]] <command>

#### Example1 ####

Let’s see the successive time outputs extracted using following watch command and observe how the difference is highlighted.

    watch -n 15 -d date

First time date is capture when command is executed, the next iteration will be repeated after 15 seconds.

![Difference A](http://blog.linoxide.com/wp-content/uploads/2015/06/6.png)

Upon the execution of next iteration, it can be seen that all output is exactly same except the seconds have increased from 14 to 29 which is highlighted.

![Difference A](http://blog.linoxide.com/wp-content/uploads/2015/06/6b.png)

#### Example 2 ####

Let’s experience in difference between two successive outputs of “uptime” command repeated by watch.

    watch -n 20 -d uptime

![uptime](http://blog.linoxide.com/wp-content/uploads/2015/06/10.png)

Now the difference between the time is highlighted as well as the three load snapshots as well.

![10b](http://blog.linoxide.com/wp-content/uploads/2015/06/10b.png)

### 3) Output without title ###

If you don’t want to display extra details about the iteration delay and actual command run by watch then –t switch can be used.

    watch [-t or --no-title] <command>

Let’s see the output of following command as an example.

    watch -t date

![watch without title](http://blog.linoxide.com/wp-content/uploads/2015/06/7t.png)

### Watch help ###

Brief details of the watch command can be found by typing the following command in SSH.

    watch -h [or --help]

![watch help](http://blog.linoxide.com/wp-content/uploads/2015/06/8h.png)

### Watch version ###

Run the following command in SSH terminal to check the version of watch.

    watch -v [--version]

![version](http://blog.linoxide.com/wp-content/uploads/2015/06/11.png)

**BUGS**

Unfortunately, upon terminal resize, the screen will not be correctly repainted until the next scheduled update. All --differences highlight-ing is lost on that update as well.

### Summary ###

Watch is a very powerful utility for system administrators because it can be used to monitor, logs, operations, performance and throughput of the system at run time. One can easily format and delay the output of watch utility. Any Linux command / utility or script and be supplied to watch for desired and continuous output.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-watch-command/

作者：[Aun Raza][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunrz/