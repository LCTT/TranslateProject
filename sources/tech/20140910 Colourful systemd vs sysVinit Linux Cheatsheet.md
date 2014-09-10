translating by szrlee
Colourful ! systemd vs sysVinit Linux Cheatsheet
================================================================================
**systemd** is the new init system, starting with Fedora and now adopted in many distributions like RedHat, Suse and Centos. Historically, most of us have been using traditional SysV init scripts normally residing in /etc/rc.d/init.d/. These scripts invoke a daemon binary which will then fork a background process. Even though shell scripts are very flexible, tasks like supervising processes and parallelized execution ordering are difficult to implement. With the introduction of systemd’s new-style daemons it is easier to supervise and control them at runtime and it simplifies their implementation.

The **systemctl** command is a very good initiative by the systemd team. It shows more detailed error messages and also runtime errors of services including start-up errors. systemd have introduced a new term called **cgroups** (control groups) which is basically groups of process that can be arranged in a hierarchy. With the original init system, determining which process does what and who it belongs to becomes increasingly difficult. With systemd, when processes spawn other processes these children are automatically made members of the parents cgroup thus avoiding confusions about inheritance.

![](http://images.linoxide.com/systemd-vs-sysVinit-cheatsheet.jpg)

There are a lot of new [systemd commands available on rhel / centos 7.0][1]注：此文原文已做，文件名是:20140901 Awesome systemd Commands to Manage Linux System.md，如果翻译发布了，可修改此链接 version that would replace sysvinit commands. You can also download [pdf version of the systemd vs sysvinit cheatsheet][2].

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/systemd-vs-sysvinit-cheatsheet/

作者：[Bobbin Zachariah][a]
译者：[szrlee](https://github.com/szrlee)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://linoxide.com/linux-command/linux-systemd-commands/
[2]:http://images.linoxide.com/systemd-vs-sysVinit-cheatsheet.pdf
