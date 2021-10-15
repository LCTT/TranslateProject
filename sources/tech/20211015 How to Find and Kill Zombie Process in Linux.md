[#]: subject: "How to Find and Kill Zombie Process in Linux"
[#]: via: "https://itsfoss.com/kill-zombie-process-linux/"
[#]: author: "Marco Carmona https://itsfoss.com/author/marco/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Find and Kill Zombie Process in Linux
======

_**Brief: This is a quick tip on finding zombie processes in Linux and then killing them. You also learn a thing or two about processes and zombie processes.**_

Before you learn about Zombie process, let me recall what is a process in Linux.

In a few words, a [process][1] is a running instance of a program in performance. It can be foreground (interactive process) or background (not interactive or automatic process). It can be a parent (creator of other processes during run-time) or child (process created by others) process.

In Linux, except for the first init (or systemd) process with PID 0, every other process has a parent process. Processes also have their own child processes.

Don’t believe me? Use the `pstree` command in terminal to look at the process tree to see the ‘family tree’ of your system’s processes.

### What is a Zombie process in Linux?

When a child process dies, the parent process is informed so that it can do some clean up like freeing up memory etc. However, child process goes into zombie state if the parent process is not aware of its death. For the parent, the child still exists but the child process is actually dead. This is how zombie processes (also known as defunct processes) are created and stay in the system.

Here’s an excellent funny take on the zombie process by Turnoff.us:

![Image credit: Turnoff.us][2]

### Do you really need to worry about Zombie processes?

Here is important to say that zombie processes are not as dangerous as its name can sound.

The problem may arise if your system has limited RAM or if there are too many zombie processes eating up RAM. Also, most Linux processes can have maximum PID set to 32768. If there are no available IDs for other productive tasks, your system may crash.

This rarely happens, but it’s a possibility, specially if a poorly coded program starts inducing numerous zombie processes.

In such case, it would be a good idea to find and kill zombie process.

### How to find zombie processes?

A process in Linux can have one of the following states:

  * D = uninterruptible sleep
  * I = idle
  * R = running
  * S = sleeping
  * T = stopped by job control signal
  * t = stopped by debugger during trace
  * Z = zombie



But where can you see the processes and their respective status? One easy way is to use the terminal and the [top command][3].

![Top command show processes and their status][4]

As you can see in the screenshot above, there are 250 total tasks (or processes), 1 is running, 248 processes are sleeping and 1 is in zombie state.

Now, the question arises, how to kill the zombie process?

### How to find and kill a zombie process? Can a zombie process be killed?

![][5]

A zombie process is already dead. How do you kill an already dead process?

In the zombie movies, you shoot the zombies in the head or burn it. That’s not an option here. You can burn your system for killing the zombie process but that’s not a feasible solution ;)

Some people suggests sending SIGCHLD signal to the parent process. But it is more likely to be ignored. The other option to kill the zombie process is to kill its parent process. That sounds brutal but that’s the only sure shot way of killing zombie processes.

So, first, let’s list the zombie processes to know their ID. It can be achieved by [using the ps command][6] like this in the terminal.

```
ps ux | awk '{if($8=="Z+") print}'
```

The 8th column in the output of the ps ux command displays the state of a process. You are asking to print all the matching lines where the state of a process is Z+ (indicating zombie state).

Once you have identified its process ID, let’s get its parent’s process ID.

```
ps -o ppid= -p <child_id>
```

Alternatively, you can combine the above two commands in the following fashion where it directly provides the PID of the zombie process and the PID of its parent process.

```
ps -A -ostat,pid,ppid | grep -e '[zZ]'
```

Here you get the parent process ID, so [finally kill the process][7] by typing the command line with its respective ID process obtained before.

```
kill -9 <parent_process_ID>
```

![Killing parent process][8]

You can verify if the zombie process is killed or not by running the ps command again or even the top command.

Congrats! Now you know how to eliminate zombie processes.

_With inputs from Abhishek Prakash._

--------------------------------------------------------------------------------

via: https://itsfoss.com/kill-zombie-process-linux/

作者：[Marco Carmona][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/marco/
[b]: https://github.com/lujun9972
[1]: https://tldp.org/LDP/tlk/kernel/processes.html
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/zombies-turnoff.webp?resize=800%2C467&ssl=1
[3]: https://linuxhandbook.com/top-command/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/top-command-view.png?resize=800%2C474&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/kill-zombie-process-linux.jpg?resize=800%2C450&ssl=1
[6]: https://linuxhandbook.com/ps-command/
[7]: https://itsfoss.com/how-to-find-the-process-id-of-a-program-and-kill-it-quick-tip/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/killing-parent-process.png?resize=800%2C180&ssl=1
