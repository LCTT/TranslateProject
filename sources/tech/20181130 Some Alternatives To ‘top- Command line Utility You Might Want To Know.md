[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Some Alternatives To ‘top’ Command line Utility You Might Want To Know)
[#]: via: (https://www.ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)
[#]: url: ( )

Some Alternatives To ‘top’ Command line Utility You Might Want To Know
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/Alternatives-To-Top-Command-720x340.png)

Every now and then, I see a lot of open source programs, tools, and utilities are being added to GitHub and GitLab by developers across the world. Some of those programs are new and some of them are just alternative programs to the most popular and widely used existing Linux programs. In this tutorial, we are going to discuss about some good alternatives to [**‘top’**][1], the command line task manager program. Read on.

### Alternatives To ‘top’ Command line Utility

As of writing this guide, I am aware of the following 6 alternatives to Top program, namely:

  1. Htop
  2. Vtop
  3. Gtop
  4. Gotop
  5. Ptop
  6. Hegemon



I will keep updating this list if I come across any similar utilities in the days to come. Bookmark this guide if you’re interested to know about such utilities.

#### 1\. Htop

The **htop** is a popular, open source and cross-platform interactive process manager. It is my favorite system activity monitor tool. htop is an enhanced version of the classic top program. It is originally developed for Linux, but the developer extended its support to other Unix-like operating systems such as FreeBSD and Mac OS X. htop is free open source, and ncurses-based utility released under GPLv2.

Compared to the classic top command, it has the following few advantages.

  * htop starts faster than top program.
  * htop allows us to scroll horizontally and vertically to view all processes and full command lines.
  * There is no need to type the PID to kill a process in htop. But in top, you need to type the PID to kill the process.
  * There is no need to type PID to change the priority of a process, but in top command, you do.
  * We can kill multiple processes at once in htop.
  * In top program you are subject to a delay for each unassigned key you press. It is especially annoying when multi-key escape sequences are triggered by accident.



**Installing htop**

htop is available in the default repositories of most Linux distributions.

On Arch-based systems, run the following command to install htop.

```
$ sudo pacman -S htop
```

On Debian-based systems:

```
$ sudo apt install htop
```

On RPM-based systems:

```
$ sudo dnf install htop
```

Or,

```
$ sudo yum install htop
```

On openSUSE:

```
$ sudo zypper in htop
```

**Usage**

When you htop command without any arguments, you will see the following screen.

```
$ htop
```
![](https://www.ostechnix.com/wp-content/uploads/2018/11/htop-command-1.png)

As you can see, htop task manager shows total memory and swap usage, total number of tasks, system average load and system uptime on the top. On the bottom side, just like top command, it displays the list of processes in multiple columns. Each column displays details such as pid, user, priority, nice value, virtual memory usage, cpu usage, memory usage by each process etc. You can read about these parameters in the top command tutorial linked in the first paragraph.

Unlike top command, htop allows you to perform each operation with a dedicated function key. Here is the list of shortcut keys to interact with htop.

  * **F1, h, ?** – Open help section.
  * **F2, S(Shift+s)** – Go to the setup section, where you can configure the meters displayed at the top of the screen, set various display options, choose among color schemes, and select which columns are displayed, in which order etc.
  * **F3, /** – Search the command lines of all the displayed processes.
  * **F4, \** – Filter processes. Just type the part of the process name and you will see only the processes that matches the name. Press F4 again and hit ESC key to cancel filtering.
  * **F5, t** – Switch between tree view and default view. Press + to view the sub-tree.
  * **F6, <, >** – Sort the processes by PID, USER, PRIORITY, NICE value, CPU usage, MEMORY usage etc.
  * **F7, ]** – Increase the selected process’s priority.
  * **F8, [** – Decrease the selected process’s priority.
  * **F9, k** – Kill the processes. Use the UP/DOWN arrows to choose the process and press F9 or k to kill it.
  * **F10, q** – Exit htop.



All shortcuts keys are given at the bottom of the htop interface.

Please note that some of these function keys might be assigned to various Terminal operations. For example, when I hit the F2 key, it didn’t go to htop setup section. Instead it displayed the option to set the title to my Terminal window. In such cases, you might need to other keys given along with the function keys.

Apart from the above mentioned keys, there are few more keys available to perform different functions. For example,

  * Press **‘u’** to show processes owned by a user.
  * **Shift+m** will sort the processes by memory usage.
  * **Shift+p** – Sort the processes by processor usage.
  * **Shit+t** – Sort the processes by time.
  * **CTRL+l** – Refresh screen.



htop can do everything using the shortcut keys without having to mention any options when launching it. However, you can use some flags when starting it.

For example, to start htop displaying only processes owned by given user, run:

```
$ htop -u <username>
```

Change the Output Refresh Interval:

```
$ htop -d 10
```

As you can see, htop usage is incredibly easier than the usage of top command.

Refer htop man pages to know more about the available options and functionalities.

```
$ man htop
```

Also, refer the project home page and HitHub repository.

+ [htop website](http://hisham.hm/htop/)
+ [htop GitHub Repository](https://github.com/hishamhm/htop)

#### 2\. Vtop

**Vtop** is yet another alternative to good-old top utility. It is a free and open source, command-line system activity monitor written in **NodeJS** and released under MIT. It uses unicode braille characters to draw CPU and Memory charts, helping you to visualize spikes.

Make sure you have NodeJS installed on your system. If not installed yet, refer the following guide.

Once node installed, run the following command to install Vtop.

```
$ npm install -g vtop
```

After installing Vtop, simply run vtop to start monitoring.

```
$ vtop
```

Sample output:

![][3]

As you can see, Vtop interface is little bit different than top and htop programs. It displays each details in a separate box layout. You will see all shortcuts keys to interact with Vtop at the bottom.

Here is the list of shortcuts:

  * **dd** – Kill the processes.
  * **UP** arrow or **k** – Move up.
  * **DOWN** arrow or **j** – Move down.
  * **Left** arrow or or **h** to – Zoom the graphs in.
  * **Right** arrow or **l** – Zoom the graphs out.
  * **g** – Jump to top of the process list.
  * **SHIFT+g** – Jump to end of the process list.
  * **c** – Sort processes by CPU usage.
  * **m** – Sort processes by memory usage.



For more details, refer the following Vtop resources.

+ [Vtop website](http://parall.ax/vtop)
+ [Vtop GitHub Repository](https://github.com/MrRio/vtop)


#### 3\. Gtop

Gtop is same as Vtop system activity monitor. It is also written in NodeJS and released under MIT license.

To install it, run:

```
$ npm install gtop -g
```

Start gtop using command:

```
$ gtop
```

Sample output:

![](https://www.ostechnix.com/wp-content/uploads/2018/11/gtop.png)

I noticed Gtop interface is very nice. It showed each elements with different set of colors which is eye-pleasing.

Keyboard shortcuts:

  * **p** – Sort processes by process Id.
  * **c** – Sort processes by CPU usage.
  * **m** – Sort processes by Memory usage.
  * **q** or **ctrl+c** – Quit Gtop.



For more details, visit Gtop GitHub page.

+ [Gtop GitHub Repository](https://github.com/aksakalli/gtop)


#### 4\. Gotop

As the name says, **Gotop** is a TUI graphical activity monitor, written in **Go** programming language. It is completely free, open source and inspired by **gtop** and **vtop** programs which we mentioned in the previous sections. We already have written about it a while ago. If you’re interested to learn about it, please visit the following link.

+ [Gotop – Yet Another TUI Graphical Activity Monitor, Written In Go
](https://www.ostechnix.com/manage-python-packages-using-pip/)

#### 5\. Ptop

Some of you might not like programs written in NodeJS and Go. If you’re one of them, there is another process monitor program named **Ptop** , which is written in **Python** programming language. It is free, open source system activity monitor, released under MIT license.

Ptop is compatible with both Python2.x and Python3.x, so you can easily install it using **Pip** , a package manager to install programs developed in Python. If you haven’t installed Pip yet, refer the following link.

+ [How To Manage Python Packages Using Pip](https://www.ostechnix.com/manage-python-packages-using-pip/)

After installing Pip, run the following command to install ptop.

```
$ pip install ptop
```

Or, you can compile from source as shown below.

```
$ git clone https://github.com/darxtrix/ptop
$ cd ptop/
$ pip install -r requirements.txt # install requirements
$ sudo python setup.py install
```

To update Ptop, run:

```
$ pip install --upgrade ptop
```

Even if you don’t update, Ptop will prompt you if you’d like to update to the latest version when launch it for the first time.

Now, let us run ptop and see what happens.

```
$ ptop
```

Here you go!
![](https://www.ostechnix.com/wp-content/uploads/2018/11/ptop-1.png)
Here is the list of shortcuts keys to interact with ptop:

  * **Ctrl+k** – Kill the process.
  * **Ctrl+n** – Sort processes by memory usage.
  * **Ctrl+t** – Sort processes by process lifetime.
  * **Ctrl+r** – Reset the stats.
  * **Ctrl+f** – Filter a specific process information. Just type process name and you will see its details only.
  * **Ctrl+l** – View the information of a selected process.
  * **g** – Go to the top of the process list.
  * **Ctrl+q** – Quit Ptop.



Ptop has a feature to change the theme. If you want a pretty output of Ptop, you could use any one of the available themes. Currently the following themes are supported:

  * colorful
  * elegant
  * simple
  * dark
  * light



To set a theme, for example colorful, simply run:

```
$ ptop -t colorful
```

To view help section, use **-h** :

```
$ ptop -h
```

For more details, refer the project’s GitHub page.

+ [Ptop Github Repository](https://github.com/darxtrix/ptop)

#### 6\. Hegemon

**Hegemon** is another system activity monitor application written in **Rust** programming language. If you’re fan of programs written in Rust, hegemon might be a good choice. We have published a brief review about Hegemon a while ago. Please visit the following link to know more about this tool.

[Hegemon – A Modular System Monitor Application Written In Rust](https://www.ostechnix.com/hegemon-a-modular-system-monitor-application-written-in-rust/)

### Conclusion

You know now six alternatives to Top program. I won’t claim these programs are better than or best replacement for ‘top’ program. But it is always nice to know some alternatives. I use htop mostly to monitor the processes. Now is your turn. Have you used any tools listed here? Great! Which is your favorite tool and why? Please share your experience in the comment section below.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/some-alternatives-to-top-command-line-utility-you-might-want-to-know/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/the-top-command-tutorial-with-examples-for-beginners/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2018/11/vtop.png
