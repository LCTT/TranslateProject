[#]: subject: "Linux su vs sudo: what's the difference?"
[#]: via: "https://opensource.com/article/22/6/linux-su-vs-sudo-sysadmin"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux su vs sudo: what's the difference?
======
A comparison of Linux commands for escalating privileges for non-root users.

![bash logo on green background][1]

Image by: Opensource.com

Both the `su` and the `sudo` commands allow users to perform system administration tasks that are not permitted for non-privileged users—that is, everyone but the root user. Some people prefer the `sudo` command: For example, [Seth Kenlon][2] recently published "[5 reasons to use sudo on Linux][3]", in which he extols its many virtues.

I, on the other hand, am partial to the `su` command and prefer it to `sudo` for most of the system administration work I do. In this article, I compare the two commands and explain why I prefer `su` over `sudo` but still use both.

### Historical perspective of sysadmins

The `su` and `sudo` commands were designed for a different world. Early Unix computers required full-time system administrators, and they used the root account as their only administrative account. In this ancient world, the person entrusted with the root password would log in as root on a teletype machine or CRT terminal such as the DEC VT100, then perform the administrative tasks necessary to manage the Unix computer.

The root user would also have a non-root account for non-root activities such as writing documents and managing their personal email. There were usually many non-root user accounts on those computers, and none of those users needed total root access. A user might need to run one or two commands as root, but very infrequently. Many sysadmins log in as root to work as root and log out of our root sessions when finished. Some days require staying logged in as root all day long. Most sysadmins rarely use `sudo` because it requires typing more than necessary to run essential commands.

These tools both provide escalated privileges, but the way they do so is significantly different. This difference is due to the distinct use cases for which they were originally intended.

### sudo

The original intent of `sudo` was to enable the root user to delegate to one or two non-root users access to one or two specific privileged commands they need regularly. The `sudo` command gives non-root users temporary access to the elevated privileges needed to perform tasks such as adding and deleting users, deleting files that belong to other users, installing new software, and generally any task required to administer a modern Linux host.

Allowing the users access to a frequently used command or two that requires elevated privileges saves the sysadmin a lot of requests from users and eliminates the wait time. The `sudo` command does not switch the user account to become root; most non-root users should never have full root access. In most cases, `sudo` lets a user issue one or two commands then allows the privilege escalation to expire. During this brief time interval, usually configured to be 5 minutes, the user may perform any necessary administrative tasks that require elevated privileges. Users who need to continue working with elevated privileges but are not ready to issue another task-related command can run the `sudo -v` command to revalidate the credentials and extend the time for another 5 minutes.

Using the `sudo` command does have the side effect of generating log entries of commands used by non-root users, along with their IDs. The logs can facilitate a problem-related postmortem to determine when users need more training. (You thought I was going to say something like "assign blame," didn't you?)

### su

The `su` command is intended to allow a non-root user to elevate their privilege level to that of root—in fact, the non-root user becomes the root user. The only requirement is that the user know the root password. There are no limits on this because the user is now logged in as root.

No time limit is placed on the privilege escalation provided by the su command. The user can work as root for as long as necessary without needing to re-authenticate. When finished, the user can issue the exit command to revert from root back to their own non-root account.

### Controversy and change

There has been some recent disagreement about the uses of `su` versus `sudo`.

> Real [Sysadmins] don't use sudo. —Paul Venezia

Venezia contends in his [InfoWorld article][4] that `sudo` is used as an unnecessary prop for many people who act as sysadmins. He does not spend much time defending or explaining this position; he just states it as a fact. And I agree with him—for sysadmins. We don't need the training wheels to do our jobs. In fact, they get in the way.

However,

> The times they are a'changin.' —Bob Dylan

Dylan was correct, although he was not singing about computers. The way computers are administered has changed significantly since the advent of the one-person, one-computer era. In many environments, the user of a computer is also its administrator. This makes it necessary to provide some access to the powers of root for those users.

Some modern distributions, such as Ubuntu and its derivatives, are configured to use the `sudo` command exclusively for privileged tasks. In those distros, it is impossible to log in directly as the root user or even to `su` to root, so the `sudo` command is required to allow non-root users any access to root privileges. In this environment, all system administrative tasks are performed using `sudo`.

This configuration is possible by locking the root account and adding the regular user account(s) to the wheel group. This configuration can be circumvented easily. Try a little experiment on any Ubuntu host or VM. Let me stipulate the setup here so you can reproduce it if you wish. I installed Ubuntu 16.04 LTS1 and installed it in a VM using VirtualBox. During the installation, I created a non-root user, student, with a simple password for this experiment.

Log in as the user student and open a terminal session. Look at the entry for root in the `/etc/shadow` file, where the encrypted passwords are stored.

```
student@ubuntu1:~$ cat /etc/shadow
cat: /etc/shadow: Permission denied
```

Permission is denied, so we cannot look at the `/etc/shadow` file. This is common to all distributions to prevent non-privileged users from seeing and accessing the encrypted passwords, which would make it possible to use common hacking tools to crack those passwords.

Now let's try to `su -` to root.

```
student@ubuntu1:~$ su -
Password: <Enter root password – but there isn't one>
su: Authentication failure
```

This fails because the root account has no password and is locked out. Use the `sudo` command to look at the `/etc/shadow` file.

```
student@ubuntu1:~$ sudo cat /etc/shadow
[sudo] password for student: <enter the student password>
root:!:17595:0:99999:7:::
<snip>
student:$6$tUB/y2dt$A5ML1UEdcL4tsGMiq3KOwfMkbtk3WecMroKN/:17597:0:99999:7:::
<snip>
```

I have truncated the results to show only the entry for the root and student users. I have also shortened the encrypted password so the entry will fit on a single line. The fields are separated by colons (`:` ) and the second field is the password. Notice that the password field for root is a bang, known to the rest of the world as an exclamation point (`!` ). This indicates that the account is locked and that it cannot be used.

Now all you need to do to use the root account as a proper sysadmin is to set up a password for the root account.

```
student@ubuntu1:~$ sudo su -
[sudo] password for student: <Enter password for student>
root@ubuntu1:~# passwd root
Enter new UNIX password: <Enter new root password>
Retype new UNIX password: <Re-enter new root password>
passwd: password updated successfully
root@ubuntu1:~#
```

Now you can log in directly on a console as root or `su` directly to root instead of using `sudo` for each command. Of course, you could just use `sudo su -` every time you want to log in as root, but why bother?

Please do not misunderstand me. Distributions like Ubuntu and their up- and downstream relatives are perfectly fine, and I have used several of them over the years. When using Ubuntu and related distros, one of the first things I do is set a root password so that I can log in directly as root. Other distributions, like Fedora and its relatives, now provide some interesting choices during installation. The first Fedora release where I noticed this was Fedora 34, which I have installed many times while writing an upcoming book.

One of those installation options can be found on the page to set the root password. The new option allows the user to choose "Lock root account" in the way an Ubuntu root account is locked. There is also an option on this page that allows remote SSH login to this host as root using a password, but that only works when the root account is unlocked. The second option is on the page that allows the creation of a non-root user account. One of the options on this page is "Make this user administrator." When this option is checked, the user ID is added to a special group called the wheel group, which authorizes members of that group to use the `sudo` command. Fedora 36 even mentions the wheel group in the description of that checkbox.

More than one non-root user can be set as an administrator. Anyone designated as an administrator using this method can use the `sudo` command to perform all administrative tasks on a Linux computer. Linux only allows the creation of one non-root user during installation, so other new users can be added to the wheel group when created. Existing users can be added to the wheel group by the root user or another administrator directly by using a text editor or the `usermod` command.

In most cases, today's administrators need to do only a few essential tasks such as adding a new printer, installing updates or new software, or deleting software that is no longer needed. These GUI tools require a root or administrative password and will accept the password from a user designated as an administrator.

### How I use su and sudo on Linux

I use both `su` and `sudo`. They each have an important place in my sysadmin toolbox.

I can't lock the root account because I need to use it to run my [Ansible][5] playbooks and the [rsbu][6] Bash program I wrote to perform backups. Both of these need to be run as root, and so do several other administrative Bash scripts I have written. I use the `su` command to switch users to the root user so I can perform these and many other common tasks. Elevating my privileges to root using `su` is especially helpful when performing problem determination and resolution. I really don't want a `sudo` session timing out on me while I am in the middle of my thought process.

I use the `sudo` command for tasks that need root privilege when a non-root user needs to perform them. I set the non-root account up in the sudoers file with access to only those one or two commands needed to complete the tasks. I also use `sudo` myself when I need to run only one or two quick commands with escalated privileges.

### Conclusions

The tools you use don't matter nearly as much as getting the job done. What difference does it make if you use vim or Emacs, systemd or SystemV, RPM or DEB, `sudo` or `su` ? The bottom line here is that you should use the tools with which you are most comfortable and that work best for you. One of the greatest strengths of Linux and open source is that there are usually many options available for each task we need to accomplish.

Both `su` and `sudo` have strengths, and both can be secure when applied properly for their intended use cases. I choose to use both `su` and `sudo` mostly in their historical roles because that works for me. I prefer `su` for most of my own work because it works best for me and my workflow.

Share how you prefer to work in the comments!

This article is taken from Chapter 19 of my book The Linux Philosophy for Sysadmins (Apress, 2018) and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-su-vs-sudo-sysadmin

作者：[David Both][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bash_command_line.png
[2]: https://opensource.com/users/seth
[3]: https://opensource.com/article/22/5/use-sudo-linux
[4]: http://www.infoworld.com/t/unix/nine-traits-the-veteran-unix-admin-276?page=0,0&source=fssr
[5]: https://opensource.com/article/20/10/first-day-ansible
[6]: https://opensource.com/article/17/1/rsync-backup-linux
