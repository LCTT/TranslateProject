translating by lujun9972
What Are Zombie Processes And How To Find & Kill Zombie Processes?
======
 [![What Are Zombie Processes And How To Find & Kill Zombie Processes?](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/what-are-the-zombie-processes_orig.jpg)][1] 

If you are a regular Linux user, you must have encountered the term `Zombie Processes`. So what are the Zombie Processes? How do they get created? Are they harmful to the system? How do I kill these processes?  Keep reading for the answers to all these questions.

### What are Zombie Processes?

So we all know how processes work. We launch a program, start our task & once our task is over, we end that process. Once the process has ended, it has to be removed from the processes table.

​

You can see the current processes in the ‘System-Monitor’.

 [![Replace the pid with the id of the parent process so that the parent process will remove all the child processes that are dead and completed. Imagine it Like this : “You find a dead body in the middle of the road, you call the dead body’s family and they take that body away from the road.” But a lot of programs are not programmed well enough to remove these child zombies because if they were, you wouldn’t have those zombies in the first place. So the only thing guaranteed to remove Child Zombies is killing the parent.](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/linux-check-zombie-processes_orig.jpg)][2] 

But, sometimes some of these processes stay in the processes table even after they have completed execution.

​

So these processes that have completed their life of execution but still exist in the processes table are called ‘Zombie Processes’.

### And How Exactly do they get Created?

Whenever we run a program it creates a parent process and a lot of child processes. All of these child processes use resources such as memory and CPU allocated to them by the kernel.

​

Once these child processes have finished executing they send an Exit call and die. This Exit call has to be read by the parent process which later calls the wait command to read the exit_status of the child process so that the child process can be removed from the processes table.

If the Parent reads the Exit call correctly sent by the Child Process, the process is removed from the processes table.

But, if the parent fails to read the exit call from the child process, the child process which has already finished its execution and is now dead will not be removed from the processes table.

### Are Zombie processes harmful to the System?

**No. **

Since zombie process is not doing any work, not using any resources or affecting any other process, there is no harm in having a zombie process. But since the exit_status and other process information from the process table are stored in the RAM, having too many Zombie processes can sometimes be an issue.

 **_Imagine it Like this :_** 

“

 _You are the owner of a construction company. You pay daily wages to all your workers depending upon how they work. _  _A worker comes to the construction site every day, just sits there, you don’t have to pay him, he doesn’t do any work. _  _He just comes every day and sits, that’s it !”_  

Such a worker is the living example of a zombie process. 

**But,**

if you have a lot of zombie workers, your construction site will get crowded and it might get difficult for the people that are actually working.

### So how to find Zombie Processes?

Fire up a terminal and type the following command -

ps aux | grep Z

You will now get details of all zombie processes in the processes table.

### How to kill Zombie processes?

Normally we kill processes with the SIGKILL command but zombie processes are already dead. You Cannot kill something that is already dead. So what you do is you type this command -

kill -s SIGCHLD pid

​Replace the pid with the id of the parent process so that the parent process will remove all the child processes that are dead and completed.

 **_Imagine it Like this :_** 

“

 _You find a dead body in the middle of the road, you call the dead body’s family and they take that body away from the road.”_ 

But a lot of programs are not programmed well enough to remove these child zombies because if they were, you wouldn’t have those zombies in the first place. So the only thing guaranteed to remove Child Zombies is killing the parent.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/what-are-zombie-processes-and-how-to-find-kill-zombie-processes

作者：[linuxandubuntu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/what-are-zombie-processes-and-how-to-find-kill-zombie-processes
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/linux-check-zombie-processes_orig.jpg
