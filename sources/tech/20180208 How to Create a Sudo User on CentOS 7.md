How to Create a Sudo User on CentOS 7
======
![How to create a sudo user on CentOS 7][1]

We’ll guide you, how to create a sudo user on CentOS 7. Sudo is a Linux command line program that allows you to execute commands as superuser or another system user. The configuration file offers detailed access permissions, including enabling commands only from the invoking terminal; requiring a password per user or group; requiring re-entry of a password every time or never requiring a password at all for a particular command line. It can also be configured to permit passing arguments or multiple commands. In this tutorial we will show you how to create a sudo user on CentOS 7.

### Steps to Create a New Sudo User on CentOS 7

#### 1. Connect via SSH

First of all, [connect to your server via SSH][2]. Once you are logged in, you need to add a new system user.

#### 2. Add New User in CentOS

You can add a new system user using the following command:
```
# adduser newuser

```

You need to replace `newuser` with the name of the user you want to add. Also, you need to set up a password for the newly added user.

#### 3. Create a Strong Password

To set up a password you can use the following command:
```
# passwd newuser

```

Make sure you are using a [strong password][3], otherwise the password will fail against the dictionary check. You will be asked to enter the password again and once you enter it you will be notified that the authentication tokens are updated successfully:
```
# passwd newuser
Changing password for user newuser.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.

```

#### 4. Add User to the Wheel Group in CentOS

The wheel group is a special user group that allows all members in the group to run all commands. Therefore, you need to add the new user to this group so it can run commands as superuser. You can do that by using the following command:
```
# usermod -aG wheel newuser

```

Again, make sure you are using the name of the actual user instead of `newuser`.
Now, use `visudo` to open and edit the `/etc/sudoers` file. Make sure that the line that starts with `%wheel` is not commented. It should look exactly like this:
```
### Allows people in group wheel to run all commands
%wheel ALL=(ALL) ALL

```

Now that your new user is set up you can switch to that user and test if everything is OK.

#### 5. Switch to the sudo User

To switch to the new user, run the following command:
```
# su - newuser

```

Now run a command that usually doesn’t work for regular users like the one below:
```
$ ls -la /root/

```

You will get the following error message:
```
ls: cannot open directory /root/: Permission denied

```

Try to run the same command, now with using `sudo`
```
$ sudo ls -ls /root/

```

You will need to enter the password for the new user to proceed. If everything is OK, the command will list all the content in the `/root` directory. Another way to test this is to run the following command:
```
$ sudo whoami

```

The output of the command should be similar to the one below:
```
$ sudo whoami
root

```

Congratulations, now you have a sudo user which you can use to manage your CentOS 7, operating system.

Of course, you don’t have to create a sudo user on CentOS 7, if you use one of our [CentOS 7 Hosting][4] services, in which case you can simply ask our expert Linux admins to create a sudo user on CentOS 7, for you. They are available 24×7 and will take care of your request immediately.

**PS**. If you liked this post on **how to create a sudo user on CentOS 7** , please share it with your friends on the social networks using the buttons on the left or simply leave a reply below. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-create-a-sudo-user-on-centos-7/

作者：[RoseHosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2018/02/How-to-create-a-sudo-user-on-CentOS-7.jpg
[2]:https://www.rosehosting.com/blog/connect-to-your-linux-vps-via-ssh/
[3]:https://www.rosehosting.com/blog/generate-password-linux-command-line/
[4]:https://www.rosehosting.com/centos-vps.html
