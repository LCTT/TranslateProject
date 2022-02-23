[#]: subject: "5 new sudo features sysadmins need to know in 2022"
[#]: via: "https://opensource.com/article/22/2/new-sudo-features-2022"
[#]: author: "Peter Czanik https://opensource.com/users/czanik"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 new sudo features sysadmins need to know in 2022
======
Recent sudo releases added new features that allow you to watch and
control previously hidden problem areas.
![Tools for the sysadmin][1]

When you want to grant administrative access to some of your users while controlling and checking what they do on your systems, you use `sudo`. However, even with `sudo`, there are quite a few unseen issues—just think about giving out shell access. Recent `sudo` releases added features that let you see these issues and even control them. For example, you can turn on more detailed and easier-to-process log messages and log each command executed in a shell session.

Some of these features are brand new. Some of them build on features introduced in version 1.9.0 or even earlier. For example, `sudo` could record everything that happened on a terminal, even in version 1.8. However, the system stored these recordings locally, and they were easy to delete, especially those where the recordings were the most useful: Shell sessions. Version 1.9.0 added central session recording collection, so recordings cannot be deleted by the local user, and recent versions added relays, making the collection even more robust.

If you only know the basics of `sudo` or used only version 1.8 previously, I recommend reading my previous [article][2].

### 1\. JSON-formatted logging

The first new feature I want to introduce is JSON-formatted logging. I am a logging fanatic (I started working on the `syslog-ng` project twelve years ago), and this feature is the first one introduced since my Opensource.com article. When enabled, `sudo` logs a lot more information and does it in an easier way to parse.

Traditional `syslog` messages by `sudo` are short and contain only the minimum amount of necessary information. This is due to constraints by old `syslog` implementations: Messages over 1k size were discarded or truncated:


```
`Jan 28 13:56:27 localhost.localdomain sudo[10419]: czanik : TTY=pts/0 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash`
```

More recent `syslog` implementations can handle much larger message sizes. `syslog-ng` accepts log messages up to 64k in size by default (but of course, it can be smaller or larger, depending on the actual configuration).

The same event contains a lot more information if logged in JSON format. More does not mean more difficult to handle: JSON-formatted messages are easier to parse by many log management software applications. Here is an example:


```
`Jan 28 13:58:20 localhost.localdomain sudo[10518]: @cee:{"sudo":{"accept":{"uuid":"616bc9efcf-b239-469d-60ee-deb5af8ce6","server_time":{"seconds":1643374700,"nanoseconds":222446715,"iso8601":"20220128125820Z","localtime":"Jan 28 13:58:20"},"submit_time":{"seconds":1643374700,"nanoseconds":209935349,"iso8601":"20220128125820Z","localtime":"Jan 28 13:58:20"},"submituser":"czanik","command":"/bin/bash","runuser":"root","runcwd":"/home/czanik","ttyname":"/dev/pts/0","submithost":"localhost.localdomain","submitcwd":"/home/czanik","runuid":0,"columns":118,"lines":60,"runargv":["/bin/bash"],"runenv":["LANG=en_US.UTF-8","HOSTNAME=localhost.localdomain","SHELL=/bin/bash","TERM=xterm-256color","PATH=/home/czanik/.local/bin:/home/czanik/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin","MAIL=/var/mail/root","LOGNAME=root","USER=root","HOME=/root","SUDO_COMMAND=/bin/bash","SUDO_USER=czanik","SUDO_UID=1000","SUDO_GID=1000"]}}}`
```

You can enable JSON-formatted log messages in the `sudoers` file:


```
`Defaults log_format=json`
```

You can learn more about how to work with JSON-formatted log messages from `sudo` from my [syslog-ng][3] blog.

### 2\. Collecting logs centrally using sudo_logsrvd

Another logging-related feature in 1.9.4 is collecting all `sudo` log messages (including failures) using `sudo_logsrvd`. Previously, the system only logged successful sessions when `sudo_logsrvd` actually made a recording. Logging is still done through `syslog` by default in the end.

Why is this important? First of all, you can collect anything related to `sudo` in one place: Both the session recordings and all the corresponding log messages. Secondly, it can also guarantee proper logging of all `sudo`-related events, as `sudo` can refuse to execute commands if `sudo_logsrvd` is inaccessible.

You can enable logging to `sudo_logsrvd` with the following setting in the `sudoers` file (of course, replace the IP address):


```
`Defaults log_servers=172.16.167.150`
```

If you want JSON-formatted log messages, you need the following setting in the `[eventlog]` section of the `sudo_logsrvd` configuration:


```
`log_format = json`
```

Otherwise, `sudo_logsrvd` uses the traditional `sudo` log format with a simple modification: It also includes information about the host where the log comes from:


```


Nov 18 12:40:16 centos8splunk.localdomain sudo[21028]:   czanik : 3 incorrect password attempts ; HOST=centos7sudo.localdomain ; TTY=pts/0 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash
Nov 18 12:40:23 centos8splunk.localdomain sudo[21028]:   czanik : HOST=centos7sudo.localdomain ; TTY=pts/0 ; PWD=/home/czanik ; USER=root ; TSID=00000A ; COMMAND=/bin/bash
Nov 18 12:40:30 centos8splunk.localdomain sudo[21028]:   czanik : command rejected by I/O plugin ; HOST=centos7sudo.localdomain ; TTY=pts/0 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash

```

### 3\. Relays

When they originally introduced `sudo_logsrvd` (version 1.9.0) for central session recording collection, clients could only send recordings directly. Version 1.9.7 introduced the concept of relays. With relays, instead of sending recordings directly, you can send recordings to multiple levels of intermediate hosts, which structure your network.

Why is this important? First of all, relays make it possible to collect session recordings even if the central host is unavailable due to network problems or maintenance. By default, `sudo` refuses to run when it cannot send recordings, so relays can ensure that you can use `sudo` around the clock.

Secondly, it also allows you to have stricter controls on your network: Instead of opening up the firewall for all hosts to the central `sudo_logsrvd`, you only need to allow your relay through.

Finally, it allows you to collect session recordings from networks without direct internet access, like AWS private networks, where you can install `sudo_logsrvd` in relay mode on the gateway host.

When you use relays, configuring the `sudo` clients and the central `sudo_logsrvd` remains the same. On the relay host, add the following line to the `[relay]` section of `sudo_logsrvd.conf`:


```
`relay_host = 172.16.167.161`
```

If the network connection towards the central server is known to be problematic, you can configure the relay to store recordings before forwarding them:


```
`store_first = true`
```

### 4\. Logging subcommands

Did you ever want to know what happens within a shell session started through `sudo`? Yes, session recordings are there, but watching hours of recordings just to see a couple of commands executed is boring and a huge waste of time. Luckily, version 1.9.8 introduced logging subcommands. Now it is enough to check your log messages regularly and watch recordings only when something suspicious occurs.

You do not even need a rule to allow shell access to have shell access, just access to an editor. Most editors can run external commands. My favorite editor is JOE, and this is what you can see when I start it through `sudo`:


```
`Aug 30 13:03:00 czplaptop sudo[10150]:   czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/joe`
```

Nothing interesting, just an editor—even if I spawn a shell and delete a few files and partitions from that shell. Now let us see what happens when you enable logging subcommands:


```


Aug 30 13:13:14 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/joe
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/sh -c /bin/bash
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/bin/bash
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/readlink /proc/10889/exe
[...]
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/sed -r s@/*:|([^\\\\]):@\1\n@g;H;x;s@/\n@\n@
Aug 30 13:13:37 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/tty
Aug 30 13:13:42 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/id
Aug 30 13:13:56 czanik : TTY=pts/1 ; PWD=/home/czanik ; USER=root ; COMMAND=/usr/bin/ls -A -N --color=none -T 0 /usr/share/syslog-ng/include/scl/

```

I omitted dozens of lines to save some space, but you can still see that I started a shell, and the commands executed by `bash_profile` are also available in the logs.

You can enable logging subcommands in the `sudoers` file using the following setting:


```
`Defaults log_subcmds`
```

In the traditional `sudo` logs, you can see from the `sudo` process id that these logs are from the very same `sudo` session. If you turn on JSON-formatted logging, as shown earlier, `sudo` logs a lot more information in the logs, making it easier to analyze them.

### 5\. Intercepting subcommands

Logging subcommands removes most hidden problem areas from `sudo`, but there are situations when you do not want just to watch what is happening but also control the flow of events. For example, you need to give shell access to a user but still want to prevent them from running a specific command. Interception is ideal in such cases. There are, of course, some limitations, like you cannot limit the built-in commands of shells.

Let's say the `who` command is dangerous. You can enable interception in two steps: The first one enables it, the second one configures it. In this case, my user is not allowed to run `who`:


```


Defaults intercept
czanik ALL = (ALL) ALL, !/usr/bin/who

```

Here is what happens when I start a root shell session through `sudo` and try to run `who`:


```


$ sudo -s
# who
Sorry, user czanik is not allowed to execute '/usr/bin/who' as root on czplaptop.
bash: /usr/bin/who: Permission denied

```

You can easily disable running shells altogether:


```


Defaults intercept
Cmnd_Alias SHELLS=/usr/bin/bash, /usr/bin/sh, /usr/bin/csh
czanik ALL = (ALL) ALL, !SHELLS

```

However, it also means that you cannot start shell sessions through `sudo`. Not just that, but you cannot execute external commands from editors either. This is what happens when I try to start the `ls` command from within `vi`:


```


$ sudo vi /etc/issue
Sorry, user czanik is not allowed to execute '/bin/bash -c /bin/ls' as root on czplaptop.
Cannot execute shell /bin/bash
Press ENTER or type command to continue

```

### What is next?

I hope that reading my article makes you want to try these new features yourself. You can install the latest `sudo` on many Linux distributions and UNIX variants from your package manager, or use a binary installer available on the [Sudo website][4].

This article provides you with just an overview of new possibilities. If you want to learn more about these features, visit the website, which hosts manual pages, and also the [Sudo blog][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/new-sudo-features-2022

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_sysadmin_cloud.png?itok=sUciG0Cn (Tools for the sysadmin)
[2]: https://opensource.com/article/20/10/sudo-19
[3]: https://www.syslog-ng.com/community/b/blog/posts/working-with-json-logs-from-sudo-in-syslog-ng
[4]: https://www.sudo.ws/getting/packages
[5]: https://www.sudo.ws/posts
