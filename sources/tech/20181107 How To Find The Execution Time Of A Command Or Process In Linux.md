translating by caixiangyue
How To Find The Execution Time Of A Command Or Process In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/11/time-command-720x340.png)

You probably know the start time of a command/process and [**how long a process is running**][1] in Unix-like systems. But, how do you when did it end and/or what is the total time taken by the command/process to complete? Well, It’s easy! On Unix-like systems, there is a utility named **‘GNU time’** that is specifically designed for this purpose. Using Time utility, we can easily measure the total execution time of a command or program in Linux operating systems. Good thing is ‘time’ command comes preinstalled in most Linux distributions, so you don’t have to bother with installation.

### Find The Execution Time Of A Command Or Process In Linux

To measure the execution time of a command/program, just run.

```
$ /usr/bin/time -p ls
```

Or,

```
$ time ls
```

Sample output:

```
dir1 dir2 file1 file2 mcelog

real 0m0.007s
user 0m0.001s
sys 0m0.004s

$ time ls -a
. .bash_logout dir1 file2 mcelog .sudo_as_admin_successful
.. .bashrc dir2 .gnupg .profile .wget-hsts
.bash_history .cache file1 .local .stack

real 0m0.008s
user 0m0.001s
sys 0m0.005s
```

The above commands displays the total execution time of **‘ls’** command. Replace “ls” with any command/process of your choice to find the total execution time.

Here,

  1. **real** -refers the total time taken by command/program,
  2. **user** – refers the time taken by the program in user mode,
  3. **sys** – refers the time taken by the program in kernel mode.



We can also limit the command to run only for a certain time as well. Refer the following guide for more details.

### time vs /usr/bin/time

As you may noticed, we used two commands **‘time’** and **‘/usr/bin/time’** in the above examples. So, you might wonder what is the difference between them.

First, let us see what actually ‘time’ is using ‘type’ command. For those who don’t know, the **Type** command is used to find out the information about a Linux command. For more details, refer [**this guide**][2].

```
$ type -a time
time is a shell keyword
time is /usr/bin/time
```

As you see in the above output, time is both,

  * A keyword built into the BASH shell
  * An executable file i.e **/usr/bin/time**



Since shell keywords take precedence over executable files, when you just run`time`command without full path, you run a built-in shell command. But, When you run `/usr/bin/time`, you run a real **GNU time** program. So, in order to access the real command, you may need to specify its explicit path. Clear, good?

The built-in ‘time’ shell keyword is available in most shells like BASH, ZSH, CSH, KSH, TCSH etc. The ‘time’ shell keyword has less options than the executables. The only option you can use in ‘time’ keyword is **-p**.

You know now how to find the total execution time of a given command/process using ‘time’ command. Want to know little bit more about ‘GNU time’ utility? Read on!

### A brief introduction about ‘GNU time’ program

The GNU time program runs a command/program with given arguments and summarizes the system resource usage as standard output after the command is completed. Unlike the ‘time’ keyword, the GNU time program not just displays the time used by the command/process, but also other resources like memory, I/O and IPC calls.

The typical syntax of the Time command is:

```
/usr/bin/time [options] command [arguments...]
```

The ‘options’ in the above syntax refers a set of flags that can be used with time command to perform a particular functionality. The list of available options are given below.

  * **-f, –format** – Use this option to specify the format of output as you wish.
  * **-p, –portability** – Use the portable output format.
  * **-o file, –output=FILE** – Writes the output to **FILE** instead of displaying as standard output.
  * **-a, –append** – Append the output to the FILE instead of overwriting it.
  * **-v, –verbose** – This option displays the detailed description of the output of the ‘time’ utility.
  * **–quiet** – This option prevents the time ‘time’ utility to report the status of the program.



When using ‘GNU time’ program without any options, you will see output something like below.

```
$ /usr/bin/time wc /etc/hosts
9 28 273 /etc/hosts
0.00user 0.00system 0:00.00elapsed 66%CPU (0avgtext+0avgdata 2024maxresident)k
0inputs+0outputs (0major+73minor)pagefaults 0swaps
```

If you run the same command with the shell built-in keyword ‘time’, the output would be bit different:

```
$ time wc /etc/hosts
9 28 273 /etc/hosts

real 0m0.006s
user 0m0.001s
sys 0m0.004s
```

Some times, you might want to write the system resource usage output to a file rather than displaying in the Terminal. To do so, use **-o** flag like below.

```
$ /usr/bin/time -o file.txt ls
dir1 dir2 file1 file2 file.txt mcelog
```

As you can see in the output, Time utility doesn’t display the output. Because, we write the output to a file named file.txt. Let us have a look at this file:

```
$ cat file.txt
0.00user 0.00system 0:00.00elapsed 66%CPU (0avgtext+0avgdata 2512maxresident)k
0inputs+0outputs (0major+106minor)pagefaults 0swaps
```

When you use **-o** flag, if there is no file named ‘file.txt’, it will create and write the output in it. If the file.txt is already present, it will overwrite its content.

You can also append output to the file instead of overwriting it using **-a** flag.

```
$ /usr/bin/time -a file.txt ls
```

The **-f** flag allows the users to control the format of the output as per his/her liking. Say for example, the following command displays output of ‘ls’ command and shows just the user, system, and total time.

```
$ /usr/bin/time -f "\t%E real,\t%U user,\t%S sys" ls
dir1 dir2 file1 file2 mcelog
0:00.00 real, 0.00 user, 0.00 sys
```

Please be mindful that the built-in shell command ‘time’ doesn’t support all features of GNU time program.

For more details about GNU time utility, refer the man pages.

```
$ man time
```

To know more about Bash built-in ‘Time’ keyword, run:

```
$ help time
```

And, that’s all for now. Hope this useful.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-the-execution-time-of-a-command-or-process-in-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/find-long-process-running-linux/
[2]: https://www.ostechnix.com/the-type-command-tutorial-with-examples-for-beginners/
