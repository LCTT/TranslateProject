[#]: subject: "How To Run All Programs In A Directory Via Sudo In Linux"
[#]: via: "https://ostechnix.com/run-programs-in-a-directory-via-sudo/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Run All Programs In A Directory Via Sudo In Linux
======
This brief guide explains how to **allow an user to run all programs in a directory via sudo** and deny the user to run programs in other directories in Linux and Unix-like systems.

#### Contents

1. Introduction
2. Run All Programs In A Directory Via Sudo
3. Authorize Users To Run Commands Via Sudo From Custom Directory
4. Conclusion

### Introduction

There are many ways to restrict users from doing certain things in Linux. You can allow an user to run only a specific commands and tasks. You can restrict the users from changing the environment variables or switching to other user's directories. Check the following guide to know more on how to limit restrict user's access.

> **[How To Limit User’s Access To The Linux System][1]**

In this guide, we are going to allow the users to run specific commands only. Particularly, we authorize an user to **run the programs that are available in a specific directory ONLY**. The user can able to execute only those commands via sudo, but not the commands from other locations.

### Run All Programs In A Directory Via Sudo

For the demonstration purpose, I am going to create a test user named **"user1"** as `root`.

```
[root@Almalinux8CT ~]# useradd user1
```

Set password for the user1 using command:

```
[root@Almalinux8CT ~]# passwd user1
```

Next, edit `/etc/sudoers` file using command:

```
[root@Almalinux8CT ~]# visudo
```

Add the full directory path (including the slash at the end) that contains all the programs. For example:

```
user1   ALL=(root)      /usr/bin/
```

![Allow User1 To Run All Programs In A Directory][2]

As per the above line, the user1 can able to run ONLY the programs in the `/usr/bin/` directory. Save the file and close it.

Log out from the `root` session and log back in as user1.

From the user1 session, run any program as root from the allowed directory i.e. `/usr/bin/` :

```
[user1@Almalinux8CT ~]$ sudo -u root /usr/bin/touch ostechnix.txt
```

The above command should just work fine and creates a text file called `ostechnix.txt` in the current directory. Please note that the user1 can run commands **ONLY** from the `/usr/bin/` directory. He can't even run programs from the sub-directory of `/usr/bin/` directory.

Next, check if user1 can run commands from other directory via sudo:

```
[user1@Almalinux8CT ~]$ sudo -u root /usr/local/bin/yt-dlp --help
```

You will see the following error:

```
Sorry, user user1 is not allowed to execute '/usr/local/bin/yt-dlp --help' as root on Almalinux8CT.
```

![Run All Programs In A Directory Via Sudo][3]

See? The user1 is not allowed to run commands in `/usr/local/bin/` directory.

As stated already, the user1 is authorized to run any command from the `/usr/bin/` directory only, but not from the **sub-directory** of `/usr/bin/` and other directories.

I must also say that **this tip is effective** **only when the user1 runs the commands as root user** via sudo. The user1 can still able to run all commands from anywhere in the system path.

For example, user1 can run:

```
[user1@Almalinux8CT ~]$ yt-dlp --help
```

But not as `root` user:

```
[user1@Almalinux8CT ~]$ sudo -u root /usr/local/bin/yt-dlp --help
```

Here, I've used yt-dlp program for demonstration purpose. You can use any program of your choice.

To revert back to the original default settings, simply remove the line that you added in the `/etc/sudoers` file.

### Authorize Users To Run Commands Via Sudo From Custom Directory

You can also create a custom directory and store all the executable binaries in it. For instance, I am going to create the following directory as `root` user:

```
[root@Almalinux8CT ~]# mkdir /home/user1/programs
```

Copy all the binary executable files that you want to run by the user1. Then add the full directory path in the `/etc/sudoers` file:

```
user1   ALL=(root)      /home/user1/programs/
```

Log out from the root session and log back in as user1 and check if you can able run any programs from other directories via sudo. The user1 can not run the programs via sudo from other directories except the allowed directory `/home/user1/programs/`.

For more details, refer the man pages.

```
$ man sudoers
```

### Conclusion

In this guide, we discussed how to allow an user to run all programs in a directory via sudo and disallow the same user from running commands from other locations.

I couldn't find any practical use-cases for this tip. But, whatever the reasons, if you ever wondered how to run programs in a directory as root via sudo, this guide will definitely help.

--------------------------------------------------------------------------------

via: https://ostechnix.com/run-programs-in-a-directory-via-sudo/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-limit-users-access-to-the-linux-system/
[2]: https://ostechnix.com/wp-content/uploads/2022/09/Allow-User1-To-Run-All-Programs-In-A-Directory.png
[3]: https://ostechnix.com/wp-content/uploads/2022/09/Run-All-Programs-In-A-Directory-Via-Sudo.png
