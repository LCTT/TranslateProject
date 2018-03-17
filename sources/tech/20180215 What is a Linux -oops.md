translating----geekpi

What is a Linux 'oops'?
======
If you check the processes running on your Linux systems, you might be curious about one called "kerneloops." And that’s “kernel oops,” not “kerne loops” just in case you didn’t parse that correctly.

Put very bluntly, an “oops” is a deviation from correct behavior on the part of the Linux kernel. Did you do something wrong? Probably not. But something did. And the process that did something wrong has probably at least just been summarily knocked off the CPU. At worst, the kernel may have panicked and abruptly shut the system down.

For the record, “oops” is NOT an acronym. It doesn’t stand for something like “object-oriented programming and systems” or “out of procedural specs”; it actually means “oops” like you just dropped your glass of wine or stepped on your cat. Oops! The plural of "oops" is "oopses."

An oops means that something running on the system has violated the kernel’s rules about proper behavior. Maybe the code tried to take a code path that was not allowed or use an invalid pointer. Whatever it was, the kernel — always on the lookout for process misbehavior — most likely will have stopped the particular process in its tracks and written some messages about what it did to the console, to /var/log/dmesg or the /var/log/kern.log file.

An oops can be caused by the kernel itself or by some process that tries to get the kernel to violate its rules about how things are allowed to run on the system and what they're allowed to do.

An oops will generate a crash signature that can help kernel developers figure out what went wrong and improve the quality of their code.

The kerneloops process running on your system will probably look like this:
```
kernoops 881 1 0 Feb11 ? 00:00:01 /usr/sbin/kerneloops

```

You might notice that the process isn't run by root, but by a user named "kernoops" and that it's accumulated extremely little run time. In fact, the only task assigned to this particular user is running kerneloops.
```
$ sudo grep kernoops /etc/passwd
kernoops:x:113:65534:Kernel Oops Tracking Daemon,,,:/:/bin/false

```

If your Linux system isn't one that ships with kerneloops (like Debian), you might consider adding it. Check out this [Debian page][1] for more information.

### When should you be concerned about an oops?

An oops is not a big deal, except when it is. It depends in part on the role that the particular process was playing. It also depends on the class of oops.

Some oopses are so severe that they result in system panics. Technically speaking, a panic is a subset of the oops (i.e., the more serious of the oopses). A panic occurs when a problem detected by the kernel is bad enough that the kernel decides that it (the kernel) must stop running immediately to prevent data loss or other damage to the system. So, the system then needs to be halted and rebooted to keep any inconsistencies from making it unusable or unreliable. So a system that panics is actually trying to protect itself from irrevocable damage.

In short, all panics are oops, but not all oops are panics.

The /var/log/kern.log and related rotated logs (/var/log/kern.log.1, /var/log/kern.log.2 etc.) contain the logs produced by the kernel and handled by syslog.

The kerneloops program collects and by default submits information on the problems it runs into <http://oops.kernel.org/> where it can be analyzed and presented to kernel developers. Configuration details for this process are specified in the /etc/kerneloops.conf file. You can look at the settings easily with the command shown below:
```
$ sudo cat /etc/kerneloops.conf | grep -v ^# | grep -v ^$
[sudo] password for shs:
allow-submit = ask
allow-pass-on = yes
submit-url = http://oops.kernel.org/submitoops.php
log-file = /var/log/kern.log
submit-pipe = /usr/share/apport/kernel_oops

```

In the above (default) settings, information on kernel problems can be submitted, but the user is asked for permission. If set to allow-submit = always, the user will not be asked.

Debugging kernel problems is one of the finer arts of working with Linux systems. Fortunately, most Linux users seldom or never experience oops or panics. Still, it's nice to know what processes like kerneloops are doing on your system and to understand what might be reported and where when your system runs into a serious kernel violation.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3254778/linux/what-is-a-linux-oops.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://packages.debian.org/stretch/kerneloops
