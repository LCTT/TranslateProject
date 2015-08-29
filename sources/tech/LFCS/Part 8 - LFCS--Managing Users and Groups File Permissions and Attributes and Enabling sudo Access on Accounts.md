Translating by Xuanwo

Part 8 - LFCS: Managing Users & Groups, File Permissions & Attributes and Enabling sudo Access on Accounts
================================================================================
Last August, the Linux Foundation started the LFCS certification (Linux Foundation Certified Sysadmin), a brand new program whose purpose is to allow individuals everywhere and anywhere take an exam in order to get certified in basic to intermediate operational support for Linux systems, which includes supporting running systems and services, along with overall monitoring and analysis, plus intelligent decision-making to be able to decide when it’s necessary to escalate issues to higher level support teams.

![Linux Users and Groups Management](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-8.png)

Linux Foundation Certified Sysadmin – Part 8

Please have a quick look at the following video that describes an introduction to the Linux Foundation Certification Program.

注：youtube视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This article is Part 8 of a 10-tutorial long series, here in this section, we will guide you on how to manage users and groups permissions in Linux system, that are required for the LFCS certification exam.

Since Linux is a multi-user operating system (in that it allows multiple users on different computers or terminals to access a single system), you will need to know how to perform effective user management: how to add, edit, suspend, or delete user accounts, along with granting them the necessary permissions to do their assigned tasks.

### Adding User Accounts ###

To add a new user account, you can run either of the following two commands as root.

    # adduser [new_account]
    # useradd [new_account]

When a new user account is added to the system, the following operations are performed.

1. His/her home directory is created (/home/username by default).

2. The following hidden files are copied into the user’s home directory, and will be used to provide environment variables for his/her user session.

    .bash_logout
    .bash_profile
    .bashrc

3. A mail spool is created for the user at /var/spool/mail/username.

4. A group is created and given the same name as the new user account.

**Understanding /etc/passwd**

The full account information is stored in the /etc/passwd file. This file contains a record per system user account and has the following format (fields are delimited by a colon).

    [username]:[x]:[UID]:[GID]:[Comment]:[Home directory]:[Default shell]

- Fields [username] and [Comment] are self explanatory.
- The x in the second field indicates that the account is protected by a shadowed password (in /etc/shadow), which is needed to logon as [username].
- The [UID] and [GID] fields are integers that represent the User IDentification and the primary Group IDentification to which [username] belongs, respectively.
- The [Home directory] indicates the absolute path to [username]’s home directory, and
- The [Default shell] is the shell that will be made available to this user when he or she logins the system.

**Understanding /etc/group**

Group information is stored in the /etc/group file. Each record has the following format.

    [Group name]:[Group password]:[GID]:[Group members]

- [Group name] is the name of group.
- An x in [Group password] indicates group passwords are not being used.
- [GID]: same as in /etc/passwd.
- [Group members]: a comma separated list of users who are members of [Group name].

![Add User Accounts in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/add-user-accounts.png)

Add User Accounts

After adding an account, you can edit the following information (to name a few fields) using the usermod command, whose basic syntax of usermod is as follows.

    # usermod [options] [username]

**Setting the expiry date for an account**

Use the –expiredate flag followed by a date in YYYY-MM-DD format.

    # usermod --expiredate 2014-10-30 tecmint

**Adding the user to supplementary groups**

Use the combined -aG, or –append –groups options, followed by a comma separated list of groups.

    # usermod --append --groups root,users tecmint

**Changing the default location of the user’s home directory**

Use the -d, or –home options, followed by the absolute path to the new home directory.

    # usermod --home /tmp tecmint

**Changing the shell the user will use by default**

Use –shell, followed by the path to the new shell.

    # usermod --shell /bin/sh tecmint

**Displaying the groups an user is a member of**

    # groups tecmint
    # id tecmint

Now let’s execute all the above commands in one go.

    # usermod --expiredate 2014-10-30 --append --groups root,users --home /tmp --shell /bin/sh tecmint

![usermod Command Examples](http://www.tecmint.com/wp-content/uploads/2014/10/usermod-command-examples.png)

usermod Command Examples

Read Also:

- [15 useradd Command Examples in Linux][1]
- [15 usermod Command Examples in Linux][2]

For existing accounts, we can also do the following.

**Disabling account by locking password**

Use the -L (uppercase L) or the –lock option to lock a user’s password.

    # usermod --lock tecmint

**Unlocking user password**

Use the –u or the –unlock option to unlock a user’s password that was previously blocked.

    # usermod --unlock tecmint

![Lock User in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/lock-user-in-linux.png)

Lock User Accounts

**Creating a new group for read and write access to files that need to be accessed by several users**

Run the following series of commands to achieve the goal.

    # groupadd common_group # Add a new group
    # chown :common_group common.txt # Change the group owner of common.txt to common_group
    # usermod -aG common_group user1 # Add user1 to common_group
    # usermod -aG common_group user2 # Add user2 to common_group
    # usermod -aG common_group user3 # Add user3 to common_group

**Deleting a group**

You can delete a group with the following command.

    # groupdel [group_name]

If there are files owned by group_name, they will not be deleted, but the group owner will be set to the GID of the group that was deleted.

### Linux File Permissions ###

Besides the basic read, write, and execute permissions that we discussed in [Setting File Attributes – Part 3][3] of this series, there are other less used (but not less important) permission settings, sometimes referred to as “special permissions”.

Like the basic permissions discussed earlier, they are set using an octal file or through a letter (symbolic notation) that indicates the type of permission.
Deleting user accounts

You can delete an account (along with its home directory, if it’s owned by the user, and all the files residing therein, and also the mail spool) using the userdel command with the –remove option.

    # userdel --remove [username]

#### Group Management ####

Every time a new user account is added to the system, a group with the same name is created with the username as its only member. Other users can be added to the group later. One of the purposes of groups is to implement a simple access control to files and other system resources by setting the right permissions on those resources.

For example, suppose you have the following users.

- user1 (primary group: user1)
- user2 (primary group: user2)
- user3 (primary group: user3)

All of them need read and write access to a file called common.txt located somewhere on your local system, or maybe on a network share that user1 has created. You may be tempted to do something like,

    # chmod 660 common.txt
    OR
    # chmod u=rw,g=rw,o= common.txt [notice the space between the last equal sign and the file name]

However, this will only provide read and write access to the owner of the file and to those users who are members of the group owner of the file (user1 in this case). Again, you may be tempted to add user2 and user3 to group user1, but that will also give them access to the rest of the files owned by user user1 and group user1.

This is where groups come in handy, and here’s what you should do in a case like this.

**Understanding Setuid**

When the setuid permission is applied to an executable file, an user running the program inherits the effective privileges of the program’s owner. Since this approach can reasonably raise security concerns, the number of files with setuid permission must be kept to a minimum. You will likely find programs with this permission set when a system user needs to access a file owned by root.

Summing up, it isn’t just that the user can execute the binary file, but also that he can do so with root’s privileges. For example, let’s check the permissions of /bin/passwd. This binary is used to change the password of an account, and modifies the /etc/shadow file. The superuser can change anyone’s password, but all other users should only be able to change their own.

![passwd Command Examples](http://www.tecmint.com/wp-content/uploads/2014/10/passwd-command.png)

passwd Command Examples

Thus, any user should have permission to run /bin/passwd, but only root will be able to specify an account. Other users can only change their corresponding passwords.

![Change User Password in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/change-user-password.png)

Change User Password

**Understanding Setgid**

When the setgid bit is set, the effective GID of the real user becomes that of the group owner. Thus, any user can access a file under the privileges granted to the group owner of such file. In addition, when the setgid bit is set on a directory, newly created files inherit the same group as the directory, and newly created subdirectories will also inherit the setgid bit of the parent directory. You will most likely use this approach whenever members of a certain group need access to all the files in a directory, regardless of the file owner’s primary group.

    # chmod g+s [filename]

To set the setgid in octal form, prepend the number 2 to the current (or desired) basic permissions.

    # chmod 2755 [directory]

**Setting the SETGID in a directory**

![Add Setgid in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/add-setgid-to-directory.png)

Add Setgid to Directory

**Understanding Sticky Bit**

When the “sticky bit” is set on files, Linux just ignores it, whereas for directories it has the effect of preventing users from deleting or even renaming the files it contains unless the user owns the directory, the file, or is root.

# chmod o+t [directory]

To set the sticky bit in octal form, prepend the number 1 to the current (or desired) basic permissions.

# chmod 1755 [directory]

Without the sticky bit, anyone able to write to the directory can delete or rename files. For that reason, the sticky bit is commonly found on directories, such as /tmp, that are world-writable.

![Add Stickybit in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/add-sticky-bit-to-directory.png)

Add Stickybit to Directory

### Special Linux File Attributes ###

There are other attributes that enable further limits on the operations that are allowed on files. For example, prevent the file from being renamed, moved, deleted, or even modified. They are set with the [chattr command][4] and can be viewed using the lsattr tool, as follows.

    # chattr +i file1
    # chattr +a file2

After executing those two commands, file1 will be immutable (which means it cannot be moved, renamed, modified or deleted) whereas file2 will enter append-only mode (can only be open in append mode for writing).

![Protect File from Deletion](http://www.tecmint.com/wp-content/uploads/2014/10/chattr-command.png)

Chattr Command to Protect Files

### Accessing the root Account and Using sudo ###

One of the ways users can gain access to the root account is by typing.

    $ su

and then entering root’s password.

If authentication succeeds, you will be logged on as root with the current working directory as the same as you were before. If you want to be placed in root’s home directory instead, run.

    $ su -

and then enter root’s password.

![Enable sudo Access on Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Enable-Sudo-Access.png)

Enable Sudo Access on Users

The above procedure requires that a normal user knows root’s password, which poses a serious security risk. For that reason, the sysadmin can configure the sudo command to allow an ordinary user to execute commands as a different user (usually the superuser) in a very controlled and limited way. Thus, restrictions can be set on a user so as to enable him to run one or more specific privileged commands and no others.

- Read Also: [Difference Between su and sudo User][5]

To authenticate using sudo, the user uses his/her own password. After entering the command, we will be prompted for our password (not the superuser’s) and if the authentication succeeds (and if the user has been granted privileges to run the command), the specified command is carried out.

To grant access to sudo, the system administrator must edit the /etc/sudoers file. It is recommended that this file is edited using the visudo command instead of opening it directly with a text editor.

    # visudo

This opens the /etc/sudoers file using vim (you can follow the instructions given in [Install and Use vim as Editor – Part 2][6] of this series to edit the file).

These are the most relevant lines.

    Defaults    secure_path="/usr/sbin:/usr/bin:/sbin"
    root        ALL=(ALL) ALL
    tecmint     ALL=/bin/yum update
    gacanepa    ALL=NOPASSWD:/bin/updatedb
    %admin      ALL=(ALL) ALL

Let’s take a closer look at them.

    Defaults    secure_path="/usr/sbin:/usr/bin:/sbin:/usr/local/bin"

This line lets you specify the directories that will be used for sudo, and is used to prevent using user-specific directories, which can harm the system.

The next lines are used to specify permissions.

    root        ALL=(ALL) ALL

- The first ALL keyword indicates that this rule applies to all hosts.
- The second ALL indicates that the user in the first column can run commands with the privileges of any user.
- The third ALL means any command can be run.

    tecmint     ALL=/bin/yum update

If no user is specified after the = sign, sudo assumes the root user. In this case, user tecmint will be able to run yum update as root.

    gacanepa    ALL=NOPASSWD:/bin/updatedb

The NOPASSWD directive allows user gacanepa to run /bin/updatedb without needing to enter his password.

    %admin      ALL=(ALL) ALL

The % sign indicates that this line applies to a group called “admin”. The meaning of the rest of the line is identical to that of an regular user. This means that members of the group “admin” can run all commands as any user on all hosts.

To see what privileges are granted to you by sudo, use the “-l” option to list them.

![Sudo Access Rules](http://www.tecmint.com/wp-content/uploads/2014/10/sudo-access-rules.png)

Sudo Access Rules

### Summary ###

Effective user and file management skills are essential tools for any system administrator. In this article we have covered the basics and hope you can use it as a good starting to point to build upon. Feel free to leave your comments or questions below, and we’ll respond quickly.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-users-and-groups-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/add-users-in-linux/
[2]:http://www.tecmint.com/usermod-command-examples/
[3]:http://www.tecmint.com/compress-files-and-finding-files-in-linux/
[4]:http://www.tecmint.com/chattr-command-examples/
[5]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[6]:http://www.tecmint.com/vi-editor-usage/