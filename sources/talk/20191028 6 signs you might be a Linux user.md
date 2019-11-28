[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 signs you might be a Linux user)
[#]: via: (https://opensource.com/article/19/10/signs-linux-user)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

6 signs you might be a Linux user
======
If you're a heavy Linux user, you'll probably recognize these common
tendencies.
![Tux with binary code background][1]

Linux users are a diverse bunch, but many of us share a few habits. You might not have any of the telltale signs listed in this article, and if you're a new Linux user, you may not recognize many of them... yet.

Here are six signs you might be a Linux user.

### 1\. As far as you know, the world began on January 1, 1970.

There are many rumors about why a Unix computer clock always sets itself back to 1970-01-01 when it resets. But the mundane truth is that the Unix "epoch" serves as a common and simple reference point for synchronization. For example, Halloween is the 304th day of this year in the Julian calendar, but we commonly refer to the holiday as being "on the 31st". We know which 31st we mean because we have common reference points: We know that Halloween is celebrated in October and that October is the 10th month of the year, and we know how many days each preceding month contains. Without these values, we could use traditional methods of timekeeping, such as phases of the moon, to keep track of special seasonal events, but of course, a computer doesn't have that ability.

A computer requires firm and clearly defined values, so the value 1970-01-01T00:00:00Z was chosen as the beginning of the Unix epoch. Any time a [POSIX][2] computer loses track of time, a service like the Network Time Protocol (NTP) can provide it the number of seconds since 1970-01-01T00:00:00Z, which the computer can convert to a human-friendly date.

Date and time are a famously complex thing to track in computing, largely because there are exceptions to nearly standard. A month doesn't always have 30 days, a year doesn't always have 365 days, and even seconds tend to drift a little each year. If you're looking for a fun and frustrating programming exercise, try to program a reliable calendaring application!

### 2\. You think it's a chore to type anything over two letters to get something done.

The most common Unix commands are famously short. In addition to commands like **cd** and **ls** and **mv**, there's one command that literally can't get any shorter: **w** (which shows who is currently logged in according to the **/var/run/utmp** file).

On the one hand, extremely short commands seem unintuitive. A new user probably isn't going to guess that typing **ls** would _list_ directories. Once you learn the commands, though, the shorter they are, the better. If you spend all day in a terminal, the fewer keystrokes you have to type means you can spend more time getting your work done.

Luckily, single-letter commands are far and few between, which means you can use most letters for aliases. For example, I use Emacs often enough that I consider **emacs** too long to type, so I alias it to **e** by adding this line to my **.bashrc** file:


```
`alias e='emacs'`
```

You can also alias commands temporarily. For instance, if you find yourself running [firewall-cmd][3] repeatedly while you troubleshoot a network issue, then you can create an alias just for your current session:


```
$ alias f='firewall-cmd'
$ f
usage: see firewall-cmd man page
No option specified.
```

As long as the terminal is open, your alias persists. Once the terminal is closed, it's forgotten.

### 3\. You think it's a chore to click more than two times to get something done.

Linux users are fond of efficiency. While not every Linux user is always in a hurry to get things done, there are conventions in Linux desktops that seek to reduce the number of actions required to accomplish any given task. Here are some examples.

  * In the KDE file manager Dolphin, a single click opens a file or directory. It's assumed that if you want to select a file, you can either click and drag or else Ctrl+Click instead. This may confuse users who are used to double-clicking everything, but once you've tried single-click actions, you usually can't go back to laborious double-clicks.
  * On most Linux desktops, a middle-click pastes the most recent contents of the clipboard.
  * On many Linux desktops, drag actions can be modified by pressing the Alt, Ctrl, or Shift keys. For instance, Alt+Drag moves a window in KDE, and Ctrl+Drag in GNOME causes a file to be copied instead of moved.



### 4\. You've never performed any action on a computer more than three times because you've already automated it by the third time.

Pardon the hyperbole, but many Linux users expect their computer to work harder than they do. While it takes time to learn how to automate common tasks, it tends to be easier on Linux than on other platforms because the Linux terminal and the Linux operating system are so tightly integrated. The easy things to automate are the actions you already do in a terminal because commands are just strings that you type into an interpreter, and that interpreter (the terminal) doesn't care whether you typed the strings out manually or whether you're just pointing it to a script.

For instance, if you find yourself frequently moving a set of files from one place to another, then you can probably use the same sequence of instructions as a script, which you can trigger with a single command. Imagine you are doing this manually each morning:


```
$ cd Documents
$ trash reports-latest.txt
$ wget myserver.local/reports/daily/report-latest.txt
$ cp report-latest.txt reports_daily/2019-31-10.log
```

It's a simple sequence, but repeating it daily isn't the most efficient way of spending your time. With a little bit of abstraction, you could automate it with a simple script:


```
#!/bin/sh

trash $HOME/Documents/reports-latest.txt

wget myserver.local/reports/daily/report-latest.txt \
-P $HOME/Documents/udpates_daily/`date --iso-8601`.log

cp $HOME/Documents/udpates_daily/`date --iso-8601`.log \
$HOME/Documents/reports-latest.txt
```

You could call your script **get-reports.sh** and launch it manually each morning, or you could even enter it into your crontab so that your computer performs the task without requiring any intervention from you.

This can be confusing for a new user because it's not always obvious what's integrated with what. For instance, if you regularly find yourself opening images and scaling them down by 50%, then you're probably used to doing something like this:

  1. Opening up your photo viewer or editor
  2. Scaling the image
  3. Exporting the image as a modified file
  4. Closing the application



If you did this several times a day, you would probably get tired of the repetition. However, because you perform those actions in the graphical user interface (GUI), you would need to know how to script the GUI to automate it. Some applications, like [GIMP][4], have a rich scripting interface, but the process is obviously different than just adapting a bunch of commands and dumping those into a file.

Then again, sometimes there are command-line equivalents to things you do in a GUI. Converting documents from one text format to another can be done with [Pandoc][5], images can be manipulated with [Image Magick][6], music and video can be edited and converted, and so on. It's a matter of knowing what to look for, and usually learning a new (and sometimes complex) command. Scaling images down, however, is notably simpler in the terminal than in a GUI:


```
#!/bin/sh

convert "${1}" -scale 50% `basename "${1}" .jpg`_50.jpg
```

It's worth investigating those bothersome, repetitious tasks. You never know how simple and fast your work is for a computer to do!

### 5\. You distro hop

I'm an ardent Slackware user at home and a RHEL user at work. Actually, that's not true; I'm a Fedora user at work now. Except when I use CentOS. And there was that time I ran [Mageia][7] for a while.

![Debian on a PowerPC64 box, image CC BY SA Claudio Miranda][8]

Debian on a PowerPC64 box

It doesn't matter how great a distribution is; part of the guilty pleasure of being a Linux user is the freedom to be indecisive about which distro you run. At a glance, they're all basically the same, and that's refreshing. But depending on your mood, you might prefer the stability of CentOS to the constant updates of Fedora, or you might truly enjoy the centralized control center of Mageia one day and then frolic in the modularity of raw [Debian][9] configuration files another. And sometimes you turn to an alternate OS altogether.

![OpenBSD, image CC BY SA Claudio Miranda][10]

OpenBSD, not a Linux distro

The point is, Linux distributions are passion projects, and it's fun to be a part of other people's open source passions.

### 6\. You have a passion for open source.

Regardless of your experience, if you're a Linux user, you undoubtedly have a passion for open source. Whether you express that on a daily basis through [Creative Commons artwork][11] or code or you sublimate it and just get your work done in a liberating (and liberated) environment, you're living in and building upon open source. It's because of you that there's an open source community, and the community is richer for having you as a member.

There are lots of things I haven't mentioned. What else betrays you as a Linux user? Let us know in the comments!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/signs-linux-user

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY (Tux with binary code background)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://www.gimp.org/
[5]: https://opensource.com/article/19/5/convert-markdown-to-word-pandoc
[6]: https://opensource.com/article/17/8/imagemagick
[7]: http://mageia.org
[8]: https://opensource.com/sites/default/files/uploads/debian.png (Debian on a PowerPC64 box)
[9]: http://debian.org
[10]: https://opensource.com/sites/default/files/uploads/openbsd.jpg (OpenBSD)
[11]: http://freesvg.org
