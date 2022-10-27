[#]: subject: "Reptyr – Move A Running Process From One Terminal To Another Without Closing It"
[#]: via: "https://ostechnix.com/reptyr-move-running-process-new-terminal/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Reptyr – Move A Running Process From One Terminal To Another Without Closing It
======
This step by step tutorial explains what is **Reptyr** application and how to **move a running process to a new terminal using Reptyr command in Linux and Unix** operating systems.

### Introduction

Let us say, you are running a task in a remote server via a SSH session from your local system.

When you started the task, you didn't know that the remote job would take long time to complete. You just want to leave the running job on the remote server itself, and close the SSH session without terminating the remote job, and then re-attach it to the SSH session later or at the next day.

Of course, you can start the job in screen or tmux session, and detach from the screen session without exiting the remote job, and exit SSH session.

But if you forgot to start the screen session in the first place, there is no way to reattach to the running process later. Once you closed the SSH session, the running processes will also be closed on the remote system.

So, what would you do in such situation? Worry not! Here is where Reptyr command comes in help.

### What Is Reptyr?

**Reptyr** is a command line tool for moving running processes between ptys.

Using Reptyr, we can easily migrate or move a long-running process from one Terminal to another Terminal instantly without terminate it. Reptyr uses **ptrace** system call to attach to the target program.

Just start a long-running process on your remote system via SSH session from your local machine, and close the SSH session, go home, and re-attach the running process on the next day.

Reptyr is an opensource command line application. It supports both Linux and FreeBSD.

### Install Reptyr In Your Remote Linux Systems

First of all, make sure you've installed **tmux** or **screen** in your remote systems in-order to move running process from local terminal to remote terminal. If you haven't installed tmux/screen yet, refer the following links.

> **[Tmux Commands Examples To Manage Multiple Terminal Sessions In Linux][1]**

> **[Screen Command Examples To Manage Multiple Terminal Sessions][2]**

Next, you should install Reptyr application on your REMOTE systems.

To install Reptyr in Arch Linux and its derivatives such as Endeavour OS and Manjaro Linux, run:

```
$ sudo pacman -S reptyr
```

In Debian, Ubuntu, Linux Mint, Pop!_OS, run the following command to install Reptyr:

```
$ sudo apt install reptyr
```

On Fedora, RHEL, CentOS, AlmaLinux, and Rocky Linux, reptyr can be installed from **EPEL** repository.

To install EPEL repository in RHEL-based systems, run the following commands:

```
$ sudo dnf config-manager --set-enabled powertools
```

```
$ sudo dnf install epel-release
```

After enabling EPEL repository, run the following command to install Reptyr:

```
$ sudo dnf install reptyr
```

### Install Reptyr From Source

Install the necessary development tools as described in the following link.

> **[How To Install Development Tools In Linux][3]**

Git clone reptyr repository with command as `root` or `sudo` user:

```
$ git clone https://github.com/nelhage/reptyr.git
```

Go to the reptyr directory:

```
$ cd reptyr/
```

Run the following commands to compile and install it.

```
$ make
```

```
$ sudo make install
```

I compiled and installed Reptyr from source in CentOS 7 64 bit server edition, and it worked pretty good as described above.

### Move A Running Process From One Terminal To Another Without Closing It Using Reptyr

Make sure you installed the following on your remote Linux systems.

* Reptyr.
* Tmux or Screen.

#### Example 1:

For demonstration purpose, I will be using the following system.

* Remote system - Debian 11 Bullseye (username - ostechnix, IP - 192.168.1.20)

##### Step 1 - SSH Into The Remote System

Usually, we connect to the remote server from any local system via SSH as shown below.

```
ssh remote_username@IP_of_remote_system
```

I am going to SSH into my remote system(AlmaLinux 8) from my local system(Debian 11).

```
$ ssh ostechnix@192.168.1.20
```

![SSH Into A Remote Linux System][4]

Here, "ostechnix" is the remote system's username and "192.168.1.20" is the remote system's IP address. Replace these two values with your own.

##### Step 2 - Start a Long-running Process

After connecting to the remote system, start any long-running process. I will start "top" command.

```
$ top
```

Here is "top" command running in my AlmaLinux connected via SSH. Let us call it **Terminal 1**.

![Running Top Command In Remote Linux System][5]

As you see in the above output, I run "top" command in Debian 11 virtual machine via SSH from my local system. The top command will keep running until we manually stop it by pressing **CTRL+C**.

What we are going to do now is simply move the top command process inside the tmux or screen session of our remote system(i.e. Debian 11) using Reptyr. And then we finally close the SSH session in our local system. During the transition, the top command will keep running without any interruption.

##### Step 3 - Background The Process

Now press **CTRL+Z** to put the process in the background. And then run **bg** to resume the process in the background.

```
$ bg
```

Verify the running background jobs with `jobs` command:

```
$ jobs -l
```

Here, the **-l** flag will list the PID of the background job.

You will see the following output.

```
[1]+  1972 Stopped (signal)        top
```

![Background The Process][6]

Note down the PID. We will need it later to attach the process to remote terminal. Here, the PID of top command is **1972**.

##### Step 4 - Disown The Process

Disown the running process from the current parent using command:

```
$ disown top
```

**Sample output:**

```
-bash: warning: deleting stopped job 1 with process group 1972
```

Now the `jobs -l` command will not show the job anymore, but the **ps -a** command will.

```
$ ps -a
    PID TTY          TIME CMD
   1972 pts/1    00:00:00 top
   2061 pts/1    00:00:00 ps
```

![Disown The Process][7]

##### Step 5 - Start A Tmux Or Screen Session

Start a new Tmux or Screen session in the same terminal or new terminal window. For the sake of easy understanding, I am going to call the new tmux session as **Terminal 2**.

```
$ tmux
```

![Start A New Tmux Session][8]

Please note that you should start the tmux/screen multiplexer in the remote(Debian 11) console, not in our local system's console.

##### Step 6 - Attach To The Background Process

Remember we put the top command in the background in **Step 3**. The PID of the background process is **1972**. If you don't remember the PID, run `ps -a` command.

Now, attach to the background process with Reptyr using command:

```
$ reptyr 1972
```

![Attach To The Background Process using Reptyr][9]

That's it. We have successfully moved the background process inside the tmux sesssion.

![Top Command Is Moved Into The Tmux Session][10]

You can now safely detach from the Tmux session by pressing **CTRL+B** and **D**. It will only close the tmux session, but not the process(top command) which is running inside of it.

We are back to the Terminal 1. Verify the list of active Tmux panes using command:

```
$ tmux list-panes -F '#{pane_active} #{pane_pid}'
1 2072
```

Here,

* pane_active will show 1 if active pane.
* pane_pid is the PID of first process in pane.

##### Step 7 - Close The SSH Connection

You can now close the SSH session. The process(Top command in our case) will keep running inside the Tmux session of your remote system as long as your remote system is up. Closing the SSH connection will not terminate the process.

##### Step 8 - Reattach To Tmux

To reattach to the process, simply SSH to your remote system:

```
$ ssh remote_user@remote_ip
```

And run the following command to attach the tmux session where the top process is still running.

```
$ tmux attach
```

![Reattach To Tmux][11]

You will now see the running process inside the Tmux session.

This way you can start any number of Tmux panes and move the running processes inside to each pane.

Let me show you another example.

#### Example 2:

In this example, I use how to move a running process (E.g. wget) in CentOS server.

**Step 1** - SSH into Remote system.

**Step 2** - After you connected to the remote system, start a long-running process. For example, I am going to download Ubuntu 16.04 desktop ISO with **wget** command.

```
# wget http://cdimage.ubuntu.com/daily-live/current/xenial-desktop-amd64.iso
```

**Sample output:**

![Download Ubuntu ISO][12]

As you see in the above screenshot, the total download size is 1.5GB, and it will take more than 90 minutes to complete.

I don't want to wait that much longer, and also I don't want to quit the remote job either.

So, what I am going to do now is start a **screen** or **tmux** session in a new terminal, use **reptyr** utility to grab the running process inside the screen or tmux session.  Finally, I will terminate both ssh sessions, and reattach to the running process whenever I want.

**Step 3** - Let us open a new terminal window or new tab, and start a screen or tmux session by typing **screen** or **tmux** in the terminal:

```
# screen
```

or

```
# tmux
```

![Start A Screen Session][13]

As you see in the above screenshot, the screen session has been started and it is running.

**Step 4** - Now, let us find the the running processes from the new Terminal by using the following command:

```
# ps -a
```

**Sample output:**

```
PID TTY TIME CMD
 2320 pts/0 00:00:11 wget
 2343 pts/1 00:00:00 screen
 2358 pts/2 00:00:00 ps
```

Note down the PID for the **wget** process, and attach the running process inside screen session using command:

```
# reptyr 2320
```

![Attach The Running Process Inside Screen Session Using Reptyr][14]

Done! As you see in the above screenshot, wget process has been moved (migrated) from old terminal to the new terminal window (the one running with screen session).

Once you moved the running process from the original terminal (i.e. remote terminal), it will be closed immediately in the local terminal, and start to continue where we left it off in the new terminal.

![Wget Download Process Is Stopped][15]

**Step 5** - Now, you can safely detach or close the terminal and the job will continue running on your remote server.

To detach from screen session, press **CTRL+A**and**D**. If it is Tmux session, press CTRL+B and D.

After you detached from screen session, you will see the following output.

```
[detached from 2344.pts-1.server1]
```

**Step 6** - To reattach the running process, SSH to your remote system:

```
# ssh root@192.168.1.150
```

Here. 192.168.1.150 is my remote server IP address.

**Step 7** - And run the following if you use screen session:

```
# screen -Dr
```

For tmux session, run:

```
# tmux attach
```

Voila! The running process has been reattached again, and you'll see there that the download process is still running.

![Move A Running Process From One Terminal To Another Using Reptyr][16]

As you see in the above screenshot, wget job isn't interrupted or terminated, and is still running. It will continue to run as long as your remote system is up and running.

### Summary

To summing up, Reptyr is very very important and useful tool for a Linux users and system administrators of any level. In case you fed up with a process that took a really long time to complete, Reptyr will definitely be helpful. Just open a new Terminal window, SSH to your remote server, find the running processes ID, and safely move them inside the screen or tmux sessions, and exit from the SSH session. For further details, refer the links attached at the end of this tutorial.

That's all for now folks. Well then, I leave you to get acquainted with this useful tool. Give it a try, and you won't be disappointed.

**Resources:**

* [Reptyr GitHub][17]
* [Reptyr guide][18]

--------------------------------------------------------------------------------

via: https://ostechnix.com/reptyr-move-running-process-new-terminal/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/tmux-command-examples-to-manage-multiple-terminal-sessions/
[2]: https://ostechnix.com/screen-command-examples-to-manage-multiple-terminal-sessions/
[3]: https://ostechnix.com/install-development-tools-linux/
[4]: https://ostechnix.com/wp-content/uploads/2022/07/SSH-Into-A-Remote-Linux-System.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Running-Top-Command-In-Remote-Linux-System.png
[6]: https://ostechnix.com/wp-content/uploads/2022/07/Background-The-Process-2.png
[7]: https://ostechnix.com/wp-content/uploads/2022/07/Disown-The-Process-2.png
[8]: https://ostechnix.com/wp-content/uploads/2022/07/Start-A-New-Tmux-Session-1.png
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Attach-To-The-Background-Process-using-Reptyr.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/Top-Command-Is-Moved-Into-The-Tmux-Session.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Reattach-To-Tmux.png
[12]: https://ostechnix.com/wp-content/uploads/2016/03/root@server1_002-2.jpg
[13]: https://ostechnix.com/wp-content/uploads/2016/03/screen-0-root@server1-_003-1.jpg
[14]: https://ostechnix.com/wp-content/uploads/2016/03/screen-0-root@server1-_004-1.jpg
[15]: https://ostechnix.com/wp-content/uploads/2016/03/root@server1_005-1-1.jpg
[16]: https://ostechnix.com/wp-content/uploads/2016/03/screen-0-root@server1-_009-1.jpg
[17]: https://github.com/nelhage/reptyr
[18]: https://blog.nelhage.com/2011/02/changing-ctty/
