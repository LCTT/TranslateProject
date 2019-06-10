[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tmux Command Examples To Manage Multiple Terminal Sessions)
[#]: via: (https://www.ostechnix.com/tmux-command-examples-to-manage-multiple-terminal-sessions/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Tmux Command Examples To Manage Multiple Terminal Sessions
======

![tmux command examples][1]

We’ve already learned to use [**GNU Screen**][2] to manage multiple Terminal sessions. Today, we will see yet another well-known command-line utility named **“Tmux”** to manage Terminal sessions. Similar to GNU Screen, Tmux is also a Terminal multiplexer that allows us to create number of terminal sessions and run more than one programs or processes at the same time inside a single Terminal window. Tmux is free, open source and cross-platform program that supports Linux, OpenBSD, FreeBSD, NetBSD and Mac OS X. In this guide, we will discuss most-commonly used Tmux commands in Linux.

### Installing Tmux in Linux

Tmux is available in the official repositories of most Linux distributions.

On Arch Linux and its variants, run the following command to install it.

```
$ sudo pacman -S tmux
```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt-get install tmux
```

On Fedora:

```
$ sudo dnf install tmux
```

On RHEL and CentOS:

```
$ sudo yum install tmux
```

On SUSE/openSUSE:

```
$ sudo zypper install tmux
```

Well, we have just installed Tmux. Let us go ahead and see some examples to learn how to use Tmux.

### Tmux Command Examples To Manage Multiple Terminal Sessions

The default prefix shortcut to all commands in Tmux is **Ctrl+b**. Just remember this keyboard shortcut when using Tmux.

* * *

**Note:** The default prefix to all **Screen** commands is **Ctrl+a**.

* * *

##### Creating Tmux sessions

To create a new Tmux session and attach to it, run the following command from the Terminal:

```
tmux
```

Or,

```
tmux new
```

Once you are inside the Tmux session, you will see a **green bar at the bottom** as shown in the screenshot below.

![][3]

New Tmux session

It is very handy to verify whether you’re inside a Tmux session or not.

##### Detaching from Tmux sessions

To detach from a current Tmux session, just press **Ctrl+b** and **d**. You don’t need to press this both Keyboard shortcut at a time. First press “Ctrl+b” and then press “d”.

Once you’re detached from a session, you will see an output something like below.

```
[detached (from session 0)]
```

##### Creating named sessions

If you use multiple sessions, you might get confused which programs are running on which sessions. In such cases, you can just create named sessions. For example if you wanted to perform some activities related to web server in a session, just create the Tmux session with a custom name, for example **“webserver”** (or any name of your choice).

```
tmux new -s webserver
```

Here is the new named Tmux session.

![][4]

Tmux session with a custom name

As you can see in the above screenshot, the name of the Tmux session is **webserver**. This way you can easily identify which program is running on which session.

To detach, simply press **Ctrl+b** and **d**.

##### List Tmux sessions

To view the list of open Tmux sessions, run:

```
tmux ls
```

Sample output:

![][5]

List Tmux sessions

As you can see, I have two open Tmux sessions.

##### Creating detached sessions

Sometimes, you might want to simply create a session and don’t want to attach to it automatically.

To create a new detached session named **“ostechnix”** , run:

```
tmux new -s ostechnix -d
```

The above command will create a new Tmux session called “ostechnix”, but won’t attach to it.

You can verify if the session is created using “tmux ls” command:

![][6]

Create detached Tmux sessions

##### Attaching to Tmux sessions

You can attach to the last created session by running this command:

```
tmux attach
```

Or,

```
tmux a
```

If you want to attach to any specific named session, for example “ostechnix”, run:

```
tmux attach -t ostechnix
```

Or, shortly:

```
tmux a -t ostechnix
```

##### Kill Tmux sessions

When you’re done and no longer required a Tmux session, you can kill it at any time with command:

```
tmux kill-session -t ostechnix
```

To kill when attached, press **Ctrl+b** and **x**. Hit “y” to kill the session.

You can verify if the session is closed with “tmux ls” command.

To Kill Tmux server along with all Tmux sessions, run:

```
tmux kill-server
```

Be careful! This will terminate all Tmux sessions even if there are any running jobs inside the sessions without any warning.

When there were no running Tmux sessions, you will see the following output:

```
$ tmux ls
no server running on /tmp/tmux-1000/default
```

##### Split Tmux Session Windows

Tmux has an option to split a single Tmux session window into multiple smaller windows called **Tmux panes**. This way we can run different programs on each pane and interact with all of them simultaneously. Each pane can be resized, moved and closed without affecting the other panes. We can split a Tmux window either horizontally or vertically or both at once.

**Split panes horizontally**

To split a pane horizontally, press **Ctrl+b** and **”** (single quotation mark).

![][7]

Split Tmux pane horizontally

Use the same key combination to split the panes further.

**Split panes vertically**

To split a pane vertically, press **Ctrl+b** and **%**.

![][8]

Split Tmux panes vertically

**Split panes horizontally and vertically**

We can also split a pane horizontally and vertically at the same time. Take a look at the following screenshot.

![][9]

Split Tmux panes

First, I did a horizontal split by pressing **Ctrl+b “** and then split the lower pane vertically by pressing **Ctrl+b %**.

As you see in the above screenshot, I am running three different programs on each pane.

**Switch between panes**

To switch between panes, press **Ctrl+b** and **Arrow keys (Left, Right, Up, Down)**.

**Send commands to all panes**

In the previous example, we run three different commands on each pane. However, it is also possible to run send the same commands to all panes at once.

To do so, press **Ctrl+b** and type the following command and hit ENTER:

```
:setw synchronize-panes
```

Now type any command on any pane. You will see that the same command is reflected on all panes.

**Swap panes**

To swap panes, press **Ctrl+b** and **o**.

**Show pane numbers**

Press **Ctrl+b** and **q** to show pane numbers.

**Kill panes**

To kill a pane, simply type **exit** and ENTER key. Alternatively, press **Ctrl+b** and **x**. You will see a confirmation message. Just press **“y”** to close the pane.

![][10]

Kill Tmux panes

At this stage, you will get a basic idea of Tmux and how to use it to manage multiple Terminal sessions. For more details, refer man pages.

```
$ man tmux
```

Both GNU Screen and Tmux utilities can be very helpful when managing servers remotely via SSH. Learn Screen and Tmux commands thoroughly to manage your remote servers like a pro.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/tmux-command-examples-to-manage-multiple-terminal-sessions/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/Tmux-720x340.png
[2]: https://www.ostechnix.com/screen-command-examples-to-manage-multiple-terminal-sessions/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/06/Tmux-session.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/06/Named-Tmux-session.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/06/List-Tmux-sessions.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/06/Create-detached-sessions.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/06/Horizontal-split.png
[8]: https://www.ostechnix.com/wp-content/uploads/2019/06/Vertical-split.png
[9]: https://www.ostechnix.com/wp-content/uploads/2019/06/Split-Panes.png
[10]: https://www.ostechnix.com/wp-content/uploads/2019/06/Kill-panes.png
