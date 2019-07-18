[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mastering user groups on Linux)
[#]: via: (https://www.networkworld.com/article/3409781/mastering-user-groups-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Mastering user groups on Linux
======
Managing user groups on Linux systems is easy, but the commands can be more flexible than you might be aware.
![Scott 97006 \(CC BY 2.0\)][1]

User groups play an important role on Linux systems. They provide an easy way for a select groups of users to share files with each other. They also allow sysadmins to more effectively manage user privileges, since they can assign privileges to groups rather than individual users.

While a user group is generally created whenever a user account is added to a system, there’s still a lot to know about how they work and how to work with them.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

### One user, one group?

Most user accounts on Linux systems are set up with the user and group names the same. The user "jdoe" will be set up with a group named "jdoe" and will be the only member of that newly created group. The user’s login name, user id, and group id will be added to the **/etc/passwd** and **/etc/group** files when the account is added, as shown in this example:

```
$ sudo useradd jdoe
$ grep jdoe /etc/passwd
jdoe:x:1066:1066:Jane Doe:/home/jdoe:/bin/sh
$ grep jdoe /etc/group
jdoe:x:1066:
```

The values in these files allow the system to translate between the text (jdoe) and numeric (1066) versions of the user id — jdoe is 1066 and 1066 is jdoe.

The assigned UID (user id) and GID (group id) for each user are generally the same and configured sequentially. If Jane Doe in the above example were the most recently added user, the next new user would likely be assigned 1067 as their user and group IDs.

### GID = UID?

UIDs and GIDs can get of out sync. For example, if you add a group using the **groupadd** command without specifying a group id, your system will assign the next available group id (in this case, 1067). The next user to be added to the system would then get 1067 as a UID but 1068 as a GID.

You can avoid this issue by specifying a smaller group id when you add a group rather than going with the default. In this command, we add a new group and provide a GID that is smaller than the range used for user accounts.

```
$ sudo groupadd -g 500 devops
```

If it works better for you, you can specify a shared group when you create accounts. For example, you might want to assign new development staff members to a devops group instead of putting each one in their own group.

```
$ sudo useradd -g staff bennyg
$ grep bennyg /etc/passwd
bennyg:x:1064:50::/home/bennyg:/bin/sh
```

### Primary and secondary groups

There are actually two types of groups — primary and secondary.

The **primary group** is the one that’s recorded in the **/etc/passwd** file, configured when an account is set up. When a user creates a file, it’s their primary group that is associated with it.

```
$ whoami
jdoe
$ grep jdoe /etc/passwd
jdoe:x:1066:1066:John Doe:/home/jdoe:/bin/bash
             ^
             |
             +-------- primary group
$ touch newfile
$ ls -l newfile
-rw-rw-r-- 1 jdoe jdoe 0 Jul 16 15:22 newfile
                   ^
                   |
                   +-------- primary group
```

**Secondary groups** are those that users might be added to once they already have accounts. Secondary group memberships show up in the /etc/group file.

```
$ grep devops /etc/group
devops:x:500:shs,jadep
          ^
          |
          +-------- secondary group for shs and jadep
```

The **/etc/group** file assigns names to user groups (e.g., 500 = devops) and records secondary group members.

### Preferred convention

The convention of having each user a member of their own group and optionally a member of any number of secondary groups allows users to more easily separate files that are personal from those they need to share with co-workers. When a user creates a file, members of the various user groups they belong to don't necessarily have access. A user will have to use the **chgrp** command to associate a file with a secondary group.

### There’s no place like /home

One important detail when adding a new account is that the **useradd** command does not necessarily add a home directory for a new user. If you want this step to be taken only some of the time, you can add **-m** (think of this as the “make home” option) with your useradd commands.

```
$ sudo useradd -m -g devops -c "John Doe" jdoe2
```

The options in this command:

  * **-m** creates the home directory and populates it with start-up files
  * **-g** specifies the group to assign the user to
  * **-c** adds a descriptor for the account (usually the person’s name)



If you want a home directory to be created _all_ of the time, you can change the default behavior by editing the **/etc/login.defs** file. Change or add a setting for the CREATE_HOME variable and set it to “yes”:

```
$ grep CREATE_HOME /etc/login.defs
CREATE_HOME     yes
```

Another option is to set yourself up with an alias so that **useradd** always uses the -m option.

```
$ alias useradd=’useradd -m’
```

Make sure you add the alias to your ~/.bashrc or similar start-up file to make it permanent.

### Looking into /etc/login.defs

Here’s a command to list all the setting in the /etc/login.defs file. The **grep** commands are hiding comments and blank lines.

```
$ cat /etc/login.defs | grep -v "^#" | grep -v "^$"
MAIL_DIR        /var/mail
FAILLOG_ENAB            yes
LOG_UNKFAIL_ENAB        no
LOG_OK_LOGINS           no
SYSLOG_SU_ENAB          yes
SYSLOG_SG_ENAB          yes
FTMP_FILE       /var/log/btmp
SU_NAME         su
HUSHLOGIN_FILE  .hushlogin
ENV_SUPATH      PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV_PATH        PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
TTYGROUP        tty
TTYPERM         0600
ERASECHAR       0177
KILLCHAR        025
UMASK           022
PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
UID_MIN                  1000
UID_MAX                 60000
GID_MIN                  1000
GID_MAX                 60000
LOGIN_RETRIES           5
LOGIN_TIMEOUT           60
CHFN_RESTRICT           rwh
DEFAULT_HOME    yes
CREATE_HOME         yes                 <===
USERGROUPS_ENAB yes
ENCRYPT_METHOD SHA512
```

Notice the various settings in this file determine the range of user ids to be used along with password aging and other setting (e.g., umask).

### How to display a user’s groups

Users can be members of multiple groups for various reasons. Group membership gives a user access to group-owned files and directories, and sometimes this behavior is critical. To generate a list of the groups that some user belongs to, use the **groups** command.

```
$ groups jdoe
jdoe : jdoe adm admin cdrom sudo dip plugdev lpadmin staff sambashare
```

You can list your own groups by typing “groups” without an argument.

### How to add users to groups

If you want to add an existing user to another group, you can do that with a command like this:

```
$ sudo usermod -a -G devops jdoe
```

You can also add a user to multiple groups by specifying the groups in a comma-separated list:

```
$ sudo usermod -a -G devops,mgrs jdoe
```

The **-a** argument means “add” while **-G** lists the groups.

You can remove a user from a group by editing the **/etc/group** file and removing the username from the list. The usermod command may also have an option for removing a member from a group.

```
fish:x:16:nemo,dory,shark
           |
           V
fish:x:16:nemo,dory
```

### Wrap-up

Adding and managing user groups isn't particularly difficult, but consistency in how you configure accounts can make it easier in the long run.

**[ Now see: [Must-know Linux Commands][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3409781/mastering-user-groups-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/carrots-100801917-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
