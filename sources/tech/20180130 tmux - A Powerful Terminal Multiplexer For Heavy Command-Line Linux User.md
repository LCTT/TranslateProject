tmux – A Powerful Terminal Multiplexer For Heavy Command-Line Linux User
======
tmux stands for terminal multiplexer, it allows users to create/enable multiple terminals (vertical & horizontal) in single window, this can be accessed and controlled easily from single window when you are working with different issues.

It uses a client-server model, which allows you to share sessions between users, also you can attach terminals to a tmux session back. We can easily move or rearrange the virtual console as per the need. Terminal sessions can freely rebound from one virtual console to another.

tmux depends on libevent and ncurses libraries. tmux offers status-line at the bottom of the screen which display information about your current tmux session suc[]h as current window number, window name, username, hostname, current time, and current date.

When tmux is started it creates a new session with a single window and displays it on screen. It allows users to create Any number of windows in the same session.

Many of us says it's similar to screen but i'm not since this offers wide range of configuration options.

**Make a note:** `Ctrl+b` is the default prefix in tmux so, to perform any action in tumx, you have to type the prefix first then required options.

**Suggested Read :** [List Of Terminal Emulator For Linux][1]

### tmux Features

  * Create any number of windows
  * Create any number of panes in the single window
  * It allows vertical and horizontal splits
  * Detach and Re-attach window
  * Server-client architecture which allows users to share sessions between users
  * tmux offers wide range of configuration hacks



**Suggested Read :**
**(#)** [tmate - Instantly Share Your Terminal Session To Anyone In Seconds][2]
**(#)** [Teleconsole - A Tool To Share Your Terminal Session Instantly To Anyone In Seconds][3]

### How to Install tmux Command

tmux command is pre-installed by default in most of the Linux systems. If no, follow the below procedure to get installed.

For **`Debian/Ubuntu`** , use [APT-GET Command][4] or [APT Command][5] to install tmux.
```
$ sudo apt install tmux

```

For **`RHEL/CentOS`** , use [YUM Command][6] to install tmux.
```
$ sudo yum install tmux

```

For **`Fedora`** , use [DNF Command][7] to install tmux.
```
$ sudo dnf install tmux

```

For **`Arch Linux`** , use [Pacman Command][8] to install tmux.
```
$ sudo pacman -S tmux

```

For **`openSUSE`** , use [Zypper Command][9] to install tmux.
```
$ sudo zypper in tmux

```

### How to Use tmux

kick start the tmux session by running following command on terminal. When tmux is started it creates a new session with a single window and will automatically login to your default shell with your user account.
```
$ tmux

```

[![][10]![][10]][11]

You will get similar to above screenshot like us. tmux comes with status bar which display an information's about current sessions details, date, time, etc.,.

The status bar information's are below:

  * **`0 :`** It is indicating the session number which was created by the tmux server. By default it starts with 0.
  * **`0:username@host: :`** 0 is indicating the session number. Username and Hostname which is holding the current window.
  * **`~ :`** It is indicating the current directory (We are in the Home directory)
  * **`* :`** This indicate that the window is active now.
  * **`Hostname :`** This shows fully qualified hostname of the server
  * **`Date& Time:`** It shows current date and time



### How to Split Window

tmux allows users to split window vertically and horizontally. Let 's see how to do that.

Press `**(Ctrl+b), %**` to split the pane vertically.
[![][10]![][10]][13]

Press `**(Ctrl+b), "**` to split the pane horizontally.
[![][10]![][10]][14]

### How to Move Between Panes

Lets say, we have created few panes and want to move between them. How to do that? If you don 't know how to do, then there is no purpose to use tmux. Use the following control keys to perform the actions. There are many ways to move between panes.

Press `(Ctrl+b), Left arrow` - To Move Left

Press `(Ctrl+b), Right arrow` - To Move Right

Press `(Ctrl+b), Up arrow` - To Move Up

Press `(Ctrl+b), Down arrow` - To Move Down

Press `(Ctrl+b), {` - To Move Left

Press `(Ctrl+b), }` - To Move Right

Press `(Ctrl+b), o` - Switch to next pane (left-to-right, top-down)

Press `(Ctrl+b), ;` - Move to the previously active pane.

For testing purpose, we are going to move between panes. Now, we are in the `pane2` which shows `lsb_release -a` command output.
[![][10]![][10]][15]

And we are going to move to `pane0` which shows `uname -a` command output.
[![][10]![][10]][16]

### How to Open/Create New Window

You can open any number of windows within one terminal. Terminal window can be split vertically & horizontally which is called `panes`. Each pane will contain its own, independently running terminal instance.

Press `(Ctrl+b), c` to create a new window.

Press `(Ctrl+b), n` move to the next window.

Press `(Ctrl+b), p` to move to the previous window.

Press `(Ctrl+b), (0-9)` to immediately move to a specific window.

Press `(Ctrl+b), l` Move to the previously selected window.

I have two windows, first window has three panes which contains operating system distribution information, top command output & kernal information.
[![][10]![][10]][17]

And second window has two panes which contains Linux distributions logo information. Use the following commands perform the action.
[![][10]![][10]][18]

Press `(Ctrl+b), w` Choose the current window interactively.
[![][10]![][10]][19]

### How to Zoom Panes

You are working in some pane which is very small and you want to zoom it out for further work. To do use the following key binds.

Currently we have three panes and i'm working in `pane1` which shows system activity using **Top** command and am going to zoom that.
[![][10]![][10]][17]

When you zoom a pane, it will hide all other panes and display only the zoomed pane in the window.
[![][10]![][10]][20]

Press `(Ctrl+b), z` to zoom the pane and press it again, to bring the zoomed pane back.

### Display Pane Information

To know about pane number and it's size, run the following command.

Press `(Ctrl+b), q` to briefly display pane indexes.
[![][10]![][10]][21]

### Display Window Information

To know about window number, layout size, number of panes associated with the window and it's size, etc., run the following command.

Just run `tmux list-windows` to view window information.
[![][10]![][10]][22]

### How to Resize Panes

You may want to resize the panes to fit your requirement. You have to press `(Ctrl+b), :` then type the following details on the `yellow` color bar in the bottom of the page.
[![][10]![][10]][23]

In the previous section we have print pane index which shows panes size as well. To test this we are going to increase `10 cells UPward`. See the following output that has increased the pane1 & pane2 size from `55x21` to `55x31`.
[![][10]![][10]][24]

**Syntax:** `(Ctrl+b), :` then type `resize-pane [options] [cells size]`

`(Ctrl+b), :` then type `resize-pane -D 10` to resize the current pane Down for 10 cells.

`(Ctrl+b), :` then type `resize-pane -U 10` to resize the current pane UPward for 10 cells.

`(Ctrl+b), :` then type `resize-pane -L 10` to resize the current pane Left for 10 cells.

`(Ctrl+b), :` then type `resize-pane -R 10` to resize the current pane Right for 10 cells.

### Detaching and Re-attaching tmux Session

One of the most powerful features of tmux is the ability to detach and reattach session whenever you need.

Run a long running process and press `Ctrl+b` followed by `d` to detach your tmux session safely by leaving the running process.

**Suggested Read :** [How To Keep A Process/Command Running After Disconnecting SSH Session][25]

Now, run a long running process. For demonstration purpose, we are going to move this server backup to another remote server for disaster recovery (DR) purpose.

You will get similar output like below after detached tmux session.
```
[detached (from session 0)]

```

Run the following command to list the available tmux sessions.
```
$ tmux ls
0: 3 windows (created Tue Jan 30 06:17:47 2018) [109x45]

```

Now, re-attach the tmux session using an appropriate session ID as follow.
```
$ tmux attach -t 0

```

### How to Close Panes & Window

Just type `exit` or hit `Ctrl-d` in the corresponding pane to close it. It's similar to terminal close. To close window, press `(Ctrl+b), &`.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/tmux-a-powerful-terminal-multiplexer-emulator-for-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/category/terminal-emulator/
[2]:https://www.2daygeek.com/tmate-instantly-share-your-terminal-session-to-anyone-in-seconds/
[3]:https://www.2daygeek.com/teleconsole-share-terminal-session-instantly-to-anyone-in-seconds/
[4]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[9]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[10]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[11]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-1.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-2.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-3.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-4.png
[16]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-5.png
[17]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-8.png
[18]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-6.png
[19]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-7.png
[20]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-9.png
[21]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-10.png
[22]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-14.png
[23]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-11.png
[24]:https://www.2daygeek.com/wp-content/uploads/2018/01/tmux-a-powerful-terminal-multiplexer-emulator-for-linux-13.png
[25]:https://www.2daygeek.com/how-to-keep-a-process-command-running-after-disconnecting-ssh-session/
