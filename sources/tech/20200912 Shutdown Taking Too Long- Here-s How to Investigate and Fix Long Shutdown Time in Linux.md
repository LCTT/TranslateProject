[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Shutdown Taking Too Long? Here’s How to Investigate and Fix Long Shutdown Time in Linux)
[#]: via: (https://itsfoss.com/long-shutdown-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Shutdown Taking Too Long? Here’s How to Investigate and Fix Long Shutdown Time in Linux
======

_**Your Linux system is taking too long to shut down? Here are the steps you can take to find out what is causing the delayed shutdown and fix the issue.**_

I hope you are a tad bit familiar with the [sigterm and sigkill][1] concept.

When you [shut down your Linux system][2], it sends the sigterm and politely asks the running processes to stop. Some processes misbehave and they ignore the sigterm and keep on running.

This could cause a delay to the shutdown process as your system will wait for the running processes to stop for a predefined time period. After this time period, it sends the kill signal to force stop all the remaining running processes and shuts down the system.

In fact, in some cases, you would see a message like ‘a stop job is running’ on the black screen.

If your system is taking too long in shutting down, you can do the following:

  * Check which process/service is taking too long and if you can remove or reconfigure it to behave properly.
  * Change the default waiting period before your system force stops the running processes. [Quick and dirty fix]



I am using Ubuntu here which uses systemd. The commands and steps here are valid for any Linux distribution that uses systemd (most of them do).

![][3]

### Check which processes are causing long shutdown in Linux

If you want to figure out what’s wrong, you should check what happened at the last shutdown. Use this command to get the power of ‘I know what you did last session’ (pun intended):

```
journalctl -rb -1
```

The [journalctl command][4] allows you to read system logs. With options ‘-b -1’ you filter the logs for the last boot session. With option ‘-r’, the logs are shown in reverse chronological order.

In other words, the ‘journalctl -rb -1’ command will show the system logs just before your Linux system was shutdown the last time. This is what you need to analyze the long shutdown problem in Linux.

No journal logs? Here’s what you should do

If there are no journal logs, please make sure that your distribution uses systemd.

Even on some Linux distributions with systemd, the journal logs are not activated by default.

Make sure that /var/log/journal exists. If it doesn’t, create it:

```
sudo mkdir /var/log/journal
```

You should also check the content of /etc/systemd/journald.conf file and make sure that the value of Storage is set to either auto or persistent.

Do you find something suspicious in the logs? Is there a process/service refusing to stop? If yes, investigate if you could remove it without side effects or if you could reconfigure it. Don’t go blindly removing stuff here, please. You should have knowledge of the process.

### Speed up shutdown in Linux by reducing default stop timeout [Quick fix]

The default wait period for the shut down is usually set at 90 seconds. Your system tries to force stop the services after this time period.

If you want your Linux system to shut down quickly, you can change this waiting period.

You’ll find all the systemd settings in the config file located at /etc/systemd/system.conf. This file should be filled with lots of line starting with #. They represent the default values of the entries in the file.

Before you do anything, it will be a good idea to make a copy of the original file.

```
sudo cp /etc/systemd/system.conf /etc/systemd/system.conf.orig
```

Look for DefaultTimeoutStopSec here. It should probably be set to 90 sec.

```
#DefaultTimeoutStopSec=90s
```

You have to change this value to something more convenient like 5 or 10 seconds.

```
DefaultTimeoutStopSec=5s
```

If you don’t know how to edit the config file in terminal, use this command to open the file for editing in your system’s default text editor (like Gedit):

```
sudo xdg-open /etc/systemd/system.conf
```

![Change Shutdown Time Settings Ubuntu][5]

Don’t forget to **remove the # before DefaultTimeoutStopSec**. Save the file and reboot your system.

This should help you reduce the shutdown delay for your Linux system.

Watchdog issue!

Linux has a module named watchdog that is used for monitoring whether certain services are running or not. It could be configured to automatically reboot systems if they are hanged due to software error.

It is unusual to use Watchdog on desktop systems because you can manually shutdown or reboot the system. It is often used on remote servers.

First check watchdog is running:

```
ps -af | grep watch*
```

If watchdog is running on your system, you can change the ShutdownWatchdogSec value from 10 minutes to something lower in the systemd config file /etc/systemd/system.conf.

**Were you able to fix the lengthy shutdown?**

I hope this tutorial helped you in investigating and fixing the long shutdown issue on your system. Do let me know in the comments if you managed to fix it.

--------------------------------------------------------------------------------

via: https://itsfoss.com/long-shutdown-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/sigterm-vs-sigkill/
[2]: https://itsfoss.com/schedule-shutdown-ubuntu/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/troubleshoot-long-shutdown-linux.gif?resize=800%2C450&ssl=1
[4]: https://linuxhandbook.com/journalctl-command/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/change-shutdown-time-settings-ubuntu.png?resize=797%2C322&ssl=1
