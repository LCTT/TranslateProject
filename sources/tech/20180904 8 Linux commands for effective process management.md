heguangzhi Translating 

8 Linux commands for effective process management
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg)

Generally, an application process' lifecycle has three main states: start, run, and stop. Each state can and should be managed carefully if we want to be competent administrators. These eight commands can be used to manage processes through their lifecycles.

### Starting a process

The easiest way to start a process is to type its name at the command line and press Enter. If you want to start an Nginx web server, type **nginx**. Perhaps you just want to check the version.
```
alan@workstation:~$ nginx

alan@workstation:~$ nginx -v
nginx version: nginx/1.14.0
```

### Viewing your executable path

The above demonstration of starting a process assumes the executable file is located in your executable path. Understanding this path is key to reliably starting and managing a process. Administrators often customize this path for their desired purpose. You can view your executable path using **echo $PATH**.
```
alan@workstation:~$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
```

#### WHICH

Use the which command to view the full path of an executable file.
```
alan@workstation:~$ which nginx                                                    
/opt/nginx/bin/nginx
```

I will use the popular web server software Nginx for my examples. Let's assume that Nginx is installed. If the command **which nginx** returns nothing, then Nginx was not found because which searches only your defined executable path. There are three ways to remedy a situation where a process cannot be started simply by name. The first is to type the full path. Although, I'd rather not have to type all of that, would you?
```
alan@workstation:~$ /home/alan/web/prod/nginx/sbin/nginx -v
nginx version: nginx/1.14.0
```

The second solution would be to install the application in a directory in your executable's path. However, this may not be possible, particularly if you don't have root privileges.

The third solution is to update your executable path environment variable to include the directory where the specific application you want to use is installed. This solution is shell-dependent. For example, Bash users would need to edit the PATH= line in their .bashrc file.
```
PATH="$HOME/web/prod/nginx/sbin:$PATH"
```

Now, repeat your echo and which commands or try to check the version. Much easier!
```
alan@workstation:~$ echo $PATH
/home/alan/web/prod/nginx/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin

alan@workstation:~$ which nginx
/home/alan/web/prod/nginx/sbin/nginx

alan@workstation:~$ nginx -v                                                
nginx version: nginx/1.14.0
```

### Keeping a process running

#### NOHUP

A process may not continue to run when you log out or close your terminal. This special case can be avoided by preceding the command you want to run with the nohup command. Also, appending an ampersand (&) will send the process to the background and allow you to continue using the terminal. For example, suppose you want to run myprogram.sh.
```
nohup myprogram.sh &
```

One nice thing nohup does is return the running process's PID. I'll talk more about the PID next.

### Manage a running process

Each process is given a unique process identification number (PID). This number is what we use to manage each process. We can also use the process name, as I'll demonstrate below. There are several commands that can check the status of a running process. Let's take a quick look at these.

#### PS

The most common is ps. The default output of ps is a simple list of the processes running in your current terminal. As you can see below, the first column contains the PID.
```
alan@workstation:~$ ps
PID TTY          TIME CMD
23989 pts/0    00:00:00 bash
24148 pts/0    00:00:00 ps
```

I'd like to view the Nginx process I started earlier. To do this, I tell ps to show me every running process ( **-e** ) and a full listing ( **-f** ).
```
alan@workstation:~$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 Aug18 ?        00:00:10 /sbin/init splash
root         2     0  0 Aug18 ?        00:00:00 [kthreadd]
root         4     2  0 Aug18 ?        00:00:00 [kworker/0:0H]
root         6     2  0 Aug18 ?        00:00:00 [mm_percpu_wq]
root         7     2  0 Aug18 ?        00:00:00 [ksoftirqd/0]
root         8     2  0 Aug18 ?        00:00:20 [rcu_sched]
root         9     2  0 Aug18 ?        00:00:00 [rcu_bh]
root        10     2  0 Aug18 ?        00:00:00 [migration/0]
root        11     2  0 Aug18 ?        00:00:00 [watchdog/0]
root        12     2  0 Aug18 ?        00:00:00 [cpuhp/0]
root        13     2  0 Aug18 ?        00:00:00 [cpuhp/1]
root        14     2  0 Aug18 ?        00:00:00 [watchdog/1]
root        15     2  0 Aug18 ?        00:00:00 [migration/1]
root        16     2  0 Aug18 ?        00:00:00 [ksoftirqd/1]
alan     20506 20496  0 10:39 pts/0    00:00:00 bash
alan     20520  1454  0 10:39 ?        00:00:00 nginx: master process nginx
alan     20521 20520  0 10:39 ?        00:00:00 nginx: worker process
alan     20526 20506  0 10:39 pts/0    00:00:00 man ps
alan     20536 20526  0 10:39 pts/0    00:00:00 pager
alan     20564 20496  0 10:40 pts/1    00:00:00 bash
```

You can see the Nginx processes in the output of the ps command above. The command displayed almost 300 lines, but I shortened it for this illustration. As you can imagine, trying to handle 300 lines of process information is a bit messy. We can pipe this output to grep to filter out nginx.
```
alan@workstation:~$ ps -ef |grep nginx
alan     20520  1454  0 10:39 ?        00:00:00 nginx: master process nginx
alan     20521 20520  0 10:39 ?        00:00:00 nginx: worker process
```

That's better. We can quickly see that Nginx has PIDs of 20520 and 20521.

#### PGREP

The pgrep command was created to further simplify things by removing the need to call grep separately.
```
alan@workstation:~$ pgrep nginx
20520
20521
```

Suppose you are in a hosting environment where multiple users are running several different instances of Nginx. You can exclude others from the output with the **-u** option.
```
alan@workstation:~$ pgrep -u alan nginx
20520
20521
```

#### PIDOF

Another nifty one is pidof. This command will check the PID of a specific binary even if another process with the same name is running. To set up an example, I copied my Nginx to a second directory and started it with the prefix set accordingly. In real life, this instance could be in a different location, such as a directory owned by a different user. If I run both Nginx instances, the **ps -ef** output shows all their processes.
```
alan@workstation:~$ ps -ef |grep nginx
alan     20881  1454  0 11:18 ?        00:00:00 nginx: master process ./nginx -p /home/alan/web/prod/nginxsec
alan     20882 20881  0 11:18 ?        00:00:00 nginx: worker process
alan     20895  1454  0 11:19 ?        00:00:00 nginx: master process nginx
alan     20896 20895  0 11:19 ?        00:00:00 nginx: worker process
```

Using grep or pgrep will show PID numbers, but we may not be able to discern which instance is which.
```
alan@workstation:~$ pgrep nginx
20881
20882
20895
20896
```

The pidof command can be used to determine the PID of each specific Nginx instance.
```
alan@workstation:~$ pidof /home/alan/web/prod/nginxsec/sbin/nginx
20882 20881

alan@workstation:~$ pidof /home/alan/web/prod/nginx/sbin/nginx
20896 20895
```

#### TOP

The top command has been around a long time and is very useful for viewing details of running processes and quickly identifying issues such as memory hogs. Its default view is shown below.
```
top - 11:56:28 up 1 day, 13:37,  1 user,  load average: 0.09, 0.04, 0.03
Tasks: 292 total,   3 running, 225 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.1 us,  0.2 sy,  0.0 ni, 99.7 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16387132 total, 10854648 free,  1859036 used,  3673448 buff/cache
KiB Swap:        0 total,        0 free,        0 used. 14176540 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
17270 alan      20   0 3930764 247288  98992 R   0.7  1.5   5:58.22 gnome-shell
20496 alan      20   0  816144  45416  29844 S   0.5  0.3   0:22.16 gnome-terminal-
21110 alan      20   0   41940   3988   3188 R   0.1  0.0   0:00.17 top
    1 root      20   0  225564   9416   6768 S   0.0  0.1   0:10.72 systemd
    2 root      20   0       0      0      0 S   0.0  0.0   0:00.01 kthreadd
    4 root       0 -20       0      0      0 I   0.0  0.0   0:00.00 kworker/0:0H
    6 root       0 -20       0      0      0 I   0.0  0.0   0:00.00 mm_percpu_wq
    7 root      20   0       0      0      0 S   0.0  0.0   0:00.08 ksoftirqd/0
```

The update interval can be changed by typing the letter **s** followed by the number of seconds you prefer for updates. To make it easier to monitor our example Nginx processes, we can call top and pass the PID(s) using the **-p** option. This output is much cleaner.
```
alan@workstation:~$ top -p20881 -p20882 -p20895 -p20896

Tasks:   4 total,   0 running,   4 sleeping,   0 stopped,   0 zombie
%Cpu(s):  2.8 us,  1.3 sy,  0.0 ni, 95.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 16387132 total, 10856008 free,  1857648 used,  3673476 buff/cache
KiB Swap:        0 total,        0 free,        0 used. 14177928 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
20881 alan      20   0   12016    348      0 S   0.0  0.0   0:00.00 nginx
20882 alan      20   0   12460   1644    932 S   0.0  0.0   0:00.00 nginx
20895 alan      20   0   12016    352      0 S   0.0  0.0   0:00.00 nginx
20896 alan      20   0   12460   1628    912 S   0.0  0.0   0:00.00 nginx
```

It is important to correctly determine the PID when managing processes, particularly stopping one. Also, if using top in this manner, any time one of these processes is stopped or a new one is started, top will need to be informed of the new ones.

### Stopping a process

#### KILL

Interestingly, there is no stop command. In Linux, there is the kill command. Kill is used to send a signal to a process. The most commonly used signal is "terminate" (SIGTERM) or "kill" (SIGKILL). However, there are many more. Below are some examples. The full list can be shown with **kill -L**.
```
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM

```

Notice signal number nine is SIGKILL. Usually, we issue a command such as **kill -9 20896**. The default signal is 15, which is SIGTERM. Keep in mind that many applications have their own method for stopping. Nginx uses a **-s** option for passing a signal such as  "stop" or "reload." Generally, I prefer to use an application's specific method to stop an operation. However, I'll demonstrate the kill command to stop Nginx process 20896 and then confirm it is stopped with pgrep. The PID 20896 no longer appears.
```
alan@workstation:~$ kill -9 20896
 
alan@workstation:~$ pgrep nginx
20881
20882
20895
22123
```

#### PKILL

The command pkill is similar to pgrep in that it can search by name. This means you have to be very careful when using pkill. In my example with Nginx, I might not choose to use it if I only want to kill one Nginx instance. I can pass the Nginx option **-s** **stop** to a specific instance to kill it, or I need to use grep to filter on the full ps output.
```
/home/alan/web/prod/nginx/sbin/nginx -s stop

/home/alan/web/prod/nginxsec/sbin/nginx -s stop
```

If I want to use pkill, I can include the **-f** option to ask pkill to filter across the full command line argument. This of course also applies to pgrep. So, first I can check with **pgrep -a** before issuing the **pkill -f**.
```
alan@workstation:~$ pgrep -a nginx
20881 nginx: master process ./nginx -p /home/alan/web/prod/nginxsec
20882 nginx: worker process
20895 nginx: master process nginx
20896 nginx: worker process
```

I can also narrow down my result with **pgrep -f**. The same argument used with pkill stops the process.
```
alan@workstation:~$ pgrep -f nginxsec
20881
                                           
alan@workstation:~$ pkill -f nginxsec
```

The key thing to remember with pgrep (and especially pkill) is that you must always be sure that your search result is accurate so you aren't unintentionally affecting the wrong processes.

Most of these commands have many command line options, so I always recommend reading the [man page][1] on each one. While most of these exist across platforms such as Linux, Solaris, and BSD, there are a few differences. Always test and be ready to correct as needed when working at the command line or writing scripts.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/linux-commands-process-management

作者：[Alan Formy-Duval][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[1]: https://www.kernel.org/doc/man-pages/
