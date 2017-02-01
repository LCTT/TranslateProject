How to Run ‘sudo’ Command Without Entering a Password in Linux
============================================================

In case you are running Linux on a machine that you normally use alone, say on a laptop, entering a password each time you invoke **sudo** can become so boring in the long run. Therefore, in this guide, we will describe [how to configure sudo command][4] to run without entering a password.

This setting is done in the **/etc/sudoers** file, which drives sudoers to use default security policy plugin for the [sudo command][5]; under the user privilege specification section.

**Important**: In the **sudeors** file, the authenticate parameter which is turned on by default is used for authentication purposes. If it is set, users must authenticate themselves via a password (or other means of authentication) before they run commands with **sudo**.

However, this default value may be overridden using the **NOPASSWD** (require no password when user invokes **sudo** command) tag.

The syntax to configure user privileges is as follows:

```
user_list host_list=effective_user_list tag_list command_list
```

Where:

1.  `user_list` – list of users or a user alias that has already been set.
2.  `host_list` – list of hosts or a host alias on which users can run sudo.
3.  `effective_user_list` – list of users they must be running as or a run as alias.
4.  `tag_list` – list of tags such as NOPASSWD.
5.  `command_list` – list of commands or a command alias to be run by user(s) using sudo.

To allow a user (`aaronkilik` in the example below) to run all commands using **sudo** without a password, open the **sudoers** file:

```
$ sudo visudo
```

And add the following line:

```
aaronkilik ALL=(ALL) NOPASSWD: ALL
```

For the case of a group, use the `%` character before the group name as follows; this means that all member of the `sys` group will run all commands using sudo without a password.

```
%sys ALL=(ALL) NOPASSWD: ALL
```

To permit a user to run a given command (`/bin/kill`) using sudo without a password, add the following line:

```
aaronkilik ALL=(ALL) NOPASSWD: /bin/kill
```

The line below will enable member of the `sys` group to run the commands: **/bin/kill**, **/bin/rm**using **sudo** without a password:

```
%sys ALL=(ALL) NOPASSWD: /bin/kill, /bin/rm
```
[
 ![Run sudo Without Password](http://www.tecmint.com/wp-content/uploads/2017/01/Run-sudo-Without-Password.png) 
][6]

Run sudo Without Password

For more **sudo** configuration and additional usage options, read our articles that describes more examples:

1.  [10 Useful Sudoers Configurations for Setting ‘sudo’ in Linux][1]

3.  [Let Sudo Insult You When You Enter Incorrect Password][2]
4.  [How to Keep ‘sudo’ Password Timeout Session Longer in Linux][3]

In this article, we described how to configure sudo command to run without entering a password. Do not forget to offer us your thoughts about this guide or other useful sudeors configurations for Linux system administrators all in the comments.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

----------------------------------------------------------------


via: http://www.tecmint.com/run-sudo-command-without-password-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[2]:http://www.tecmint.com/sudo-insult-when-enter-wrong-password/
[3]:http://www.tecmint.com/set-sudo-password-timeout-session-longer-linux/
[4]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[5]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Run-sudo-Without-Password.png
