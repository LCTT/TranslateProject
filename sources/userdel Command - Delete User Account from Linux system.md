Translating---------------geekpi


userdel Command - Delete User Account from Linux system
================================================================================
Maintaining users on the server means add them, modify them and delete them. When a user is no longer need on the system for any reasons, we should delete it to avoid security breach. On Linux system we have **userdel** command to delete a user

![](http://linoxide.com/wp-content/uploads/2013/12/userdel-linux-command.jpg)

### What is userdel ###

Userdel is a low level utility for removing users. On Debian, we should usually use deluser command. Userdel will look the system account files such as **/etc/password** and **/etc/group**. Then it will deleting all entries related to the user name. The user name must exist before we can delete it.

### How to use Userdel ###

Since userdel will modify system account files, we **need root privilege** to run it. Otherwise we will have an error message that saying “*only root can do that*” or similar. After we gain root privilege, we can delete a user by typing userdel from your console. Here’s a sample of default usage of userdel

    $ sudo userdel pasadena

or

    # userdel pasadena

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_default.png)

As you see above, we can’t delete a user with name pasadena without root privilege. When we have it, system give us no error which mean that user is deleted successfully.

### Completely remove user home directory ###

Using userdel without options, will only delete the user. User home directory will still remain at /home folder.

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_home_folder.png)

When we go into /home folder, we still seeing pasadena folder which owned by 1002. Created user will usually have a same group name with user name. 1002 was the UID and GID of pasadena user name and pasadena group name.

To completely remove the home user along user deletion, we can use -r option. This option will also delete user’s mail spool if exist.

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_r.png)

### Force delete a user ###

Userdel provide **-f** option to force user deletion. This option will delete a user even the user still log in into Linux system. Please take a look a sample screenshot.

![](http://linoxide.com/wp-content/uploads/2013/12/userdel_f.png)

Screenshot above show us that pasadena user is logged in to Linux system. It is marked by process **6218** which is SSHD process. But when we do “**userdel -f pasadena**” the command only show us the information that the user is logged in. The command itself was succeed. If we see the content of **/etc/passwd** file using [cat command][1], we don’t see pasadena user there. It’s home directory still exist but the owner is changed.

One thing that we must know that, userdel with **-f** option **did not broke** the SSH connection. So the user actually still logged in and active even the user is not exist. But when the user log off, the the user can not log in anymore because that user has been deleted.

So **this options is dangerous to use** since it can lead your system into inconsistent state.

Conclusion

Userdel is a tool to delete a user inside Linux system. Userdel also a backend of **deluser command**, a perl script to delete a user. As usual, you can always type **man userdel** to explore more detail about userdel command.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-userdel-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/13-cat-command-examples/