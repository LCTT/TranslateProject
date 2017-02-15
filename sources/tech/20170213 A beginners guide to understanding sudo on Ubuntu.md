A beginner's guide to understanding sudo on Ubuntu
============================================================

### On this page

1.  [What is sudo?][4]
2.  [Can any user use sudo?][5]
3.  [What is a sudo session?][6]
4.  [The sudo password][7]
5.  [Some important sudo command line options][8]
    1.  [The -k option][1]
    2.  [The -s option][2]
    3.  [The -i option][3]
6.  [Conclusion][9]

Ever got a 'Permission denied' error while working on the Linux command line? Chances are that you were trying to perform an operation that requires root permissions. For example, the following screenshot shows the error being thrown when I was trying to copy a binary file to one of the system directories:

[
 ![permission denied on the shell](https://www.howtoforge.com/images/sudo-beginners-guide/perm-denied-error.png) 
][11]

So what's the solution to this problem? Simple, use the **sudo** command.

[
 ![run command with sudo](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-example.png) 
][12]

The user who is running the command will be prompted for their login password. Once the correct password is entered, the operation will be performed successfully.

While sudo is no doubt a must-know command for any and everyone who works on the command line in Linux, there are several other related (and in-depth) details that you should know in order to use the command more responsibly and effectively.  And that's exactly what we'll be discussing here in this article.

But before we move ahead, it's worth mentioning that all the commands and instructions mentioned in this article have been tested on Ubuntu 14.04LTS with Bash shell version 4.3.11.

### What is sudo?

The sudo command, as most of you might already know, is used to execute a command with elevated privileges (usually as root). An example of this we've already discussed in the introduction section above. However, if you want, you can use sudo to execute command as some other (non-root) user.

This is achieved through the -u command line option the tool provides. For example, in the example shown below, I (himanshu) tried renaming a file in some other user's (howtoforge) home directory, but got a 'permission denied' error. And then I tried the same 'mv' command with 'sudo -u howtoforge,' the command was successful:

[
 ![What is sudo](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-switch-user.png) 
][13]

### Can any user use sudo?

No. For a user to be able to use sudo, an entry corresponding to that user should be in the /etc/sudoers file. The following paragraph - taken from Ubuntu's website - should make it more clear:

```
The /etc/sudoers file controls who can run what commands as what users on what machines and can also control special things such as whether you need a password for particular commands. The file is composed of aliases (basically variables) and user specifications (which control who can run what).
```

If you are using Ubuntu, it's easy to make sure that a user can run the sudo command: all you have to do is to make that user account type 'administrator'. This can be done by heading to System Settings... -> User Accounts.

[
 ![sudo users](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-user-accounts.png) 
][14]

Unlocking the window:

[
 ![unlocking window](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-user-unlock.png) 
][15]

Then selecting the user whose account type you want to change, and then changing the type to 'administrator'

[
 ![choose sudo accounts](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-admin-account.png) 
][16]

However, if you aren't on Ubuntu, or your distribution doesn't provide this feature, you can manually edit the /etc/sudoers file to make the change. You'll be required to add the following line in that file:

```
[user]    ALL=(ALL:ALL) ALL
```

Needless to say, [user] should be replaced by the user-name of the account you're granting the sudo privilege. An important thing worth mentioning here is that the officially suggested method of editing this file is through the **visudo** command - all you have to do is to run the following command:

sudo visudo

To give you an idea why exactly is that the case, here's an excerpt from the visudo manual:

```
visudo edits the sudoers file in a safe fashion. visudo locks the sudoers file against multiple simultaneous edits, provides basic sanity checks, and checks for parse errors. If the sudoers file is currently being edited you will receive a message to try again later.
```

For more information on visudo, head [here][17].

### What is a sudo session?

If you use the sudo command frequently, I am sure you'd have observed that after you successfully enter the password once, you can run multiple sudo commands without being prompted for the password. But after sometime, the sudo command asks for your password again.

This behavior has nothing to do with the number of sudo-powered commands you run, but instead depends on time. Yes, by default, sudo won't ask for password for 15 minutes after the user has entered it once. Post these 15 minutes, you'll be prompted for password again.

However, if you want, you can change this behavior. For this, open the /etc/sudoers file using the following command:

sudo visudo

And then go to the line that reads:

```
Defaults env_reset
```

[
 ![env_reset](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-session-time-default.png) 
][18]

and add the following variable (highlighted in bold below) at the end of the line

```
Defaults env_reset,timestamp_timeout=[new-value]
```

The [new-value] field should be replaced by the number of minutes you want your sudo session to last. For example, I used the value 40.

[
 ![sudo timeout value](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-session-timeout.png) 
][19]

In case you want to get prompted for password every time you use the sudo command, then in that case you can assign the value '0' to this variable. And for those of you who want that their sudo session should never time out, you can assign the value '-1'.

Please note that using timestamp_timeout with value '-1' is strongly discouraged.

### The sudo password

As you might have observed, whenever sudo prompts you for a password and you start entering it, nothing shows up - not even asterisks that's usually the norm. While that's not a big deal in general, some users may want to have the asterisks displayed for whatever reason.

The good thing is that's possible and pretty easy to do. All you have to do is to change the following line in /etc/sudoers file:

```
Defaults        env_reset
```

to

```
Defaults        env_reset,pwfeedback
```

And save the file.

Now, whenever you'll type the sudo password, asterisk will show up.

[
 ![hide the sudo password](https://www.howtoforge.com/images/sudo-beginners-guide/sudo-password.png) 
][20]

### Some important sudo command line options

Aside from the -u command line option (which we've already discussed at the beginning of this tutorial), there are some other important sudo command line options that deserve a mention. In this section, we will discuss some of those.

### The -k option

Consider a case where-in you've just run a sudo-powered command after entering your password. Now, as you already know, the sudo session remains active for 15-mins by default. Suppose during this session, you have to give someone access to your terminal, but you don't want them to be able to use sudo. What will you do?

Thankfully, there exists a command line option -k that allows user to revoke sudo permission. Here's what the sudo man page has to say about this option:

```
-k, --reset-timestamp

When used without a command, invalidates the user's cached credentials. In other words, the next time sudo is run a password will be required. This option does not require a password and was added to allow a user to revoke sudo permissions from a .logout file.

When used in conjunction with a command or an option that may require a password, this option will cause sudo to ignore the user's cached credentials. As a result, sudo will prompt for a password (if one is required by the security policy) and will not update the user's cached credentials.
```

### The -s option

There might be times when you work requires you to run a bucketload of commands that need root privileges, and you don't want to enter the sudo password every now and then. Also, you don't want to tweak the sudo session timeout limit by making changes to the /etc/sudoers file. 

In that case, you may want to use the -s command line option of the sudo command. Here's how the sudo man page explains it:

```
-s, --shell

Run the shell specified by the SHELL environment variable if it is set or the shell specified by the invoking user's password database entry. If a command is specified, it is passed to the shell for execution via the shell's -c option. If no command is specified, an interactive shell is executed.
```

So basically, what this command line option does is:

*   Launches a new shell - as for which shell, the SHELL env variable is referred. In case $SHELL is empty, the shell defined in the /etc/passwd file is picked up.
*   If you're also passing a command name along with the -s option (for example: sudo -s whoami), then the actual command that gets executed is: sudo /bin/bash -c whoami.
*   If you aren't trying to execute any other command (meaning, you're just trying to run sudo -s) then you get an interactive shell with root privileges.

What's worth keeping in mind here is that the -s command line option gives you a shell with root privileges, but you don't get the root environment - it's your .bashrc that gets sourced. This means that, for example, in the new shell that sudo -s runs, executing the whoami command will still return your username, and not 'root'.

### The -i option

The -i option is similar to the -s option we just discussed. However, there are some differences. One of the key differences is that -i gives you the root environment as well, meaning your (user's) .bashrc is ignored. It's like becoming root without explicitly logging as root. What more, you don't have to enter the root user's password as well.

**Important**: Please note that there exists a **su** command which also lets you switch users (by default, it lets you become root). This command requires you to enter the 'root' password. To avoid this, you can also execute it with sudo ('sudo su'); in that case you'll just have to enter your login password. However, 'su' and 'sudo su' have some underlying differences - to understand them as well as know more about how 'sudo -i' compares to them, head [here][10].

### Conclusion

I hope that by now you'd have at least got the basic idea behind sudo, and how you tweak it's default behavior. Do try out the /etc/sudoers tweaks we've explained here, also go through the forum discussion (linked in the last paragraph) to get more insight about the sudo command.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/sudo-beginners-guide/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/
[1]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-k-option
[2]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-s-option
[3]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-i-option
[4]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#what-is-sudo
[5]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#can-any-user-use-sudo
[6]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#what-is-a-sudo-session
[7]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#the-sudo-password
[8]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#some-important-sudo-command-line-options
[9]:https://www.howtoforge.com/tutorial/sudo-beginners-guide/#conclusion
[10]:http://unix.stackexchange.com/questions/98531/difference-between-sudo-i-and-sudo-su
[11]:https://www.howtoforge.com/images/sudo-beginners-guide/big/perm-denied-error.png
[12]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-example.png
[13]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-switch-user.png
[14]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-user-accounts.png
[15]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-user-unlock.png
[16]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-admin-account.png
[17]:https://www.sudo.ws/man/1.8.17/visudo.man.html
[18]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-session-time-default.png
[19]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-session-timeout.png
[20]:https://www.howtoforge.com/images/sudo-beginners-guide/big/sudo-password.png
