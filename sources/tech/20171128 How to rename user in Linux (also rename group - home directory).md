translating by lujun9972
How to rename user in Linux (also rename group & home directory)
======
We might have come across a situation where we might want to rename user in Linux system, for whatever reasons. We can easily rename user in Linux & also we can rename the home directory or its UID as well.

In this short tutorial, we will be discussing these things only. Let's start by renaming user in Linux first,
**(Recommended Read:[How to use FIND command to locate anything in Linux][1])** 
### Rename user in Linux

For renaming user in Linux systems, we will use ** 'usermod'** command. Syntax for the command is,

 **$ usermod -l new_username old_username**

For example, if we have a user named ** 'dan'** & want to rename it to **' susan'**, execute the following command from terminal;

 **$ sudo usermod -l susan dan**

This will only change the username & everything else, like group, home directory, UID will remain same.

 **Note:-** You should need to logged out from the account you are trying to rename. You can also kill all the processes running for that user, to do so execute the following command,

 **$ sudo pkill -u dan**

 **$ sudo pkill -9 -u dan**

### Renaming Home directory

For renaming home directory to correspond to the renamed user, we use ** '-d'** option with **' usermod'** command.,

 **$ sudo usermod -d /home/susan -m susan**

### Changing UID for the user

To change the UID of the user , execute the following command,

 **$ sudo usermod -u 2000 susan**

where **' 2000'** is the new UID for user.

### Renaming the group

To rename the group from ** 'dan'** to **' susan**', we will use **' groupmod'** command. Use the following command to rename the group,

 **$ groupmod -n susan dan**

Once we have made the required changes, we can than check the changes made using the ** 'id'** command,

 **$ id susan**

With this we end this tutorial on how to rename user in Linux. Please let us know if you have any question or any issue or if you do have any suggestion, please do let us know that as well.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/rename-user-in-linux-rename-home-directory/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/use-of-find-command/
