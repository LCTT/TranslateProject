[translating by dianbanjiu]

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How to use the sudo command to deploy superuser powers on Linux)
[#]: via: (https://www.networkworld.com/article/3322504/linux/selectively-deploying-your-superpowers-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)
[#]: url: ( )

How to use the sudo command to deploy superuser powers on Linux
======

![](https://images.idgesg.net/images/article/2018/11/superman-100781085-large.jpg)

The **sudo** command is very handy when you need to run occasional commands with superuser power, but you can sometimes run into problems when it doesn’t do everything you expect it should. Say you want to add an important message at the end of some log file and you try something like this:

```
$ echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
```

OK, it looks like you need to employ some extra privilege. In general, you can't write to a system log file with your user account. Let’s try that again with **sudo**.

```
$ sudo !!
sudo echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
```

Hmm, that didn't work either. Let's try something a little different.

```
$ sudo 'echo "Important note" >> /var/log/somelog'
sudo: echo "Important note" >> /var/log/somelog: command not found
```

**[ Also see:[Invaluable tips and tricks for troubleshooting Linux][1] ]**

### What's going on here?

The response to the first of the commands shown above indicates that you lack the required privilege to write to the log file. In the second, you have simply tried to run the previously entered command with root privilege, but that resulted in a **Permission denied** error. In the third, you've tried to rerun the command by putting the entire command in quotes and ran into a **command not found** error. So, what went wrong?

  * First command: You can’t write to that log without root privilege.
  * Second command: Your superpowers don't extend to the redirect.
  * Third command: Sudo doesn’t recognize everything you’ve put into the quotes as a "command."



And if you had tried to use sudo when you had no sudo access at all, you would have seen an error like this:

```
nemo is not in the sudoers file. This incident will be reported.
```

### What can you do?

One fairly simple option is to use the sudo command to briefly become root. Given you have sudo privileges, you might be able to do that with a command like this one:

```
$ sudo su
[sudo] password for nemo:
#
```

Notice that the prompt has changed to indicate your new authority. Then you can run the original command as root:

```
# echo "Important note" >> /var/log/somelog
```

And then you can enter **^d** and go back to being yourself. Of course, some sudo configurations might prevent you from using sudo to become root.

Another option is to switch user to root with just the **su** command, but that requires knowing the root password. Many people will be given access to sudo without being provided with the root password, so this won't always work.

If you switch user to root, you can then run commands as root to your heart’s content. The problems with this approach are 1) everyone exercising root privilege will have to know the root password (not very secure) and 2) you won't be protected from the repercussions of making big mistakes if you fail to exit your privileged status after you run the specific commands that require root privilege. The sudo command is intended to allow you to use root privilege _only_ when you really need it and to control how much of root’s power each sudo user ought to have. It’s also intended to easily revert to having you working in your normal user state.

Note also that this entire discussion is predicated on the assumption that you have access to sudo and that your access is not narrowly defined. More on that in a moment.

Another option is to use a different command. If adding to a file by editing it is an option, you might use a command such as "sudo vi /var/log/somelog", though editing an active log file isn't generally a good idea because of how frequently the system might need to write to it.

A final but more complex option is to use one of the following commands that get around the problems we saw earlier, but they involve more complex syntax. The first command allows you to repeat your command using !! after getting the "Permission denied" rejection:

```
$ sudo echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
$ !!:gs/>/|sudo tee -a / <=====
$ tail -1 /var/log/somelog
Important note
```

The second allows you to add your message by passing your message to **tee** using the sudo command. Note that the **-a** specifies that the text should be appended to the file:

```
$ echo "Important note" | sudo tee -a /var/log/somelog
$ tail -1 /var/log/somelog
Important note
```

### How controllable is sudo?

The quick answer to this question is that it depends on the person administering it. Most Linux systems default to a very simple setup. If a user is assigned to a particular group, which might be called **wheel** or **admin** , that user will have the ability to run any command as root without having to know the root password. This is the default setup on most Linux systems. Once a user is added to the privileged group in the **/etc/group** file, that person can run any command with root privilege. On the other hand, sudo can be set up so that some users can only run a single command or any in a set of commands as root and nothing more.

If lines like those shown below were added to the **/etc/sudoers** file, for example, the user  "nemo" would be allowed to run the **whoami** command with root authority. While this might not make any sense in the  "real world," it works fairly well as an example.

```
# User alias specification
nemo ALL=(root) NOPASSWD: WHOAMI

# Cmnd alias specification
Cmnd_Alias WHOAMI = /usr/bin/whoami
```

Note that we've added both a command alias (Cmnd_Alias) that specifies the command that can be run — with their full paths — and a user alias that allows that user to run that single command with sudo without even entering a password.

When nemo runs the command **sudo whoami** , he will see this:

```
$ sudo whoami
root
```

Notice that, since nemo is running the command using sudo, the response to **whoami** shows that when the command is running, the user is **root**.

For other commands, nemo will see something like this:

```
$ sudo date
[sudo] password for nemo:
Sorry, user nemo is not allowed to execute '/bin/date' as root on butterfly.
```

### Default sudo setup

In the default approach, we'd be taking advantage of a line like one of those shown below from the **/etc/sudoers** file:

```
$ sudo egrep "admin|sudo" /etc/sudoers
# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL        <=====
# Allow members of group sudo to execute any command
%sudo ALL=(ALL:ALL) ALL <=====
```

In these lines, **%admin** and **%sudo** both refer to groups that permit anyone added to one of these groups to run any command as root using the sudo command.

A line like the one shown below from the /etc/group file makes the individuals listed members of the group, thereby giving them sudo privileges without any changes required in the /etc/sudoers file.

```
sudo:x:27:shs,nemo
```

### Wrap-up

The sudo command is meant to allow you to easily deploy superuser access on an as-needed basis, but also to endow users with very limited privileged access when that's all that is required. You can run into problems that require a different approach than a simple "sudo command," and the responses that you get from **sudo** should indicate what problem you've run into.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3322504/linux/selectively-deploying-your-superpowers-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
