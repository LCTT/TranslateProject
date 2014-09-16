guodongxiaren 翻译中
8 Options to Trace/Debug Programs using Linux strace Command
================================================================================
The strace is the tool that helps in debugging issues by tracing system calls executed by a program. It is handy when you want to see how the program interacts with the operating system, like what system calls are executed in what order.

This simple yet very powerful tool is available for almost all the Linux based operating systems and can be used to debug a large number of programs.

### 1. Command Usage ###

Let’s see how we can use strace command to trace the execution of a program.

In the simplest form, any command can follow strace. It will list a whole lot of system calls. Not all of it would make sence at first, but if you’re really looking for something particular, then you should be able to figure something out of this output.
Lets see the system calls trace for simple ls command.

    raghu@raghu-Linoxide ~ $ strace ls

![Stracing ls command](http://linoxide.com/wp-content/uploads/2014/08/01.strace_ls.png)

This output shows the first few lines for strace command. The rest of the output is truncated.

![Strace write system call (ls)](http://linoxide.com/wp-content/uploads/2014/08/02.strace_ls_write.png)

The above part of the output shows the write system call where it outputs to STDOUT the current directory’s listing. Following image shows the listing of the directoy by ls command (without strace).

    raghu@raghu-Linoxide ~ $ ls

![ls command output](http://linoxide.com/wp-content/uploads/2014/08/03.ls_.png)

#### 1.1 Find configuration file read by program ####

One use of strace (Except debugging some problem) is that you can find out which configuration files are read by a program. For example,

    raghu@raghu-Linoxide ~ $ strace php 2>&1 | grep php.ini

![Strace config file read by program](http://linoxide.com/wp-content/uploads/2014/08/04.strace_php_configuration.png)

#### 1.2 Trace specific system call ####

The -e option to strace command can be used to display certain system calls only (for example, open, write etc.)

Lets trace only ‘open’ system call for cat command.

    raghu@raghu-Linoxide ~ $ strace -e open cat dead.letter

![Stracing specific system call (open here)](http://linoxide.com/wp-content/uploads/2014/08/05.strace_open_systemcall.png)

#### 1.3 Stracing a process ####

The strace command can not only be used on the commands, but also on the running processes with -p option.

    raghu@raghu-Linoxide ~ $ sudo strace -p 1846

![Strace a process](http://linoxide.com/wp-content/uploads/2014/08/06.strace_process.png)

#### 1.4 Statistical summary of strace ####

The summary of the system calls, time of execution, errors etc. can be displayed in a neat manner with -c option:

    raghu@raghu-Linoxide ~ $ strace -c ls

![Strace summary display](http://linoxide.com/wp-content/uploads/2014/08/07.strace_summary.png)

#### 1.5 Saving output ####

The output of strace command can be saved into a file with -o option.

    raghu@raghu-Linoxide ~ $ sudo strace -o process_strace -p 3229

![Strace a process](http://linoxide.com/wp-content/uploads/2014/08/08.strace_output_file.png)

The above command is run with sudo as it will display error in case the user ID does not match with the process owner.

### 1.6 Displaying timestamp ###

The timestamp can be displayed before each output line with -t option.

    raghu@raghu-Linoxide ~ $ strace -t ls

![Timestamp before each output line](http://linoxide.com/wp-content/uploads/2014/08/09.strace_timestamp.png)

#### 1.7 The Finer timestamp ####

The -tt option displays timestamp followed by microsecond.

    raghu@raghu-Linoxide ~ $ strace -tt ls

![Time - Microseconds](http://linoxide.com/wp-content/uploads/2014/08/010.strace_finer_timestamp.png)

The -ttt displays microseconds like above, but instead of printing surrent time, it displays the number of seconds since the epoch.

    raghu@raghu-Linoxide ~ $ strace -ttt ls

![Seconds since epoch](http://linoxide.com/wp-content/uploads/2014/08/011.strace_epoch_seconds.png)

#### 1.8 Relative Time ####

The -r option displays the relative timestamp between the system calls.

    raghu@raghu-Linoxide ~ $ strace -r ls

![Relative Timestamp](http://linoxide.com/wp-content/uploads/2014/08/012.strace_relative-time.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-strace-command-examples/

作者：[Raghu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/raghu/
