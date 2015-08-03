Troubleshooting with Linux Logs
================================================================================
Troubleshooting is the main reason people create logs. Often you’ll want to diagnose why a problem happened with your Linux system or application. An error message or a sequence of events can give you clues to the root cause, indicate how to reproduce the issue, and point out ways to fix it. Here are a few use cases for things you might want to troubleshoot in your logs.

### Cause of Login Failures ###

If you want to check if your system is secure, you can check your authentication logs for failed login attempts and unfamiliar successes. Authentication failures occur when someone passes incorrect or otherwise invalid login credentials, often to ssh for remote access or su for local access to another user’s permissions. These are logged by the [pluggable authentication module][1], or pam for short. Look in your logs for strings like Failed password and user unknown. Successful authentication records include strings like Accepted password and session opened.

Failure Examples:

    pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=10.0.2.2
    Failed password for invalid user hoover from 10.0.2.2 port 4791 ssh2
    pam_unix(sshd:auth): check pass; user unknown
    PAM service(sshd) ignoring max retries; 6 > 3

Success Examples:

    Accepted password for hoover from 10.0.2.2 port 4792 ssh2
    pam_unix(sshd:session): session opened for user hoover by (uid=0)
    pam_unix(sshd:session): session closed for user hoover

You can use grep to find which users accounts have the most failed logins. These are the accounts that potential attackers are trying and failing to access. This example is for an Ubuntu system.

    $ grep "invalid user" /var/log/auth.log | cut -d ' ' -f 10 | sort | uniq -c | sort -nr
    23 oracle
    18 postgres
    17 nagios
    10 zabbix
    6 test

You’ll need to write a different command for each application and message because there is no standard format. Log management systems that automatically parse logs will effectively normalize them and help you extract key fields like username.

Log management systems can extract the usernames from your Linux logs using automated parsing. This lets you see an overview of the users and filter on them with a single click. In this example, we can see that the root user logged in over 2,700 times because we are filtering the logs to show login attempts only for the root user.

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.05.36-AM.png)

Log management systems also let you view graphs over time to spot unusual trends. If someone had one or two failed logins within a few minutes, it might be that a real user forgot his or her password. However, if there are hundreds of failed logins or they are all different usernames, it’s more likely that someone is trying to attack the system. Here you can see that on March 12, someone tried to login as test and nagios several hundred times. This is clearly not a legitimate use of the system.

![](http://www.loggly.com/ultimate-guide/wp-content/uploads/2015/05/Screen-Shot-2015-03-12-at-11.12.18-AM.png)

### Cause of Reboots ###

Sometimes a server can stop due to a system crash or reboot. How do you know when it happened and who did it?

#### Shutdown Command ####

If someone ran the shutdown command manually, you can see it in the auth log file. Here you can see that someone remotely logged in from the IP 50.0.134.125 as the user ubuntu and then shut the system down.

    Mar 19 18:36:41 ip-172-31-11-231 sshd[23437]: Accepted publickey for ubuntu from 50.0.134.125 port 52538 ssh
    Mar 19 18:36:41 ip-172-31-11-231 23437]:sshd[ pam_unix(sshd:session): session opened for user ubuntu by (uid=0)
    Mar 19 18:37:09 ip-172-31-11-231 sudo:   ubuntu : TTY=pts/1 ; PWD=/home/ubuntu ; USER=root ; COMMAND=/sbin/shutdown -r now

#### Kernel Initializing ####

If you want to see when the server restarted regardless of reason (including crashes) you can search logs from the kernel initializing. You’d search for the facility kernel messages and Initializing cpu.

    Mar 19 18:39:30 ip-172-31-11-231 kernel: [    0.000000] Initializing cgroup subsys cpuset
    Mar 19 18:39:30 ip-172-31-11-231 kernel: [    0.000000] Initializing cgroup subsys cpu
    Mar 19 18:39:30 ip-172-31-11-231 kernel: [    0.000000] Linux version 3.8.0-44-generic (buildd@tipua) (gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #66~precise1-Ubuntu SMP Tue Jul 15 04:01:04 UTC 2014 (Ubuntu 3.8.0-44.66~precise1-generic 3.8.13.25)

### Detect Memory Problems ###

There are lots of reasons a server might crash, but one common cause is running out of memory.

When your system is low on memory, processes are killed, typically in the order of which ones will release the most resources. The error occurs when your system is using all of its memory and a new or existing process attempts to access additional memory. Look in your log files for strings like Out of Memory or for kernel warnings like to kill. These strings indicate that your system intentionally killed the process or application rather than allowing the process to crash.

Examples:

    [33238.178288] Out of memory: Kill process 6230 (firefox) score 53 or sacrifice child
    [29923450.995084] select 5230 (docker), adj 0, size 708, to kill

You can find these logs using a tool like grep. This example is for Ubuntu:

    $ grep “Out of memory” /var/log/syslog
     [33238.178288] Out of memory: Kill process 6230 (firefox) score 53 or sacrifice child

Keep in mind that grep itself uses memory, so you might cause an out of memory error just by running grep. This is another reason it’s a fabulous idea to centralize your logs!

### Log Cron Job Errors ###

The cron daemon is a scheduler that runs processes at specified dates and times. If the process fails to run or fails to finish, then a cron error appears in your log files. You can find these files in /var/log/cron, /var/log/messages, and /var/log/syslog depending on your distribution. There are many reasons a cron job can fail. Usually the problems lie with the process rather than the cron daemon itself.

By default, cron jobs output through email using Postfix. Here is a log showing that an email was sent. Unfortunately, you cannot see the contents of the message here.

    Mar 13 16:35:01 PSQ110 postfix/pickup[15158]: C3EDC5800B4: uid=1001 from=<hoover>
    Mar 13 16:35:01 PSQ110 postfix/cleanup[15727]: C3EDC5800B4: message-id=<20150310110501.C3EDC5800B4@PSQ110>
    Mar 13 16:35:01 PSQ110 postfix/qmgr[15159]: C3EDC5800B4: from=<hoover@loggly.com>, size=607, nrcpt=1 (queue active)
    Mar 13 16:35:05 PSQ110 postfix/smtp[15729]: C3EDC5800B4: to=<hoover@loggly.com>, relay=gmail-smtp-in.l.google.com[74.125.130.26]:25, delay=4.1, delays=0.26/0/2.2/1.7, dsn=2.0.0, status=sent (250 2.0.0 OK 1425985505 f16si501651pdj.5 - gsmtp)

You should consider logging the cron standard output to help debug problems. Here is how you can redirect your cron standard output to syslog using the logger command. Replace the echo command with your own script and helloCron with whatever you want to set the appName to.

    */5 * * * * echo ‘Hello World’ 2>&1 | /usr/bin/logger -t helloCron

Which creates the log entries:

    Apr 28 22:20:01 ip-172-31-11-231 CRON[15296]: (ubuntu) CMD (echo 'Hello World!' 2>&1 | /usr/bin/logger -t helloCron)
    Apr 28 22:20:01 ip-172-31-11-231 helloCron: Hello World!

Each cron job will log differently based on the specific type of job and how it outputs data. Hopefully there are clues to the root cause of problems within the logs, or you can add additional logging as needed.

--------------------------------------------------------------------------------

via: http://www.loggly.com/ultimate-guide/logging/troubleshooting-with-linux-logs/

作者：[Jason Skowronski][a1]
作者：[Amy Echeverri][a2]
作者：[Sadequl Hussain][a3]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a1]:https://www.linkedin.com/in/jasonskowronski
[a2]:https://www.linkedin.com/in/amyecheverri
[a3]:https://www.linkedin.com/pub/sadequl-hussain/14/711/1a7
[1]:http://linux.die.net/man/8/pam.d