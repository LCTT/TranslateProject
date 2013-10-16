Daily Ubuntu Tips – Adding Users To Existing Groups
================================================================================
For new users and newbies who are just starting out with Ubuntu, managing users and groups can be challenging especially since the old users and group management tool doesn’t come with Ubuntu anymore. In prior versions of Ubuntu, one could easily manage users and group with the users-admin tool which is part of Gnome system tools.

That tool no longer come with Ubuntu. Now the only tool that’s available is simplified and only allows you to create, manage and delete user accounts. So, if you need to add or delete users from groups in Ubuntu, you’re going to use the commands terminal or console.

For example, if you want to give certain users access to files or increase their access level, the best way to do it is with group permissions. You create a group, then give the group the correct permissions and add users to the group to assume those permissions.

Since there’s no easy way to manage group permissions in Ubuntu currently, this brief tutorial is going to show you how to do it from the command console. It’s just a one-line command and not too complicated once you understand it.

To get started, press **Ctrl – Alt – T** on your keyboard to open the terminal.

To view all current groups on Ubuntu, type the command groupmod and (**hit the tab key 3 times**).

    groupmod <HIT TAB 3 TIMES>

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/groupsubuntuadduser.png)

That will list all the current groups on your system. Now to add user to existing groups in Ubuntu, run the commands below.

    sudo adduser USERNAME GROUPNAME

For example, if you wish to add Richard the sudo group, run the commands below

    sudo adduser richard sudo

That’s it. To verify a user group membership, run the commands below.

    id richard

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-adding-users-existing-groups/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)