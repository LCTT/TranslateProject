How to find a file on a Linux VPS
============================================================

 ![linux-find-command](https://www.rosehosting.com/blog/wp-content/uploads/2016/09/linux-find-command.png) 

Using the command line on a Linux machine could be very uncomfortable, especially for the beginners. Without a GUI it is very difficult to navigate through the directories and find the files you need. In this tutorial, we will show you how to find a specific file if you are using [Linux VPS][1].

The first thing your need to do is to [connect to your Linux VPS via SSH][2]. There are two common ways to search for a file under Linux. The one way is to use the `find` command and the other way is to use the `locate` command. Let’s start with the former.

### Find command

The Linux find command allows you to search the directory tree using various search criteria such as name, type, ownership, size etc. This is the basic syntax:

```
# find path expression search-term
```

Here is a brief example on how to use the Linux find command to find a specific file by its name:

```
# find -name test.file
```

The command will search the entire directory tree for a file named `test.file` and will provide you with the location. You can try using a name of a file that actually exists on your Linux VPS.

Sometimes it may take few minutes for the find command to search the entire directory tree, especially if there are many files and directories on your system. To save a significant amount of time you can specify the searching directory. For example, if you know that the `test.file` is somewhere in the `/var` directory, there is no need to search other directories. Therefore, you can use the command below:

```
# find /var -name test.file
```

There is also an option to search for a file by time, size, ownership, permissions etc. For more information about these options, you can check the Linux find command man page.

```
# man find
```

### Locate command

In order to be able to use the Linux `locate` command, you need to install it first.

If you are using an [Ubuntu VPS][3], run the following commands to install locate:

```
# apt-get update
# apt-get install mlocate
```

If you are using a [CentOS VPS][4], run the following command to install locate:

```
# yum install mlocate
```

Locate is a faster option to find a file since it searches for the files in a database. To update the search databases run the following command:

```
# updatedb
```

To find files with locate, use the following syntax:

```
# locate test.file
```

Just like with the find command, there are many options to filter the search output. To learn more about this you can check the Linux locate command man page.

```
# man locate
```

* * *

Of course, you don’t have to do any of this if you use one of our[ Linux VPS hosting][5] services, in which case you can simply ask our expert Linux admins to help you. They are available 24×7 and will take care of your request immediately.

PS. If you liked this post please share it with your friends on the social networks using the buttons on the left or simply leave a reply below. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/linux-find-file/

作者：[RoseHosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/linux-find-file/
[1]:https://www.rosehosting.com/
[2]:https://www.rosehosting.com/blog/connect-to-your-linux-vps-via-ssh/
[3]:https://www.rosehosting.com/ubuntu-vps.html
[4]:https://www.rosehosting.com/centos-vps.html
[5]:https://www.rosehosting.com/linux-vps-hosting.html
