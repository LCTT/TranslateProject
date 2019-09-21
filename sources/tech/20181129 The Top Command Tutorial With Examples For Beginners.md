[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (The Top Command Tutorial With Examples For Beginners)
[#]: via: (https://www.ostechnix.com/the-top-command-tutorial-with-examples-for-beginners/)
[#]: author: ([SK](https://www.ostechnix.com/author/sk/))
[#]: url: ( )

The Top Command Tutorial With Examples For Beginners
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/top-command-720x340.png)

As a Linux administrator, you may need to need to know some basic details of your Linux system, such as the currently running processes, average system load, cpu and memory usage etc., at some point. Thankfully, we have a command line utility called **“top”** to get such details. The top command is a well-known and most widely used utility to display dynamic real-time information about running processes in Unix-like operating systems. In this brief tutorial, we are going to see some common use cases of top command.

### Top Command Examples

**Monitor all processes**

To start monitoring the running processes, simply run the top command without any options:

```
$ top
```

Sample output:

![](https://www.ostechnix.com/wp-content/uploads/2018/11/top-command-1.png)

As you see in the above screenshot, top command displays the list of processes in multiple columns. Each column displays details such as pid, user, cpu usage, memory usage. Apart from the list of processes, you will also see the brief stats about average system load, number of tasks, cpu usage, memory usage and swap usage on the top.

Here is the explanation of the parameters mentioned above.

  * **PID** – Process id of the task.
  * **USER** – Username of the the task’s owner.
  * **PR** – Priority of the task.
  * **NI** – Nice value of the task. If the nice value is negative, the process gets higher priority. If the nice value is positive, the priority is low. Refer [**this guide**][1] to know more about nice.
  * **VIRT** – Total amount of virtual memory used by the task.
  * **RES** – Resident Memory Size, the non-swapped physical memory a task is currently using.
  * **SHR** – Shared Memory Size. The amount of shared memory used by a task.
  * **S** – The status of the process (S=sleep R=running Z=zombie).
  * **%CPU** – CPU usage. The task’s share of the elapsed CPU time since the last screen update, expressed as a percentage of total CPU time.
  * **%MEM** – Memory Usage. A task’s currently resident share of available physical memory.
  * **TIME+** – Total CPU time used by the task since it has started, precise to the hundredths of a second.
  * **COMMAND** – Name of the running program.



**Display path of processes**

If you want to see the absolute path of the running processes, just press **‘c’**. Now you will see the actual path of the programs under the COMMAND column in the below screenshot.

![][3]

**Monitor processes owned by a specific user**

If you run top command without any options, it will list all running processes owned by all users. How about displaying processes owned by a specific user? It is easy! To show the processes owned by a given user, for example **sk** , simply run:

```
$ top -u sk
```

![](https://www.ostechnix.com/wp-content/uploads/2018/11/top-command-3.png)

**Do not show idle/zombie processes**

Instead of viewing all processes, you can simply ignore the idle or zombie processes. The following command will not show any idle or zombie processes:

```
$ top -i
```

**Monitor processes with PID**

If you know the PID of any processes, for example 21180, you can monitor that process using **-p** flag.

```
$ top -p 21180
```

You can specify multiple PIDs with comma-separated values.

**Monitor processes with process name**

I don’t know PID, but know only the process name. How to monitor it? Simple!

```
$ top -p $(pgrep -d ',' firefox)
```

Here, **firefox** is the process name and **‘pgrep -d’** picks the respective PID from the process name.

**Display processes by CPU usage**

Sometimes, you might want to display processes sorted by CPU usage. If so, use the following command:

```
$ top -o %CPU
```

![][4]

The processes with higher CPU usage will be displayed on the top. Alternatively, you sort the processes by CPU usage by pressing **SHIFT+p**.

**Display processes by Memory usage**

Similarly, to order processes by memory usage, the command would be:

```
$ top -o %MEM
```

**Renice processes**

You can change the priority of a process at any time using the option **‘r’**. Run the top command and press **r** and type the PID of a process to change its priority.

![][5]

Here, **‘r’** refers renice.

**Set update interval**

Top program has an option to specify the delay between screen updates. If want to change the delay-time, say 5 seconds, run:

```
$ top -d 5
```

The default value is **3.0** seconds.

If you already started the top command, just press **‘d’** and type delay-time and hit ENTER key.

![][6]

**Set number of iterations (repetition)**

By default, top command will keep running until you press **q** to exit. However, you can set the number of iterations after which top will end. For instance, to exit top command automatically after 5 iterations, run:

```
$ top -n 5
```

**Kill running processes**

To kill a running process, simply press **‘k’** and type its PID and hit ENTER key.

![][7]

Top command supports few other options as well. For example, press **‘z’** to switch between mono and color output. It will help you to easily highlight running processes.

![][8]

Press **‘h’** to view all available keyboard shortcuts and help section.

To quit top, just press **q**.

At this stage, you will have a basic understanding of top command. For more details, refer man pages.

```
$ man top
```

As you can see, using Top command to monitor the running processes isn’t that hard. Top command is easy to learn and use!

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-top-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/change-priority-process-linux/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2018/11/top-command-2.png
[4]: http://www.ostechnix.com/wp-content/uploads/2018/11/top-command-4.png
[5]: http://www.ostechnix.com/wp-content/uploads/2018/11/top-command-8.png
[6]: http://www.ostechnix.com/wp-content/uploads/2018/11/top-command-7.png
[7]: http://www.ostechnix.com/wp-content/uploads/2018/11/top-command-5.png
[8]: http://www.ostechnix.com/wp-content/uploads/2018/11/top-command-6.png
