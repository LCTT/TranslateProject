Process Monitoring
======

Since forking the Mon project to [etbemon [1]][1] I've been spending a lot of time working on the monitor scripts. Actually monitoring something is usually quite easy, deciding what to monitor tends to be the hard part. The process monitoring script ps.monitor is the one I'm about to redesign.

Here are some of my ideas for monitoring processes. Please comment if you have any suggestions for how do do things better.

For people who don't use mon, the monitor scripts return 0 if everything is OK and 1 if there's a problem along with using stdout to display an error message. While I'm not aware of anyone hooking mon scripts into a different monitoring system that's going to be easy to do. One thing I plan to work on in the future is interoperability between mon and other systems such as Nagios.

### Basic Monitoring
```
ps.monitor tor:1-1 master:1-2 auditd:1-1 cron:1-5 rsyslogd:1-1 dbus-daemon:1- sshd:1- watchdog:1-2
```

I'm currently planning some sort of rewrite of the process monitoring script. The current functionality is to have a list of process names on the command line with minimum and maximum numbers for the instances of the process in question. The above is a sample of the configuration of the monitor. There are some limitations to this, the "master" process in this instance refers to the main process of Postfix, but other daemons use the same process name (it's one of those names that's wrong because it's so obvious). One obvious solution to this is to give the option of specifying the full path so that /usr/lib/postfix/sbin/master can be differentiated from all the other programs named master.

The next issue is processes that may run on behalf of multiple users. With sshd there is a single process to accept new connections running as root and a process running under the UID of each logged in user. So the number of sshd processes running as root will be one greater than the number of root login sessions. This means that if a sysadmin logs in directly as root via ssh (which is controversial and not the topic of this post - merely something that people do which I have to support) and the master process then crashes (or the sysadmin stops it either accidentally or deliberately) there won't be an alert about the missing process. Of course the correct thing to do is to have a monitor talk to port 22 and look for the string "SSH-2.0-OpenSSH_". Sometimes there are multiple instances of a daemon running under different UIDs that need to be monitored separately. So obviously we need the ability to monitor processes by UID.

In many cases process monitoring can be replaced by monitoring of service ports. So if something is listening on port 25 then it probably means that the Postfix "master" process is running regardless of what other "master" processes there are. But for my use I find it handy to have multiple monitors, if I get a Jabber message about being unable to send mail to a server immediately followed by a Jabber message from that server saying that "master" isn't running I don't need to fully wake up to know where the problem is.

### SE Linux

One feature that I want is monitoring SE Linux contexts of processes in the same way as monitoring UIDs. While I'm not interested in writing tests for other security systems I would be happy to include code that other people write. So whatever I do I want to make it flexible enough to work with multiple security systems.

### Transient Processes

Most daemons have a second process of the same name running during the startup process. This means if you monitor for exactly 1 instance of a process you may get an alert about 2 processes running when "logrotate" or something similar restarts the daemon. Also you may get an alert about 0 instances if the check happens to run at exactly the wrong time during the restart. My current way of dealing with this on my servers is to not alert until the second failure event with the "alertafter 2" directive. The "failure_interval" directive allows specifying the time between checks when the monitor is in a failed state, setting that to a low value means that waiting for a second failure result doesn't delay the notification much.

To deal with this I've been thinking of making the ps.monitor script automatically check again after a specified delay. I think that solving the problem with a single parameter to the monitor script is better than using 2 configuration directives to mon to work around it.

### CPU Use

Mon currently has a loadavg.monitor script that to check the load average. But that won't catch the case of a single process using too much CPU time but not enough to raise the system load average. Also it won't catch the case of a CPU hungry process going quiet (EG when the SETI at Home server goes down) while another process goes into an infinite loop. One way of addressing this would be to have the ps.monitor script have yet another configuration option to monitor CPU use, but this might get confusing. Another option would be to have a separate script that alerts on any process that uses more than a specified percentage of CPU time over it's lifetime or over the last few seconds unless it's in a whitelist of processes and users who are exempt from such checks. Probably every regular user would be exempt from such checks because you never know when they will run a file compression program. Also there is a short list of daemons that are excluded (like BOINC) and system processes (like gzip which is run from several cron jobs).

### Monitoring for Exclusion

A common programming mistake is to call setuid() before setgid() which means that the program doesn't have permission to call setgid(). If return codes aren't checked (and people who make such rookie mistakes tend not to check return codes) then the process keeps elevated permissions. Checking for processes running as GID 0 but not UID 0 would be handy. As an aside a quick examination of a Debian/Testing workstation didn't show any obvious way that a process with GID 0 could gain elevated privileges, but that could change with one chmod 770 command.

On a SE Linux system there should be only one process running with the domain init_t. Currently that doesn't happen in Stretch systems running daemons such as mysqld and tor due to policy not matching the recent functionality of systemd as requested by daemon service files. Such issues will keep occurring so we need automated tests for them.

Automated tests for configuration errors that might impact system security is a bigger issue, I'll probably write a separate blog post about it.

--------------------------------------------------------------------------------

via: https://etbe.coker.com.au/2017/09/28/process-monitoring/

作者：[Andrew][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://etbe.coker.com.au
[1]:https://doc.coker.com.au/projects/etbe-mon/
