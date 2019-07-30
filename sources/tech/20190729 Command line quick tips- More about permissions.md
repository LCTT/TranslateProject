[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Command line quick tips: More about permissions)
[#]: via: (https://fedoramagazine.org/command-line-quick-tips-more-about-permissions/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Command line quick tips: More about permissions
======

![][1]

A previous article [covered some basics about file permissions][2] on your Fedora system. This installment shows you additional ways to use permissions to manage file access and sharing. It also builds on the knowledge and examples in the previous article, so if you haven’t read that one, do [check it out][2].

### Symbolic and octal

In the previous article you saw how there are three distinct permission sets for a file. The user that owns the file has a set, members of the group that owns the file has a set, and then a final set is for everyone else. These permissions are expressed on screen in a long listing (_ls -l_) using symbolic mode.

Each set has **r, w,** and **x** entries for whether a particular user (owner, group member, or other) can read, write, or execute that file. But there’s another way to express these permissions: in **octal** mode.

You’re used to the [decimal][3] numbering system, which has ten distinct values (0 through 9). The octal system, on the other hand, has eight distinct values (0 through 7). In the case of permissions, octal is used as a shorthand to show the value of the **r, w,** and **x** fields. Think of each field as having a value:

  * **r** = 4
  * **w** = 2
  * **x** = 1



Now you can express any combination with a single octal value. For instance, read and write permission, but no execute permission, would have a value of 6. Read and execute permission only would have a value of 5. A file’s **rwxr-xr-x** symbolic permission has an octal value of **755**.

You can use octal values to set file permissions with the _chmod_ command similarly to symbolic values. The following two commands set the same permissions on a file:

```
chmod u=rw,g=r,o=r myfile1
chmod 644 myfile1
```

### Special permission bits

There are several special permission bits also available on a file. These are called **setuid** (or **suid**), **setgid** (or **sgid**), and the **sticky bit** (or **delete inhibit**). Think of this as yet another set of octal values:

  * setuid = 4
  * setgid = 2
  * sticky = 1



The **setuid** bit is ignored _unless_ the file is executable. If that’s the case, the file (presumably an app or a script) runs as if it were launched by the user who owns the file. A good example of setuid is the _/bin/passwd_ utility, which allows a user to set or change passwords. This utility must be able to write to files no user should be allowed to change. Therefore it is carefully written, owned by the _root_ user, and has a setuid bit so it can alter the password related files.

The **setgid** bit works similarly for executable files. The file will run with the permissions of the group that owns it. However, setgid also has an additional use for directories. If a file is created in a directory with setgid permission, the group owner for the file will be set to the group owner of the directory.

Finally, the sticky bit, while ignored for files, is useful for directories. The sticky bit set on a directory will prevent a user from deleting files in that directory owned by other users.

The way to set these bits with _chmod_ in octal mode is to add a value prefix, such as **4755** to add setuid to an executable file. In symbolic mode, the **u** and **g** can be used to set or remove setuid and setgid, such as **u+s,g+s**. The sticky bit is set using **o+t**. (Other combinations, like **o+s** or **u+t**, are meaningless and ignored.)

### Sharing and special permissions

Recall the example from the previous article concerning a finance team that needs to share files. As you can imagine, the special permission bits help to solve their problem even more effectively. The original solution simply made a directory the whole group could write to:

```
drwxrwx---. 2 root finance 4096 Jul  6 15:35 finance
```

One problem with this directory is that users _dwayne_ and _jill_, who are both members of the _finance_ group, can delete each other’s files. That’s not optimal for a shared space. It might be useful in some situations, but probably not when dealing with financial records!

Another problem is that files in this directory may not be truly shared, because they will be owned by the default groups of _dwayne_ and _jill_ — most likely the user private groups also named _dwayne_ and _jill_.

A better way to solve this is to set both setgid and the sticky bit on the folder. This will do two things — cause files created in the folder to be owned by the _finance_ group automatically, and prevent _dwayne_ and _jill_ from deleting each other’s files. Either of these commands will work:

```
sudo chmod 3770 finance
sudo chmod u+rwx,g+rwxs,o+t finance
```

The long listing for the file now shows the new special permissions applied. The sticky bit appears as **T** and not **t** because the folder is not searchable for users outside the _finance_ group.

```
drwxrws--T. 2 root finance 4096 Jul  6 15:35 finance
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/command-line-quick-tips-more-about-permissions/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg
[2]: https://fedoramagazine.org/command-line-quick-tips-permissions/
[3]: https://en.wikipedia.org/wiki/Decimal
