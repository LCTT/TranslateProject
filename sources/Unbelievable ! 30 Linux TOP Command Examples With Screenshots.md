Unbelievable ! 30 Linux TOP Command Examples With Screenshots
================================================================================
The top command in Linux displays the running processes on the system. One of the most important tools for a system administrator. It is used extensively for monitoring the load on a server. In this article, we explore the top command in detail. The top command is an interactive command. Many commands are available when top is running. We will explore these commands as well.

### 1. Top Command output: ###

First of all, let us understand what the output says. Top command displays a lot of information about the running system. But we need to under stand the meaning of different sections of this output:
Running by default, the top command displays output like this:

![Top default display](http://linoxide.com/wp-content/uploads/2013/11/01.top_default.png)

First few lines are horizontal showing summary about different system parameters, and following these are the processes and their attributes in columns.

#### 1.1 Uptime and Load Averages: ####

![Uptime display](http://linoxide.com/wp-content/uploads/2013/11/02.top_uptime.png)

At the top of top command is displayed the output similar to uptime command.

The fields display:

- current time
- the time your system is been up
- number of users logged in
- load average of 5, 10 and 15 minutes respectively.

This uptime display can be toggled with ‘l’ command.

#### 1.2 Tasks: ####

![Task summary](http://linoxide.com/wp-content/uploads/2013/11/03.top_tasks.png)

The second line shows summary of tasks or processes. The processes can be in different states. It shows total number of the processes. Out of these, the processes can be running, sleeping, stopped or in zombie (zombie is the state of a process state, These process summary can be toggled with ‘t’ command.

#### 1.3 CPU States: ####

![CPU status display](http://linoxide.com/wp-content/uploads/2013/11/04.top_cpu_states.png)

Next is shown the CPU state. Here, %age of CPU time in different modes is shown. The meaning of different CPU times are:

- us, user: CPU time in running (un-niced) user processes
- sy, system: CPU time in running kernel processes
- ni, niced: CPU time in running niced user processes
- wa, IO wait: CPU time waiting for IO completion
- hi: CPU time serving hardware interrupts
- si: CPU time serving software interrupts
- st: CPU time stolen for this vm by the hipervisor.

This can be toggled with ‘t’ command.

#### 1.4 Memory Usage: ####

![Memory usage](http://linoxide.com/wp-content/uploads/2013/11/05.top_mem_usage.png)

Next two lines show memory usage, somewhat like ‘free’ command. 1st of these lines is for physical memory and the second for virtual memory (swap space).

The physical memory is displayed as: total available memory, used memory, free memory, and memory used for buffers
Similarly, swap reflects: total, used, free and cached swap space.
The memory can be toggled with ‘m’ command.

#### 1.5 Fields/Columns: ####

![Top columns](http://linoxide.com/wp-content/uploads/2013/11/06.top_fields.png)

After these horizontal system properties and states, the processes are shown in columns. The different columns represent different properties discussed below.

By default, top shows these attributes associated with processes:

**PID**
The Process ID, to uniquely identify a processes.

**USER**
The effective user name of the owner of the processes.

**PR**
The scheduling priority of the process. Some values in this field are ‘rt’. It means that the process is running under real-time.

**NI**
The nice value of the process. Lower values mean higher priority.

**VIRT**
The amount of virtual memory used by the process.

**RES**
The resident memory size. Resident memory is the amount of non-swapped physical memory a task is using.

**SHR**
SHR is the shared memory used by the process.

**S**
This is the process status. It can have one of the following values:

- D – uninterruptible sleep
- R – running
- S – sleeping
- T – traced or stopped
- Z – zombie

**%CPU**
It is the percentage of CPU time the task has used since last update.

**%MEM**
Percentage of available physical memory used by the process.

**TIME+**
The total CPU time the task has used since it started, with precision upto hundredth of a second.

**COMMAND**
The command which was used to start the process.

There are many other outputs which are not displayed by default which can display information about page faults, effective group and group ID of the process, and many more.

### 2. Interactive Commands: ###

We discussed earlier that the top command is interactive commands. Some of the commands we encountered in the last section. Here we explore these commands further.

#### 2.1 ‘h’: Help ####

First of all, you can press ‘h’ or ‘?’ to display the help menu for interactive commands.

![Help options](http://linoxide.com/wp-content/uploads/2013/11/07.top_help.png)

#### 2.2 ‘<ENTER>’ or ‘<SPACE>’: Refresh Display ####

The top command by default refreshes after a certain interval (3 seconds). To refresh manually, user can press enter or space key.

#### 2.3 A: Toggle Alternate Display Mode ####

This command switches between full-screen Mode and alternate-display mode. In alternate display mode, 4 windows are available:

1. Def
2. Job
3. Mem
4. Usr

Each of the 4 field groups has a unique separately configurable summary area and its own configurable task area. Only one of these 4 windows will be the current window. The current window is displayed on the top left corner.

![Alternative display mode](http://linoxide.com/wp-content/uploads/2013/11/08.top_alternative_display.png)

You can switch between 4 windows with ‘a’ and ‘w’ keys. ‘a’ moves to next and ‘w’ to previous window. With ‘g’ command, you can enter a number to select the current window.

![Window selection in alternative display](http://linoxide.com/wp-content/uploads/2013/11/09.top_alternate_window_selection.png)

#### 2.4 B: Toggle Bold Display ####

Some important information is shown in bold characters. This command toggles use of bold.

![Bold off](http://linoxide.com/wp-content/uploads/2013/11/10.top_bold_display_off.png)

#### 2.5 ‘d’ or ‘s’: Set Display Time interval ####

When ‘d’ or ‘s’ is pressed, you will be prompted to enter a value ( in seconds ) which will be set as display interval. If you enter 1 here, top will refresh every second.

![Display time interval](http://linoxide.com/wp-content/uploads/2013/11/11.top_display_time_interval.png)

#### 2.6 ‘l’, ‘t’, ‘m’: Toggle Load, Task, Memory Info ####

These will toggle load average, task/cpu status and mem info respectively as discussed.

![Load average off](http://linoxide.com/wp-content/uploads/2013/11/12.top_load_average_display_off.png)

![CPU summary off](http://linoxide.com/wp-content/uploads/2013/11/13.top_cpu_display_off.png)

![Memory and swap usage off](http://linoxide.com/wp-content/uploads/2013/11/14.top_mem_display_off.png)

![All three displays off](http://linoxide.com/wp-content/uploads/2013/11/15.top_all_three_display_off.png)

#### 2.7 ‘f’: Field Management ####

This is used to chose what field you want to display on the output screen. The fields marked as * are selected.

![Managing columns](http://linoxide.com/wp-content/uploads/2013/11/16.top_field_management.png)

‘<’ and ‘>’
The ‘<’ command moves the sorted field to the left and ‘>’ to the right

#### 2.8 ‘R’: Reverse Sort ####

Toggle Reverse/Normal sort order

#### 2.9 ‘c’: Toggle Command ####

Toggle full path of command that started the process and program name.

![Full command path](http://linoxide.com/wp-content/uploads/2013/11/17.top_command_name_displayed.png)

#### 2.10 ‘i’: Idle Tasks ####

Toggle idle tasks.

![Idle task display off](http://linoxide.com/wp-content/uploads/2013/11/18.top_idle_tasks_off.png)

#### 2.11 ‘V’: Forest View ####

Toggle forest view mode.

![Forest view of tasks](http://linoxide.com/wp-content/uploads/2013/11/19.top_forest_view.png)

#### 2.12 ‘Z’: Change color map ####

Pressing the ‘Z’ key takes the user to a screen where the display color can be changed for top command. There are 8 task areas to chose from and 8 colors.

![Customizing colors](http://linoxide.com/wp-content/uploads/2013/11/20.top_color_selection.png)

The below screen shows full colored top view with all 4 screens on.

![Colored display](http://linoxide.com/wp-content/uploads/2013/11/21.top_colored.png)

#### 2.13 ‘z’: Toggle Color ####

Toggle color, i.e. turn on or off the colored display.

#### 2.14 ‘x’ or ‘y’ ####

Toggle highlights: ‘x’ sort field; ‘y’ running tasks. Depending upon your display settings, You might have to make the output colored in order to notice these highlights.

![X and Y highlighted](http://linoxide.com/wp-content/uploads/2013/11/22.top_x_y_displayed.png)

#### 2.15 ‘u’: Processes of a User ####

Show processes for a particular user. You are prompted to enter the username. Blank will show for all users.

![Processes of 'raghu' user](http://linoxide.com/wp-content/uploads/2013/11/23.top_raghu_processes.png)

#### 2.16 ‘n’ or ‘#’: Number of tasks ####

Set maximum number of tasks displayed.

![Setting number of tasks displayed](http://linoxide.com/wp-content/uploads/2013/11/24.top_10_processes.png)

#### 2.17 ‘k’: Kill tasks ####

One of the most important commands of top. Used to send signals to tasks (Usually kill tasks).

![Killing a task](http://linoxide.com/wp-content/uploads/2013/11/25.top_kill_task.png)

#### 2.18 ‘r’: Renice ####

Renice a task to change the scheduling priority.

### 3. Command line options: ###

Most of these command line options are similar to the commands discussed above. Top output can be manipulated interactively with commands. But you can start top with some parameters set to your convenience with these options.

#### 3.1 -b: Batch mode ####

The -b option starts top command in batch mode. It can be useful when you want to save the output in a file.

#### 3.2 -c: Command/Program-name toggle: ####

As discussed in the above commands, this option will toggle from the last remembered state of command/program name display.

#### 3.3 -d: Set delay interval ####

Set the delay interval for top (in seconds). For example:

    $ top -d 1 

will start the top command with 1 sec delay interval.

#### 3.4 -i: idle process toggle ####

This option sets the top command with last remembered ‘i’ state reversed.

#### 3.5 -n: Set number of iterations ####

With -n option, you can set the number of iterations after which top willl end.

    $ top -n 3 

will exit top automatically after 3 outputs.

#### 3.6 -p: monitor specific PIDs ####

You can specify what PIDs you want to monitor with -p option. PID value 0 will be treated as process ID of top command itself.

#### 3.7 -u or -U: username or UID ####

The process of a particular user can be viewed with these options. Username or UID can be specified to the option. The -p, -u and -U options are mutually exclusive. Only one of the options can be used at a time. You get error when you try to use any combination of these options:

    $ top -p 28453 -u raghu
    top: conflicting process selections (U/p/u) 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-top-command-examples-screenshots/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出