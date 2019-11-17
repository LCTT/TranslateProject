[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intro to the Linux useradd command)
[#]: via: (https://opensource.com/article/19/10/linux-useradd-command)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Intro to the Linux useradd command
======
Add users (and customize their accounts as needed) with the useradd
command.
![people in different locations who are part of the same team][1]

Adding a user is one of the most fundamental exercises on any computer system; this article focuses on how to do it on a Linux system.

Before getting started, I want to mention three fundamentals to keep in mind. First, like with most operating systems, Linux users need an account to be able to log in. This article specifically covers local accounts, not network accounts such as LDAP. Second, accounts have both a name (called a username) and a number (called a user ID). Third, users are typically placed into a group. Groups also have a name and group ID.

As you'd expect, Linux includes a command-line utility for adding users; it's called **useradd**. You may also find the command **adduser**. Many distributions have added this symbolic link to the **useradd** command as a matter of convenience.


```
$ file `which adduser`
/usr/sbin/adduser: symbolic link to useradd
```

Let's take a look at **useradd**.

> Note: The defaults described in this article reflect those in Red Hat Enterprise Linux 8.0. You may find subtle differences in these files and certain defaults on other Linux distributions or other Unix operating systems such as FreeBSD or Solaris.

### Default behavior

The basic usage of **useradd** is quite simple: A user can be added just by providing their username.


```
`$ sudo useradd sonny`
```

In this example, the **useradd** command creates an account called _sonny_. A group with the same name is also created, and _sonny_ is placed in it to be used as the primary group. There are other parameters, such as language and shell, that are applied according to defaults and values set in the configuration files **/etc/default/useradd** and **/etc/login.defs**. This is generally sufficient for a single, personal system or a small, one-server business environment.

While the two files above govern the behavior of **useradd**, user information is stored in other files found in the **/etc** directory, which I will refer to throughout this article.

File | Description | Fields (bold—set by useradd)
---|---|---
passwd | Stores user account details | **username**:unused:**uid**:**gid**:**comment**:**homedir**:**shell**
shadow | Stores user account security details | **username**:password:lastchange:minimum:maximum:warn:**inactive**:**expire**:unused
group | Stores group details | **groupname**:unused:**gid**:**members**

### Customizable behavior

The command line allows customization for times when an administrator needs finer control, such as to specify a user's ID number.

#### User and group ID numbers

By default, **useradd** tries to use the same number for the user ID (UID) and primary group ID (GID), but there are no guarantees. Although it's not necessary for the UID and GID to match, it's easier for administrators to manage them when they do.

I have just the scenario to explain. Suppose I add another account, this time for Timmy. Comparing the two users, _sonny_ and _timmy_, shows that both users and their respective primary groups were created by using the **getent** command.


```
$ getent passwd sonny timmy
sonny❌1001:1002:Sonny:/home/sonny:/bin/bash
timmy❌1002:1003::/home/timmy:/bin/bash

$ getent group sonny timmy
sonny❌1002:
timmy❌1003:
```

Unfortunately, neither users' UID nor primary GID match. This is because the default behavior is to assign the next available UID to the user and then attempt to assign the same number to the primary group. However, if that number is already used, the next available GID is assigned to the group. To explain what happened, I hypothesize that a group with GID 1001 already exists and enter a command to confirm.


```
$ getent group 1001
book❌1001:alan
```

The group _book_ with the ID _1001_ has caused the GIDs to be off by one. This is an example where a system administrator would need to take more control of the user-creation process. To resolve this issue, I must first determine the next available user and group ID that will match. The commands **getent group** and **getent passwd** will be helpful in determining the next available number. This number can be passed with the **-u** argument.


```
$ sudo useradd -u 1004 bobby

$ getent passwd bobby; getent group bobby
bobby❌1004:1004::/home/bobby:/bin/bash
bobby❌1004:
```

Another good reason to specify the ID is for users that will be accessing files on a remote system using the Network File System (NFS). NFS is easier to administer when all client and server systems have the same ID configured for a given user. I cover this in a bit more detail in my article on [using autofs to mount NFS shares][2].

### More customization

Very often though, other account parameters need to be specified for a user. Here are brief examples of the most common customizations you may need to use.

#### Comment

The comment option is a plain-text field for providing a short description or other information using the **-c** argument.


```
$ sudo useradd -c "Bailey is cool" bailey
$ getent passwd bailey
bailey❌1011:1011:Bailey is cool:/home/bailey:/bin/bash
```

#### Groups

A user can be assigned one primary group and multiple secondary groups. The **-g** argument specifies the name or GID of the primary group. If it's not specified, **useradd** creates a primary group with the user's same name (as demonstrated above). The **-G** (uppercase) argument is used to pass a comma-separated list of groups that the user will be placed into; these are known as secondary groups.


```
$ sudo useradd -G tgroup,fgroup,libvirt milly
$ id milly
uid=1012(milly) gid=1012(milly) groups=1012(milly),981(libvirt),4000(fgroup),3000(tgroup)
```

#### Home directory

The default behavior of **useradd** is to create the user's home directory in **/home**. However, different aspects of the home directory can be overridden with the following arguments. The **-b** sets another directory where user homes can be placed. For example, **/home2** instead of the default **/home**.


```
$ sudo useradd -b /home2 vicky
$ getent passwd vicky
vicky❌1013:1013::/home2/vicky:/bin/bash
```

The **-d** lets you specify a home directory with a different name from the user.


```
$ sudo useradd -d /home/ben jerry
$ getent passwd jerry
jerry❌1014:1014::/home/ben:/bin/bash
```

#### The skeleton directory

The **-k** instructs the new user's new home directory to be populated with any files in the **/etc/skel** directory. These are usually shell configuration files, but they can be anything that a system administrator would like to make available to all new users.

#### Shell

The **-s** argument can be used to specify the shell. The default is used if nothing else is specified. For example, in the following, shell **bash** is defined in the default configuration file, but Wally has requested **zsh**.


```
$ grep SHELL /etc/default/useradd
SHELL=/bin/bash

$ sudo useradd -s /usr/bin/zsh wally
$ getent passwd wally
wally❌1004:1004::/home/wally:/usr/bin/zsh
```

#### Security

Security is an essential part of user management, so there are several options available with the **useradd** command. A user account can be given an expiration date, in the form YYYY-MM-DD, using the **-e** argument.


```
$ sudo useradd -e 20191231 sammy
$ sudo getent shadow sammy
sammy:!!:18171:0:99999:7::20191231:
```

An account can also be disabled automatically if the password expires. The **-f** argument will set the number of days after the password expires before the account is disabled. Zero is immediate.


```
$ sudo useradd -f 30 willy
$ sudo getent shadow willy
willy:!!:18171:0:99999:7:30::
```

### A real-world example

In practice, several of these arguments may be used when creating a new user account. For example, if I need to create an account for Perry, I might use the following command:


```
$ sudo useradd -u 1020 -c "Perry Example" \
-G tgroup -b /home2 \
-s /usr/bin/zsh \
-e 20201201 -f 5 perry
```

Refer to the sections above to understand each option. Verify the results with:


```
$ getent passwd perry; getent group perry; getent shadow perry; id perry
perry❌1020:1020:Perry Example:/home2/perry:/usr/bin/zsh
perry❌1020:
perry:!!:18171:0:99999:7:5:20201201:
uid=1020(perry) gid=1020(perry) groups=1020(perry),3000(tgroup)
```

### Some final advice

The **useradd** command is a "must-know" for any Unix (not just Linux) administrator. It is important to understand all of its options since user creation is something that you want to get right the first time. This means having a well-thought-out naming convention that includes a dedicated UID/GID range reserved for your users across your enterprise, not just on a single system—particularly when you're working in a growing organization.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/linux-useradd-command

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://opensource.com/article/18/6/using-autofs-mount-nfs-shares
