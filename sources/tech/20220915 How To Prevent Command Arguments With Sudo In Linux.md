[#]: subject: "How To Prevent Command Arguments With Sudo In Linux"
[#]: via: "https://ostechnix.com/prevent-command-arguments-with-sudo/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Prevent Command Arguments With Sudo In Linux
======
Allow an user to run commands with sudo, but without command arguments.

In the previous article, we learned how to **[run commands in a directory as root via sudo][1]**. In this guide, we will see how to **prevent command arguments with sudo** in Linux. Meaning - we allow an user to run commands with sudo, but **without command arguments**.

#### Contents

1. Introduction
2. Prevent Command Arguments With Sudo
3. Prohibit Command Arguments With Sudo For All Users
4. Conclusion

### Introduction

As you know already, each command has different options to perform a specific action. Let us take **"ls"** command as an example.

The `ls` command is used to list directory contents, right? Yes. The ls command ships with many command-line options and flags. For instance, you can use `-a` flag with `ls` command to list all contents(i.e. including the hidden files) in a directory.

In this brief tutorial, we will see how to allow an user to run `ls` command via sudo, but only without the command line options or flags. Understood? Let me show you how to do it in the following sections.

### Prevent Command Arguments With Sudo

Edit `/etc/sudoers` file as `root` user:

```
[root@Almalinux8CT ~]# visudo
```

Add the following line:

```
user1   ALL=(root)      /usr/bin/ls ""
```

![Deny Command Arguments With Sudo][2]

**Notice the double quotes** at the end of the `ls` command in the above line. The double quotes prohibit the user from using the arguments of the given command (i.e. `ls` command). As per the above line, the user1 can run the `ls` command as `root`, but can't use the `ls` command's options/flags. You can use some other command of your choice. Save the file and close it.

Now, log out from the root session and login as user1 and try to run `ls` command with any options as root via sudo from user1 session:

```
[user1@Almalinux8CT ~]$ sudo -u root ls -a
```

You will encounter with the following error:

```
Sorry, user user1 is not allowed to execute '/bin/ls -a' as root on Almalinux8CT.
```

You can, however, run `ls` command without its arguments:

```
[user1@Almalinux8CT ~]$ sudo -u root ls
```

![Prevent Command Arguments With Sudo][3]

### Prohibit Command Arguments With Sudo For All Users

The above example showed you how to deny an user to execute a command with its arguments as `root` user. What if you want to apply this rule to all users? Simple! Just add the following line in the `/etc/sudoers` file:

```
ALL   ALL=(root)      /usr/bin/ls ""
```

Now all users in your Linux machine can't run `ls` command with its flags.

To revert back to the default setting, just remove the command along with the double quotes. Or, remove the whole line.

For more details, refer the man pages.

```
$ man sudoers
```

### Conclusion

In this guide, we learned how to allow an user to run a command using sudo, but prevent them from adding any arguments to the command. This way we can restrict the users from misusing any commandline arguments.

--------------------------------------------------------------------------------

via: https://ostechnix.com/prevent-command-arguments-with-sudo/

作者：[sk][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/run-programs-in-a-directory-via-sudo/
[2]: https://ostechnix.com/wp-content/uploads/2022/09/Deny-Command-Arguments-With-Sudo.png
[3]: https://ostechnix.com/wp-content/uploads/2022/09/Prevent-Command-Arguments-With-Sudo.png
