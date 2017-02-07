translating---geekpi

How to Create a Shared Directory for All Users in Linux
============================================================

As a system administrator, you may have a certain directory that you want to give read/write access to every user on a Linux server. In this guide, we will review how to enable write access to all users on a particular directory (shared directory) in Linux.

This calls for setting the appropriate access permissions, and the most effective as well as reliable method to allocating a common group for all the users who will share or have write access to the specific directory.

So, start by creating the directory and common group in case it doesn’t already exist on the system as follows:

```
$ sudo mkdir -p /var/www/reports/
$ sudo groupadd project 
```

Then add an existing user who will have write access to the directory: /var/www/reports/ to the group project as below.

```
$ sudo usermod -a -G project tecmint 
```
[
 ![Create Common Directory Group](http://www.tecmint.com/wp-content/uploads/2017/01/Create-Common-Directory-Group.png) 
][1]

Create Common Directory Group

The flags and arguments used in the above command are:

1.  `-a` – which adds the user to the supplementary group.
2.  `-G` – specifies the group name.
3.  `project` – group name.
4.  `tecmint` – existing username.

Afterwards, proceed to configure the appropriate permissions on the directory, where the option `-R` enables recursive operations into subdirectories:

```
$ sudo chgrp -R project /var/www/reports/
$ sudo chmod -R 2775 /var/www/reports/
```

Explaining the permissions 2775 in the chmod command above:

1.  `2` – turns on the setGID bit, implying–newly created subfiles inherit the same group as the directory, and newly created subdirectories inherit the set GID bit of the parent directory.
2.  `7` – gives rwx permissions for owner.
3.  `7` – gives rwx permissions for group.
4.  `5` – gives rx permissions for others.

You can create more system users and add them to the directory group as follows:

```
$ sudo useradd -m -c "Aaron Kili" -s/bin/bash -G project aaronkilik
$ sudo useradd -m -c "John Doo" -s/bin/bash -G project john
$ sudo useradd -m -c "Ravi Saive" -s/bin/bash -G project ravi
```

Then create subdirectories where the new users above will store their project reports:

```
$ sudo mkdir -p /var/www/reports/aaronkilik_reports
$ sudo mkdir -p /var/www/reports/johndoo_reports
$ sudo mkdir -p /var/www/reports/ravi_reports
```

Now you can create files/folders and share with other users on the same group.

That’s it! In this tutorial, we reviewed how to enable write access to all users on a particular directory. To understand more about users/groups in Linux, read [How to Manage Users/Groups File Permissions and Attributes][2].

Remember to offer us your thoughts about this article via the feedback form below.

--------------------------------------------------------------------------------

译者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-a-shared-directory-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-Common-Directory-Group.png
[2]:http://www.tecmint.com/manage-users-and-groups-in-linux/
