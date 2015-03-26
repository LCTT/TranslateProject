A Peep into Process Management Commands in Linux
================================================================================
A program in execution is called a process. While a program is an executable file present in storage and is passive, a process is a dynamic entity comprising of allocated system resources, memory, security attributes and has a state associated with it. There can be multiple processes associated with the same program and operating simultaneously without interfering with each other. The operating system efficiently manages and keeps track of all the processes running in the system.

In order to manage these processes, user should be able to

- See all the processes that are running
- View the system resources consumed by the processes
- Locate a particular process and take specific action on it
- Change the priority levels associated with processes
- Kill the required processes
- Restrict the system resources available to processes etc.

Linux offers many commands to the user to effectively handle the above mentioned scenarios. Let's understand them one by one.

### 1. ps ###

'ps' is one of the basic commands in Linux to view the processes on the system. It lists the running processes in a system along with other details such as process id, command, cpu usage, memory usage etc.  Some of the following options come handy to get more useful information

    ps -a - List all the running / active processes

![Output of "ps -a" command](http://blog.linoxide.com/wp-content/uploads/2015/02/ps-a2.png)

    ps -ef |grep - List only the required process

    ps -aux - Displays processes including those with no terminals(x)  Output is user oriented (u) with fields like USER, PID, %CPU, %MEM etc

### 2. pstree ###

In Linux, every process gets spawned by its parent process. This command helps visualize the processes by displaying a tree diagram of the processes showing the relationship between them.  If a pid is mentioned, the root of the tree will be the pid. Else it will be rooted at init.

![pstree](http://blog.linoxide.com/wp-content/uploads/2015/02/pstree.png)

### 3. top ###

'top' is a very useful command to monitor the system as it shows the system resources used by different processes. It gives a snapshot of the situation that the system is currently in. Its output includes data like process identification number(PID), user of the process, nice value, %CPU and %memory currently consumed by the process etc. One can use this output to figure out which process is hogging the CPU or memory.

![top](http://blog.linoxide.com/wp-content/uploads/2015/02/top.png)

### 4. htop ###

htop is similar to top, but is an interactive text mode process viewer.  It displays the per CPU usage and memory, swap usage using a text graph. One can use the Up/Down arrow key to select processes, F7 and F8 to change the priority and F9 to kill a process.   It is not present by default in the system and need to be installed explicitly.

![htop output](http://blog.linoxide.com/wp-content/uploads/2015/03/htop1.png)

### 5. nice ###

With the help of nice command, users can set or change the priorities of processes in Linux. Higher the priority of a process, more is the CPU time allocated by the kernel for it. By default, a process gets launched with priority 0. Process priority can be viewed using the top command output under the NI (nice value) column.

Values of process priority range from -20 to 19.  Lower the nice value, higher the priority.

    nice <priority value> <process name> - starts the process by setting its priority to the given value

![nice command](http://blog.linoxide.com/wp-content/uploads/2015/02/nice-cmd.png)

![changed nice value of 'top'](http://blog.linoxide.com/wp-content/uploads/2015/02/top-nice.png)

In the above example,  'top' gets launched with a priority -3.

### 6. renice ###

It is similar to nice command.  Use this command to change the priority of an already running process.  Please note that users can change the priority of only the processes that they own.

    renice -n -p - change the priority of the given process

![renice command](http://blog.linoxide.com/wp-content/uploads/2015/02/renice2.png)

Priority of process with id 3806 which had an initial priority of 0 is now changed to priority 4.

    renice -u -g - change the priority of processes owned by the given user and group
![output of renice for a user group](http://blog.linoxide.com/wp-content/uploads/2015/02/renice1.png)

In the above example, priority of all processes owned by user 'mint' get changed to '-3'

### 7. kill ###

This is a command used to terminate processes by sending signals.  If a process is not responding to kill command, then it can be forcefully killed using the kill -9 command. But this needs to be used carefully as it does not give a chance for the process to clean up and might end up in corrupted files. If we are not aware of the PID of the process to be killed or want to mention the process name to be killed, then killall comes to rescue.

    kill <pid>

    kill -9 <pid>

    killall -9 - kill all instances having the same process name

If you use kill, you need to know the process id of the process to be killed.   pkill is a similar command but can be used to kill processes using a pattern, i.e. process name,  process owner etc.

    pkill <process name>

![kill initiated](http://blog.linoxide.com/wp-content/uploads/2015/02/kill-initiated.png)

![kill](http://blog.linoxide.com/wp-content/uploads/2015/02/kill.png)

### 8. ulimit ###

Command useful in controlling the system-wide resources available to the shells and processes. Mostly useful for system administrators to manage systems that are heavily used and have performance problems. Limiting the resources ensures that important processes continue to run while other processes do not consume more resources.

    ulimit -a - Displays the current limits associated with the current user.

![ulimit -a](http://blog.linoxide.com/wp-content/uploads/2015/02/ulimit-a.png)

    -f - maximum file size

    -v - maximum virtual memory size (in KB)

    -n - maximum file descriptor plus 1

    -H : To change and report the hard limit

    -S : To change and report the soft limit

Check out the ulimit man page for more options.

### 9. w ###

w gives us information about the users who have currently logged in and the processes that they are running.  The header details displayed contain information like current time, how long the system has been running, total number of users logged in, load average of the system for the last 1, 5 and 15 minutes

Based on the user information, one can take care before terminating any processes that do not belong to them.

!['w' command](http://blog.linoxide.com/wp-content/uploads/2015/02/w.png)

**who** is a related command and gives a list of currently logged in users, time of last system boot, current run levels etc.

!['who' command](http://blog.linoxide.com/wp-content/uploads/2015/02/who.png)

**whoami** command prints the username of the current user ID

!['whoami' command](http://blog.linoxide.com/wp-content/uploads/2015/02/whoami.png)

### 10. pgrep ###

pgrep stands for "Process-ID Global Regular Expression Print". It scans the currently running processes and lists the process IDs that match the selection criteria mentioned on command line to stdout. Useful for retrieving the process id of a process by using its name.

    pgrep -u mint sh

This command will display the process ID for the process named 'sh' and owned by user 'mint'

![output of pgrep](http://blog.linoxide.com/wp-content/uploads/2015/03/pgrep.png)

### 11. fg , bg ###

Sometimes, the commands that we execute take a long time to complete. In such situations, we can push the jobs to be executed in the background using 'bg' command and can be brought to the foreground with the 'fg' command.

We can start a program in background by using the '&' :

    find . -name *iso > /tmp/res.txt &

A program that is already running can also be sent to the background using 'CTRL+Z' and 'bg' command:

    find . -name *iso > /tmp/res.txt &     -  start the job in the background

    ctrl+z      -   suspend the currently executing foreground job

    bg   -  push the command execution to background

We can list all the background processes using 'jobs' command

    jobs

We can bring back a background process to foreground using the 'fg' command.

    fg %

![output of fg, bg and jobscommands](http://blog.linoxide.com/wp-content/uploads/2015/03/fg-bg-jobs.png)

### 12. ipcs ###

ipcs command is used for listing the inter-process communication facilities (shared memory, semaphores and message queues).

This command with -p option can be combined with options -m, -s or-q to display the process id which recently accessed the corresponding ipc facility.

    ipcs -p -m

The screen shot below is listing the creator id and process id which accessed the shared memory recently.

![ipcs command](http://blog.linoxide.com/wp-content/uploads/2015/03/ipcs.png)

### Conclusion ###

Generally, it is considered the job of administrators to fix problems and tweak the system to improve the performance. But users also need to deal with processes in Linux quite often. Hence, it is essential to familiarise ourselves with the various commands available to manage them effectively. 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/process-management-commands-linux/

作者：[B N Poornima][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/