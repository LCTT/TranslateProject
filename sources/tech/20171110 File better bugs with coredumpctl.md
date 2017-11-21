# [File better bugs with coredumpctl][1]

![](https://fedoramagazine.org/wp-content/uploads/2017/11/coredump.png-945x400.jpg)

An unfortunate fact of life is that all software has bugs, and some bugs can make the system crash. When it does, it often leaves a data file called a  _core dump_  on disk. This file contains data about your system when it crashed, and may help determine why the crash occurred. Often developers request data in the form of a  _backtrace_ , showing the flow of instructions that led to the crash. The developer can use it to fix the bug and improve the system. Here’s how to easily generate a backtrace if you have a system crash.

### Getting started with coredumpctl

Most Fedora systems use the [Automatic Bug Reporting Tool (ABRT)][2] to automatically capture dumps and file bugs for crashes. However, if you have disabled this service or removed the package, this method may be helpful.

If you experience a system crash, first ensure that you’re running the latest updated software. Updates often contain fixes that have already been found to fix a bug that causes critical errors and crashes. Once you update, try to recreate the situation that led to the bug.

If the crash still happens, or if you’re already running the latest software, it’s time to use the helpful  _coredumpctl_  utility. This utility helps locate and process crashes. To see a list of all core dumps on your system, run this command:

```
coredumpctl list
```

Don’t be surprised if you see a longer list than expected. Sometimes system components crash silently behind the scenes, and recover on their own. An easy way to quickly find a dump from today is to use the  _–since_  option:

```
coredumpctl list --since=today
```

The  _PID_  column contains the process ID used to identify the dump. Note that number, since you’ll use it again along the way. Or, if you don’t want to remember it, assign it to a variable you can use in the rest of the commands below:

```
MYPID=<PID>
```

To see information about the core dump, use this command (either use the  _$MYPID_  variable, or substitute the PID number):

```
coredumpctl info $MYPID
```

### Install debuginfo packages

Debugging symbols translate between data in the core dump and the instructions found in original source code. This symbol data can be quite large. Therefore, symbols are shipped in  _debuginfo_  packages separately from the packages most users run on Fedora systems. To determine which debuginfo packages you must install, start by running this command:

```
coredumpctl gdb $MYPID
```

This may result in a large amount of information to the screen. The last line may tell you to use  _dnf_  to install more debuginfo packages. Run that command [with sudo][3] to continue:

```
sudo dnf debuginfo-install <packages...>
```

Then try the  _coredumpctl gdb $MYPID_  command again. **You may need to do this repeatedly,** as other symbols are unwound in the trace.

### Capturing the backtrace

Run the following commands to log information in the debugger:

```
set logging file mybacktrace.txt
set logging on
```

You may find it helpful to turn off the pagination. For long backtraces this saves time.

```
set pagination off
```

Now run the backtrace:

```
thread apply all bt full
```

Now you can type  _quit_  to quit the debugger. The  _mybacktrace.txt_  file includes backtrace information you can attach to a bug or issue. Or if you’re working with someone in real time, you can upload the text to a pastebin. Either way, you can now provide more assistance to the developer to fix the problem.

---------------------------------

作者简介：

Paul W. Frields

Paul W. Frields has been a Linux user and enthusiast since 1997, and joined the Fedora Project in 2003, shortly after launch. He was a founding member of the Fedora Project Board, and has worked on documentation, website publishing, advocacy, toolchain development, and maintaining software. He joined Red Hat as Fedora Project Leader from February 2008 to July 2010, and remains with Red Hat as an engineering manager. He currently lives with his wife and two children in Virginia.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/file-better-bugs-coredumpctl/

作者：[Paul W. Frields ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://fedoramagazine.org/file-better-bugs-coredumpctl/
[2]:https://github.com/abrt/abrt
[3]:https://fedoramagazine.org/howto-use-sudo/
