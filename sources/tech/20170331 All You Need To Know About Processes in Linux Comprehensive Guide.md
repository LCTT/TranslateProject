All You Need To Know About Processes in Linux [Comprehensive Guide]
============================================================

In this article, we will walk through a basic understanding of processes and briefly look at [how to manage processes in Linux][9] using certain commands.

A process refers to a program in execution; it’s a running instance of a program. It is made up of the program instruction, data read from files, other programs or input from a system user.

#### Types of Processes

There are fundamentally two types of processes in Linux:

*   Foreground processes (also referred to as interactive processes) – these are initialized and controlled through a terminal session. In other words, there has to be a user connected to the system to start such processes; they haven’t started automatically as part of the system functions/services.
*   Background processes (also referred to as non-interactive/automatic processes) – are processes not connected to a terminal; they don’t expect any user input.

#### What is Daemons

These are special types of background processes that start at system startup and keep running forever as a service; they don’t die. They are started as system tasks (run as services), spontaneously. However, they can be controlled by a user via the init process.

[
 ![Linux Process State](http://www.tecmint.com/wp-content/uploads/2017/03/ProcessState.png) 
][10]

Linux Process State

### Creation of a Processes in Linux

A new process is normally created when an existing process makes an exact copy of itself in memory. The child process will have the same environment as its parent, but only the process ID number is different.

There are two conventional ways used for creating a new process in Linux:

*   Using The System() Function – this method is relatively simple, however, it’s inefficient and has significantly certain security risks.
*   Using fork() and exec() Function – this technique is a little advanced but offers greater flexibility, speed, together with security.

### How Does Linux Identify Processes?

Because Linux is a multi-user system, meaning different users can be running various programs on the system, each running instance of a program must be identified uniquely by the kernel.

And a program is identified by its process ID (PID) as well as it’s parent processes ID (PPID), therefore processes can further be categorized into:

*   Parent processes – these are processes that create other processes during run-time.
*   Child processes – these processes are created by other processes during run-time.

#### The Init Process

Init process is the mother (parent) of all processes on the system, it’s the first program that is executed when the [Linux system boots up][11]; it manages all other processes on the system. It is started by the kernel itself, so in principle it does not have a parent process.

The init process always has process ID of 1. It functions as an adoptive parent for all orphaned processes.

You can use the pidof command to find the ID of a process:

```
# pidof systemd
# pidof top
# pidof httpd
```
[
 ![Find Linux Process ID](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Process-ID.png) 
][12]

Find Linux Process ID

To find the process ID and parent process ID of the current shell, run:

```
$ echo $$
$ echo $PPID
```
[
 ![Find Linux Parent Process ID](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Parent-Process-ID.png) 
][13]

Find Linux Parent Process ID

#### Starting a Process in Linux

Once you run a command or program (for example cloudcmd – CloudCommander), it will start a process in the system. You can start a foreground (interactive) process as follows, it will be connected to the terminal and a user can send input it:

```
# cloudcmd
```
[
 ![Start Linux Interactive Process](http://www.tecmint.com/wp-content/uploads/2017/03/Start-Linux-Interactive-Process.png) 
][14]

Start Linux Interactive Process

#### Linux Background Jobs

To start a process in the background (non-interactive), use the `&` symbol, here, the process doesn’t read input from a user until it’s moved to the foreground.

```
# cloudcmd &
# jobs
```
[
 ![Start Linux Process in Background](http://www.tecmint.com/wp-content/uploads/2017/03/Start-Linux-Process-in-Background.png) 
][15]

Start Linux Process in Background

You can also send a process to the background by suspending it using `[Ctrl + Z]`, this will send the SIGSTOP signal to the process, thus stopping its operations; it becomes idle:

```
# tar -cf backup.tar /backups/*  #press Ctrl+Z
# jobs
```

To continue running the above-suspended command in the background, use the bg command:

```
# bg
```

To send a background process to the foreground, use the fg command together with the job ID like so:

```
# jobs
# fg %1
```
[
 ![Linux Background Process Jobs](http://www.tecmint.com/wp-content/uploads/2017/03/Linux-Background-Process-Jobs.png) 
][16]

Linux Background Process Jobs

You may also like: [How to Start Linux Command in Background and Detach Process in Terminal][17]

#### States of a Process in Linux

During execution, a process changes from one state to another depending on its environment/circumstances. In Linux, a process has the following possible states:

*   Running – here it’s either running (it is the current process in the system) or it’s ready to run (it’s waiting to be assigned to one of the CPUs).
*   Waiting – in this state, a process is waiting for an event to occur or for a system resource. Additionally, the kernel also differentiates between two types of waiting processes; interruptible waiting processes – can be interrupted by signals and uninterruptible waiting processes – are waiting directly on hardware conditions and cannot be interrupted by any event/signal.
*   Stopped – in this state, a process has been stopped, usually by receiving a signal. For instance, a process that is being debugged.
*   Zombie – here, a process is dead, it has been halted but it’s still has an entry in the process table.

#### How to View Active Processes in Linux

There are several Linux tools for viewing/listing running processes on the system, the two traditional and well known are [ps][18] and [top][19] commands:

#### 1\. ps Command

It displays information about a selection of the active processes on the system as shown below:

```
# ps 
# ps -e | head 
```
[
 ![List Linux Active Processes](http://www.tecmint.com/wp-content/uploads/2017/03/ps-command.png) 
][20]

List Linux Active Processes

#### 2\. top – System Monitoring Tool

[top is a powerful tool][21] that offers you a [dynamic real-time view of a running system][22] as shown in the screenshot below:

```
# top 
```
[
 ![List Linux Running Processes](http://www.tecmint.com/wp-content/uploads/2017/03/top-command.png) 
][23]

List Linux Running Processes

Read this for more top usage examples: [12 TOP Command Examples in Linux][24]

#### 3\. glances – System Monitoring Tool

glances is a relatively new system monitoring tool with advanced features:

```
# glances
```
[
 ![Glances - Linux Process Monitoring](http://www.tecmint.com/wp-content/uploads/2017/03/glances.png) 
][25]

Glances – Linux Process Monitoring

For a comprehensive usage guide, read through: [Glances – An Advanced Real Time System Monitoring Tool for Linux][26]

There are several other useful Linux system monitoring tools you can use to list active processes, open the link below to read more about them:

1.  [20 Command Line Tools to Monitor Linux Performance][1]
2.  [13 More Useful Linux Monitoring Tools][2]

### How to Control Processes in Linux

Linux also has some commands for controlling processes such as kill, pkill, pgrep and killall, below are a few basic examples of how to use them:

```
$ pgrep -u tecmint top
$ kill 2308
$ pgrep -u tecmint top
$ pgrep -u tecmint glances
$ pkill glances
$ pgrep -u tecmint glances
```
[
 ![Control Linux Processes](http://www.tecmint.com/wp-content/uploads/2017/03/Control-Linux-Processes.png) 
][27]

Control Linux Processes

To learn how to use these commands in-depth, to kill/terminate active processes in Linux, open the links below:

1.  [A Guide to Kill, Pkill and Killall Commands to Terminate Linux Processess][3]
2.  [How to Find and Kill Running Processes in Linux][4]

Note that you can use them to kill [unresponsive applications in Linux][28] when your system freezes.

#### Sending Signals To Processes

The fundamental way of controlling processes in Linux is by sending signals to them. There are multiple signals that you can send to a process, to view all the signals run:

```
$ kill -l
```
[
 ![List All Linux Signals](http://www.tecmint.com/wp-content/uploads/2017/03/list-all-signals.png) 
][29]

List All Linux Signals

To send a signal to a process, use the kill, pkill or pgrep commands we mentioned earlier on. But programs can only respond to signals if they are programmed to recognize those signals.

And most signals are for internal use by the system, or for programmers when they write code. The following are signals which are useful to a system user:

*   SIGHUP 1 – sent to a process when its controlling terminal is closed.
*   SIGINT 2 – sent to a process by its controlling terminal when a user interrupts the process by pressing `[Ctrl+C]`.
*   SIGQUIT 3 – sent to a process if the user sends a quit signal `[Ctrl+D]`.
*   SIGKILL 9 – this signal immediately terminates (kills) a process and the process will not perform any clean-up operations.
*   SIGTERM 15 – this a program termination signal (kill will send this by default).
*   SIGTSTP 20 – sent to a process by its controlling terminal to request it to stop (terminal stop); initiated by the user pressing `[Ctrl+Z]`.

The following are kill commands examples to kill the Firefox application using its PID once it freezes:

```
$ pidof firefox
$ kill 9 2687
OR
$ kill -KILL 2687
OR
$ kill -SIGKILL 2687  
```

To kill an application using its name, use pkill or killall like so:

```
$ pkill firefox
$ killall firefox 
```

#### Changing Linux Process Priority

On the Linux system, all active processes have a priority and certain nice value. Processes with higher priority will normally get more CPU time than lower priority processes.

However, a system user with root privileges can influence this with the nice and renice commands.

From the output of the top command, the NI shows the process nice value:

```
$ top  
```
[
 ![List Linux Running Processes](http://www.tecmint.com/wp-content/uploads/2017/03/top-command.png) 
][30]

List Linux Running Processes

Use the nice command to set a nice value for a process. Keep in mind that normal users can attribute a nice value from zero to 20 to processes they own.
Only the root user can use negative nice values.

To renice the priority of a process, use the renice command as follows:

```
$ renice +8  2687
$ renice +8  2103
```

Check out our some useful articles on how to manage and control Linux processes.

1.  [Linux Process Management: Boot, Shutdown, and Everything in Between][5]
2.  [Find Top 15 Processes by Memory Usage with ‘top’ in Batch Mode][6]
3.  [Find Top Running Processes by Highest Memory and CPU Usage in Linux][7]
4.  [How to Find a Process Name Using PID Number in Linux][8]

That’s all for now! Do you have any questions or additional ideas, share them with us via the feedback form below.

--------------------------------------------------------------------------------


作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-process-management/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[2]:http://www.tecmint.com/linux-performance-monitoring-tools/
[3]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
[4]:http://www.tecmint.com/find-and-kill-running-processes-pid-in-linux/
[5]:http://www.tecmint.com/rhcsa-exam-boot-process-and-process-management/
[6]:http://www.tecmint.com/find-processes-by-memory-usage-top-batch-mode/
[7]:http://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[8]:http://www.tecmint.com/find-process-name-pid-number-linux/
[9]:http://www.tecmint.com/dstat-monitor-linux-server-performance-process-memory-network/
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/ProcessState.png
[11]:http://www.tecmint.com/linux-boot-process/
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Process-ID.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Parent-Process-ID.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Start-Linux-Interactive-Process.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/Start-Linux-Process-in-Background.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/Linux-Background-Process-Jobs.png
[17]:http://www.tecmint.com/run-linux-command-process-in-background-detach-process/
[18]:http://www.tecmint.com/linux-boot-process-and-manage-services/
[19]:http://www.tecmint.com/12-top-command-examples-in-linux/
[20]:http://www.tecmint.com/wp-content/uploads/2017/03/ps-command.png
[21]:http://www.tecmint.com/12-top-command-examples-in-linux/
[22]:http://www.tecmint.com/bcc-best-linux-performance-monitoring-tools/
[23]:http://www.tecmint.com/wp-content/uploads/2017/03/top-command.png
[24]:http://www.tecmint.com/12-top-command-examples-in-linux/
[25]:http://www.tecmint.com/wp-content/uploads/2017/03/glances.png
[26]:http://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/
[27]:http://www.tecmint.com/wp-content/uploads/2017/03/Control-Linux-Processes.png
[28]:http://www.tecmint.com/kill-processes-unresponsive-programs-in-ubuntu/
[29]:http://www.tecmint.com/wp-content/uploads/2017/03/list-all-signals.png
[30]:http://www.tecmint.com/wp-content/uploads/2017/03/top-command.png
[31]:http://www.tecmint.com/author/aaronkili/
[32]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[33]:http://www.tecmint.com/free-linux-shell-scripting-books/
