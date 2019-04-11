[#]: collector: (lujun9972)
[#]: translator: ( NeverKnowsTomorrow )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Four Methods To Add A User To Group In Linux)
[#]: via: (https://www.2daygeek.com/linux-add-user-to-group-primary-secondary-group-usermod-gpasswd/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Four Methods To Add A User To Group In Linux
======

Linux groups are organization units which are used to manage user accounts in Linux.

It has unique numerical identification number for each users and groups in the Linux system.

It’s called a userid (UID) and a groupid (GID). The main purpose of groups is to define a set of privileges to the member of the group.

They all can perform the particular operations but not others.

There are two types of default groups are available in Linux. Each user should have exactly one primary group and any number of secondary groups.

  * **Primary Group:** Primary group has been added to the user when the user account creation. It’s typically the name of the user. The primary group is applied to the user when performing any actions such as creating new files (or directories), modifying files, or executing commands, etc,. The user primary group information is stored in the `/etc/passwd` file.
  * **Secondary Group:** It’s known as Supplementary Groups. It allows the group of users to perform the particular action in the same group members files.
Say for example, if you would like to allow few users to run Apache (httpd) service command then it will perfectly suits.



You may have interested in the following articles which is related to user management.

  * [Three Methods To Create An User Account In Linux?][1]
  * [How To Create The Bulk Users In Linux?][2]
  * [How to Update/Change Users Password in Linux Using Different Ways][3]



It can be done using the following four methods.

  * **`usermod:`** The usermod command modifies the system account files to reflect the changes that are specified on the command line.
  * **`gpasswd:`** The gpasswd command is used to administer /etc/group, and /etc/gshadow. Every group can have administrators, members and a password.
  * **`Shell Script:`** Shell scripts are allow administrator to automate the required tasks.
  * **`Manual Method:`** We can manually add the users into any group by editing the `/etc/group` file.



I assume that you already have the necessary group and users for this activity. In this example, we are going to use following users and groups `user1`, `user2`, `user3` and group is `mygroup` and `mygroup1`.

Before making the changes, i would like to check the users and group information. See the details below.

I could see the below users were associate with their own group and not with others.

```
# id user1
uid=1008(user1) gid=1008(user1) groups=1008(user1)

# id user2
uid=1009(user2) gid=1009(user2) groups=1009(user2)

# id user3
uid=1010(user3) gid=1010(user3) groups=1010(user3)
```

I could see there is no users are associated in this group.

```
# getent group mygroup
mygroup:x:1012:

# getent group mygroup1
mygroup1:x:1013:
```

### Method-1: What Is usermod Command?

The usermod command modifies the system account files to reflect the changes that are specified on the command line.

### How to Add an Existing User to Secondary or Supplementary Group Using usermod Command?

To add an existing user to a secondary group, use the usermod command with `-G` option and the name of the group.
Syntax

```
# usermod [-G] [GroupName] [UserName]
```

You will be getting an error message if the given user or group doesn’t exist in your system. If you doesn’t get any error then the user has been added to the corresponding group.

```
# usermod -a -G mygroup user1
```

Let me see the output using id command. Yes, it’s added successfully.

```
# id user1
uid=1008(user1) gid=1008(user1) groups=1008(user1),1012(mygroup)
```

### How to Add an Existing User to Multiple Secondary or Supplementary Groups Using usermod Command?

To add an existing user to multiple secondary groups, use the usermod command with `-G` option and the name of the groups with comma.

Syntax

```
# usermod [-G] [GroupName1,GroupName2] [UserName]
```

In this example, we are going to add the `user2` into `mygroup` and `mygroup1`.

```
# usermod -a -G mygroup,mygroup1 user2
```

Let me see the output using id command. Yes, `user2` is successfully added into `mygroup` and `mygroup1`.

```
# id user2
uid=1009(user2) gid=1009(user2) groups=1009(user2),1012(mygroup),1013(mygroup1)
```

### How to Change a User’s Primary Group?

To change a user’s primary group, use the usermod command with `-g` option and the name of the group.

Syntax

```
# usermod [-g] [GroupName] [UserName]
```

We have to use `-g` to change user’s primary group.

```
# usermod -g mygroup user3
```

Let see the output. Yes, it has been successfully changed. Now, it’s showing `mygroup` as `user3` primary group instead of `user3`.

```
# id user3
uid=1010(user3) gid=1012(mygroup) groups=1012(mygroup)
```

### Method-2: What Is gpasswd Command?

The gpasswd command is used to administer /etc/group, and /etc/gshadow. Every group can have administrators, members and a password.

### How to Add an Existing User to Secondary or Supplementary Group Using gpasswd Command?

To add an existing user to a secondary group, use the gpasswd command with `-M` option and the name of the group.

Syntax

```
# gpasswd [-M] [UserName] [GroupName]
```

In this example, we are going to add the `user1` into `mygroup`.

```
# gpasswd -M user1 mygroup
```

Let me see the output using id command. Yes, `user1` is successfully added into `mygroup`.

```
# id  user1
uid=1008(user1) gid=1008(user1) groups=1008(user1),1012(mygroup)
```

### How to Add The Multiple User’s to Secondary or Supplementary Group Using gpasswd Command?

To add the multiple users to a secondary group, use the gpasswd command with `-M` option and the name of the group.

Syntax

```
# gpasswd [-M] [UserName1,UserName2] [GroupName]
```

In this example, we are going to add the `user2` and `user3` into `mygroup1`.

```
# gpasswd -M user2,user3 mygroup1
```

Let me see the output using getent command. Yes, `user2` and `user3` are successfully added into `mygroup1`.

```
# getent group mygroup1
mygroup1:x:1013:user2,user3
```

### How to Remove a User From a Group Using gpasswd Command?

To remove the user from the group, use the gpasswd command with `-d` option and the name of the user and group.

Syntax

```
# gpasswd [-d] [UserName] [GroupName]
```

In this example, we are going to remove the `user1` from `mygroup`.

```
# gpasswd -d user1 mygroup
Removing user user1 from group mygroup
```

### Method-3: Using Shell Script?

Based on the above examples what i came to know is the `usermod` command doesn’t has capable to add multiple users into the group but it can be done through the `gpasswd` command.

However, it will overwrite the existing users which are currently associated on the group.

For example, `user1` has already associated with `mygroup`. If you would like to add `user2` and `user3` into the `mygroup` with `gpasswd` command, it doesn’t work as expected and it over right the group instead of modifying it.

What would be the solution if you would like to add multiple users to multiple groups?

There is no default option is available in both of the commands to achieve this.

Hence, we need to write a small shell script to achieve this.

### Method-3a: How to Add The Multiple Users to Secondary or Supplementary Group Using gpasswd Command?

Create the following small shell script if you would like to add the multiple users to secondary or supplementary group using gpasswd command.

Create The Users list. Each user should be in separate line.

```
$ cat user-lists.txt
user1
user2
user3
```

Use the following shell script to add multiple users to single secondary group.

```
vi group-update.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
usermod -a -G mygroup $user
done
```

Set an executable permission to `group-update.sh` file.

```
# chmod + group-update.sh
```

Finally run the script to achieve this.

```
# sh group-update.sh
```

Let me see the output using getent command. Yes, `user1`, `user2` and `user3` are successfully added into `mygroup`.

```
# getent group mygroup
mygroup:x:1012:user1,user2,user3
```

### Method-3a: How to Add The Multiple Users Into Multiple Secondary or Supplementary Group Using gpasswd Command?

Create the following small shell script if you would like to add the multiple users into multiple secondary or supplementary group using gpasswd command.

Create The Users list. Each user should be in separate line.

```
$ cat user-lists.txt
user1
user2
user3
```

Create The Groups list. Each group should be in separate line.

```
$ cat group-lists.txt
mygroup
mygroup1
```

Use the following shell script to add multiple users to multiple secondary groups.

```
#!/bin/sh
for user in `more user-lists.txt`
do
for group in `more group-lists.txt`
do
usermod -a -G $group $user
done
done
```

Set an executable permission to `group-update-1.sh` file.

```
# chmod +x group-update-1.sh
```

Finally run the script to achieve this.

```
# sh group-update-1.sh
```

Let me see the output using getent command. Yes, `user1`, `user2` and `user3` are successfully added into `mygroup`.

```
# getent group mygroup
mygroup:x:1012:user1,user2,user3
```

Also, `user1`, `user2` and `user3` are successfully added into `mygroup1`.

```
# getent group mygroup1
mygroup1:x:1013:user1,user2,user3
```

### Method-4: Manual Method To Add A User Into A Group In Linux?

We can manually add the users into any group by editing the `/etc/group` file.

Open the `/etc/group` file and search the group name where you want to update the users. Finally update the Users into the corresponding group.

```
# vi /etc/group
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-add-user-to-group-primary-secondary-group-usermod-gpasswd/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-user-account-creation-useradd-adduser-newusers/
[2]: https://www.2daygeek.com/how-to-create-the-bulk-users-in-linux/
[3]: https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/
