How To Find Files Based On their Permissions
======
Finding files in Linux is not a big deal. There are plenty of free and open source graphical utilities available on the market. In my opinion, finding files from command line is much easier and faster. We already knew how to [**find and sort files based on access and modification date and time**][1]. Today, we will see how to find files based on their permissions in Unix-like operating systems.

For the purpose of this guide, I am going to create three files namely **file1** , **file2** and **file3** with permissions **777** , **766** , **655** respectively in a folder named **ostechnix**.
```
mkdir ostechnix && cd ostechnix/
```
```
install -b -m 777 /dev/null file1
```
```
install -b -m 766 /dev/null file2
```
```
install -b -m 655 /dev/null file3
```

[![][2]][3]

Now let us find the files based on their permissions.

### Find files Based On their Permissions

The typical syntax to find files based on their permissions is:
```
find -perm mode
```

The MODE can be either with numeric or octal permission (like 777, 666.. etc) or symbolic permission (like u=x, a=r+x).

Before going further, we can specify the MODE in three different ways.

  1. If we specify the mode without any prefixes, it will find files of **exact** permissions.
  2. If we use **" -"** prefix with mode, at least the files should have the given permission, not the exact permission.
  3. If we use **" /"** prefix, either the owner, the group, or other should have permission to the file.



Allow me to explain with some examples, so you can understand better.

First, we will see finding files based on numeric permissions.

### Find Files Based On their Numeric (octal) Permissions

Now let me run the following command:
```
find -perm 777
```

This command will find the files with permission of **exactly 777** in the current directory.

[![][2]][4]

As you see in the above output, file1 is the only one that has **exact 777 permission**.

Now, let us use "-" prefix and see what happens.
```
find -perm -766
```

[![][2]][5]

As you see, the above command displays two files. We have set 766 permission to file2, but this command displays two files, why? Because, here we have used "-" prefix". It means that this command will find all files where the file owner has read/write/execute permissions, file group members have read/write permissions and everything else has also read/write permission. In our case, file1 and file2 have met this criteria. In other words, the files need not to have exact 766 permission. It will display any files that falls under this 766 permission.

Next, we will use "/" prefix and see what happens.
```
find -perm /222
```

[![][2]][6]

The above command will find files which are writable by somebody (either their owner, or their group, or anybody else). Here is another example.
```
find -perm /220
```

This command will find files which are writable by either their owner or their group. That means the files **don 't have to be writable** by **both the owner and group** to be matched; **either** will do.

But if you run the same command with "-" prefix, you will only see the files only which are writable by both owner and group.
```
find -perm -220
```

The following screenshot will show you the difference between these two prefixes.

[![][2]][7]

Like I already said, we can also use symbolic notation to represent the file permissions.

Also read:

### Find Files Based On their Permissions using symbolic notation

In the following examples, we use symbolic notations such as **u** ( for user), **g** (group), **o** (others). We can also use the letter **a** to represent all three of these categories. The permissions can be specified using letters **r** (read), **w** (write), **x** (executable).

For instance, to find any file with group **write** permission, run:
```
find -perm -g=w
```

[![][2]][8]

As you see in the above example, file1 and file2 have group **write** permission. Please note that you can use either  "=" or "+" for symbolic notation. It doesn't matter. For example, the following two commands do the same thing.
```
find -perm -g=w
find -perm -g+w
```

To find any file which are writable by the file owner, run:
```
find -perm -u=w
```

To find any file which are writable by all (the file owner, group and everyone else), run:
```
find -perm -a=w
```

To find files which are writable by **both** their **owner** and their **group** , use this command:
```
find -perm -g+w,u+w
```

The above command is equivalent of "find -perm -220" command.

To find files which are writable by **either** their **owner** or their **group** , run:
```
find -perm /u+w,g+w
```

Or,
```
find -perm /u=w,g=w
```

These two commands does the same job as "find -perm /220" command.

For more details, refer the man pages.
```
man find
```

Also, check the [**man pages alternatives**][9] to learn more simplified examples of any Linux command.

And, that's all for now folks. I hope this guide was useful. More good stuffs to come. Stay tuned.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/find-files-based-permissions/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1] https://www.ostechnix.com/find-sort-files-based-access-modification-date-time-linux/
[2] data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3] http://www.ostechnix.com/wp-content/uploads/2017/12/find-files-1-1.png ()
[4] http://www.ostechnix.com/wp-content/uploads/2017/12/find-files-2.png ()
[5] http://www.ostechnix.com/wp-content/uploads/2017/12/find-files-3.png ()
[6] http://www.ostechnix.com/wp-content/uploads/2017/12/find-files-6.png ()
[7] http://www.ostechnix.com/wp-content/uploads/2017/12/find-files-7.png ()
[8] http://www.ostechnix.com/wp-content/uploads/2017/12/find-files-8.png ()
[9] https://www.ostechnix.com/3-good-alternatives-man-pages-every-linux-user-know/
