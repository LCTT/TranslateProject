[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Root User in Ubuntu: Important Things You Should Know)
[#]: via: (https://itsfoss.com/root-user-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Root User in Ubuntu: Important Things You Should Know
======

When you have just started using Linux, you’ll find many things that are different from Windows. One of those ‘different things’ is the concept of the root user.

In this beginner series, I’ll explain a few important things about the root user in Ubuntu.

**Please keep in mind that while I am writing this from Ubuntu user’s perspective, it should be valid for most Linux distributions.**

You’ll learn the following in this article:

  * [Why root user is disabled in Ubuntu][1]
  * [Using commands as root][2]
  * [Switch to root user][3]
  * [Unlock the root user][4]



### What is root user? Why is it locked in Ubuntu?

![][5]

In Linux, there is always a super user called [root][6]. This is the super admin account that can do anything and everything with the system. It can access any file and run any command on your Linux system.

With great power comes great responsibility. Root user gives you complete power over the system and hence it should be used with great cautious. Root user can access system files and run commands to make changes to the system configuration. And hence, an incorrect command may destroy the system.

This is why [Ubuntu][7] and other Ubuntu-based distributions lock the root user by default to save you from accidental disasters.

You don’t need to have root privilege for your daily tasks like moving file in your home directory, downloading files from internet, creating documents etc.

_**Take this analogy for understanding it better. If you have to cut a fruit, you use a kitchen knife. If you have to cut down a tree, you have to use a saw. Now, you may use the saw to cut fruits but that’s not wise, is it?**_

Does this mean that you cannot be root in Ubuntu or use the system with root privileges? No, you can still have root access with the help of ‘sudo’ (explained in the next section).

**Bottom line:
**Root user is too powerful to be used for regular tasks. This is why it is not recommended to use root all the time. You can still run specific commands with root.

### How to run commands as root user in Ubuntu?

![Image Credit: xkcd][8]

You’ll need root privileges for some system specific tasks. For example, if you want to [update Ubuntu via command line][9], you cannot run the command as a regular user. It will give you permission denied error.

```
apt update
Reading package lists... Done
E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
E: Unable to lock directory /var/lib/apt/lists/
W: Problem unlinking the file /var/cache/apt/pkgcache.bin - RemoveCaches (13: Permission denied)
W: Problem unlinking the file /var/cache/apt/srcpkgcache.bin - RemoveCaches (13: Permission denied)
```

So, how do you run commands as root? The simple answer is to add sudo before the commands that require to be run as root.

```
sudo apt update
```

Ubuntu and many other Linux distributions use a special mechanism called sudo. Sudo is a program that controls access to running commands as root (or other users).

Sudo is actually quite a versatile tool. It can be configured to allow a user to run all commands as root or only some commands as root. You can also configure if password is required for some commands or not to run it with sudo. It’s an extensive topic and maybe I’ll discuss it in details in another article.

For the moment, you should know that [when you install Ubuntu][10], you are forced to create a user account. This user account works as the admin on your system and as per the default sudo policy in Ubuntu, it can run any command on your system with root privileges.

The thing with sudo is that running **sudo doesn’t require root password but the user’s own password**.

And this is why when you run a command with sudo, it asks for the password of the user who is running the sudo command:

```
[email protected]:~$ sudo apt update
[sudo] password for abhishek:
```

As you can see in the example above, user _abhishek_ was trying to run the ‘apt update’ command with _sudo_ and the system asked the password for _abhishek_.

If you are absolutely new to Linux, you might be surprised that when you start typing your password in the terminal, nothing happens on the screen. This is perfectly normal because as the default security feature, nothing is displayed on the screen. Not even the asterisks (*). You type your password and press enter.

**Bottom line:
**To run commands as root in Ubuntu, add sudo before the command.
When asked for password, enter your account’s password.
When you type the password on the screen, nothing is visible. Just keep on typing the password and press enter.

### How to become root user in Ubuntu?

You can use sudo to run the commands as root. However in situations, where you have to run several commands as root and you keep forogetting to add sudo before the commands, you may switch to root user temporarily.

The sudo command allows you to simulate a root login shell with this command:

```
sudo -i
```

```
[email protected]:~$ sudo -i
[sudo] password for abhishek:
[email protected]:~# whoami
root
[email protected]:~#
```

You’ll notice that when you switch to root, the shell command prompt changes from $ (dollar key sign) to # (pound key sign). This makes me crack a (lame) joke that pound is stronger than dollar.

_**Though I have showed you how to become the root user, I must warn you that you should avoid using the system as root. It’s discouraged for a reason after all.**_

Another way to temporarily switch to root user is by using the su command:

```
sudo su
```

If you try to use the su command without sudo, you’ll encounter ‘su authentication failure’ error.

You can go back to being the normal user by using the exit command.

```
exit
```

### How to enable root user in Ubuntu?

By now you know that the root user is locked by default in Ubuntu based distributions.

Linux gives you the freedom to do whatever you want with your system. Unlocking the root user is one of those freedoms.

If, for some reasons, you decided to enable the root user, you can do so by setting up a password for it:

```
sudo passwd root
```

Again, this is not recommended and I won’t encourage you to do that on your desktop. If you forgot it, you won’t be able to [change the root password in Ubuntu][11] again.

You can lock the root user again by removing the password:

```
sudo passwd -dl root
```

**In the end…**

I hope you have a slightly better understanding of the root concept now. If you still have some confusion and questions about it, please let me know in the comments. I’ll try to answer your questions and might update the article as well.

--------------------------------------------------------------------------------

via: https://itsfoss.com/root-user-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: tmp.IrHYJBAqVn#what-is-root
[2]: tmp.IrHYJBAqVn#run-command-as-root
[3]: tmp.IrHYJBAqVn#become-root
[4]: tmp.IrHYJBAqVn#enable-root
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/root_user_ubuntu.png?ssl=1
[6]: http://www.linfo.org/root.html
[7]: https://ubuntu.com/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/sudo_sandwich.png?ssl=1
[9]: https://itsfoss.com/update-ubuntu/
[10]: https://itsfoss.com/install-ubuntu/
[11]: https://itsfoss.com/how-to-hack-ubuntu-password/
