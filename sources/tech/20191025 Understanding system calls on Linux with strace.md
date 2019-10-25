[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding system calls on Linux with strace)
[#]: via: (https://opensource.com/article/19/10/strace)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

Understanding system calls on Linux with strace
======
Trace the thin layer between user processes and the Linux kernel with
strace.
![Hand putting a Linux file folder into a drawer][1]

A system call is a programmatic way a program requests a service from the kernel, and **strace** is a powerful tool that allows you to trace the thin layer between user processes and the Linux kernel.

To understand how an operating system works, you first need to understand how system calls work. One of the main functions of an operating system is to provide abstractions to user programs.

An operating system can roughly be divided into two modes:

  * **Kernel mode:** A privileged and powerful mode used by the operating system kernel
  * **User mode:** Where most user applications run



Users mostly work with command-line utilities and graphical user interfaces (GUI) to do day-to-day tasks. System calls work silently in the background, interfacing with the kernel to get work done.

System calls are very similar to function calls, which means they accept and work on arguments and return values. The only difference is that system calls enter a kernel, while function calls do not. Switching from user space to kernel space is done using a special [trap][2] mechanism.

Most of this is hidden away from the user by using system libraries (aka **glibc** on Linux systems). Even though system calls are generic in nature, the mechanics of issuing a system call are very much machine-dependent.

This article explores some practical examples by using some general commands and analyzing the system calls made by each command using **strace**. These examples use Red Hat Enterprise Linux, but the commands should work the same on other Linux distros:


```
[root@sandbox ~]# cat /etc/redhat-release
Red Hat Enterprise Linux Server release 7.7 (Maipo)
[root@sandbox ~]#
[root@sandbox ~]# uname -r
3.10.0-1062.el7.x86_64
[root@sandbox ~]#
```

First, ensure that the required tools are installed on your system. You can verify whether **strace** is installed using the RPM command below; if it is, you can check the **strace** utility version number using the **-V** option:


```
[root@sandbox ~]# rpm -qa | grep -i strace
strace-4.12-9.el7.x86_64
[root@sandbox ~]#
[root@sandbox ~]# strace -V
strace -- version 4.12
[root@sandbox ~]#
```

If that doesn't work, install **strace** by running:


```
`yum install strace`
```

For the purpose of this example, create a test directory within **/tmp** and create two files using the **touch** command using:


```
[root@sandbox ~]# cd /tmp/
[root@sandbox tmp]#
[root@sandbox tmp]# mkdir testdir
[root@sandbox tmp]#
[root@sandbox tmp]# touch testdir/file1
[root@sandbox tmp]# touch testdir/file2
[root@sandbox tmp]#
```

(I used the **/tmp** directory because everybody has access to it, but you can choose another directory if you prefer.)

Verify that the files were created using the **ls** command on the **testdir** directory:


```
[root@sandbox tmp]# ls testdir/
file1  file2
[root@sandbox tmp]#
```

You probably use the **ls** command every day without realizing system calls are at work underneath it. There is abstraction at play here; here's how this command works:


```
`Command-line utility -> Invokes functions from system libraries (glibc) -> Invokes system calls`
```

The **ls** command internally calls functions from system libraries (aka **glibc**) on Linux. These libraries invoke the system calls that do most of the work.

If you want to know which functions were called from the **glibc** library, use the **ltrace** command followed by the regular **ls testdir/** command:


```
`ltrace ls testdir/`
```

If **ltrace** is not installed, install it by entering:


```
`yum install ltrace`
```

A bunch of output will be dumped to the screen; don't worry about it—just follow along. Some of the important library functions from the output of the **ltrace** command that are relevant to this example include:


```
opendir("testdir/")                                  = { 3 }
readdir({ 3 })                                       = { 101879119, "." }
readdir({ 3 })                                       = { 134, ".." }
readdir({ 3 })                                       = { 101879120, "file1" }
strlen("file1")                                      = 5
memcpy(0x1665be0, "file1\0", 6)                      = 0x1665be0
readdir({ 3 })                                       = { 101879122, "file2" }
strlen("file2")                                      = 5
memcpy(0x166dcb0, "file2\0", 6)                      = 0x166dcb0
readdir({ 3 })                                       = nil
closedir({ 3 })                      
```

By looking at the output above, you probably can understand what is happening. A directory called **testdir** is being opened by the **opendir** library function, followed by calls to the **readdir** function, which is reading the contents of the directory. At the end, there is a call to the **closedir** function, which closes the directory that was opened earlier. Ignore the other **strlen** and **memcpy** functions for now.

You can see which library functions are being called, but this article will focus on system calls that are invoked by the system library functions.

Similar to the above, to understand what system calls are invoked, just put **strace** before the **ls testdir** command, as shown below. Once again, a bunch of gibberish will be dumped to your screen, which you can follow along with here:


```
[root@sandbox tmp]# strace ls testdir/
execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
brk(NULL)                               = 0x1f12000
&lt;&lt;&lt; truncated strace output &gt;&gt;&gt;
write(1, "file1  file2\n", 13file1  file2
)          = 13
close(1)                                = 0
munmap(0x7fd002c8d000, 4096)            = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
[root@sandbox tmp]#
```

The output on the screen after running the **strace** command was simply system calls made to run the **ls** command. Each system call serves a specific purpose for the operating system, and they can be broadly categorized into the following sections:

  * Process management system calls
  * File management system calls
  * Directory and filesystem management system calls
  * Other system calls



An easier way to analyze the information dumped onto your screen is to log the output to a file using **strace**'s handy **-o** flag. Add a suitable file name after the **-o** flag and run the command again:


```
[root@sandbox tmp]# strace -o trace.log ls testdir/
file1  file2
[root@sandbox tmp]#
```

This time, no output dumped to the screen—the **ls** command worked as expected by showing the file names and logging all the output to the file **trace.log**. The file has almost 100 lines of content just for a simple **ls** command:


```
[root@sandbox tmp]# ls -l trace.log
-rw-r--r--. 1 root root 7809 Oct 12 13:52 trace.log
[root@sandbox tmp]#
[root@sandbox tmp]# wc -l trace.log
114 trace.log
[root@sandbox tmp]#
```

Take a look at the first line in the example's trace.log:


```
`execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0`
```

  * The first word of the line, **execve**, is the name of a system call being executed.
  * The text within the parentheses is the arguments provided to the system call.
  * The number after the **=** sign (which is **0** in this case) is a value returned by the **execve** system call.



The output doesn't seem too intimidating now, does it? And you can apply the same logic to understand other lines.

Now, narrow your focus to the single command that you invoked, i.e., **ls testdir**. You know the directory name used by the command **ls**, so why not **grep** for **testdir** within your **trace.log** file and see what you get? Look at each line of the results in detail:


```
[root@sandbox tmp]# grep testdir trace.log
execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
stat("testdir/", {st_mode=S_IFDIR|0755, st_size=32, ...}) = 0
openat(AT_FDCWD, "testdir/", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
[root@sandbox tmp]#
```

Thinking back to the analysis of **execve** above, can you tell what this system call does?


```
`execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0`
```

You don't need to memorize all the system calls or what they do, because you can refer to documentation when you need to. Man pages to the rescue! Ensure the following package is installed before running the **man** command:


```
[root@sandbox tmp]# rpm -qa | grep -i man-pages
man-pages-3.53-5.el7.noarch
[root@sandbox tmp]#
```

Remember that you need to add a **2** between the **man** command and the system call name. If you read **man**'s man page using **man man**, you can see that section 2 is reserved for system calls. Similarly, if you need information on library functions, you need to add a **3** between **man** and the library function name.

The following are the manual's section numbers and the types of pages they contain:


```
1\. Executable programs or shell commands
2\. System calls (functions provided by the kernel)
3\. Library calls (functions within program libraries)
4\. Special files (usually found in /dev)
```

Run the following **man** command with the system call name to see the documentation for that system call:


```
`man 2 execve`
```

As per the **execve** man page, this executes a program that is passed in the arguments (in this case, that is **ls**). There are additional arguments that can be provided to **ls**, such as **testdir** in this example. Therefore, this system call just runs **ls** with **testdir** as the argument:


```
'execve - execute program'

'DESCRIPTION
       execve()  executes  the  program  pointed to by filename'
```

The next system call, named **stat**, uses the **testdir** argument:


```
`stat("testdir/", {st_mode=S_IFDIR|0755, st_size=32, ...}) = 0`
```

Use **man 2 stat** to access the documentation. **stat** is the system call that gets a file's status—remember that everything in Linux is a file, including a directory.

Next, the **openat** system call opens **testdir.** Keep an eye on the **3** that is returned. This is a file description, which will be used by later system calls:


```
`openat(AT_FDCWD, "testdir/", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3`
```

So far, so good. Now, open the **trace.log** file and go to the line following the **openat** system call. You will see the **getdents** system call being invoked, which does most of what is required to execute the **ls testdir** command. Now, **grep getdents** from the **trace.log** file:


```
[root@sandbox tmp]# grep getdents trace.log
getdents(3, /* 4 entries */, 32768)     = 112
getdents(3, /* 0 entries */, 32768)     = 0
[root@sandbox tmp]#
```

The **getdents** man page describes it as **get directory entries**, which is what you want to do. Notice that the argument for **getdents** is **3**, which is the file descriptor from the **openat** system call above.

Now that you have the directory listing, you need a way to display it in your terminal. So, **grep** for another system call, **write**, which is used to write to the terminal, in the logs:


```
[root@sandbox tmp]# grep write trace.log
write(1, "file1  file2\n", 13)          = 13
[root@sandbox tmp]#
```

In these arguments, you can see the file names that will be displayed: **file1** and **file2**. Regarding the first argument (**1**), remember in Linux that, when any process is run, three file descriptors are opened for it by default. Following are the default file descriptors:

  * 0 - Standard input
  * 1 - Standard out
  * 2 - Standard error



So, the **write** system call is displaying **file1** and **file2** on the standard display, which is the terminal, identified by **1**.

Now you know which system calls did most of the work for the **ls testdir/** command. But what about the other 100+ system calls in the **trace.log** file? The operating system has to do a lot of housekeeping to run a process, so a lot of what you see in the log file is process initialization and cleanup. Read the entire **trace.log** file and try to understand what is happening to make the **ls** command work.

Now that you know how to analyze system calls for a given command, you can use this knowledge for other commands to understand what system calls are being executed. **strace** provides a lot of useful command-line flags to make it easier for you, and some of them are described below.

By default, **strace** does not include all system call information. However, it has a handy **-v verbose** option that can provide additional information on each system call:


```
`strace -v ls testdir`
```

It is good practice to always use the **-f** option when running the **strace** command. It allows **strace** to trace any child processes created by the process currently being traced:


```
`strace -f ls testdir`
```

Say you just want the names of system calls, the number of times they ran, and the percentage of time spent in each system call. You can use the **-c** flag to get those statistics:


```
`strace -c ls testdir/`
```

Suppose you want to concentrate on a specific system call, such as focusing on **open** system calls and ignoring the rest. You can use the **-e** flag followed by the system call name:


```
[root@sandbox tmp]# strace -e open ls testdir
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libcap.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libacl.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpcre.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libattr.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
file1  file2
+++ exited with 0 +++
[root@sandbox tmp]#
```

What if you want to concentrate on more than one system call? No worries, you can use the same **-e** command-line flag with a comma between the two system calls. For example, to see the **write** and **getdents** systems calls:


```
[root@sandbox tmp]# strace -e write,getdents ls testdir
getdents(3, /* 4 entries */, 32768)     = 112
getdents(3, /* 0 entries */, 32768)     = 0
write(1, "file1  file2\n", 13file1  file2
)          = 13
+++ exited with 0 +++
[root@sandbox tmp]#
```

The examples so far have traced explicitly run commands. But what about commands that have already been run and are in execution? What, for example, if you want to trace daemons that are just long-running processes? For this, **strace** provides a special **-p** flag to which you can provide a process ID.

Instead of running a **strace** on a daemon, take the example of a **cat** command, which usually displays the contents of a file if you give a file name as an argument. If no argument is given, the **cat** command simply waits at a terminal for the user to enter text. Once text is entered, it repeats the given text until a user presses Ctrl+C to exit.

Run the **cat** command from one terminal; it will show you a prompt and simply wait there (remember **cat** is still running and has not exited):


```
`[root@sandbox tmp]# cat`
```

From another terminal, find the process identifier (PID) using the **ps** command:


```
[root@sandbox ~]# ps -ef | grep cat
root      22443  20164  0 14:19 pts/0    00:00:00 cat
root      22482  20300  0 14:20 pts/1    00:00:00 grep --color=auto cat
[root@sandbox ~]#
```

Now, run **strace** on the running process with the **-p** flag and the PID (which you found above using **ps**). After running **strace**, the output states what the process was attached to along with the PID number. Now, **strace** is tracing the system calls made by the **cat** command. The first system call you see is **read**, which is waiting for input from 0, or standard input, which is the terminal where the **cat** command ran:


```
[root@sandbox ~]# strace -p 22443
strace: Process 22443 attached
read(0,
```

Now, move back to the terminal where you left the **cat** command running and enter some text. I entered **x0x0** for demo purposes. Notice how **cat** simply repeated what I entered; hence, **x0x0** appears twice. I input the first one, and the second one was the output repeated by the **cat** command:


```
[root@sandbox tmp]# cat
x0x0
x0x0
```

Move back to the terminal where **strace** was attached to the **cat** process. You now see two additional system calls: the earlier **read** system call, which now reads **x0x0** in the terminal, and another for **write**, which wrote **x0x0** back to the terminal, and again a new **read**, which is waiting to read from the terminal. Note that Standard input (**0**) and Standard out (**1**) are both in the same terminal:


```
[root@sandbox ~]# strace -p 22443
strace: Process 22443 attached
read(0, "x0x0\n", 65536)                = 5
write(1, "x0x0\n", 5)                   = 5
read(0,
```

Imagine how helpful this is when running **strace** against daemons to see everything it does in the background. Kill the **cat** command by pressing Ctrl+C; this also kills your **strace** session since the process is no longer running.

If you want to see a timestamp against all your system calls, simply use the **-t** option with **strace**:


```
[root@sandbox ~]#strace -t ls testdir/

14:24:47 execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
14:24:47 brk(NULL)                      = 0x1f07000
14:24:47 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2530bc8000
14:24:47 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
14:24:47 open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
```

What if you want to know the time spent between system calls? **strace** has a handy **-r** command that shows the time spent executing each system call. Pretty useful, isn't it?


```
[root@sandbox ~]#strace -r ls testdir/

0.000000 execve("/usr/bin/ls", ["ls", "testdir/"], [/* 40 vars */]) = 0
0.000368 brk(NULL)                 = 0x1966000
0.000073 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fb6b1155000
0.000047 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
0.000119 open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
```

### Conclusion

The **strace** utility is very handy for understanding system calls on Linux. To learn about its other command-line flags, please refer to the man pages and online documentation.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/strace

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://en.wikipedia.org/wiki/Trap_(computing)
