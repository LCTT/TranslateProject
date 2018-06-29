Migrating to Linux: Using Sudo
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ray-hennessy-233438-unsplash.jpg?itok=d4l7QUtF)

This article is the fifth in our series about migrating to Linux. If you missed earlier ones, you can catch up here:

[Part 1 - An Introduction][1]

[Part 2 - Disks, Files, and Filesystems][2]

[Part 3 - Graphical Environments][3]

[Part 4 - The Command Line][4]

You may have been wondering about Linux for a while. Perhaps it's used in your workplace and you'd be more efficient at your job if you used it on a daily basis. Or, perhaps you'd like to install Linux on some computer equipment you have at home. Whatever the reason, this series of articles is here to make the transition easier.

Linux, like many other operating systems supports multiple users. It even supports multiple users being logged in simultaneously.

User accounts are typically assigned a home directory where files can be stored. Usually this home directory is in:
```
/home/<login name>

```

This way, each user has their own separate location for their documents and other files.

### Admin Tasks

In a traditional Linux installation, regular user accounts don't have permissions to perform administrative tasks on the system. And instead of assigning rights to each user to perform various tasks, a typical Linux installation will require a user to log in as the admin to do certain tasks.

The administrator account on Linux is called root.

### Sudo Explained

Historically, to perform admin tasks, one would have to login as root, perform the task, and then log back out. This process was a bit tedious, so many folks logged in as root and worked all day long as the admin. This practice could lead to disastrous results, for example, accidentally deleting all the files in the system. The root user, of course, can do anything, so there are no protections to prevent someone from accidentally performing far-reaching actions.

The sudo facility was created to make it easier to login as your regular user account and occasionally perform admin tasks as root without having to login, do the task, and log back out. Specifically, sudo allows you to run a command as a different user. If you don't specify a specific user, it assumes you mean root.

Sudo can have complex settings to allow users certain permissions to use sudo for some commands but not for others. Typically, a desktop installation will make it so the first account created has full permissions in sudo, so you as the primary user can fully administer your Linux installation.

### Using Sudo

Some Linux installations set up sudo so that you still need to know the password for the root account to perform admin tasks. Others, set up sudo so that you type in your own password. There are different philosophies here.

When you try to perform an admin task in the graphical environment, it will usually open a dialog box asking for a password. Enter either your own password (e.g., on Ubuntu), or the root account's password (e.g., Red Hat).

When you try to perform an admin task in the command line, it will usually just give you a "permission denied" error. Then you would re-run the command with sudo in front. For example:
```
systemctl start vsftpd
Failed to start vsftpd.service: Access denied

sudo systemctl start vsftpd
[sudo] password for user1:

```

### When to Use Sudo

Running commands as root (under sudo or otherwise) is not always the best solution to get around permission errors. While will running as root will remove the "permission denied" errors, it's sometimes best to look for the root cause rather than just addressing the symptom. Sometimes files have the wrong owner and permissions.

Use sudo when you are trying to perform a task or run a program and the program requires root privileges to perform the operation. Don't use sudo if the file just happens to be owned by another user (including root). In this second case, it's better to set the permission on the file correctly.

Learn more about Linux through the free ["Introduction to Linux" ][5]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/3/migrating-linux-using-sudo

作者：[John Bonesio][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction
[2]:https://www.linux.com/blog/learn/intro-to-linux/2017/11/migrating-linux-disks-files-and-filesystems
[3]:https://www.linux.com/blog/learn/2017/12/migrating-linux-graphical-environments
[4]:https://www.linux.com/blog/learn/2018/1/migrating-linux-command-line
[5]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
