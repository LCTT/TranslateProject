[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Create a User Account Without useradd Command in Linux?)
[#]: via: (https://www.2daygeek.com/linux-user-account-creation-in-manual-method/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Create a User Account Without useradd Command in Linux?
======

There are three commands are available in Linux to create an user account.

Did you ever tried to create a user account in Linux using manual method?

I mean to say without using an above three commands.

If you don’t know how to do that? we are here to help you on this and will show you in details.

Have you wondering, how it’s possible? If yes, don’t worry, as we have mentioned many times that anything can be done on Linux. It is one of the example.

Yes, we can create it. Are you excited to know more it?

  * **[Three Methods To Create A User Account In Linux?][1]**
  * **[Two Methods To Create Bulk Users In Linux][2]**



I don’t want to you to wait any more. Let’s do it right away.

To do so, first, we need to find out last created UID and GID information. Once you have these information handy then proceed to next step.

```
# cat /etc/passwd | tail -1

tuser1:x:1153:1154:Test User:/home/tuser1:/bin/bash
```

Based on the above output. Last created user UID is 1153 and GID is 1154. To experiment this, we are going to add `tuser2` in the system.

Now, add an entry of user details in /etc/passwd. There are seven fields exist and you need to add required details.

```
+-----------------------------------------------------------------------+
|username:password:UID:GID:Comments:User Home Directory:User Login Shell|
+-----------------------------------------------------------------------+
    |         |     |   |      |            |                  |
    1         2     3   4      5            6                  7

1- Username: This field indicates the User name. Characters length should be between 1 to 32.
2- Password (x): It indicates that encrypted password is stored at /etc/shadow file.
3- User ID: It indicates the user ID (UID) each user should be contain unique UID. UID (0-Zero) is reserved for root, UID (1-99) reserved for system users and UID (100-999) reserved for system accounts/groups
4- Group ID (GID): It indicates the group ID (GID) each group should be contain unique GID is stored at /etc/group file.
5- Comment/User ID Info: It indicates the command field. This field can be used to describe the user information.
6- Home directory (/home/$USER): It indicates the user's home directory.
7- shell (/bin/bash): It indicates the user's shell.
```

Add the user information in end of the file.

```
# vi /etc/passwd

tuser2:x:1154:1155:Test User2:/home/tuser2:/bin/bash
```

You have to create a group with same name. So, add a group details in /etc/group file as well.

```
# vi /etc/group

tuser2:x:1155:
```

Once you done the above two steps, then set a password for user.

```
# passwd tuser2

Changing password for user tuser2.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

Finally, try to login with newly created user.

```
# ssh [email protected]

[email protected]'s password:
Creating directory '/home/tuser2'.

$ls -la

total 16
drwx------.  2 tuser2 tuser2   59 Jun 17 09:46 .
drwxr-xr-x. 15 root   root   4096 Jun 17 09:46 ..
-rw-------.  1 tuser2 tuser2   18 Jun 17 09:46 .bash_logout
-rw-------.  1 tuser2 tuser2  193 Jun 17 09:46 .bash_profile
-rw-------.  1 tuser2 tuser2  231 Jun 17 09:46 .bashrc
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-user-account-creation-in-manual-method/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-user-account-creation-useradd-adduser-newusers/
[2]: https://www.2daygeek.com/linux-bulk-users-creation-useradd-newusers/
