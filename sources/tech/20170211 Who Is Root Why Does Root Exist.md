zhb127 申请翻译
Who Is Root? Why Does Root Exist?
============================================================

Have you ever wondered why there is a special account named `root` in Linux? Do you know what are the recommended best practices to use this account? Are you aware of the scenarios where it must be used and those where it doesn’t? If you answered “yes” to one or more of these questions, keep reading.

In this post we will provide a reference with information about the root account that you will want to keep handy.

### What is root?

To begin, let us keep in mind that the hierarchy of directories in Unix-like operating systems has been designed as a tree-like structure. The starting point is a special directory represented by a forward slash `(/)` with all other directories initially branching off from it. Since this is analogous to an actual tree, `/` is called the root directory.

In the following image we can see the output of:

```
$ tree -d / | less
```

which illustrates the analogy between `/` and the `root` of a tree.

[
 ![Hierarchy of Directories in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Linux-root-Directory-Tree.png) 
][1]

Hierarchy of Directories in Linux

Although the reasons behind the naming of the root account are not quite clear, it is likely due to the fact that root is the only account having write permissions inside `/`.

Additionally, root has access to all files and commands in any Unix-like operating system and it is often referred to as the superuser for that reason.

On a side note, the root directory `(/)` must not be confused with `/root`, which is the home directory of the root user. In fact, `/root` is a subdirectory of `/`.

### Gaining Access to root Permissions

When we talk about root (or superuser) privileges, we refer to the permissions that such account has on the system. These privileges include (but are not limited to) the ability to modify the system and to grant other users certain access permissions to its resources.

The reckless use of this power can lead to system corruption at best and total failure at worst. That is why the following guidelines are accepted as best practices when it comes to accessing the privileges of the root account:

Initially, use the root account to run visudo. Use that command to edit /etc/sudoers to grant the minimum superuser privileges that a given account (e.g. supervisor) needs.

This may include, for example, the ability to [create (adduser)][2] and [modify (usermod) user accounts][3] – and nothing else.

Moving forward, login as supervisor and [use sudo to perform user management tasks][4]. You will notice that attempting to perform other tasks that require superuser permissions (removing packages, for example) should fail.

[
 ![Run Commands Without sudo Privileges](http://www.tecmint.com/wp-content/uploads/2017/02/Run-Commands-Without-sudo.png) 
][5]

Run Commands Without sudo Privileges

Repeat the above two steps whenever needed, and once done, use the exit command to return to your unprivileged account immediately.

At this point you should ask yourself, Are the any other tasks that pop up on a periodic basis that need superuser privileges? If so, grant the necessary permissions in /etc/sudoers either for a given account or group, and continue avoiding the use of the root account at the extent possible.

##### Summary

This post can serve as a reference for the proper use of the root account in a Unix-like operating system. Feel free to add it to your bookmarks and return as many times as you want!

As always, drop us a note using the comment form below if you have any questions or suggestions about this article. We look forward to hearing from you!

--------------------------------------------------------------------------------

作者简介：

Gabriel Cánepa is a GNU/Linux sysadmin and web developer from Villa Mercedes, San Luis, Argentina. He works for a worldwide leading consumer product company and takes great pleasure in using FOSS tools to increase productivity in all areas of his daily work.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/who-is-root-why-does-root-exist-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/

[1]:http://www.tecmint.com/wp-content/uploads/2017/02/Linux-root-Directory-Tree.png
[2]:http://www.tecmint.com/add-users-in-linux/
[3]:http://www.tecmint.com/usermod-command-examples/
[4]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Run-Commands-Without-sudo.png
