[#]: subject: "Fixing “Unable to acquire dpkg frontend lock. Are You Root?” Error on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/fixed-are-you-root-error/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fixing “Unable to acquire dpkg frontend lock. Are You Root?” Error on Ubuntu and Other Linux Distributions
======

I am presuming you are quite new to Linux.

You follow some tutorial on the internet that tells you to install a certain program or run some command. Probably it is something to do with a server.

But when you run the command, you encounter this error:

**E: Could not open lock file /var/lib/dpkg/lock-frontend – open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?**

A similar error is this one:

dpkg: error: required read/write access to the dpkg database directory /var/lib/dpkg
**E: Sub-process dpkg –set-selections returned an error code (2)
E: Executing dpkg failed. Are you root?**

Both errors ask you the same question: are you root? And that’s the answer to this problem. Become root.

### Become root to avoid this error

How do you [become root in Ubuntu][1] or Debian? You use the sudo command.

Yes, that’s it. Whatever command you were running, just add sudo before it.

```
sudo your_command
```

![Running command with sudo][2]

It will ask you to enter your user account password. Please keep in mind that nothing gets displayed on the screen when you type the password and that’s okay.

There is nothing wrong with your system. In most Linux systems, password typing doesn’t show the usual asterisks or anything of that sort as a ‘security feature’.

Just type your password and press enter after it. If the password was typed correctly, you should be able to run the command now.

You can even use this handy [Linux command line trick][3] to run a previous command with sudo:

```
sudo !!
```

That was simple and works immediately, unless you do not have sudo access. Then, you’ll see a different error.

### Seeing a ‘User is not in sudoer file’ error?

![Some users cannot run commands with sudo][4]

When you [install Ubuntu][5], you have to create a user account. This user is automatically granted sudo power to run commands as root when required.

This happens on Ubuntu desktop, not servers. Most server distributions will have a separate root account. If you create a regular account separately, you’ll have to add the user to sudoer so that this normal user can use sudo.

In the screenshot above, I had created this additional user but did not add it to the sudo group. This means that user ‘prakash’ here does not have rights to use the sudo command and hence the system complains that ‘prakash is not in sudoers file’.

#### Where is the incident reported?

An incorrect sudo attempt is added to the system logs. It logs the user name, the virtual terminal number, location from where the command was run and which command was run.

![Incorrect sudo attempts are logged into the system][6]

The location of these logs differ from distribution to distribution.

Normally, you may find it in journalctl logs or /var/log/auth.log file in Ubuntu, /var/log/audit/audit.log file in Fedora.

#### What can you do if a user is not in sudoer list?

What can you do when you cannot use sudo with the current user account? First, [verify if the user has sudo rights or not. If not, here are some options for][7] you:

  * Log in as root or switch to root (if you have root password).
  * [Add the user into sudoer list][8] (if you have admin/sudo rights from some other user account).
  * If you are in multi-user Linux system and do not have root or sudo access yourself, ask your sytem administrator to either grant your user sudo access or install the application you wanted to install.



### Did this help?

Sudo is a very comprehensive security mechanism, and it is much more than just allowing a normal user to become root. It helps in auditing the system to know which user ran which command with sudo. It can also be configured to allow a certain user to run only certain commands with sudo.

You won’t see such granular sudo configuration on desktop Linux where it is preconfigured to allow any user in the sudo group to run any command as root with sudo. More on sudo in some other article.

I hope while solving this classic beginner problem, you get some initial insights into the sudo command. Let me know if you have further questions on this topic in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/fixed-are-you-root-error/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/root-user-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/running-commands-with-sudo.webp?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/linux-command-tricks/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/not-in-sudoer-file-error-800x289.png?resize=800%2C289&ssl=1
[5]: https://itsfoss.com/install-ubuntu/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/sudo-incident-reported.png?resize=800%2C339&ssl=1
[7]: https://linuxhandbook.com/check-if-user-has-sudo-rights/
[8]: https://linuxhandbook.com/create-sudo-user/
