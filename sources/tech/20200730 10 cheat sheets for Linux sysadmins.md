[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 cheat sheets for Linux sysadmins)
[#]: via: (https://opensource.com/article/20/7/sysadmin-cheat-sheets)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

10 cheat sheets for Linux sysadmins
======
These quick reference guides make sysadmins' lives and daily tasks
significantly easier, and they're all freely available.
![People work on a computer server with devices][1]

When you're a systems administrator, you don't just have one job; you have ALL the jobs, and often each one is on-demand with little to no warning. Unless you do a task every day, you may not always have all the commands and options you need in mind when you need them. And that's why I love cheat sheets.

Cheat sheets help you avoid silly mistakes, they keep you from having to look through pages of documentation, and they keep you moving efficiently through your tasks. I've selected my favorite 10 cheat sheets for any sysadmin, regardless of experience level.

### Networking

Our [Linux networking][2] cheat sheet is like the swiss army knife of cheat sheets. It contains gentle reminders for the most common networking commands, including `nslookup`, `tcpdump`, `nmcli`, `netstat`, `traceroute`, and more. Most importantly, it uses `ip` so you can finally stop defaulting to `ifconfig`!

### Firewall

There are two groups of sysadmins—those who understand iptables and those who use iptables config files written by the first group. If you're a member of that first group, you can keep using your iptables configurations with or without [firewalld][3].

If you're a member of the second group, you can finally set aside your iptables anxiety and embrace the ease of firewalld. Go read [Secure your Linux network with firewall-cmd][4], and then download our [firewalld cheat sheet][5] to remember what you learned. Protecting your network ports has never been easier.

### SSH

Many sysadmins live in a [POSIX][6] shell, so it's no surprise that one of the most important tools on Linux is a remote shell they can run on someone else's computer. Anyone learning server administration usually gets acquainted with SSH pretty early, but many of us learn only the basics.

Sure, SSH can open an interactive shell on a remote machine, but there's a lot more to it than that. For instance, say you need a graphical login on a remote machine. The user of the remote host is either away from the keyboard or else can't seem to understand your instructions for enabling VNC. As long as you have SSH access, you can open the port for them:


```
$ ssh -L 5901:localhost:5901 &lt;remote_host&gt;
```

Learn about that, and more, with our [SSH cheat sheet][7].

### Linux users and permissions

Traditional user accounts in the style of mainframes and UNIX supercomputers have largely been replaced now by systems such as Samba, LDAP, and OpenShift. That doesn't change the need, however, for careful admin and services account management. For that, you still need to be familiar with commands like `useradd`, `usermod`, `chown`, `chmod`, `passwd`, `gpasswd`, `umask`, and others.

Keep my [users and permissions cheat sheet][8] handy, and you'll always have a sensible overview of tasks related to user management, and example commands demonstrating the correct syntax for whatever you need to do.

### Essential Linux commands

Not all sysadmins spend all their time in a terminal. Whether you just prefer a desktop for your work, and you're just starting out on Linux, sometimes it's nice to have a task-oriented reference for common terminal commands.

It's difficult to capture everything you might need for an interface designed for flexibility and improvisation, but my [common commands cheat sheet][9] is pretty comprehensive. Modeled after a typical day in the life of any technically-inclined desktop user, this cheat sheet covers navigating your computer with text, finding absolute paths to files, copying and renaming files, making directories, starting system services, and more.

### Git

At one point in the history of computers, revision control was something only developers needed. But that was then, and Git is now. Version control is an important tool for anyone looking to track changes to anything from Bash scripts to configuration files, documentation, and code. Git is applicable to everyone, including programmers site reliability engineers (SRE), and even sysadmins.

Get our [Git cheat sheet][10] to learn the essentials, the basic workflow, and the most important Git flags.

### Curl

Curl isn't necessarily a tool specific to sysadmins; it's technically "just" a non-interactive web browser for the terminal. You might go days without using it. And yet, chances are strong that you'll find Curl useful for something you do on a daily basis, whether it's a way to quickly reference some information on a website, to troubleshoot a web host, or to verify an important API you either run or rely upon.

Curl is a command to transfer data to and from a server, and it supports protocols including HTTP, FTP, IMAP, LDAP, POP3, SCP, SFTP, SMB, SMTP, and more. It's a vital networking tool, so download our [cheat sheet][11] and start exploring Curl.

### SELinux

Linux security policies are good by default, with strong separation between root and user privileges, but SELinux improves upon that using a labeling system. On a host configured with SELinux, every process and every file object (or directory, network port, device, and so on) has a label. SELinux provides a set of rules to control the access of a process label to an object (like a file) label.

Sometimes you need to adjust SELinux policies, or debug something that didn't get set properly upon install, or gain insight into current policies. Our [SELinux cheat sheet][12] can help.

### Kubectl

Whether you've moved into an open hybrid cloud, a closed cloud, or you're still investigating what such a move will take, you need to know Kubernetes. While the cloud does still need people to wrangle physical servers, your future as a sysadmin is definitely going to involve containers, and nothing does that better than Kubernetes.

While [OpenShift][13] provides a smooth "dashboard" experience for Kubernetes, sometimes a direct approach is necessary, which is exactly what `kubectl` provides. Next time you have to push containers around, make sure you have our [kubectl cheat sheet][14] on hand.

### awk

Linux has seen a lot of innovation in recent years; there have been virtual machines, containers, new security models, new init systems, clouds, and much more. And yet some things never seem to change. Particularly, a sysadmin's need to parse and isolate information from log files and other endless streams of data. There's still no better tool better suited for the job than Aho, Weinberger, and Kernighan's classic `awk` command.

Of course, awk has come a long way since it was written way back in 1977, with new options and features to make it even easier to use. But if you don't use awk every day, all the options and syntax can be a little overwhelming. Download our [awk cheat sheet][15] for the executive summary of how GNU awk works.

### Bonus: Bash scripting

Cheat sheets are useful, but if you're looking for something a little more comprehensive, you can download our [Bash scripting book][16]. This guide teaches you how to combine all the commands you know from cheat sheets and experience into scripts, helping you build an arsenal of on-call, automated solutions to solve your everyday problems. It's packed with detailed explanations of how Bash works, how scripting is different from interactive commands, how to catch errors, and much more.

### Enabling sysadmins

Are you a sysadmin?
Are you on your way to becoming one?
Are you curious about what sysadmins do all day?

If so, check out [Enable Sysadmin][17] for new articles from the industry's hardest working systems administrators about what they do and how Linux and open source make it all possible.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/sysadmin-cheat-sheets

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server with devices)
[2]: https://opensource.com/downloads/cheat-sheet-networking
[3]: https://firewalld.org/
[4]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[5]: https://opensource.com/downloads/firewall-cheat-sheet
[6]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[7]: https://opensource.com/downloads/advanced-ssh-cheat-sheet
[8]: https://opensource.com/downloads/linux-permissions-cheat-sheet
[9]: https://opensource.com/downloads/linux-common-commands-cheat-sheet
[10]: https://opensource.com/downloads/cheat-sheet-git
[11]: https://opensource.com/downloads/curl-command-cheat-sheet
[12]: https://opensource.com/downloads/cheat-sheet-selinux
[13]: https://opensource.com/tags/openshift
[14]: https://opensource.com/downloads/kubectl-cheat-sheet
[15]: https://opensource.com/downloads/cheat-sheet-awk-features
[16]: https://opensource.com/downloads/bash-scripting-ebook
[17]: http://redhat.com/sysadmin
