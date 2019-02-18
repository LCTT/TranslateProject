[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Grant And Remove Sudo Privileges To Users On Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-grant-and-remove-sudo-privileges-to-users-on-ubuntu/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Grant And Remove Sudo Privileges To Users On Ubuntu
======
![](https://www.ostechnix.com/wp-content/uploads/2019/02/sudo-privileges-720x340.png)

As you know already, the user can perform any administrative tasks with sudo privileges on Ubuntu systems. When creating a new users on your Linux box, they can’t do any administrative tasks until you make them to be a member of **‘sudo’ group**. In this brief tutorial, we explain how to add a regular user to sudo group and remove the given privileges to make it as just a normal user.

**Grant Sudo Privileges To A regular User On Linux**

Usually, we use **‘adduser’** command to create new user like below.

```
$ sudo adduser ostechnix
```

If you want the newly created user to perform any administrative tasks with sudo, just add him to the sudo group using command:

```
$ sudo usermod -a -G sudo hduser
```

The above command will make the user called **‘ostechnix’** to be the member of sudo group.

You can also use this command too to add the users to sudo group.

```
$ sudo adduser ostechnix sudo
```

Now, log out and log in back as the new user for this change to take effect. The user has now become an administrative user.

To verify it, just use ‘sudo’ as prefix in a any command.

```
$ sudo mkdir /test
[sudo] password for ostechnix:
```

### Remove sudo privileges of an User

Sometimes, you might want to remove sudo privileges to a particular user without deleting it from your Linux box. To make any user as a normal user, just remove them from the sudo group.

Say for example If you want to remove a user called **ostechnix** , from the sudo group, just run:

```
$ sudo deluser ostechnix sudo
```

**Sample output:**

```
Removing user `ostechnix' from group `sudo' ...
Done.
```

This command will only remove user ‘ostechnix’ from the sudo group, but it will not delete the user permanently from the system. Now, He becomes a regular user and can’t do any administrative tasks as sudo user.

Also, you can use the following command to revoke the sudo access from an user:

```
$ sudo gpasswd -d ostechnix sudo
```

Please be careful while removing users from the sudo group. Do not remove the real administrator from the “sudo” group.

Verify the user “ostechnix” has been really removed from sudo group using command:

```
$ sudo -l -U ostechnix
User ostechnix is not allowed to run sudo on ubuntuserver.
```

Yes, the user “ostechnix” has been removed from sudo group, and he can’t execute any administrative tasks.

Please be careful while removing a user from a sudo group. If you have only one sudo user on your system and you remove him from the sudo group, you can’t perform any administrative stuffs such as installing, removing and updating programs on your system. So, please be careful. In our next, tutorial, we will explain how to restore sudo privileges to a user

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-grant-and-remove-sudo-privileges-to-users-on-ubuntu/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
