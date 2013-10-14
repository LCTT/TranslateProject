翻译中
Mastering the “Kill” Command in Linux
================================================================================
It doesn’t matter which operating system you are using, you will surely come across a misbehaving application that lock itself up and refuse to close. In Linux (and Mac), there is this “kill” command that you can use to terminate the application forcefully. In this tutorial, we will show you the various way you can make use of the “kill” command to terminate an application.

**Kill Commands and Signals**

When you execute a “kill” command, you are in fact sending a signal to the system to instruct it to terminate the misbehaving app. There is a total of 60 signals that you can use, but all you really need to know is SIGTERM (15) and SIGKILL (9).

You can view all the signals with the command:

    kill -l

![](http://i1.wp.com/imagecdn5.maketecheasier.com/2013/10/kill-list-signal.png)

- SIGTERM – This signal requests a process to stop running. This signal can be ignored. The process is given time to gracefully shutdown. When a program gracefully shuts down, that means it is given time to save its progress and release resources. In other words, it is not forced to stop.
- SIGKILL – The SIGKILL signal forces the process to stop executing immediately. The program cannot ignore this signal. Unsaved progress will be lost.

The syntax for using “kill” is:

    kill [signal or option] PID(s)

The default signal (when none is specified) is SIGTERM. When that doesn’t work, you can use the following to kill a process forcefully:

    kill SIGKILL PID

or

    kill -9 PID

where the “-9” flag refers to SIGKILL signal.

If you are not aware of the PID of the application, simply run the command:

    ps ux

and it will display all the running applications together with its PID.

![](http://i1.wp.com/imagecdn5.maketecheasier.com/2013/10/kill-find-pid.png)

For example, to kill the Chrome app, I will run the command:

    kill -9 3629

Do also note that you can kill multiple processes at the same time.

    kill -9 PID1 PID2 PID 3

**PKill**

The “pkill” command allows the use of extended regular expression patterns and other matching criteria. Instead of using PID, you can now kill application by entering their process name. For example, to kill Firefox browser, just run the command:

    pkill firefox

As it matches regular expression pattern, you can also enter partial name of the process, such as:

    pkill fire

To avoid killing the wrong processes, you might want to do a “pgrep -l [process name]” to list the matching processes.

![](http://i0.wp.com/imagecdn5.maketecheasier.com/2013/10/kill-pgrep-command.png)

**Killall**

Killall uses the process name as well instead of PID, and it kills all instance of the process with the same name. For example, if you are running multiple instances of Firefox browser, you can kill them all with the command:

    killall firefox

In Gnome, you can restart Nautilus by using the command:

    killall nautilus

**xkill**

Xkill is a graphical way to kill an application. When you type “xkill” in the terminal, your mouse cursor will instantly become a “cross”. All you have to do is to click the “cross” at the misbehaving app and it will kill the application instantly. If you are keen, you can also add a [keyboard shortcut to activate the xkill][1] function.

**Conclusion**

When apps misbehave and cause the system to hang, it is very tempting to restart the computer and start the session all over again. With these “kill” commands, you will be able to better manage the misbehaving apps without them causing the system to crash. This is especially useful for a server when you don’t want a misbehaving process to bring the whole server down.

--------------------------------------------------------------------------------

via: http://www.maketecheasier.com/kill-command-in-linux/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.maketecheasier.com/quick-tips/kill-unresponsive-application-in-ubuntu/
