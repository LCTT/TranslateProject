[#]: subject: (5 reasons sysadmins love systemd)
[#]: via: (https://opensource.com/article/21/4/sysadmins-love-systemd)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

5 reasons sysadmins love systemd
======
Systemd's speed and ease make it a popular way to manage modern Linux
systems.
![Woman sitting in front of her laptop][1]

As systems administrators know, there's a lot happening on modern computers. Applications run in the background, automated events wait to be triggered at a certain time, log files are written, status reports are delivered. Traditionally, these disparate processes have been managed and monitored with a collection of Unix tools to great effect and with great efficiency. However, modern computers are diverse, with local services running alongside containerized applications, easy access to clouds and the clusters they run on, real-time processes, and more data to process than ever.

Having a unified method of managing them is an expectation for users and a useful luxury for busy sysadmins. For this nontrivial task, the system daemon, or **systemd**, was developed and quickly adopted by all major Linux distributions.

Of course, systemd isn't the only way to manage a Linux system. There are many alternative init systems, including sysvinit, OpenRC, runit, s6, and even BusyBox, but systemd treats Linux as a unified data set, meant to be manipulated and queried consistently with robust tools. For a busy systems administrator and many users, the speed and ease of systemd is an important feature. Here are five reasons why.

### Boot management

Booting a Linux computer can be a surprisingly rare event, if you want it to be. Certainly in the server world, uptimes are often counted in _years_ rather than months or weeks. Laptops and desktops tend to be shut down and booted pretty frequently, although even these are as likely to be suspended or hibernated as they are to be shut down. Either way, the time since the most recent boot event can serve as a sort of session manager for a computer health check. It's a useful way to limit what data you look at when monitoring your system or diagnosing problems.

In the likely event that you can't remember the last time you booted your computer, you can list boot sessions with systemd's logging tool, `journalctl`:


```
$ journalctl --list-boots
-42 7fe7c3... Fri 2020-12-04 05:13:59 - Wed 2020-12-16 16:01:23
-41 332e99... Wed 2020-12-16 20:07:39 - Fri 2020-12-18 22:08:13
[...]
-1 e0fe5f... Mon 2021-03-29 20:47:46 - Mon 2021-03-29 21:59:29
 0 37fbe4... Tue 2021-03-30 04:46:13 - Tue 2021-03-30 10:42:08
```

The latest boot sessions appear at the bottom of the list, so you can pipe the output to `tail` for just the latest boots.

The numbers on the left (42, 41, 1, and 0 in this example) are index numbers for each boot session. In other words, to view logs for only a specific boot session, you can use its index number as reference.

### Log reviews

Looking at logs is an important method of extrapolating information about your system. Logs provide a history of much of the activity your computer engages in without your direct supervision. You can see when services launched, when timed jobs ran, what services are running in the background, which activities failed, and more. One of the most common initial troubleshooting steps is to review logs, which is easy to do with `journalctl`:


```
`$ journalctl --pager-end`
```

The `--pager-end` (or `-e` for short) option starts your view of the logs at the end of the `journalctl` output, so you must scroll up to see events that happened earlier.

Systemd maintains a "catalog" of errors and messages filled with records of errors, possible solutions, pointers to support forums, and developer documentation. This can provide important context to a log event, which can otherwise be a confusing blip in a sea of messages, or worse, could go entirely unnoticed. To integrate error messages with explanatory text, you can use the `--catalog` (or `-x` for short) option:


```
`$ journalctl --pager-end --catalog`
```

To further limit the log output you need to wade through, you can specify which boot session you want to see logs for. Because each boot session is indexed, you can specify certain sessions with the `--boot` option and view only the logs that apply to it:


```
`$ journalctl --pager-end --catalog --boot 42`
```

You can also see logs for a specific systemd unit. For instance, to troubleshoot an issue with your secure shell (SSH) service, you can specify `--unit sshd` to see only the logs that apply to the `sshd` daemon:


```
$ journalctl --pager-end \
\--catalog --boot 42 \
\--unit sshd
```

### Service management

The first task for systemd is to boot your computer, and it generally does that promptly, efficiently, and effectively. But the task that's never finished is service management. By design, systemd ensures that the services you want to run do indeed start and continue running during your session. This is nicely robust, because in theory even a crashed service can be restarted without your intervention.

Your interface to help systemd manage services is the `systemctl` command. With it, you can view the unit files that define a service:


```
$ systemctl cat sshd
# /usr/lib/systemd/system/sshd.service
[Unit]
Description=OpenSSH server daemon
Documentation=man:sshd(8) man:sshd_config(5)
After=network.target sshd-keygen.target
Wants=sshd-keygen.target

[Service]
Type=notify
EnvironmentFile=-/etc/crypto-policies/back-ends/opensshserver.config
EnvironmentFile=-/etc/sysconfig/sshd
ExecStart=/usr/sbin/sshd -D $OPTIONS $CRYPTO_POLICY
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=42s

[Install]
WantedBy=multi-user.target
```

Most unit files exist in `/usr/lib/systemd/system/` but, as with many important configurations, you're encouraged to modify them with local changes. There's an interface for that, too:


```
`$ systemctl edit sshd`
```

You can see whether a service is currently active:


```
$ systemctl is-active sshd
active
$ systemctl is-active foo
inactive
```

Similarly, you can see whether a service has failed with `is-failed`.

Starting and stopping services is nicely intuitive:


```
$ systemctl stop sshd
$ systemctl start sshd
```

And enabling a service to start at boot time is simple:


```
`$ systemctl enable sshd`
```

Add the `--now` option to enable a service to start at boot time or to start it for your current session.

### Timers

Long ago, when you wanted to automate a task on Linux, the canonical tool for the job was `cron`. There's still a place for the cron command, but there are also some compelling alternatives. For instance, the [`anacron` command][2] is a versatile, cron-like system capable of running tasks that otherwise would have been missed during downtime.

Scheduled events are little more than services activated at a specific time, so systemd manages a cron-like function called [timers][3]. You can list active timers:


```
$ systemctl list-timers
NEXT                          LEFT      
Tue 2021-03-30 12:37:54 NZDT  16min left [...]
Wed 2021-03-31 00:00:00 NZDT  11h left [...]
Wed 2021-03-31 06:42:02 NZDT  18h left [...]

3 timers listed.
Pass --all to see loaded but inactive timers, too.
```

You can enable a timer the same way you enable a service:


```
`$ systemctl enable myMonitor.timer`
```

### Targets

Targets are the final major component of the systemd matrix. A target is defined by a unit file, the same as services and timers. Targets can also be started and enabled in the same way. What makes targets unique is that they group other unit files in an arbitrarily significant way. For instance, you might want to boot to a text console instead of a graphical desktop, so the `multi-user` target exists. However, the `multi-user` target is only the `graphical` target without the desktop unit files as dependencies.

In short, targets are an easy way for you to collect services, timers, and even other targets together to represent an intended state for your machine.

In fact, within systemd, a reboot, a power-off, or a shut-down action is just another target.

You can list all available targets using the `list-unit-files` option, constraining it with the `--type` option set to `target`:


```
`$ systemctl list-unit-files --type target`
```

### Taking control with systemd

Modern Linux uses systemd for service management and log introspection. It provides everything from personal Linux systems to enterprise servers with a modern mechanism for monitoring and easy maintenance. The more you use it, the more systemd becomes comfortably predictable and intuitive, and the more you discover how disparate parts of your system are interconnected.

To get better acquainted with systemd, you must use it. And to get comfortable with using it, [download our cheat sheet][4] and refer to it often.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/sysadmins-love-systemd

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_4.png?itok=VGZO8CxT (Woman sitting in front of her laptop)
[2]: https://opensource.com/article/21/2/linux-automation
[3]: https://opensource.com/article/20/7/systemd-timers
[4]: https://opensource.com/downloads/linux-systemd-cheat-sheet
