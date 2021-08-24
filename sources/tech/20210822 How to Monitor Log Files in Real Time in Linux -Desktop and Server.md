[#]: subject: "How to Monitor Log Files in Real Time in Linux [Desktop and Server]"
[#]: via: "https://www.debugpoint.com/2021/08/monitor-log-files-real-time/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Monitor Log Files in Real Time in Linux [Desktop and Server]
======
This tutorial explains how you can monitor Linux log files (desktop,
server or applications) in real time for diagnosis and troubleshooting
purpose.Basic SyntaxUsage
When you ran into problems in your Linux desktop, or server or any application, you first look into the respective log files. The log files are generally a stream of text and messages from applications with a timestamp attached to it. It helps you to narrow down specific instances and helps you find the cause of any problem. It can also help to get assistance from the web as well.

In general, all log files are located in /var/log. This directory contains log files with extension .log for specific applications, services, and it also contains separate other directories which contains their log files.

![log files in var-log][1]

So, that said, if you want to monitor a bunch of log files Or, a specific one – here’s are some ways how you can do it.

### Monitor Log Files in real time – Linux

#### Using tail command

Using the tail command is the most basic way of following a log file in real time. Specially, if you are in a server with only just a terminal, no GUI. This is very helpful.

Examples:

```
tail /path/to/log/file
```

![Monitoring multiple log files via tail][2]

Use the switch -f to follow the log file, which updates in real time. For example, if you want to follow syslog, you can use the following command.

```
tail -f /var/log/syslog
```

You can monitor multiple log files using a single command using –

```
tail -f /var/log/syslog /var/log/dmesg
```

If you want to monitor http or sftp or any server, you can also their respective log files in this command.

Remember, above commands requires admin privileges.

#### Using lnav (The Logfile Navigator)

![lnav Running][3]

The lnav is a nice utility which you can use to monitor log files in a more structured way with color coded messages. This is not installed by default in Linux systems. You can install it using the below command:

```
sudo apt install lnav (Ubuntu)
sudo dnf install lnav (Fedora)
```

The good thing about lnav is, if you do not want to install it, you can just download its pre-compiled executable and run in anywhere. Even from a USB stick. No setup is required, plus loaded with features. Using lnav you can query the log files via SQL among other cool features which you can learn on it [official website][4].

[][5]

SEE ALSO:   This App is An Advanced Log File Viewer - lnav

Once installed, you can simply run lnav from terminal with admin privilege, and it will show all the logs from /var/log by default and start monitoring in real time.

#### A note about journalctl of systemd

All modern Linux distributions today use systemd, mostly. The systemd provides basic framework and components which runs Linux operating system in general. The systemd provides journal services via journalctl which helps to manage logs from all systemd services. You can also monitor respective systemd services and logs in real time using the following command.

```
journalctl -f
```

Here are some of the specific journalctl commands which you can use for several cases. You can combine these with -f switch above to start monitoring in real time.

  * To emergency system messages use



```
journalctl -p 0
```

  * Show errors with explanations



```
journalctl -xb -p 3
```

  * Use time controls to filter out



```
journalctl --since "2020-12-04 06:00:00"
journalctl --since "2020-12-03" --until "2020-12-05 03:00:00"
journalctl --since yesterday
journalctl --since 09:00 --until "1 hour ago"
```

If you want to learn more about and want to find out details about journalctl – I have written a [guide here][6].

### Closing Notes

I hope these commands and tricks helps you find out the root cause of your problem/errors in your desktop or servers. For more details, you can always refer to the man pages and play around with various switches. Let me know using the comment box below, if you have any comments or what do you think about this article.

Cheers.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/monitor-log-files-real-time/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/log-files-in-var-log-1024x312.jpeg
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/Monitoring-multiple-log-files-via-tail-1024x444.jpeg
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/lnav-Running-1024x447.jpeg
[4]: https://lnav.org/features
[5]: https://www.debugpoint.com/2016/11/advanced-log-file-viewer-lnav-ubuntu-linux/
[6]: https://www.debugpoint.com/2020/12/systemd-journalctl/
