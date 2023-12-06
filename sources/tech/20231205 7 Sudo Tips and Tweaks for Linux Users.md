[#]: subject: "7 Sudo Tips and Tweaks for Linux Users"
[#]: via: "https://itsfoss.com/sudo-tips/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 Sudo Tips and Tweaks for Linux Users
======

You know sudo, right? You must have used it at some point in the time.

For most Linux users, it is the magical tool that gives you the ability to run any command as root or switch to the root user.

But that's only half-truth. See, sudo is not an absolute command. **sudo is a tool that can be configured to your need and liking**.

Ubuntu, Debian and other distros come preconfigured with sudo in a way that allows to them to run any command as root. That makes many users believe that sudo is some kind of magical switch that instantly gives you the root access.

**For example, a sysadmin can configure it in a way that users that are part of a certain 'dev' group can run only nginx command with sudo. Those users won't be able to run any other command with sudo or switch to root.**

If that surprises you, it's because you might have used sudo forever but never gave much thought about its underlying mechanism.

I am not going to explain how sudo works in this tutorial. I'll keep that for some other day.

In this article, you'll see how different aspects of sudo can be tweaked. Some are useful and some are pretty useless but fun.

🚧

Please do not start following all the mentioned tweaks blindly. You do it wrong and you may end up with a messed up system that cannot run sudo. For most part, just read and enjoy. And if you decide to try some of the tweaks, [make a system settings backup][1] so that you can restore things back to normal.

### 1\. Always use visudo for editing sudo config

The sudo command is configured through the `/etc/sudoers` file.

While you may edit this file with your [favorite terminal-based text editor][2] like Micro, NeoVim etc, you **MUST NOT** do that.

Why? Because any incorrect syntax in this file will leave you with a screwed up system where sudo won't work. Which may render your Linux system useless.

Just use it like this:

```

    sudo visudo

```

The `visudo` command traditionally opens the `/etc/sudoers` file in the Vi editor. Ubuntu will open it in Nano.

![][3]

The advantage here is that **visudo performs a syntax check when you try to save your changes**. This ensures that you don't mess up the sudo configuration due to incorrect syntax.

![visudo checks the syntax before saving the changes to the sudoers file][4]

Alright! Now you can see some sudo configuration changes.

💡

I would recommend making a backup of the /etc/sudoers file. So that if you are unsure what changes you made or if you want to revert to the default sudo configuration, you copy it from the backup.

sudo cp /etc/sudoers /etc/sudoers.bak

### 2\. Show asterisks while entering password with sudo

We have this behavior inherited from UNIX. When you enter your password for sudo in the terminal, it doesn't display anything. This lack of visual feedback makes new Linux users think that their system hanged.

Elders say that this is a security feature. This might have been the case in the last century but I don't think we should continue with it anymore. That's just my opinion.

Anyway, some distributions, like Linux Mint, have sudo tweaked in a way that it displays asterisks when you enter the password.

Now that's more in line with the behavior we see everywhere.

To show asterisks with sudo, run `sudo visudo` and look for the line:

```

    Defaults env_reset

```

Change it to:

```

    Defaults env_reset,pwfeedback

```

![][5]

💡

You may not find the Defaults env_reset line in some distributions like Arch. If that's the case, just add a new line with text Defaults env_reset, pwfeedback

Now, if you try using sudo and it asks for a password, you should see asterisks when you enter the password.

![][6]

✋

If you notice any issues with password not being accepted even when correct with graphical applications like software center, revert this change. Some old forum posts mentioned it. I haven't encountered it though.

### 3\. Increase sudo password timeout

So, you use sudo for the first time and it asks for the password. But for the subsequent commands with sudo, you don't have to enter the password for a certain time.

Let's call it sudo password timeout (or SPT, I just made it up. Don't call it that 😁).

Different distributions have different timeout. It could be 5 minutes or 15 minutes.

You can change the behavior and set a sudo password timeout of your choice.

Edit the sudoer file as you have seen above and look for the line with `Defaults env_reset` and add `timestamp_timeout=XX` to the line so that it becomes this:

```

    Defaults        env_reset, timestamp_timeout=XX

```

Where XX is the timeout in minutes.

If you had other parameters like the asterisk feedback you saw in the previous section, they all can be combined:

```

    Defaults        env_reset, timestamp_timeout=XX, pwfeedback

```

💡

Similarly, you can control the password retries limit. Use the passwd_tries=N to change the number of times a user can enter incorrect passwords.

### 4\. Use sudo without password

Alright! So you increased the sudo password timeout (or the SPT. Wow! you are still calling it that 😛).

That's fine. I mean who likes to enter the password every few minutes.

Increasing the timeout is one thing. The other thing is to not use it all.

Yes, you read that right. You can use sudo without entering the password.

That sounds risky from security point of view, right? Well it is but there are genuine cases where you are (productively) better off using sudo without password.

For example, if you manage several Linux servers remotely and you have created sudo users on them to avoid using root all the time. The trouble is that you'll have too many passwords. You don't want to use the same sudo password for all the servers.

In such a case, you can set up only key-based SSH access to the servers and allow using sudo with password. This way, only the authorized user access the remote server and sudo password doesn't need to be remembered.

I do this on the test servers I deploy on [DigitalOcean][7] for testing open source tools and services.

The good thing is that this can be allowed per user basis. Open the `/etc/sudoer` file for editing with:

```

    sudo visudo

```

And then add a line like this:

```

    user_name ALL=(ALL) NOPASSWD:ALL

```

Of course, you need to replace the `user_name` with actual user name in the above line.

Save the file and enjoy sudo life without passwords.

### 5\. Create separate sudo log files

You can always read the syslog or the journal logs for sudo related entries.

However, if you want a separate entry for sudo, you can create a custom log file dedicated to sudo.

Let's say, you want to use `/var/sudo.log` file for this purpose. You don't need to create the new log file before hand. It will be created for you if it does not exist.

Edit the /etc/sudoers file using visudo and add the following line to it:

```

    Defaults  logfile="/var/log/sudo.log"

```

Save it and you can start seeing which commands were run by sudo at what time and by what user in this file:

![][8]

### 6\. Only allow a certain commands with sudo to a specific group of users

This is more of an advanced solution that sysadmin use in a multi-user environment where people across departments are working on the same server.

A developer may need to run web server or some other program with root permission but giving them complete sudo access will be a security issue.

While this can be done at user level, I recommend doing it at group level. Let's say you create a group called `coders` and you allow them to run the commands (or binaries) from the `/var/www` and `/opt/bin/coders` directories and the [inxi command][9] (binary `/usr/bin/inxi`).

This is a hypothetical scenario. Please don't take it verbatim.

Now, edit the sudoer file with `sudo visudo` (yeah, you know it by now). Add the following line to it:

```

    %coders   ALL=(ALL:ALL) /var/www,/opt/bin/coders,/usr/bin/inxi

```

You can add the NOPASSWD parameter if you want so that sudo for the above allowed commands can be run with sudo but without password.

More on ALL ALL ALL in some other article as this one is getting longer than usual anyway.

### 7\. Check the sudo access for a user

Alright! This one is more of a tip than a tweak.

How do you know if a user has sudo access? Check if they are member of the sudo group, you say. But that's not a guarantee. Some distros use wheel group name instead of sudo.

A better way is to use the built-in functionality of sudo and see what kind of sudo access a user has:

```

    sudo -l -U user_name

```

It will show if the user has sudo access for some commands or for all commands.

![][10]

As you can see above, it shows that I have a custom log file and password feedback on apart from sudo access for all commands.

If the user doesn't have sudo access at all, you'll see an output like this:

```

    User prakash is not allowed to run sudo on this-that-server.

```

### 🎁 Bonus: Let sudo insult you for incorrect password attempts

This one is the 'useless' tweak I mentioned at the beginning of this article.

I guess you must have mistyped the password while using sudo some time in the past, right?

This little [tweak let sudo throw a random insult at you][11] for entering incorrect passwords.

Use `sudo visudo` to edit the sudo config file and add the following line to it:

```

    Defaults   insults

```

And then you can test the changes by entering incorrect passwords:

![][12]

You may wonder who likes to be insulted? OnlyFans can answer that in a graphic manner 😇

### How do you sudo?

![][13]

I know there is no end to customization. Although, sudo is not something a regular Linux user customizes.

Still, I like to share such things with you because you may discover something new and useful.

💬 _So, did you discover something new? Tell me in the comments, please. And do you have some secret sudo trick up your sleeve? Why not share it with the rest of us?_

--------------------------------------------------------------------------------

via: https://itsfoss.com/sudo-tips/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/backup-restore-linux-timeshift/
[2]: https://itsfoss.com/command-line-text-editors-linux/
[3]: https://itsfoss.com/content/images/2023/02/save-file-in-nano-editor.png
[4]: https://itsfoss.com/content/images/2023/12/visudo-syntax-validation.png
[5]: https://itsfoss.com/content/images/2023/12/sudo-password-feedback.png
[6]: https://itsfoss.com/content/images/2023/12/sudo-password-with-asterisk-display.png
[7]: https://digitalocean.pxf.io/JzK74r
[8]: https://itsfoss.com/content/images/2023/12/sudo-log-file.png
[9]: https://itsfoss.com/inxi-system-info-linux/
[10]: https://itsfoss.com/content/images/2023/12/check-sudo-access.png
[11]: https://itsfoss.com/sudo-insult-linux/
[12]: https://itsfoss.com/content/images/2023/12/sudo-insults.png
[13]: https://itsfoss.com/content/images/2023/12/sudo-meme.png
