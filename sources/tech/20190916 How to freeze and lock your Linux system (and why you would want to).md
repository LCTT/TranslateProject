[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to freeze and lock your Linux system (and why you would want to))
[#]: via: (https://www.networkworld.com/article/3438818/how-to-freeze-and-lock-your-linux-system-and-why-you-would-want-to.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to freeze and lock your Linux system (and why you would want to)
======
What it means to freeze a terminal window and lock a screen -- and how to manage these activities on your Linux system.
Sandra Henry-Stocker

How you freeze and "thaw out" a screen on a Linux system depends a lot on what you mean by these terms. Sometimes “freezing a screen” might mean freezing a terminal window so that activity within that window comes to a halt. Sometimes it means locking your screen so that no one can walk up to your system when you're fetching another cup of coffee and type commands on your behalf.

In this post, we'll examine how you can use and control these actions.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][1] ]**

### How to freeze a terminal window on Linux

You can freeze a terminal window on a Linux system by typing **Ctrl+S** (hold control key and press "s"). Think of the "s" as meaning "start the freeze". If you continue typing commands after doing this, you won't see the commands you type or the output you would expect to see. In fact, the commands will pile up in a queue and will be run only when you reverse the freeze by typing **Ctrl+Q**. Think of this as "quit the freeze".

One easy way to view how this works is to use the date command and then type **Ctrl+S**. Then type the date command again and wait a few minutes before typing **Ctrl+Q**. You'll see something like this:

```
$ date
Mon 16 Sep 2019 06:47:34 PM EDT
$ date
Mon 16 Sep 2019 06:49:49 PM EDT
```

The gap between the two times shown will indicate that the second date command wasn't run until you unfroze your window.

Terminal windows can be frozen and unfrozen whether you're sitting at the computer screen or running remotely using a tool such as PuTTY.

And here's a little trick that can come in handy. If you see that a terminal window appears to be inactive, one possibility is that you or someone else inadvertently typed **Ctrl+S**. In any case, entering **Ctrl+Q** just in case this resolves the problem is not a bad idea.

### How to lock your screen

To lock your screen before you leave your desk, either **Ctrl+Alt+L** or **Super+L** (i.e., holding down the Windows key and pressing L) should work. Once your screen is locked, you will have to enter your password to log back in.

### Automatic screen locking on Linux systems

While best practice suggests that you lock your screen whenever you are about to leave your desk, Linux systems usually automatically lock after a period of no activity. The timing for "blanking" a screen (making it go dark) and actually locking the screen (requiring a login to use it again) depend on settings that you can set to your personal preferences.

To change how long it takes for your screen to go dark when using GNOME screensaver, open your settings window and select **Power** and then **Blank screen**. You can choose times between 1 and 15 minutes or never. To select how long after the blanking the screen locks, go to settings, select **Privacy** and then **Blank screen.** Settings should include 1, 2, 3, 5 and 30 minutes or one hour.

### How to lock your screen from the command line

If you are using Gnome screensaver, you can also lock the screen from the command line using this command:

```
gnome-screensaver-command -l
```

That's a lowercase L for "lock".

### How to check your lockscreen state

You can also use the gnome screensaver command to check whether your screen is locked,. With the **\--query** option, the command tells you whether screen is currently locked (i.e., active). With the --time option, it tells you how long the lock has been in effect. Here's an sample sctipt:

```
#!/bin/bash

gnome-screensaver-command --query
gnome-screensaver-command --time
```

Running the script will show output like this:

```
$ ./check_lockscreen
The screensaver is active
The screensaver has been active for 1013 seconds.
```

#### Wrap-up

Freezing your terminal window is easy if you remember the proper control sequences. For screen locking, how well it works depends on the controls you put in place for yourself or whether you're comfortable working with the defaults.

**[ Also see: [Invaluable tips and tricks for troubleshooting Linux][2] ]**

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438818/how-to-freeze-and-lock-your-linux-system-and-why-you-would-want-to.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[2]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
