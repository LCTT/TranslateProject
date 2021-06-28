[#]: subject: (Forgot Linux Password on WSL? Here’s How to Reset it Easily)
[#]: via: (https://itsfoss.com/reset-linux-password-wsl/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Forgot Linux Password on WSL? Here’s How to Reset it Easily
======

WSL (Windows Subsystem for Linux) is a handy tool for people who want to enjoy the power of Linux command line from the comfort of Windows.

When you [install Linux using WSL on Windows][1], you are asked to create a username and password. This user is automatically logged on when you start Linux on WSL.

Now, the problem is that if you haven’t used it for some time, you may forget the account password of WSL. And this will become a problem if you have to use a command with sudo because here you’ll need to enter the password.

![][2]

Don’t worry. You can easily reset it.

### Reset forgotten password for Ubuntu or any other Linux distribution on WSL

To reset the Linux password in WSL, you have to:

  * Switch the default user to root
  * Reset the password for the normal user
  * Switch back the default user to the normal user



Let me show you the steps in detail and with screenshots.

#### Step 1: Switch to root as default user

It will be wise to note down your account’s normal/regular username. As you can see, my regular account’s username is abhishek.

![Note down the account username][3]

The root user in WSL is unlocked and doesn’t have a password set. This means that you can switch to the root user and then use the power of root to reset the password.

Since you don’t remember the account password, switching to the root user is done by changing the configuration of your Linux WSL application and make it use root user by default.

This is done through Windows Command Prompt and you’ll need to know which command you need to run for your Linux distribution.

This information is usually provided in the description of the distribution app in the [Windows Store][4]. This is from where you had downloaded your distribution in the first place.

![Know the command to run for your distribution app][5]

From the Windows menu, start the command prompt:

![Start Command Prompt][6]

In here, use your distribution’s command in this fashion. If you were using the Ubuntu app from Windows store, the command would be:

```
ubuntu config --default-user root
```

In the screenshot, I am using Ubuntu 20.04 app from the Windows store. So, I have used ubuntu2004 command.

![Set root as default user in Linux app’s configuration][7]

To save you the trouble, I am listing some distributions and their respective commands in this table:

Distribution App | Windows Command
---|---
Ubuntu | ubuntu config –default-user root
Ubuntu 20.04 | ubuntu2004 config –default-user root
Ubuntu 18.04 | ubuntu1804 config –default-user root
Debian | debian config –default-user root
Kali Linux | kali config –default-user root

#### Step 2: Reset the password for the account

Now, if you start the Linux distribution app, you should be logged in as root. You can reset the password for the normal user account.

Do you remember the username in WSL? If not, you can always check the contents of the /home directory. When you have the username, use this command:

```
passwd username
```

It will ask you to enter a new password. **When you type here, nothing will be displayed on the screen. That’s normal. Just type the new password and hit enter.** You’ll have to retype the new password to confirm and once again, nothing will be displayed on the screen while you type the password.

![Reset the password for the regular user][8]

Congratulations. The password for the user account has been reset. But you are done just yet. The default user is still root. You should change it back to your regular account user, otherwise it will keep on logging in as root user.

#### Step 3: Set regular user as default again

You’ll need the regular account username that you used with the [passwd command][9] in the previous step.

Start the Windows command prompt once again. **Use your distribution’s command** in the similar manner you did in the step 1. However, this time, replace root with the regular user.

```
ubuntu config --default-user username
```

![Set regular user as default user][10]

Now when you start your Linux distribution app in WSL, you’ll be logged in as the regular user. You have reset the password fresh and can use it to run commands with sudo.

If you forgot the password again in the future, you know the steps to reset it.

### If resetting WSL password is this easy, is this not a security risk?

Not really. You need to have physical access to the computer along with access to the Windows account. If someone already has this much access, she/he can do a lot more than just changing the Linux password in WSL.

### Were you able to reset WSL password?

I gave you the commands and explained the steps. I hope this was helpful to you and you were able to reset the password of your Linux distribution in WSL.

If you are still facing issues or if you have a question on this topic, please feel free to ask in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/reset-linux-password-wsl/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-bash-on-windows/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/reset-wsl-password.png?resize=800%2C450&ssl=1
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/username-wsl.png?resize=800%2C296&ssl=1
[4]: https://www.microsoft.com/en-us/store/apps/windows
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/wsl-distro-command.png?resize=800%2C602&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/start-cmd-windows.jpg?resize=800%2C500&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/wsl-set-root-as-default.png?resize=800%2C288&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/resetting-wsl-password.png?resize=800%2C366&ssl=1
[9]: https://linuxhandbook.com/passwd-command/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/set-regular-user-as-default-wsl.png?resize=800%2C288&ssl=1
