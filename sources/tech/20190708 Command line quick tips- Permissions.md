[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command line quick tips: Permissions)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-permissions/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Command line quick tips: Permissions
======

![][1]

Fedora, like all Linux based systems, comes with a powerful set of security features. One of the basic features is _permissions_ on files and folders. These permissions allow files and folders to be secured from unauthorized access. This article explains a bit about these permissions, and shows you how to share access to a folder using them.

### Permission basics

Fedora is by nature a multi-user operating system. It also has _groups_, which users can be members of. But imagine for a moment a multi-user system with no concept of permissions. Different logged in users could read each other’s content at will. This isn’t very good for privacy or security, as you can imagine.

Any file or folder on Fedora has three sets of permissions assigned. The first set is for the _user_ who owns the file or folder. The second is for the _group_ that owns it. The third set is for everyone else who’s not the user who owns the file, or in the group that owns the file. Sometimes this is called the _world_.

### What permissions mean

Each set of permissions comes in three flavors — _read_, _write_, and _execute_. Each of these has an initial that stands for the permission, thus _r_, _w_, and _x_.

#### File permissions

For _files_, here’s what these permissions mean:

  * Read (r): the file content can be read

  * Write (w): the file content can be changed

  * Execute (x): the file can be executed — this is used primarily for programs or scripts that are meant to be run directly

  *


You can see the three sets of these permissions when you do a long listing of any file. Try this with the _/etc/services_ file on your system:

```
$ ls -l /etc/services
-rw-r--r--. 1 root root 692241 Apr  9 03:47 /etc/services
```

Notice the groups of permissions at the left side of the listing. These are provided in three sets, as mentioned above — for the user who owns the file, for the group that owns the file, and for everyone else. The user owner is _root_ and the group owner is the _root_ group. The user owner has read and write access to the file. Anyone in the group _root_ can only read the file. And finally, anyone else can also only read the file. (The dash at the far left shows this is a regular file.)

By the way, you’ll commonly find this set of permissions on many (but not all) system configuration files. They are only meant to be changed by the system administrator, not regular users. Often regular users need to read the content as well.

#### Folder (directory) permissions

For folders, the permissions have slightly different meaning:

  * Read (r): the folder contents can be read (such as the _ls_ command)
  * Write (w): the folder contents can be changed (files can be created or erased in this folder)
  * Execute (x): the folder can be searched, although its contents cannot be read. (This may sound strange, but the explanation requires more complex details of file systems outside the scope of this article. So just roll with it for now.)



Take a look at the _/etc/grub.d_ folder for example:

```
$ ls -ld /etc/grub.d
drwx------. 2 root root 4096 May 23 16:28 /etc/grub.d
```

Note the _d_ at the far left. It shows this is a directory, or folder. The permissions show the user owner (_root_) can read, change, and _cd_ into this folder. However, no one else can do so — whether they’re a member of the _root_ group or not. Notice you can’t _cd_ into the folder, either:

```
$ cd /etc/grub.d
bash: cd: /etc/grub.d: Permission denied
```

Notice how your own home directory is setup:

```
$ ls -ld $HOME
drwx------. 221 paul paul 28672 Jul  3 14:03 /home/paul
```

Now, notice how no one, other than you as the owner, can access anything in this folder. This is intentional! You wouldn’t want others to be able to read your private content on a shared system.

### Making a shared folder

You can exploit this permissions capability to easily make a folder to share within a group. Imagine you have a group called _finance_ with several members who need to share documents. Because these are user documents, it’s a good idea to store them within the _/home_ folder hierarchy.

To get started, [use][2] _[sudo][2]_ to make a folder for sharing, and set it to be owned by the _finance_ group:

```
$ sudo mkdir -p /home/shared/finance
$ sudo chgrp finance /home/shared/finance
```

By default the new folder has these permissions. Notice how it can be read or searched by anyone, even if they can’t create or erase files in it:

```
drwxr-xr-x. 2 root root 4096 Jul  6 15:35 finance
```

That doesn’t seem like a good idea for financial data. Next, use the _chmod_ command to change the mode (permissions) of the shared folder. Note the use of _g_ to change the owning group’s permissions, and _o_ to change other users’ permissions. Similarly, _u_ would change the user owner’s permissions:

```
$ sudo chmod g+w,o-rx /home/shared/finance
```

The resulting permissions look better. Now, anyone in the _finance_ group (or the user owner _root_) have total access to the folder and its contents:

```
drwxrwx---. 2 root finance 4096 Jul  6 15:35 finance
```

If any other user tries to access the shared folder, they won’t be able to do so. Great! Now our finance group can put documents in a shared place.

### Other notes

There are additional ways to manipulate these permissions. For example, you may want any files in this folder to be set as owned by the group _finance_. This requires additional settings not covered in this article, but stay tuned to the Magazine for more on that topic soon.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-permissions/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://fedoramagazine.org/howto-use-sudo/
