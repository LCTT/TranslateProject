translating---geekpi

How to Keep ‘sudo’ Password Timeout Session Longer in Linux
============================================================

In recent articles, we’ve showed you [10 Useful Sudoers Configurations in Linux][1] and [Let Sudo Insult You When You Enter Incorrect Password][2], and in this article, we discovered a another sudo tip that will help you to make sudo password sessions (timeout) longer or shorter in Ubuntu Linux.

In Ubuntu and its derivatives such as Linux Mint or any other Ubuntu-based distro, when you execute a [sudo command][3], it will prompt you to enter administrative password.

After you execute sudo command first time, the password will last for 15 minutes by default, so you don’t need to type password for every sudo command.

If, somehow you feel that the 15 minutes too long or short for some reason, you can change it with a easy tweak in sudoers file.

To set the sudo password timeout value, use the `passwd_timeout` parameter. First open the /etc/sudoers file with super user privileges using sudo and visudo commands like so:

```
$ sudo visudo 
```

Then add the following defaults entry, it implies that the sudo password prompt will time out after 20 minutes once sudo is invoked by a user.

```
Defaults        env_reset,timestamp_timeout=20
```

Note: You can set whatever time you want in minutes and make sure to wait before it times out. You can also set time to `0` if you want a password prompt for every sudo command you execute, or disable password prompt forever by setting the value `-1`.

The screen shot below show the defaults parameters I have set in my /ec/sudoers file.

[
 ![Change sudo Password Timeout](http://www.tecmint.com/wp-content/uploads/2017/01/set-sudo-password-timeout-session.png) 
][4]

Change sudo Password Timeout

Save the file by pressing `[Ctrl + O]` and exit using `[Ctrl + X]`. Afterwards test if the setting is working by running a command with sudo and wait for 2 minutes to see if the password prompt will time out.

In this post, we explained how to set the number of minutes before the sudo password prompt times out, remember to share your thoughts concerning this article or perhaps other [useful sudeors configurations for system administrators][5] out there via the feedback section below.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.



via: http://www.tecmint.com/set-sudo-password-timeout-session-longer-linux/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[2]:http://www.tecmint.com/sudo-insult-when-enter-wrong-password/
[3]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/set-sudo-password-timeout-session.png
[5]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
