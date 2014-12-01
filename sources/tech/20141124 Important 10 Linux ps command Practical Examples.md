johnhoow translating...
Important 10 Linux ps command Practical Examples
================================================================================
As an Operating System which inspired from Unix, Linux has a built-in tool to capture current processes on the system. This tool is available in command line interface.

### What is PS Command ###

From its manual page, PS gives a snapshots of the current process. It will “capture” the system condition at a single time. If you want to have a repetitive updates in a real time, we can use top command.

PS support three (3) type of usage syntax style.

1. UNIX style, which may be grouped and **must** be preceded by a dash
2. BSD style, which may be grouped and **must not be** used with a dash
3. GNU long options, which are preceded by two dash

We can mix those style, but conflicts can appear. In this article, will use UNIX style. Here’s are some examples of PS command in a daily use.

### 1. Run ps without any options ###

This is a very basic **ps** usage. Just type ps on your console to see its result.

![ps with no options](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_no_options.png)

By default, it will show us 4 columns of information.

- PID is a Process ID of the running command (CMD)
- TTY is a place where the running command runs
- TIME tell about how much time is used by CPU while running the command
- CMD is a command that run as current process

This information is displayed in unsorted result.

### 2. Show all current processes ###

To do this, we can use **-a** options. As we can guess, **-a is stand for “all”**. While x will show all process even the current process is not associated with any TTY (terminal)

    $ ps -ax

This result might be long result. To make it more easier to read, combine it with less command.

    $ ps -ax | less

![ps all information](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_ax.png)

### 3. Filter processes by its user ###

For some situation we may want to filter processes by user. To do this, we can use **-u** option. Let say we want to see what processes which run by user pungki. So the command will be like below

    $ ps -u pungki

![filter by user](http://blog.linoxide.com/wp-content/uploads/2014/10/ps__u.png)

### 4. Filter processes by CPU or memory usage ###

Another thing that you might want to see is filter the result by CPU or memory usage. With this, you can grab information about which processes that consume your resource. To do this, we can use **aux options**. Here’s an example of it :

    $ ps -aux | less

![show all information](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_aux.png)

Since the result can be in a long list, we can **pipe** less command into ps command.
By default, the result will be in unsorted form. If we want to sort by particular column, we can add **--sort** option into ps command.

Sort by the highest **CPU utilization** in ascending order

    $ ps -aux --sort -pcpu | less

![sort by cpu usage](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_aux_sort_cpu.png)

Sort by the highest **Memory utilization** in ascending order

    $ ps -aux --sort -pmem | less

![sort by memory usage](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_aux_sort_mem.png)

Or we can combine itu a single command and display only the top ten of the result :

    $ ps -aux --sort -pcpu,+pmem | head -n 10

### 5. Filter processes by its name or process ID ###

To to this, we can use **-C option** followed by the keyword. Let say, we want to show processes named getty. We can type :

    $ ps -C getty

![filter by its name or process ID](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_C.png)

If we want to show more detail about the result, we can add -f option to show it on full format listing. The above command will looks like below :

    $ ps -f -C getty

![filter by its name or process ID](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_C_f.png)

### 6. Filter processes by thread of process ###

If we need to know the thread of a particular process, we can use **-L option** followed by its Process ID (PID). Here’s an example of **-L option** in action :

    $ ps -L 1213

![show processes in threaded view](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_L.png)

As we can see, the PID remain the same value, but the LWP which shows numbers of thread show different values.

### 7. Show processes in hierarchy ###

Sometime we want to see the processes in hierarchical form. To do this, we can use **-axjf** options.

    $ps -axjf

![show in hierarchy](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_axjf.png)

Or, another command which we can use is pstree.

    $ pstree

![show information in hierarchy](http://blog.linoxide.com/wp-content/uploads/2014/10/pstree.png)

### 8. Show security information ###

If we want to see who is currently logged on into your server, we can see it using the ps command. There are some options that we can use to fulfill our needs. Here’s some examples :

    $ ps -eo pid,user,args

**Option -e** will show you all processes while **-o option** will control the output. **Pid**, **User and Args** will show you the **Process ID**, **the User who run the application** and **the running application**.

![show security information](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_security_1.png)

The keyword / user-defined format that can be used with **-e option** are **args, cmd, comm, command, fname, ucmd, ucomm, lstart, bsdstart and start**.

### 9. Show every process running as root (real & effecitve ID) in user format ###

System admin may want to see what processes are being run by root and other information related to it. Using ps command, we can do by this simple command :

    $ ps -U root -u root u

The **-U parameter** will select by **real user ID (RUID)**. It selects the processes whose real user name or ID is in the userlist list. The real User ID identifies the user who created the process.

While the **-u paramater** will select by effective user ID (EUID)

The last **u** paramater, will display the output in user-oriented format which contains **User, PID, %CPU, %MEM, VSZ, RSS, TTY, STAT, START, TIME and COMMAND** columns.

Here’s the output of the above command.

![show real and effective User ID](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_root_real_effective_ID.png)

### 10. Use PS in a realtime process viewer ###

ps will display a report of what happens in your system. The result will be a static report.
Let say, we want to filter processes by CPU and Memory usage as on the point 4 above. And we want the report is updated every 1 second. We can do it by **combining ps command with watch command** on Linux.

Here’s the command :

    $ watch -n 1 ‘ps -aux --sort -pmem, -pcpu’

![combine ps with watch](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_watch_1.png)

If you feel the report is too long, **we can limit it** by - let say - the top 20 processes. We can add **head** command to do it.

    $ watch -n 1 ‘ps -aux --sort -pmem, -pcpu | head 20’

![combine ps with watch](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_watch_2.png)

This live reporter **is not** like top or htop of course. **But the advantage of using ps** to make live report is that you can custom the field. You can choose which field you want to see.

For example, **if you need only the pungki user shown**, then you can change the command to become like this :

    $ watch -n 1 ‘ps -aux -U pungki u --sort -pmem, -pcpu | head 20’

![combine ps with watch](http://blog.linoxide.com/wp-content/uploads/2014/10/ps_watch_3.png)

### Conclusion ###

You may use **ps** on your daily usage to monitor about what happens your Linux system. But actually, you can generate various types of report using **ps** command with the use of appropriate paramaters.

**Another ps advantage** is that **ps** are installed by default in any kind of Linux. So you can just start to use it.

Don't forget to see **ps documentation** by typing **man ps** on you Linux console to explore more options.

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/linux-ps-command-examples/

作者：[Pungki Arianto][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/pungki/
