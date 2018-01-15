Managing users on Linux systems
======
Your Linux users may not be raging bulls, but keeping them happy is always a challenge as it involves managing their accounts, monitoring their access rights, tracking down the solutions to problems they run into, and keeping them informed about important changes on the systems they use. Here are some of the tasks and tools that make the job a little easier.

### Configuring accounts

Adding and removing accounts is the easier part of managing users, but there are still a lot of options to consider. Whether you use a desktop tool or go with command line options, the process is largely automated. You can set up a new user with a command as simple as **adduser jdoe** and a number of things will happen. John 's account will be created using the next available UID and likely populated with a number of files that help to configure his account. When you run the adduser command with a single argument (the new username), it will prompt for some additional information and explain what it is doing.
```
$ sudo adduser jdoe
Adding user `jdoe' ...
Adding new group `jdoe' (1001) ...
Adding new user `jdoe' (1001) with group `jdoe' ...
Creating home directory `/home/jdoe' ...
Copying files from `/etc/skel' …
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully
Changing the user information for jdoe
Enter the new value, or press ENTER for the default
 Full Name []: John Doe
 Room Number []:
 Work Phone []:
 Home Phone []:
 Other []:
Is the information correct? [Y/n] Y

```

As you can see, adduser adds the user's information (to the /etc/passwd and /etc/shadow files), creates the new home directory and populates it with some files from /etc/skel, prompts for you to assign the initial password and identifying information, and then verifies that it's got everything right. If you answer "n" for no at the final "Is the information correct?" prompt, it will run back through all of your previous answers, allowing you to change any that you might want to change.

Once an account is set up, you might want to verify that it looks as you'd expect. However, a better strategy is to ensure that the choices being made "automagically" match what you want to see _before_ you add your first account. The defaults are defaults for good reason, but it 's useful to know where they're defined in case you want some to be different - for example, if you don't want home directories in /home, you don't want user UIDs to start with 1000, or you don't want the files in home directories to be readable by _everyone_ on the system.

Some of the details of how the adduser command works are configured in the /etc/adduser.conf file. This file contains a lot of settings that determine how new accounts are configured and will look something like this. Note that the comments and blanks lines are omitted in the output below so that we can focus more easily on just the settings.
```
$ cat /etc/adduser.conf | grep -v "^#" | grep -v "^$"
DSHELL=/bin/bash
DHOME=/home
GROUPHOMES=no
LETTERHOMES=no
SKEL=/etc/skel
FIRST_SYSTEM_UID=100
LAST_SYSTEM_UID=999
FIRST_SYSTEM_GID=100
LAST_SYSTEM_GID=999
FIRST_UID=1000
LAST_UID=29999
FIRST_GID=1000
LAST_GID=29999
USERGROUPS=yes
USERS_GID=100
DIR_MODE=0755
SETGID_HOME=no
QUOTAUSER=""
SKEL_IGNORE_REGEX="dpkg-(old|new|dist|save)"

```

As you can see, we've got a default shell (DSHELL), the starting value for UIDs (FIRST_UID), the location for home directories (DHOME) and the source location for startup files (SKEL) that will be added to each account as it is set up - along with a number of additional settings. This file also specifies the permissions to be assigned to home directories (DIR_MODE).

One of the more important settings is DIR_MODE, which determines the permissions that are used for each user's home directory. Given this setting, the permissions assigned to a directory that the user creates will be 755. Given this setting, home directories will be set up with rwxr-xr-x permissions. Users will be able to read other users' files, but not modify or remove them. If you want to be more restrictive, you can change this setting to 750 (no access by anyone outside the user's group) or even 700 (no access but the user himself).

Any user account settings can be manually changed after the accounts are set up. For example, you can edit the /etc/passwd file or chmod home directory, but configuring the /etc/adduser.conf file _before_ you start adding accounts on a new server will ensure some consistency and save you some time and trouble over the long run.

Changes to the /etc/adduser.conf file will affect all accounts that are set up subsequent to those changes. If you want to set up some specific account differently, you've also got the option of providing account configuration options as arguments with the adduser command in addition to the username. Maybe you want to assign a different shell for some user, request a specific UID, or disable logins altogether. The man page for the adduser command will display some of your choices for configuring an individual account.
```
adduser [options] [--home DIR] [--shell SHELL] [--no-create-home]
[--uid ID] [--firstuid ID] [--lastuid ID] [--ingroup GROUP | --gid ID]
[--disabled-password] [--disabled-login] [--gecos GECOS]
[--add_extra_groups] [--encrypt-home] user

```

These days probably every Linux system is, by default, going to put each user into his or her own group. As an admin, you might elect to do things differently. You might find that putting users in shared groups works better for your site, electing to use adduser's --gid option to select a specific group. Users can, of course, always be members of multiple groups, so you have some options on how to manage groups -- both primary and secondary.

### Dealing with user passwords

Since it's always a bad idea to know someone else's password, admins will generally use a temporary password when they set up an account and then run a command that will force the user to change his password on his first login. Here's an example:
```
$ sudo chage -d 0 jdoe

```

When the user logs in, he will see something like this:
```
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for jdoe.
(current) UNIX password:

```

### Adding users to secondary groups

To add a user to a secondary group, you might use the usermod command as shown below -- to add the user to the group and then verify that the change was made.
```
$ sudo usermod -a -G sudo jdoe
$ sudo grep sudo /etc/group
sudo:x:27:shs,jdoe

```

Keep in mind that some groups -- like the sudo or wheel group -- imply certain privileges. More on this in a moment.

### Removing accounts, adding groups, etc.

Linux systems also provide commands to remove accounts, add new groups, remove groups, etc. The **deluser** command, for example, will remove the user login entries from the /etc/passwd and /etc/shadow files but leave her home directory intact unless you add the --remove-home or --remove-all-files option. The **addgroup** command adds a group, but will give it the next group id in the sequence (i.e., likely in the user group range) unless you use the --gid option.
```
$ sudo addgroup testgroup --gid=131
Adding group `testgroup' (GID 131) ...
Done.

```

### Managing privileged accounts

Some Linux systems have a wheel group that gives members the ability to run commands as root. In this case, the /etc/sudoers file references this group. On Debian systems, this group is called sudo, but it works the same way and you'll see a reference like this in the /etc/sudoers file:
```
%sudo ALL=(ALL:ALL) ALL

```

This setting basically means that anyone in the wheel or sudo group can run all commands with the power of root once they preface them with the sudo command.

You can also add more limited privileges to the sudoers file -- maybe to give particular users the ability to run one or two commands as root. If you do, you should also periodically review the /etc/sudoers file to gauge how much privilege users have and very that the privileges provided are still required.

In the command shown below, we're looking at the active lines in the /etc/sudoers file. The most interesting lines in this file include the path set for commands that can be run using the sudo command and the two groups that are allowed to run commands via sudo. As was just mentioned, individuals can be given permissions by being directly included in the sudoers file, but it is generally better practice to define privileges through group memberships.
```
# cat /etc/sudoers | grep -v "^#" | grep -v "^$"
Defaults env_reset
Defaults mail_badpass
Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
root ALL=(ALL:ALL) ALL
%admin ALL=(ALL) ALL		<== admin group
%sudo ALL=(ALL:ALL) ALL	<== sudo group

```

### Checking on logins

To see when a user last logged in, you can use a command like this one:
```
# last jdoe
jdoe pts/18 192.168.0.11 Thu Sep 14 08:44 - 11:48 (00:04)
jdoe pts/18 192.168.0.11 Thu Sep 14 13:43 - 18:44 (00:00)
jdoe pts/18 192.168.0.11 Thu Sep 14 19:42 - 19:43 (00:00)

```

If you want to see when each of your users last logged in, you can run the last command through a loop like this one:
```
$ for user in `ls /home`; do last $user | head -1; done

jdoe pts/18 192.168.0.11 Thu Sep 14 19:42 - 19:43 (00:03)

rocket pts/18 192.168.0.11 Thu Sep 14 13:02 - 13:02 (00:00)
shs pts/17 192.168.0.11 Thu Sep 14 12:45 still logged in


```

This command will only show you users who have logged on since the current wtmp file became active. The blank lines indicate that some users have never logged in since that time, but doesn't call them out. A better command would be this one that clear displays the users who have not logged in at all in this time period:
```
$ for user in `ls /home`; do echo -n "$user ";last $user | head -1 | awk '{print substr($0,40)}'; done
dhayes
jdoe pts/18 192.168.0.11 Thu Sep 14 19:42 - 19:43
peanut pts/19 192.168.0.29 Mon Sep 11 09:15 - 17:11
rocket pts/18 192.168.0.11 Thu Sep 14 13:02 - 13:02
shs pts/17 192.168.0.11 Thu Sep 14 12:45 still logged
tsmith

```

That command is a lot to type, but could be turned into a script to make it a lot easier to use.
```
#!/bin/bash

for user in `ls /home`
do
 echo -n "$user ";last $user | head -1 | awk '{print substr($0,40)}'
done

```

Sometimes this kind of information can alert you to changes in users' roles that suggest they may no longer need the accounts in question.

### Communicating with users

Linux systems provide a number of ways to communicate with your users. You can add messages to the /etc/motd file that will be displayed when a user logs into a server using a terminal connection. You can also message users with commands such as write (message to single user) or wall (write to all logled in users.
```
$ wall System will go down in one hour

Broadcast message from shs@stinkbug (pts/17) (Thu Sep 14 14:04:16 2017):

System will go down in one hour

```

Important messages should probably be delivered through multiple channels as it's difficult to predict what users will actually notice. Together, message-of-the-day (motd), wall, and email notifications might stand of chance of getting most of your users' attention.

### Paying attention to log files

Paying attention to log files can also help you understand user activity. In particular, the /var/log/auth.log file will show you user login and logout activity, creation of new groups, etc. The /var/log/messages or /var/log/syslog files will tell you more about system activity.

### Tracking problems and requests

Whether or not you install a ticketing application on your Linux system, it's important to track the problems that your users run into and the requests that they make. Your users won't be happy if some portion of their requests fall through the proverbial cracks. Even a paper log could be helpful or, better yet, a spreadsheet that allows you to notice what issues are still outstanding and what the root cause of the problems turned out to be. Ensuring that problems and requests are addressed is important and logs can also help you remember what you had to do to address a problem that re-emerges many months or even years later.

### Wrap-up

Managing user accounts on a busy server depends in part on starting out with well configured defaults and in part on monitoring user activities and problems encountered. Users are likely to be happy if they feel you are responsive to their concerns and know what to expect when system upgrades are needed.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3225109/linux/managing-users-on-linux-systems.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
