[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run Particular Commands Without Sudo Password In Linux)
[#]: via: (https://www.ostechnix.com/run-particular-commands-without-sudo-password-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

Run Particular Commands Without Sudo Password In Linux
======

I had a script on my Ubuntu system deployed on AWS. The primary purpose of this script is to check if a specific service is running at regular interval (every one minute to be precise) and start that service automatically if it is stopped for any reason. But the problem is I need sudo privileges to start the service. As you may know already, we should provide password when we run something as sudo user. But I don’t want to do that. What I actually want to do is to run the service as sudo without password. If you’re ever in a situation like this, I know a small work around, Today, in this brief guide, I will teach you how to run particular commands without sudo password in Unix-like operating systems.

Have a look at the following example.

```
$ sudo mkdir /ostechnix
[sudo] password for sk:
```

![][2]

As you can see in the above screenshot, I need to provide sudo password when creating a directory named ostechnix in root (/) folder. Whenever we try to execute a command with sudo privileges, we must enter the password. However, in my scenario, I don’t want to provide the sudo password. Here is what I did to run a sudo command without password on my Linux box.

### Run Particular Commands Without Sudo Password In Linux

For any reasons, if you want to allow a user to run a particular command without giving the sudo password, you need to add that command in **sudoers** file.

I want the user named **sk** to execute **mkdir** command without giving the sudo password. Let us see how to do it.

Edit sudoers file:

```
$ sudo visudo
```

Add the following line at the end of file.

```
sk ALL=NOPASSWD:/bin/mkdir
```

![][3]

Here, **sk** is the username. As per the above line, the user **sk** can run ‘mkdir’ command from any terminal, without sudo password.

You can add additional commands (for example **chmod** ) with comma-separated values as shown below.

```
sk ALL=NOPASSWD:/bin/mkdir,/bin/chmod
```

Save and close the file. Log out (or reboot) your system. Now, log in as normal user ‘sk’ and try to run those commands with sudo and see what happens.

```
$ sudo mkdir /dir1
```

![][4]

See? Even though I ran ‘mkdir’ command with sudo privileges, there was no password prompt. From now on, the user **sk** need not to enter the sudo password while running ‘mkdir’ command.

When running all other commands except those commands added in sudoers files, you will be prompted to enter the sudo password.

Let us run another command with sudo.

```
$ sudo apt update
```

![][5]

See? This command prompts me to enter the sudo password.

If you don’t want this command to prompt you to ask sudo password, edit sudoers file:

```
$ sudo visudo
```

Add the ‘apt’ command in visudo file like below:

```
sk ALL=NOPASSWD: /bin/mkdir,/usr/bin/apt
```

Did you notice that the apt binary executable file path is different from mkdir? Yes, you must provide the correct executable file path. To find executable file path of any command, for example ‘apt’, use ‘whereis’ command like below.

```
$ whereis apt
apt: /usr/bin/apt /usr/lib/apt /etc/apt /usr/share/man/man8/apt.8.gz
```

As you see, the executable file for apt command is **/usr/bin/apt** , hence I added it in sudoers file.

Like I already mentioned, you can add any number of commands with comma-separated values. Save and close your sudoers file once you’re done. Log out and log in again to your system.

Now, check if you can be able to run the command with sudo prefix without using the password:

```
$ sudo apt update
```

![][6]

See? The apt command didn’t ask me the password even though I ran it with sudo.

Here is yet another example. If you want to run a specific service, for example apache2, add it as shown below.

```
sk ALL=NOPASSWD:/bin/mkdir,/usr/bin/apt,/bin systemctl restart apache2
```

Now, the user can run ‘sudo systemctl restart apache2’ command without sudo password.

Can I re-authenticate to a particular command in the above case? Of course, yes! Just remove the added command. Log out and log in back.

Alternatively, you can add **‘PASSWD:’** directive in-front of the command. Look at the following example.

Add/modify the following line as shown below.

```
sk ALL=NOPASSWD:/bin/mkdir,/bin/chmod,PASSWD:/usr/bin/apt
```

In this case, the user **sk** can run ‘mkdir’ and ‘chmod’ commands without entering the sudo password. However, he must provide sudo password when running ‘apt’ command.

**Disclaimer:** This is for educational-purpose only. You should be very careful while applying this method. This method might be both productive and destructive. Say for example, if you allow users to execute ‘rm’ command without sudo password, they could accidentally or intentionally delete important stuffs. You have been warned!

**Suggested read:**

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/run-particular-commands-without-sudo-password-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-1.png
[3]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-7.png
[4]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-6.png
[5]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-4.png
[6]: http://www.ostechnix.com/wp-content/uploads/2017/05/sudo-password-5.png
